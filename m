Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B239EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 10:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O7eD0wrs+km6lrs+4i3II34UDaTR3ANIVNOTTBmkqxM=; b=spu/v92BxSicQXrhcPWF3rmoJ8
	UVc7dfXaP+l0VZrHrhq1+ViPlP0sSBRE0dWAMKfcgwJmTgJ7tbVHq7MKz89vs6W5jGfnhewQDbqcA
	dgvlrMmDSSJJjmyQThVxFgennXLVSROtkxlxsDGJFABeUl/xJex9UWoDmUpAN6Aabe+Xduw1RGpP+
	3g9mRCmPVoLFkFctLVF1CxbwfTw4irysLlAC57mV5fK5ywT/LZQgcSQ3+7HHU6r1NCltlyisyraWP
	/aKsvmbhf1UbBhyO5xhaMHdwVBE2qt5OSpv+u3PqNc/5PIBXPBW8Y90nZ1AsSKP9itnjpeORvbxWT
	1Es5m7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPcW-00000004Ard-3fgW;
	Tue, 04 Mar 2025 10:35:28 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpP1b-000000041gi-0T9N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 09:57:20 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 9F867A0391;
	Tue,  4 Mar 2025 10:57:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=O7eD0wrs+km6lrs+4i3I
	I34UDaTR3ANIVNOTTBmkqxM=; b=gXmHO5nR2oYypWDnMoZKH4nKOSeHA36L1egR
	4SdB5UtMA8/0L+c05ZMZL29MmIuG5kP51lVcgLVcELGIDwhBowTs9g8Ns2sxS9O1
	fulfKvQHC+mFwI2zQy9ri0A7kQpKy+0PJ1/82Csb44K5VkV80pb34avi686oXReT
	z1rkeTzjmetXB1veEGDkSuFkspqFGluWWNgvSLsgtNP2d5b7lzQ24CWvlj1mhP6h
	+OClikhWU5QzDbr8bj5xNRv2yMCO1lXgt+fXwGOxMo+NL1fJ4o3F53iyCOXaYvcz
	uVg529HwBL01D/XuK0yA0uD6jyF3z2w16Jr0PXO+3NEAGKn84RYoqKjkXAdYkymp
	NJTnq1udc2M4KHPKdI4EpnOXhNi5B6MuiOU8xoaKv+bcejHdWWuMklw1PDujlYpo
	FQjs82lWj/bF4uG2cUpLQntjuTshSmDYOpjlz9wKjG1I8vk/pIAatMf02/PkE9OZ
	ty0vqHXfcVyTUTNrapoVdGZ3Ja++KvuuLRDrFj5KeeC6OA0N2O3f7AN+6CuA+QWJ
	g8jHhkHJHfsBeD4uP9Ct77MqargS6eEt58bq2zu0Fxh5ipsMKNKsKem6TYhgL0XI
	Yfw6WWTAFyPpQVebPxcaenimSGSkAFJTUKjCTkwjcVR95SjNdFcWhffaBGXecMY+
	x2QsKTQ=
Message-ID: <9fcf9cf4-ba02-4583-9e14-bd650dbe32ee@prolan.hu>
Date: Tue, 4 Mar 2025 10:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] counter: microchip-tcb-capture: Add IRQ handling
To: William Breathitt Gray <wbg@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kamel Bouhara <kamel.bouhara@bootlin.com>
References: <20250227144023.64530-1-csokas.bence@prolan.hu>
 <20250227144023.64530-3-csokas.bence@prolan.hu> <Z8alaOTjZeRuXnUI@ishi>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <Z8alaOTjZeRuXnUI@ishi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852637260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_015719_618017_2BB6CDA5 
X-CRM114-Status: GOOD (  17.40  )
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

Hi,

On 2025. 03. 04. 8:02, William Breathitt Gray wrote:
> In theory, the error code could be something else if of_irq_get() failed
> for any other reason. Handle all those error cases at once by checking
> IS_ERR(priv->irq) rather than just -EPROBE_DEFER. Then you can just
> return dev_err_probe() with priv->irq for the error code.

Yes, `of_irq_get()` can return an error, for example if the IRQ is not 
defined in the DT. In these cases, we just don't do IRQ, but still allow 
the device to probe. -EPROBE_DEFER is special in this case, because it 
signifies that there *is* an IRQ to set up, just not now.

>> +enum counter_mchp_event_channels {
>> +	COUNTER_MCHP_EVCHN_CV = 0,
>> +	COUNTER_MCHP_EVCHN_RA = 0,
>> +	COUNTER_MCHP_EVCHN_RB,
>> +	COUNTER_MCHP_EVCHN_RC,
>> +};
> 
> These would be better as preprocessor defines in case we need to
> introduce new events to channel 1 or 2 in the future. That would allow
> us to insert new events easily to existing channels without having to
> worry about its actual position in an enum list.

Okay. I personally like the enum interface more, as it is much cleaner, 
but if there's a good reason to use #define's, then so be it.

> One additional benefit is if we do end up introducing more Counts for
> the module. In that situation we would have multiple CV and RA/RB/RC per
> Counter device, but we can easily define a preprocessor macro to
> calculate the channel offset given the Count index. However, with enum
> structure we would have to manually add and maintain redundant defines
> for each Count, which is far less ideal.
> 
> William Breathitt Gray

Bence


