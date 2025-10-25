Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98B9CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 22:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eqCxPLGNk+p8qKPy3tzCrxq9AIQfMJbfl7ZnTBK0a5Q=; b=CY3lLpn+0alL+b+x6jMQC+Xu4y
	f3w5+stVuiupuCFTgJv6vHTkfqTv34IxWQkh+iZP0cuVI1EIDCF4Hj6KhmS1KEyHGRw8sNMskTQEW
	eZ7g6QGJBLR2vUWpvngf2RHIYUJOoSVahnJa1oEz+Er+e3wnQEPDP8LIyDGsd4Rr+92v7OFEPCepQ
	7mwhCg7LxZbEVt7MeDUcqhfc5drjI7xf7iMd1qXYqWgjaBva9WMNniTytS91GZos/vK0wBPWPk5Rt
	DomAyGinxtzgTMORMEd1rr5Q6UL3Ml5ixSrMgqrT+4+Zu03phDiOPgz/3YN1jfYHjqFhRdRfarSXS
	ErmKzMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCmJy-0000000BnrF-316p;
	Sat, 25 Oct 2025 22:01:10 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCmJr-0000000Bnpl-19mb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 22:01:09 +0000
Received: (wp-smtpd smtp.wp.pl 39240 invoked from network); 26 Oct 2025 00:00:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1761429656; bh=eqCxPLGNk+p8qKPy3tzCrxq9AIQfMJbfl7ZnTBK0a5Q=;
          h=Subject:To:From;
          b=pxQMMed8x4AVKbBEnKdtT8wYSYfE4PNhM80Hnx9G/7c7doMtqKorFIbmOcM37/unk
           hYyWwceDi4V7xFKygQTQxbfgy+NwET2DRZapiL+cs4+pGUbleLNjw5RlTvx5gm8A4q
           vwCRZMiIl13vYPV4NAzUBTIRbsbO6LkBSjLu+PxQIfkYAnSJD6xGBeu4/5YF89zPss
           69IeUPOGO/fq2Y7QByPtxZnRfg2XZnL3L2Cak7iLD/SkquywsaeqrnWwzDH5jDhulg
           yh+K+uR5ukLIF1zZkrl83xZWUN4Kv3ylzo9389MvIPO5R8A5Yk/lMzfOlJZA8lnY79
           OQEkdmdHcf7mQ==
Received: from 83.24.132.245.ipv4.supernova.orange.pl (HELO [192.168.1.14]) (olek2@wp.pl@[83.24.132.245])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <greearb@candelatech.com>; 26 Oct 2025 00:00:56 +0200
Message-ID: <626b4034-13f2-4b09-9f48-5bed9a6c82ca@wp.pl>
Date: Sun, 26 Oct 2025 00:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mt76: add tx checksum offload for mt7915, mt7921,
 mt7981 and mt7986
To: Ben Greear <greearb@candelatech.com>, nbd@nbd.name, lorenzo@kernel.org,
 ryder.lee@mediatek.com, shayne.chen@mediatek.com, sean.wang@mediatek.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 howard-yh.hsu@mediatek.com, StanleyYP.Wang@mediatek.com, rosenp@gmail.com,
 luoxueqin@kylinos.cn, chad@monroe.io, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20251019155316.3537185-1-olek2@wp.pl>
 <fa7befd5-b2c7-4277-ad57-a1577216ba83@candelatech.com>
 <5a529d81-fb4e-4e7a-a132-3b76d26c3696@wp.pl>
 <4f75bb90-25ee-4312-b4b1-3faf0249b05a@candelatech.com>
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <4f75bb90-25ee-4312-b4b1-3faf0249b05a@candelatech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 7bd021ef727bbcc9a938de5417393e54
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000003 [UbDx]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_150103_783427_93B10AB0 
X-CRM114-Status: GOOD (  17.17  )
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


On 10/19/25 20:18, Ben Greear wrote:
> On 10/19/25 09:43, Aleksander Jan Bajkowski wrote:
>> Hi Ben,
>>
>> On 10/19/25 18:26, Ben Greear wrote:
>>> On 10/19/25 08:51, Aleksander Jan Bajkowski wrote:
>>>> Supports IPv4 and IPv6 TCP + UDP
>>>>
>>>> In various tests between MT7986 and Intel BE200, I observed a 
>>>> performance
>>>> boost ranging from 2 to 12%, with an average of 5.5%.
>>>>
>>>> I did the tests on the MT7915, MT7981, MT7986, and MT7921 variants. 
>>>> The
>>>> MT7922, MT7925, and MT799x are untouched for now and still have
>>>> checksumming disabled.
>>>
>>> At least with  7996, tcp csum only worked on the first few vdevs
>>> created in our testing, so we had to add logic to disable that flag
>>> on subsequent vdevs.
>>>
>>> Have you tried creating a bunch of station and/or vap vdevs to see if
>>> all of them can still transmit TCP traffic?
>>>
>>>
>> Thanks for the useful information. On all tested devices, I had a single
>> AP configured per device. I will try to create several APs for each 
>> device.
>
> We can try it out as well.


I've tested multiple VAPs (15x AP + 1x station). It seems that everything
works fine on MT7915, MT7981, and MT7986. By connecting to the first
and last AP, tx checksum offload works correctly. MT7921 only supports
a single VAP, so I skipped testing it.

>
>> I also have a router with MT7996. A quick test shows that checksum
>> offload doesn't work on this router. MT7996 is visible in the system
>> as a single DBDC device. I have 3 APs configured there. Each on a
>> separate band (2.4/5/6 GHz).
>>
>> Best regards,
>> Aleksander
>
> We have it working on 7996, but the patch is tangled in some other 
> changes we made
> with how wcid and such are allocated.  We are still cleaning and 
> testing patches
> on top of Felix's tree, should have something to post sometime soon.
>

Maybe only the MT7996 is affected?

