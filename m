Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D401C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7xlBoDFGfwAiK0YOXlC4SwDB4WdN2STB65PhvVY3kGQ=; b=gLOfTUoPgbvaLJbUr7mBRQ4TaI
	QO8TqzwGmG6IotA52RwXIab7qN+72ciPqdOyErqcXfu5RdM/VbeLPO9CNCSfy9LIoBv2Au8OSfti7
	kQf4CGqLrUEGBcNoNGQ+58riEuotuaVTZKXMTzjw0wPF4H0lRYLgrywYYYVaewkr6rgGX4ATDj6kX
	3wtH12EFMC1GTws04HI7GqCgHNGa2fjiJIHSGoYe85yons7G3+kk/MreZmBPjQ2aSP6Xh/Q6gH6BD
	f0RpjPfpESsL/BQlHXCE/ffJYA1DqQunFXvuW0TlOc/ypsHYZfIpwMEzoYwx03FW7S5lFQR2g59Nj
	QFempZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56yU-0000000ATlO-1ytO;
	Wed, 16 Apr 2025 17:55:02 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56v6-0000000ATBW-3mtx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 17:51:34 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso12211319a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 10:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744825891; x=1745430691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xlBoDFGfwAiK0YOXlC4SwDB4WdN2STB65PhvVY3kGQ=;
        b=D7j1qwHQTuhK9DXEHx1+j08ALudXR46+Th2c3oV010KWklWKRCVRWNkT9FgKnXn9uE
         gwcAKR9k53uKjZDlnkInU5+H3wrn/amrz+cG6ZQjduvWBLjHV5ZJq+r1eIcyr2poJrnG
         pIkUNNqypp/d9DJkpW6eBgeHv8sqon7mil0NTV9c8kx4cYKj8g1aIMiJHa3zpfwRP/4q
         99fEU5GTp1PvaJnH5syc3T0DMPo+732RLsOiSIoZHnaGXXxgLDQ+977q/KgVJxmPthbP
         abPPm2g9INoV23m2OwpyVqVDOypVEUAiv+hGRyseNs7DSBTZGzT1N9VqI8RzuYrVfJEz
         tU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744825891; x=1745430691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xlBoDFGfwAiK0YOXlC4SwDB4WdN2STB65PhvVY3kGQ=;
        b=Le+bCgcSclV3wgwnK5p8SjX9j7cL6pmBs81o16YRdMagAt70XVB6gq5JJnH+gFuMxg
         ++nkQHadfUaA4GpwIwBAtOHjKjoy+4f+TiFarqSUnk0yrkOCywoOzfw+OGqFzw38p4r6
         SAgXHf3nc96sdzyZLNlu69gSay4xhxIycqfiXkSli8lTLF8UdhVaf7CanmxHVWp8XEGV
         veZB1LtPK9mapMZQosqERnFTPvOUXyNcqrX+dROZVk9j/GX55bRG1Q1eX5nqeywK2FqK
         V3GZRuPLBNFkkiBNHij/tVGtu8/i+SacgyN6Ohr6jc2e/kNO4eFXngr4Qgh77cxojgJx
         zW9g==
X-Forwarded-Encrypted: i=1; AJvYcCXRKFbXKwzcsvlgf3PsQ4kGInp05ALErdb19dGAGyyLcbsEfNrnQ57CoLZGAummGkKlTEvg3AoxAa+uuToP1WHl@lists.infradead.org
X-Gm-Message-State: AOJu0YyQoV57NiVUp9O6iWdsUqWSn0iTzFbdZ/gs+R4crlP0jrRU2MSm
	jYmQMAf3vsLtKjmD/2Fs0hAkTkE9KR9O64JRuReovYJlytCmSqLwtKV2wjzkFV0=
X-Gm-Gg: ASbGncsrbao9Bk4LShSeQGAVZ/QWsl/1N++NZET0gMUuVzZ67b1XiLp6facBYZV2hld
	LZldl6DK+mbr4F3+A+V7dZ93EJ9aw955JGt0F/vRcXXPKunLJmBzlMtd1MNg9++G1UQZLtiuEUQ
	o6BK2fXvhrQLfnsdfGRYjJWccArZHuj1Izf280uMI57GSCE90KvwuLDFdot4o6+pf4Bbq7AgUIc
	xNCu8cQA2Etnxa4igDC0sJlfEUSZzEecZDf5wwFrKfBLEXaaLPSXw+bhaABrd5eJN6jDcnbCbF5
	ap9EUe8aLAC52E13/SoOrySmP5lGPsD1avOGnlVKVnxQepGu5HxkGTv+lKKyNIoR9SxYGF4=
X-Google-Smtp-Source: AGHT+IG8ocY2R4u3MSMUM8wLm0cAOVd+8ApQg05RyBRV3UoKUWOsni8cwFhkPXwWINMuR8awGmVJfQ==
X-Received: by 2002:a17:907:3d0e:b0:ac3:853e:4345 with SMTP id a640c23a62f3a-acb42ac181emr250869466b.45.1744825891181;
        Wed, 16 Apr 2025 10:51:31 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cde06f8sm167165366b.61.2025.04.16.10.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 10:51:30 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 16 Apr 2025 19:52:54 +0200
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 10/13] arm64: dts: Add overlay for RP1 device
Message-ID: <Z__udrXkRz-5DSB6@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <ab9ab3536baf5fdf6016f2a01044f00034189291.1742418429.git.andrea.porta@suse.com>
 <abb3405a-45fb-4425-a817-89a03b0c16c4@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abb3405a-45fb-4425-a817-89a03b0c16c4@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_105132_941021_B5B72C3E 
X-CRM114-Status: GOOD (  23.93  )
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

Hi Stefan,

On 13:38 Mon 14 Apr     , Stefan Wahren wrote:
> Hi Andrea,
> 
> just a nit. Could you please add "broadcom:" to the subject?

Consider it done.

Many thanks,
Andrea

> 
> Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > Define the RP1 node in an overlay. The inclusion tree is
> > as follow (the arrow points to the includer):
> > 
> >                        rp1.dtso
> >                            ^
> >                            |
> > rp1-common.dtsi ----> rp1-nexus.dtsi
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> > This patch can be considered optional, since it fills just the second
> > scenario as detailed in [1], which is the RP1 DT node loaded from a dtb
> > overlay by the FW at early boot stage.
> > This may be useful for debug purpose, but as such not strictly necessary.
> > 
> > [1] https://lore.kernel.org/all/CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com/#t
> > ---
> >   arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
> >   arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
> >   2 files changed, 13 insertions(+), 1 deletion(-)
> >   create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
> > index 4836c6da5bee..58293f9c16ab 100644
> > --- a/arch/arm64/boot/dts/broadcom/Makefile
> > +++ b/arch/arm64/boot/dts/broadcom/Makefile
> > @@ -13,7 +13,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
> >   			      bcm2837-rpi-3-b.dtb \
> >   			      bcm2837-rpi-3-b-plus.dtb \
> >   			      bcm2837-rpi-cm3-io3.dtb \
> > -			      bcm2837-rpi-zero-2-w.dtb
> > +			      bcm2837-rpi-zero-2-w.dtb \
> > +			      rp1.dtbo
> >   subdir-y	+= bcmbca
> >   subdir-y	+= northstar2
> > diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > new file mode 100644
> > index 000000000000..ab4f146d22c0
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
> > @@ -0,0 +1,11 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +&pcie2 {
> > +	#address-cells = <3>;
> > +	#size-cells = <2>;
> > +
> > +	#include "rp1-nexus.dtsi"
> > +};
> 

