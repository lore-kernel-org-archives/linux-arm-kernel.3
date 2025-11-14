Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D23CE8D5F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 17:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCRjBZyNz8BCs2Fp1Icrt4MQbgBntpN/nGDy1hv7Aqs=; b=C/EqPDVoHFjw7kCobhNPRVxKLD
	RqxC824hF55IarnTZoguRBw8uKhE7GlEJgc+4tnebY8x+EG5lOpxcRg8wpoKuLZALFGpA6fPa3ipp
	cDbCqYyuaufQBu0aN4h2WVlrYziOnFQl1eeznAJRZDOXf257IfVA4bu1n0heZ2sKvKUrsPJEULi+h
	mw/zsbrVT7UUKWC7q2Rumn/4+qsUmAoDYCnqQt2k2e6/3KkbFIJLwZDrzhhscqneKwtWr+IsgdfMi
	l6R6XLV/n3NnbERdXn7a2e3CXbej1zPPG1kBoEx6x95wxe6nzCydUccgArH8mOcCQZGpqtND7vUSC
	Xf15E2Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxM0-0000000Cp0n-3IID;
	Fri, 14 Nov 2025 17:12:56 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxLy-0000000Cp0E-3IxB;
	Fri, 14 Nov 2025 17:12:56 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout4.routing.net (Postfix) with ESMTP id 250D1100387;
	Fri, 14 Nov 2025 17:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1763140370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zCRjBZyNz8BCs2Fp1Icrt4MQbgBntpN/nGDy1hv7Aqs=;
	b=oHHmuatKdvbjzw6oIV6h4eEaFhABMPYVxxahaWcYo3BF/Ez64tF/Xi0iQoiHQzdGNJ6ySh
	Kiab7PBvcmXymQSq3ROG9FP4nVUd9feOFDzsUIFQvEe6X7aahLcpGPOtJnd2feD4l+t8xc
	mG48oPbRNKzhVITJDdHToxk0B66Pr+0=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 2601A40131;
	Fri, 14 Nov 2025 17:12:49 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 14 Nov 2025 18:12:49 +0100
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mason Chang <mason-cw.chang@mediatek.com>, Frank
 Wunderlich <frank-w@public-files.de>, =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E?=
 =?UTF-8?Q?_A=2E_Prado?= <nfraprado@collabora.com>, =?UTF-8?Q?Uwe_Klein?=
 =?UTF-8?Q?e-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Balsam CHIHI
 <bchihi@baylibre.com>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 1/5] dt-bindings: thermal: mediatek: make interrupt
 only required for current SoCs
In-Reply-To: <7a8bf2e9-5033-4588-923c-53ad23c12924@collabora.com>
References: <20251026122143.71100-1-linux@fw-web.de>
 <20251026122143.71100-2-linux@fw-web.de>
 <7a8bf2e9-5033-4588-923c-53ad23c12924@collabora.com>
Message-ID: <e31fcd9e9e5bb6e615eab98f73532dce@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 55044b9e-28b6-4f7d-8091-aa83c7055f8b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_091255_028989_23AD76F2 
X-CRM114-Status: GOOD (  18.63  )
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

i got respoonse from MTK...

Am 2025-10-27 11:43, schrieb AngeloGioacchino Del Regno:
> Il 26/10/25 13:21, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> Upcoming MT7987 does not have a IRQ we have to make interrupt-property 
>> only
>> required for current supported SoCs.
> 
> Hmm. Thermal sensor IP with no interrupt? Looks really strange.
> 
> This is odd, because LVTS always has multiple interrupts, and if this 
> doesn't
> actually feature any, it really feels like the hardware is broken 
> somehow.
> 
> MediaTek, can you please confirm whether the LVTS IP in MT7987 is 
> really
> like that, or can you please give the right interrupt number to Frank?
> 

the reason why the interrupt is disabled on MT7988/87 is because the 
original designer only
intended for customers to use HW reset, and did not plan for customers 
to use high/low offset
interrupts. However, in theory, this function can work.

see this part of driver-patch (3/5 "Add no-irq-mode for mt7987")

handling is divided into two cases: one is high/low offset, and the 
other is HW reset.

-	writel(0, LVTS_MONINT(lvts_ctrl->base));
-
+	if (lvts_data->irq_enable) {
+		writel(0, LVTS_MONINT(lvts_ctrl->base));
+	} else {
+		writel(BIT(16), LVTS_PROTCTL(lvts_ctrl->base));
+		writel(lvts_ctrl->hw_reset_raw_temp, LVTS_PROTTC(lvts_ctrl->base));
+	}


HW Reset:
In BL2, we set the thermal_ctl_en (bit 16) of WDT_REQ_MODE (0x1001C030) 
to 1 so that the WDT
can receive the HW reset signal from LVTS.
We also set thermal_ctl_irq (bit 16) of WDT_REQ_IRQ_EN (0x1001C034) to 1 
so that when the WDT
receives the LVTS HW reset signal, it will directly reset the IC.
LVTSMONCTRL, LVTSPROTCTL, and LVTSPROTTC are used to control the HW 
reset strategy and temperature.

High/Low Offset:
Since multiple sensors share the high/low offset settings, the high/low 
offset temperature will be
set when we echo the temperature to thermal_zoneX/trip_point_X (call 
lvts_set_trips function).
Whenever any sensor's temperature is higher or lower than the high/low 
offset, it will trigger an
IRQ (call lvts_irq_handle).

Currently we are discussing a way to verify this function works in 
hardware and then we can add
IRQ for mt7987 (which is same as on mt7988 where i did not know till now 
that IRQ is not known as
working - just ported driver + dts and checked temperature output and 
thermal-trip handling
regarding to fan). And if it works we could drop patches for 
no-irq-mode.

> Thanks,
> Angelo

regards Frank

