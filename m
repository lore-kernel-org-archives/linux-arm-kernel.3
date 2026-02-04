Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEAEE95396
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 13:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rKC9479RtmvQxjIDGbP/TybkiDx+Ouj854nFtYQtJb4=; b=VBXZJEagCp5EPd86gqrNy1p/So
	YdU1ocP5fOeTdel8WJ6mREa5NLPdFedfew6prA3YzppoTMiPSNz51XQRgxF19rnuUheawJaFj+I0V
	Sz1HTPGHqsKT/Bc4A72It2AM3fauF3uSBqEDLK/HFTOxkM+6+s+5X3Sa0izD0/iSpG5oOmRSS7yrm
	66UJaNjjLwZElut35TYIKxBI4FQQgUoHiqBKUbb/ao+zipz3EAFOkda1c6uZwhcJQPR9W6olRZfje
	9TOVavBmBQwmVGUlHynbwikxXF8lrN2hRuTispitQuc3IHatEn8o27EnYiDPvxpyQ1Q72A/cK46BB
	JGtMJLEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncoU-00000008Uae-2RmC;
	Wed, 04 Feb 2026 13:20:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vncoS-00000008UZF-09g2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 13:20:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a79998d35aso6970485ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 05:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770211255; x=1770816055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKC9479RtmvQxjIDGbP/TybkiDx+Ouj854nFtYQtJb4=;
        b=Enx13wlIHk3qLXgyVJN3jfjCYQPdsI2J0SE4hBO5BhngP4ao/Uz56lM7EAhZbh/Z5C
         JzqLK/zwFBWhyHD/hjman+OTLLrYexNvAJdUUycozmNIuwTBHNJr8wwoCcKX4rAL3gDD
         c1TNffkilaqmWA1jyB889PaCf6mck4hcmGjFK6pswB6CPKgT44YcW0Ad1HFjeN75yzaH
         VOhGxK+RrF/5bQTtRIFP9eZveUMVI+ZOKo6W/heQoOUxE5sltHbGJptCwI+qJ3nwNaMr
         9WWHM86QEKlW8RKy7ohV6EV/6X8zJy0jbJDW0+bugZj+t5ibD6XDv5HIEXdErR+ou5rn
         5IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211255; x=1770816055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rKC9479RtmvQxjIDGbP/TybkiDx+Ouj854nFtYQtJb4=;
        b=O3xSBMfQDVehsds2GxolvOHeJT0nucFKzVNjpBD457xO92rtAltldHkKe9lQy4BqM4
         1XcVJg7Kv9HyZUbiQBfWbZUBR8yZ+sS5kqCqw4RW602rEzFzpbEw3U7OM08mD8vmcSPU
         BqycTvM5NBwB7WzDAnFTT4zxte1iHL7elH9upZG6XYJhjZoeqHXJSMGgzltJTzRfZlG3
         pb3/YuV1fdnO06GMCq6D6IOyPXuAlumdd48vkrG3/5uwnNw0RQrOLxwehg7+LBws07uP
         NomN1kYRyu+NHl6IuyKjJbYpwwty09ulD5u2OPAObnoO6BdPEkd1oJDb3LJtR9TFObns
         +3pw==
X-Forwarded-Encrypted: i=1; AJvYcCVLeg52gNQg0kZ6DjtBxWhxrhmY9cFBpuJ3A2vrN66A7eYC1P1ky+mKpK7e5GdQfX/q+Yhi6rAumws7zj6CipSJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzA5ITERyh6UKwpXus02PWCfwu2cpkJ//m/TIM8siB/viSZ4OJD
	QDviCDhOzWJIQzAwWC40h92sfDQ/HVnp43MxSbMH8Nq1pV0II+bWsQBy1/Q2gw73
X-Gm-Gg: AZuq6aLAHfZCMDFz/QjJNBzn4IIt9WosSJf7Uauz1EusXsF9VjUr6BPsfSnkwRXBzVg
	Vr7R5UTCS45EpAccUDIv4tBL2UAgUx2AcIuhaGRrFtKcS4BLKWtDamKwFgeEChh+ELR5ka3FWaU
	RC7bULwI3btowoYizEvN7cdeIKXCd1UXKxo1PWtF3GwvlpmV0VrPz9bl2b2KkwgSSE4GjuwBOrr
	3ROOG0MSLa6D4IA0mb5+aZzoBCOmP4yRHkxYLAd76znuU2kVXLpviLp+vw6FVFBk7CXdhAths53
	bDYySq2MiUb6FV0cIc1Eoy92hHlpTU7Fq3BKnAn9TXT48o8u4q2knbXhkUFZ6qzr28VTaBVJVmC
	ldaAGQc1CWHVEDUAOIquMfdskITgV9HVPaL0VXMapYRXvAGxug1wr5jbEzsB9gjh2/TK/FwKguq
	raRSAqOms8
X-Received: by 2002:a17:902:ec82:b0:29b:e512:752e with SMTP id d9443c01a7336-2a933fad904mr38729415ad.47.1770211254785;
        Wed, 04 Feb 2026 05:20:54 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a52:d2b1::1004])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93397cd43sm24287045ad.91.2026.02.04.05.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 05:20:54 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: dsimic@manjaro.org
Cc: alchark@gmail.com,
	andyshrk@163.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: Add OneThing Edge Cube series
Date: Wed,  4 Feb 2026 21:20:49 +0800
Message-ID: <20260204132049.327451-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <f6eb572c-dd2c-9606-4fb5-b26b51bbbb06@manjaro.org>
References: <f6eb572c-dd2c-9606-4fb5-b26b51bbbb06@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_052056_102235_FDEF5C23 
X-CRM114-Status: GOOD (  36.77  )
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

Hello,

> Hello Jun,
> 
> On Tuesday, February 03, 2026 16:10 CET, Jun Yan <jerrysteve1101@gmail.com> wrote:
> > > On Monday, February 02, 2026 16:04 CET, Jun Yan <jerrysteve1101@gmail.com> wrote:
> > > > The OneThing Edge Cube (OEC) series features the RK3566 SoC, 8GB
> > > > eMMC storage, and supports one SATA interface, one Gigabit Ethernet
> > > > port, and one USB 3.0 port.
> > > > 
> > > > Other than the difference in RAM capacity, the OEC and OEC-turbo are
> > > > identical in all other specifications.
> > > > 
> > > >   Specification:
> > > >     - Rockchip RK3566
> > > >     - LPDDR4X 2GB (OEC) / 4GB (OEC-turbo)
> > > >     - eMMC 8GB
> > > >     - Gigabit Ethernet port x 1
> > > >     - USB 3.0 port x 1
> > > >     - USB-C 2.0 port x 1
> > > >     - 12V DC Power supply
> > > >     - SATA 3.0 connector x 1
> > > > 
> > > > These devices do not have a PMIC, and their hardware circuit design
> > > > is highly similar to that of the rk3566-box-demo[1]. Hardware schematics
> > > > are not available at this time, with the vendor firmware dts available
> > > > for reference[2].
> > > > 
> > > > Ethernet, USB 3.0 and SATA 3.0 ports tested, all working well.
> > > > 
> > > > [1] https://elixir.bootlin.com/linux/v6.18.6/source/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
> > > > [2] https://archive.org/download/wxy-oec-RK3566-4G-dump/wxy-oec-RK3566-4G-dump.dts
> > > > 
> > > > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> > > >  .../rockchip/rk3566-onething-oec-series.dts   | 312 ++++++++++++++++++
> > > >  2 files changed, 313 insertions(+)
> > > >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec-series.dts
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> > > > index 4d384f153c13..234fa53abe17 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > > > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > > > @@ -104,6 +104,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353v.dtb
> > > >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353vs.dtb
> > > >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
> > > >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-odroid-m1s.dtb
> > > > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-onething-oec-series.dtb
> > > >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-orangepi-3b-v1.1.dtb
> > > >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-orangepi-3b-v2.1.dtb
> > > >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-series.dts b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-series.dts
> > > > new file mode 100644
> > > > index 000000000000..2007b93e190e
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-series.dts
> > > > @@ -0,0 +1,312 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include <dt-bindings/gpio/gpio.h>
> > > > +#include <dt-bindings/leds/common.h>
> > > > +#include <dt-bindings/pinctrl/rockchip.h>
> > > > +#include "rk3566.dtsi"
> > > > +
> > > > +/ {
> > > > +	model = "OneThing OEC/OEC-turbo";
> > > > +	compatible = "onething,oec-turbo", "onething,oec", "rockchip,rk3566";
> > > 
> > > Thanks for the v3!  After thinking a bit more about it, it would be better
> > > to name the board dtb "rk3566-onething-edge-cube.dtb" and omit the "series"
> > > part, because the only difference between the board variants is the amount
> > > of DRAM.  Also, "onething,oec-turbo" should be removed from the compatibles,
> > > and the single compatible renamed to "onething,edge-cube", because I see no
> > > need to have an additional compatible, which may be added later if really
> > > needed for some unforeseen differentiating purpose.
> > > 
> > > Also, it might be better to use "OneThing Edge Cube/Edge Cube Turbo" as the
> > > combined name, because "Edge Cube" is more self-descriptive than just "OEC",
> > > which may also help with various search engines down the road.
> > 
> > Sorry for the quick follow-up.
> > In official documentation (Most of it is in Chinese) from OneThing Tech[1], 
> > the designations "OEC/OEC-turbo" are more commonly and widely used.
> > for this reason, I propose retaining the "OEC/OEC-turbo" naming in the model 
> > property.
> 
> I see, that's an interesting twist.  As some kind of a compromise, it would
> be best to have the board dtb named "rk3566-onething-edge-cube.dtb" and use
> "OneThing Edge Cube (OEC)/OEC Turbo" as the combined name.  That way the
> board dtb name isn't too short, while "OEC" is present in the model name,
> for search engines to pick it up, hopefully, and for people to see it in
> a few places. :)
> 
I appreciate the compromise and fully agree with it: naming the dtb 
"rk3566-onething-edge-cube.dtb" and using "OneThing Edge Cube (OEC)/OEC Turbo" 
as the combined name.

The V4 patch will follow shortly.

Best regards,

Jun Yan

> > [1] https://help.onethingcloud.com/be81/OEC1/80c5


