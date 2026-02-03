Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7576E87834
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 15:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MK5oboaEkHiYwSTjLFoCDPQwjjJ04uX2RfYZ7bqzPwQ=; b=T1NrKpMVG6pT9mpC2fxiKFvyBK
	/r+UsLk4Zuna9IGSrlh0LdEzLL/OruQmyE3W9S0F4DcnfEEUjq5NAtAbnntSJszqvG83DHj26nc3i
	citp40auPVwOw/SGVh3ODOe37c6Q5XyWmzepbZLNL/DWiLhNb1PqA+K16ehNKB7xmj3rciNERqmYT
	0MfcOwqtZxu4xP65y5zyiFMkya1StsftrB+9PDkv8sekyKiDfeLfH47DIHlxylJFgV/ioM85PqyVk
	QTetmDfx5bVrfqh3KKWjic/1ZVF+Ft6XrLi/9aEJBYv+I/Woq0pWyyh9rUwgyLUvdr2in5XFmP7rF
	2SWrYpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnI2u-00000006otD-1De3;
	Tue, 03 Feb 2026 15:10:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnI2q-00000006osR-3DiI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 15:10:26 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29f102b013fso59678495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 07:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770131423; x=1770736223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MK5oboaEkHiYwSTjLFoCDPQwjjJ04uX2RfYZ7bqzPwQ=;
        b=N5ybamT47rzRDafkTZcFlwlXP4nljkf1uQhWvkGgKRkf33jp5bME/L6BjGkmFGgifR
         Ear/Jb6KxrZ5nkVkvbD9+yaSYx3UQRzUBsMzeTms/HNM/YI8wyzXTFV0b9AiuC3Pswzi
         Blgm01+ulAPZTqqwLGRuN5kR9LcJrxaMR+wW8Z/cUOB3Fcur5hZ2QMBp0JGFdrRH09Ny
         56ZWcXX//bmhtMTHepwLwBn+Zb2N0W1QJ9QO5rRNXd++OH7UQ5IfTzCd/Yib8HRwVvNh
         VoDtEJ8L8PDEgZZCTiDOYN6PlTVvtp7I98VdWTYnnae7ce+fEvQzJUDJv3ZXDO0aP5lm
         MKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770131423; x=1770736223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MK5oboaEkHiYwSTjLFoCDPQwjjJ04uX2RfYZ7bqzPwQ=;
        b=YFIev0t9zwmqvW6jbjgqXiOg41NdOSjexKHY568e+95UUDB5Yu4HyICLite92yaBSi
         OXn1dVnBQk7jcFVFeF+j+KFxZCVavgcvhqMgBRs/OsynD6nA0e6KlDlOB9lwluZeUceZ
         Qs/P54Co50mWNdiVND8BfGWrKMZgetPHxFuWIp5YfSBw2ZVBXkBTRg0pfiqb3Oq5ZKwX
         pwg6wRoIN4a4it9cZY2IYTDzOtL9sDIYAstCJpwh7U836BiSJwJFQQkp3t7G/nM4x2YU
         EY3OKXoh6p1W/aGx0VjNjiLF73G3C4nLJhVQMFfNW657RCIy0dP6hr0BJegl+TxTB4J2
         e99g==
X-Forwarded-Encrypted: i=1; AJvYcCXBxMqqEydpl/9qCHdhE3BvGpw8KzvY3gbvw6ss21fvcb4fHIBpq+DfJc3K8MxF+z3ZGGMtKO4erFD48MCmE3gi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2rcD09KCWJSExHuokKRH1BupTcvqPkMTouKo2JvVD0L6ryoFc
	4aQL4rM8SDeJJKJQzm/V2B0jZ2kBgwU6PcF8xTh9gM9/51VosEKTtLCu
X-Gm-Gg: AZuq6aJP//vnz2xvPfuqQ0F/zC/SUHE5FqzKX95YEFFHo7wgjGmcScb3kGBmf/KTJmX
	EGn7VMxYmZvZVU3wSf6Q6v35pILg7DrSrU5gaiPrdJ2E3SqaEK/16fgsL9odRyiCGtpBqGGZsGZ
	wCWYa2J9+QXcvxdSBlAZILyfvY3VSfpmKL7EPUyL6jUAxH1oRukPk2jeKC5dY1G3ifOjx9/+PMh
	mwA/gOqdH7jtvGosZzOY+aVk0ar08wUA7QMJdIui9JC5DnzrWVP0KctK0XmbuZNmkCRzt3SGuG6
	nqkCQG/tZQiBk4jojyvvF9u3vFk7sQwI3QTosb1+mzoPYBGmhzc7RDvxAubu5X9H8+pmMo7CpTE
	EXlUI+fvGbp/rX/mlokmsxM9gS1/VnxwiuQ87cNeQol9LnQRnr2i96DymbDIgJjeEGZt8Yqu7Pu
	WTcaxDBeqH
X-Received: by 2002:a17:903:1112:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2a8d993d3b3mr134577365ad.50.1770131422758;
        Tue, 03 Feb 2026 07:10:22 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a52:d2b1::1004])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c3e04sm172196585ad.46.2026.02.03.07.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 07:10:22 -0800 (PST)
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
Date: Tue,  3 Feb 2026 23:10:13 +0800
Message-ID: <20260203151013.305032-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <705908c9-4552-d808-783e-3ce0cf45bbff@manjaro.org>
References: <705908c9-4552-d808-783e-3ce0cf45bbff@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_071024_799870_65556D01 
X-CRM114-Status: GOOD (  28.96  )
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

> Hello Jun,
> 
> On Monday, February 02, 2026 16:04 CET, Jun Yan <jerrysteve1101@gmail.com> wrote:
> > The OneThing Edge Cube (OEC) series features the RK3566 SoC, 8GB
> > eMMC storage, and supports one SATA interface, one Gigabit Ethernet
> > port, and one USB 3.0 port.
> > 
> > Other than the difference in RAM capacity, the OEC and OEC-turbo are
> > identical in all other specifications.
> > 
> >   Specification:
> >     - Rockchip RK3566
> >     - LPDDR4X 2GB (OEC) / 4GB (OEC-turbo)
> >     - eMMC 8GB
> >     - Gigabit Ethernet port x 1
> >     - USB 3.0 port x 1
> >     - USB-C 2.0 port x 1
> >     - 12V DC Power supply
> >     - SATA 3.0 connector x 1
> > 
> > These devices do not have a PMIC, and their hardware circuit design
> > is highly similar to that of the rk3566-box-demo[1]. Hardware schematics
> > are not available at this time, with the vendor firmware dts available
> > for reference[2].
> > 
> > Ethernet, USB 3.0 and SATA 3.0 ports tested, all working well.
> > 
> > [1] https://elixir.bootlin.com/linux/v6.18.6/source/arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
> > [2] https://archive.org/download/wxy-oec-RK3566-4G-dump/wxy-oec-RK3566-4G-dump.dts
> > 
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
> >  .../rockchip/rk3566-onething-oec-series.dts   | 312 ++++++++++++++++++
> >  2 files changed, 313 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec-series.dts
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> > index 4d384f153c13..234fa53abe17 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -104,6 +104,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353v.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353vs.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-odroid-m1s.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-onething-oec-series.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-orangepi-3b-v1.1.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-orangepi-3b-v2.1.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-series.dts b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-series.dts
> > new file mode 100644
> > index 000000000000..2007b93e190e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-series.dts
> > @@ -0,0 +1,312 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/pinctrl/rockchip.h>
> > +#include "rk3566.dtsi"
> > +
> > +/ {
> > +	model = "OneThing OEC/OEC-turbo";
> > +	compatible = "onething,oec-turbo", "onething,oec", "rockchip,rk3566";
> 
> Thanks for the v3!  After thinking a bit more about it, it would be better
> to name the board dtb "rk3566-onething-edge-cube.dtb" and omit the "series"
> part, because the only difference between the board variants is the amount
> of DRAM.  Also, "onething,oec-turbo" should be removed from the compatibles,
> and the single compatible renamed to "onething,edge-cube", because I see no
> need to have an additional compatible, which may be added later if really
> needed for some unforeseen differentiating purpose.
> 
> Also, it might be better to use "OneThing Edge Cube/Edge Cube Turbo" as the
> combined name, because "Edge Cube" is more self-descriptive than just "OEC",
> which may also help with various search engines down the road.

Sorry for the quick follow-up.
In official documentation (Most of it is in Chinese) from OneThing Tech[1], 
the designations "OEC/OEC-turbo" are more commonly and widely used.
for this reason, I propose retaining the "OEC/OEC-turbo" naming in the model 
property.

[1] https://help.onethingcloud.com/be81/OEC1/80c5

Best regards,
Jun Yan

