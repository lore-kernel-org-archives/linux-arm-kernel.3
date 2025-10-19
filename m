Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E357CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgVBVUJXxuJNfAai+w6JVOE/OpKRFqXAijpu2MBRy4Y=; b=w5DMpktlX1k5A+Id+IML2WTDIX
	lURJuFR/9GOOzmAnsVdUbQgqvxBPha6fgzZ7CFzlB3muaCNWFXtu3chiOU53DmT4S9SSgM4r/Xgsl
	ii3IW8HXSdi1XP7L/qqLc7GmtKnkADlNjcnQBH0ooS+yP3yxo11Pvkspm0ztOQjnFmPJeWkP+TVMW
	bmMmDaAsns1KGXcx+e62RPNqPzprTwCdeIoIzR8VpBBW9RsO/ZgA0odZnZOLA9T5+7P6AAcLKleda
	pY0i7Aufyh/l5TMwkSidHCnYk0bhx4hBBq5gVnnE5RVousF5fvh2fYLnLzzbKSqGiq0X9fhUomIpY
	CTty7dAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWVh-0000000BDVe-1nb0;
	Sun, 19 Oct 2025 16:43:57 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAWVd-0000000BDUS-2AMd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 16:43:55 +0000
Received: (wp-smtpd smtp.wp.pl 22663 invoked from network); 19 Oct 2025 18:43:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1760892228; bh=KgVBVUJXxuJNfAai+w6JVOE/OpKRFqXAijpu2MBRy4Y=;
          h=Subject:To:From;
          b=peBtpR6E7ZW4mYxBVRYav6r8j8zPXBkmZ6KC1fyEaTN5k9iEEE5NYcPaLBSnYDgdM
           4nCFA/00CFZ0/FTv/Dve5kuipwf7Ftzqs3olf5JTEZPF2e6jjIlaahChWh/DEU6hel
           Thdeu/RtlqnD5qj5YiPsOaWMnicvLR6onNpj2q9RfXdNgRKsOstz762DDwpserWGCq
           XJ0vddbs9T3Ib9+qXyJH8Z/iVRitMnGRM5hTmV7r33h1LLq+VzKUkg3FlUNdoN2cQ4
           JoeSdxXoeAJNqFD51dnlJ4rR0/fxEZS6pkPVOOLWjc7P/Fd8FNQRXbfa3UGSDuhhwE
           LLo5pcgxGo81A==
Received: from 83.24.149.147.ipv4.supernova.orange.pl (HELO [192.168.1.10]) (olek2@wp.pl@[83.24.149.147])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <greearb@candelatech.com>; 19 Oct 2025 18:43:48 +0200
Message-ID: <5a529d81-fb4e-4e7a-a132-3b76d26c3696@wp.pl>
Date: Sun, 19 Oct 2025 18:43:47 +0200
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
Content-Language: en-US
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <fa7befd5-b2c7-4277-ad57-a1577216ba83@candelatech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: 93b31ec6953bcf946e080ba9f5d8865d
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000003 [IcDR]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_094353_858707_39D27897 
X-CRM114-Status: GOOD (  12.16  )
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

Hi Ben,

On 10/19/25 18:26, Ben Greear wrote:
> On 10/19/25 08:51, Aleksander Jan Bajkowski wrote:
>> Supports IPv4 and IPv6 TCP + UDP
>>
>> In various tests between MT7986 and Intel BE200, I observed a 
>> performance
>> boost ranging from 2 to 12%, with an average of 5.5%.
>>
>> I did the tests on the MT7915, MT7981, MT7986, and MT7921 variants. The
>> MT7922, MT7925, and MT799x are untouched for now and still have
>> checksumming disabled.
>
> At least with  7996, tcp csum only worked on the first few vdevs
> created in our testing, so we had to add logic to disable that flag
> on subsequent vdevs.
>
> Have you tried creating a bunch of station and/or vap vdevs to see if
> all of them can still transmit TCP traffic?
>
>
Thanks for the useful information. On all tested devices, I had a single
AP configured per device. I will try to create several APs for each device.

I also have a router with MT7996. A quick test shows that checksum
offload doesn't work on this router. MT7996 is visible in the system
as a single DBDC device. I have 3 APs configured there. Each on a
separate band (2.4/5/6 GHz).

Best regards,
Aleksander


