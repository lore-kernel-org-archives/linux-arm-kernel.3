Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E5CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 18:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEdAoTI0Zvq9lrO508IgR4SfxTCAqZjw0pM5fpGCRpU=; b=M5MYaeNiCarJf1oK4D8CgBLwEN
	r87enuT/BCvMrKWvbWezaYmyzcbHFQGJIy5kX7ZxuiZKO3oNJrsrTeo0CblYIJdzpjj7rtZqxktRz
	DO5uftqu8XzALVDiEsE72UfaDbeROW8H6OfBj99gZtk0XUNsAeQVCdC/DvVez6rPyvEQ4YBgGOEN/
	xayDjsMAba4fS4KnPOOkNjs18lAZUrOKN1DMiguBN1qtXAKV6S6gbJ5XpYhWAOjyYHIi9k86Mw7P5
	xxJDKB8vVDJhAlC6UYhfxwfzP1j+gKKfertW0l4x7vu1UnrkdteOQGVgSTsQUrO6BFHRKdGIpNx87
	bQyKJn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAY08-0000000BIIJ-0Miw;
	Sun, 19 Oct 2025 18:19:28 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAY01-0000000BIHl-2yhX;
	Sun, 19 Oct 2025 18:19:26 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id A656A28007A;
	Sun, 19 Oct 2025 18:19:13 +0000 (UTC)
Received: from [192.168.1.23] (unknown [98.97.32.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id E397F13C2B0;
	Sun, 19 Oct 2025 11:18:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com E397F13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1760897951;
	bh=d11pgiUBlTDSn8XZdaFMt+akqhMwov8Yt4HpY3gvaug=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CPwIRTr17+B4Oc/3SpOvEJQmGN4mblNpDjM7OrDyawykWCqxg7OeBOsRFglJxBO6K
	 Gu3w3XNR2LkSscHWH6uU+HhBhWGBAU+drpjW/yhi1gmHnv3BuGO41JQA+X6+WUMB9+
	 4tYFRD4F/5PoWKtFxvc9A5Fkj1nkoLjaNXpGGXzs=
Message-ID: <4f75bb90-25ee-4312-b4b1-3faf0249b05a@candelatech.com>
Date: Sun, 19 Oct 2025 11:18:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: add tx checksum offload for mt7915, mt7921,
 mt7981 and mt7986
To: Aleksander Jan Bajkowski <olek2@wp.pl>, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 howard-yh.hsu@mediatek.com, StanleyYP.Wang@mediatek.com, rosenp@gmail.com,
 luoxueqin@kylinos.cn, chad@monroe.io, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251019155316.3537185-1-olek2@wp.pl>
 <fa7befd5-b2c7-4277-ad57-a1577216ba83@candelatech.com>
 <5a529d81-fb4e-4e7a-a132-3b76d26c3696@wp.pl>
Content-Language: en-MW
From: Ben Greear <greearb@candelatech.com>
Organization: Candela Technologies
In-Reply-To: <5a529d81-fb4e-4e7a-a132-3b76d26c3696@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MDID: 1760897955-ofoHgPYxUDkh
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;ut7;1760897955;ofoHgPYxUDkh;<greearb@candelatech.com>;d5c215dcae166280e85b20da571dd1ee
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_111922_181949_CA69C86C 
X-CRM114-Status: GOOD (  19.03  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 10/19/25 09:43, Aleksander Jan Bajkowski wrote:
> Hi Ben,
> 
> On 10/19/25 18:26, Ben Greear wrote:
>> On 10/19/25 08:51, Aleksander Jan Bajkowski wrote:
>>> Supports IPv4 and IPv6 TCP + UDP
>>>
>>> In various tests between MT7986 and Intel BE200, I observed a performance
>>> boost ranging from 2 to 12%, with an average of 5.5%.
>>>
>>> I did the tests on the MT7915, MT7981, MT7986, and MT7921 variants. The
>>> MT7922, MT7925, and MT799x are untouched for now and still have
>>> checksumming disabled.
>>
>> At least with  7996, tcp csum only worked on the first few vdevs
>> created in our testing, so we had to add logic to disable that flag
>> on subsequent vdevs.
>>
>> Have you tried creating a bunch of station and/or vap vdevs to see if
>> all of them can still transmit TCP traffic?
>>
>>
> Thanks for the useful information. On all tested devices, I had a single
> AP configured per device. I will try to create several APs for each device.

We can try it out as well.

> I also have a router with MT7996. A quick test shows that checksum
> offload doesn't work on this router. MT7996 is visible in the system
> as a single DBDC device. I have 3 APs configured there. Each on a
> separate band (2.4/5/6 GHz).
> 
> Best regards,
> Aleksander

We have it working on 7996, but the patch is tangled in some other changes we made
with how wcid and such are allocated.  We are still cleaning and testing patches
on top of Felix's tree, should have something to post sometime soon.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


