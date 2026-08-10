Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA970C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exfw+BpSiYeouKj8oOQeysjMtDRV6oyZO/QGXxK66VI=; b=VK4Cv+dsvR/9uMb+EMmsQGynqy
	otWJRQWGQZpwFTHO/a2wfA4p9UWYSAHyVwWNTQKJ1AuCBJ1NiUJON4fITlTyxkxJlBA6UbWa4tLvn
	GSNslroddoN94lRYjzCQEV+9HfjiqUefgtCusJQH4w9V60iCK2ppIJ2sXmGUjFzIjRRFNycYh0F8M
	OauhlEWcoSt1QI/s4twkyZdJv/u9BbQ7YJrrtfSOZ74sxwkm1wdXRi2jZpRn7pvcpFrx1zlUbHdPh
	AJ209Dm6VG+x+CTmFuESKMK5q38QXsGbCsY2lIH57i91Lh49kuCyp2hxU/IwRtR45vHhRPYqT9Qph
	FQd5EKaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWCK-0000000CnaO-0Cg4;
	Mon, 10 Aug 2026 20:02:12 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWC8-0000000CnXf-3sFX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:02:10 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso21631275e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 13:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786392119; x=1786996919; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=exfw+BpSiYeouKj8oOQeysjMtDRV6oyZO/QGXxK66VI=;
        b=oghsqlxEx5ujEe8YLa7p9iG5CllMjmHb2smF1yqyNidiOVhs5Ih2c6JY8lQ9r9OUbJ
         irpvkaGrn5G2WOBgJu2gi+mzDWbJkEFORckDi9GFLbR7gakVkfS2aSCC+pg5fedMpYl3
         SNKMZPGpS3xCBA3hDcX6xUH74q73UBH2pYxTfKgYFSTpbtyeNSBnxSKTnYZjlpT8bOzL
         aBAoLulnnhqYijQneAV41VqR5SiTME/4UfhE/qKBgiPIYp3CCFuLTCCa8Nxud38qQ99w
         PljVWaN3lH9MTjj2NR0Mis7hq8g3TDLOyK8hUoS011TO2eW98iBek51pBoTotDh3+/WD
         4poA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786392119; x=1786996919;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exfw+BpSiYeouKj8oOQeysjMtDRV6oyZO/QGXxK66VI=;
        b=PbDOQYfVwfEeyPHPlaQNrq/KWQVeI9JjaraGNIej5c2UMVEU0cOuFiUgicTBfFxEUF
         GigqPWz0nkJbQuGA7tRjZdXSFqpDTfc6RO6xgioQR1BMC/eil2u8kOMYIRj5ue5QUhf8
         7UxyrJafXeR3T5+mGgEQBtGmXmsARrX1DwdWIWIrfyqOz0+eo76v/DXfYR60fy0rnce1
         3AzTX6j/qE3JSdRNaTMfwop+bdUejeriM24tLbg8T/yr7NeskibVlnuq/+O0BQM/rWsG
         ltk65j0mY8SzhqQy1reCSBG7LwhyUNt9szR5Q81V5H5Iukh8srABHyazJSWYrNva9AdO
         95JQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpd1jEsqEzexTviin5LLwDA8tcR7rFgYlozBceR15ApIop87PhqpnMDG+pQv3c/jVjJcZUWi15bTHVmiOcvtBPI@lists.infradead.org
X-Gm-Message-State: AOJu0YzimQ45Ptt19rZVHWIbVlGZxUoXf6zanMr8TaU0FgfgPoE2MlTj
	zrqXGSai467lzgHym1ZbchOVBsfKFc1bWfS2Dq7zglhU0Vc3QpqN8bTq
X-Gm-Gg: AR+sD13zioJpNSCiV/kI+pOU3f69ZRfExknci17F0UKc2hlQ+FWZe5Lugv3Gl7ahi8P
	tnrckYME6ZLIzgGf7TY094kG+ghi8PKzKebAfKefNgQ8malcW7Qng1mpgsGBe5Z0chvWCbKgS/G
	Kl/+gd08mczA3eqdyF/Z0QriDdxI3un61gckfxu13qE/i247N5y4cjy7F+N4TVBOsefAj4pUli7
	9E5yuTXNCg7ygdjBMKOjsKGv3MD3h9rXioQSr1/hvOyGRv6MdMVqukeyK6goxi5lrUbhgirbRlC
	xeFZEuF8vJhOxrHTHBWJmNrpHdxtrzHm8OCVmN6Pk60nx9HHyZV41RQctEvio2NPs1pCkOiadVx
	pUSCx2QiQlSYXCNv12lJl/ro/ZCmttq4nmiK4CfeTaJ+W9Er6T1RV6pFI4caq2M1QU0Rx9gBqVn
	IKeeaUsyVj8NaujYYO0pNbdS/X4UUc3eJNOUK7NDqTRRkSK1Oc/GUB7iQ67aGoCvwJNAeA4TBdL
	MXjuUhFz5H/9yFVkMp/EK0=
X-Received: by 2002:a05:600c:19d1:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-4996199bd2dmr283023555e9.14.1786392118717;
        Mon, 10 Aug 2026 13:01:58 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997415df9asm12835825e9.13.2026.08.10.13.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 13:01:58 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: iuncuim@gmail.com
Cc: wens@kernel.org,
	anarsoul@gmail.com,
	tiny.windzz@gmail.com,
	rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	p.zabel@pengutronix.de,
	andre.przywara@arm.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: Re: [PATCH v5 4/5] thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
Date: Mon, 10 Aug 2026 22:01:55 +0200
Message-ID: <20260810200155.965544-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260704171411.1413349-5-iuncuim@gmail.com>
References: <20260704171411.1413349-1-iuncuim@gmail.com> <20260704171411.1413349-5-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_130201_060368_F6B94A92 
X-CRM114-Status: GOOD (  22.68  )
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

Hi Mikhail, Chen-Yu,

Andre pointed me at this series. I have a T527 (A523 family) Orange Pi 4A
here, so I applied v5 on top of v7.2-rc7 and ran it on the board. It works:

  thermal_zone0  cpu4-thermal   43.0 C idle   49.1 C under load
  thermal_zone1  cpu0-thermal   43.2 C idle   49.2 C under load
  thermal_zone2  gpu-thermal    42.8 C idle   47.2 C under load
  thermal_zone3  ddr-thermal    43.8 C idle   49.3 C under load

(60 s of busy loops on all eight cores.) Boot is clean, no errors from the
driver, and the readings track load sensibly, so:

Tested-by: Juan Manuel López Carrillo <juanmanuellopezcarrillo@gmail.com>

While testing I looked into the open question about the extra sensor,
because I had reached a different number in my own out-of-tree work: I use
sensor_num = 4 for this controller, and this series uses 3.

> Are you sure? The calibration data is written to the sensor register.
> The BSP simply reads the sensor data from the GPU sensor, and passes it
> off as the value for the NPU sensor. No extra calculation involving the
> calibration data is done.

What the BSP does in software and what the hardware has look like two
different things here. The T527 User Manual v0.92 documents four sensors on
this controller: THS_EN (offset 0x04, page 452) has THS0_EN..THS3_EN in bits
3:0 with 31:4 reserved, and page 459 lists four data registers, THS0_DATA
0xC0, THS1_DATA 0xC4, THS2_DATA 0xC8 and THS3_DATA 0xCC, the last described
as "Temperature measurement data of Sensor3". THS_DATA_INTC, THS_SHUT_INTC
and THS_ALARM_INTC likewise have four per-sensor bits.

A documented register is not a wired-up sensor, so I measured it. With this
series running, THS_EN reads 0x7, so sensor 3 is off and THS3_DATA is 0x0,
as expected. Setting bit 3 and reading the four data registers once per
second (raw 12-bit values; lower means hotter on this part):

  idle          THS0 0x875   THS1 0x874   THS2 0x87C   THS3 0x85E
  under load    THS0 0x83C   THS1 0x83C   THS2 0x852   THS3 0x836
  delta          -57          -56          -42          -40

Sensor 3 starts reading as soon as it is enabled, sits at its own offset of
about 0x1C from sensor 2 instead of mirroring it, fluctuates independently
between consecutive reads, and follows the load. So there are four live
channels on this controller and the series reads three. I restored THS_EN to
0x7 afterwards.

What I cannot tell you is which channel belongs to which block, and I want
to be honest that my own tree does not settle it either. I followed a vendor
recipe that goes the other way round from what you describe: it treats the
GPU channel (id 2) as unreliable and reads channel 3 in its place. Your
reading is that the vendor takes the GPU channel and reports it as NPU. Both
cannot be right, and I have no way to tell which block each channel actually
sits next to. All I am claiming is the electrical part: channel 3 is alive
and independent.

One more thing you may want to check, and I am less confident about this
one. Applying your calibration code to my SID gives 0x90D, 0x90D and 0x90E
for sensors 0..2, and 0x92B for the ths0/DDR sensor. In the bits your switch
does not consume, between caldata[4] and the ths0 field, there is a further
12-bit value of 0x919, in the same numeric range as the other four. That
would fit the factory having calibrated four sensors on this controller, but
I have not verified the exact packing, so please take it as a hint and not
as a claim.

If you do end up reading channel 3, there is a trap worth knowing about.
Right after the block is enabled that channel can still be at 0 while its
first conversion is pending. With the two-slope formula a raw 0 works out to
about 183 C, which is above the 110 C critical trip, so the board powers off
2.8 s into boot while it is actually at ~50 C. I hit exactly that and had to
guard against a zero reading before using it.

I am happy to run whatever test would help on this board, including reading
channel 3 with proper calibration if you respin with sensor_num = 4.

Finally, a data point for the naming issue Chen-Yu raised on 5/5. On this
boot the kernel prints:

  thermal_sys: No trip points found for thermal-sensor@2009400 id=2

The gpu-thermal zone does define three trips, but inside a container named
"gpu-trips", so the thermal core silently ignores all of them. Renaming the
containers to "trips" is not only what the binding requires, it is what makes
those trips take effect at all.

Cheers,
Juan

