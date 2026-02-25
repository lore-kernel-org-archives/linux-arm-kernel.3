Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166A5FD3756
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 12:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bk588DBfNe67SRQfvFVlYp/ZLLbI8UjxnD459J1IWfU=; b=G9R4YQfnwjoTr/1yQ2x/8WEgU/
	/dOwcmkeOhbHflHqXMcPSWq4402w7VL+RAoRamlLu6w6y2zHf4G+fX9dgZBrEv5AXd0Id5q88x4cL
	tsJ6puOk8spSuH05itg0011vXqvQVj9Ub6p7FvVovKBLN8ZiBKvNMbImXcijcS5bQ8K12DGhkmrZv
	x6EzmYsfZYuDMBPaWx7xAJK0GD/n0RtmWwWN0/AZNBARZBtHDIuDAFzMhWkA/EsRsZZS3niguZe/p
	dsqxnUj6EDByfU517KAaui9PoK9L9YLVSlsPr38foZdvefZO4r2Sz4/pwuJ9NzxCrRa6dlPIr2X5K
	Ol+FbPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvECI-0000000415i-2xbW;
	Wed, 25 Feb 2026 12:40:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvECG-0000000415J-0ohV;
	Wed, 25 Feb 2026 12:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772023252;
	bh=ngaopgY039OjChM8qBLj6ujB7B8vDxU3MnbrCR2xlPs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pWdD6mGI99dJH6qGsQBVWGzvUP0BjC6j8ll7dXJ7r3qUj2dev2m56xdT5JREZegZx
	 oJHt7qifVuU+9NB3qfgmjgMXQelsciYLzjO3ZruDropQ7r7UbCYbRLWcG+kBCJXxyr
	 Z54s0yBU5k8OUs0qdu+im92weAONwkkcxqBj9x4v8l77u3xbTmcqQDoGrbX2S2VFmq
	 KAdm5Yi9IDKgkyG5sT/GcbcyH8gFV4j9LQlQretgY/ZDuqATS3ZsxBmZygEXC358kU
	 Y5V20tbJNW/YGHyIbL0x7Yjv2cTXyjT/BH2Ouy/jlwDtljXgjA2aDG7TRGjPMNj4OC
	 MKc3oKTR85SoQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A013417E0BA2;
	Wed, 25 Feb 2026 13:40:51 +0100 (CET)
Message-ID: <cad2e275-8b5d-4023-b3da-a191bfd065c5@collabora.com>
Date: Wed, 25 Feb 2026 13:40:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 20/23] scsi: ufs: mediatek: Back up idle timer in
 per-instance struct
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
 <20260216-mt8196-ufs-v7-20-b5f2907c6da7@collabora.com>
 <5d9723fd6b4ff8430889efb33e0fc93a10c4a880.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <5d9723fd6b4ff8430889efb33e0fc93a10c4a880.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_044056_399372_56F25B94 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

Il 25/02/26 11:35, Peter Wang (王信友) ha scritto:
> On Mon, 2026-02-16 at 14:37 +0100, Nicolas Frattaroli wrote:
>> @@ -187,6 +187,7 @@ struct ufs_mtk_host {
>>   	u16 ref_clk_gating_wait_us;
>>   	u32 ip_ver;
>>   	bool legacy_ip_ver;
>> +	u32 hibernate_idle_timer;
> 
> The name hibernate_idle_timer is somewhat confusing in
> terms of its intended use. I would suggest using
> backup_ahit or saved_ahit instead.
> 

In my opinion "ahit" is way less readable than "hibernate_idle_timer".

The hibernate_idle_timer member here stores the AUTO HIBERNATE IDLE TIMER, and
there is no other possible hibernation state in this driver.

Not sure why this could ever be confusing in terms of its intended use: its
intended use is to store the (auto) hibern8 idle timer, and the member is called
hibernate_idle_timer.

In my eyes, that matches 1:1 with its usage. Loud and clear.

Regards,
Angelo

> Thanks
> Peter
> 



