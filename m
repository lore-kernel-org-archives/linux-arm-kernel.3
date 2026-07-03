Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4C6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 17:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaErd3idfCYZ9nBzpwZ4jTIj75xKFGwhc0tNJS1QEx4=; b=wr5UYSLW8wvEdHhxGWFDCOMqXO
	ARbucAFFge3ky16G77DCY1zAz/EKa3eGAFxy0Z01rGWihfLYUjmOpOmbX4zLOGjF6HL9A0w0BNx+B
	Lvg5jR9V+lbRotS170w5azy2jQe7gwI1cRJ3O3jbMzWb0L8hF4YHdRVSZB+XRJyDr13CNAR6RHn43
	0d47T7/SVwXR4Vo6h6s3bQetN7c+wHlbDxhulleBxzINsdHJFJFsYUeEqvzhnvZvBAWVN9UVJEX8e
	nwcCvFVEVHJdgOaDC6pZ88nRjpJgWUOwagaP8H86FhG3Z3cZRmweMd3BKOVZkhgGXOMrIzkwoZJSu
	qZCSICdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhT1-00000007b36-0D8v;
	Fri, 03 Jul 2026 17:14:19 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhSy-00000007b1n-1ZZ3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 17:14:17 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-37de8008910so720600a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 10:14:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783098854; cv=none;
        d=google.com; s=arc-20260327;
        b=WSQeJjBbEjFUMkVvIJbl455FeaEDJYcbuysJm2oeX8pPJ9SpgGnhDc9KiN3f/g3cnJ
         dRo/2edRFv5J3D7HmDlMj+Zi98W5IelXAbHsLCXUHWTeZ35MYGdN4J85kVS1gtsdw3F1
         vI1mtmmljKyHjrNGTWGhWn3pWTXms2a/ote44g+OGhCzeWIieH0iCJ5xhBv6LLHtyXw3
         WSy+uTgmzXWWPTquS7rJa5BPjGeU4GsG2UaJAVlQHTmlGC62EPSCEwTu0NyBSEfFhTW1
         KBosOVeW70SB9wDU+Xsv9ngmbiKbvz2c5Ghp5EIf1S1p29gyfyDqqd8PjcvCaJknHsLV
         BE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uaErd3idfCYZ9nBzpwZ4jTIj75xKFGwhc0tNJS1QEx4=;
        fh=TQIjBMAe4bOlZQHg8SuXE9o+ixn2oiqUtUc3Z+NaTbw=;
        b=bt9qSSnzEQx1C52nUuVLoSe13b6Bq3/c3O4bpSQWWhGAsdA+DHe12KVsuRv2tAYTv/
         Jgh+Rrt+HYWE7K+ki240x8uxTe7AE2CXDXNR/LHenwTK+dKP8231eGdrRxn0Oj0DyGXd
         1qSAFhDl/tcyUXL+95boegMIC6+dimczFlgn9r2BrqwdhoBG7jyzZfoPztxXE5THdNcK
         2cDX8ljdopw/1GLTuNilkorNAfhKuImOrg1A9u9yWA67JJi2ONzprgq6HXDjcMkLfhYD
         k5YXjB5x1R5p24vfIf192fxoFN1YVthtX2ml7ohbIu2Wjb0PpeI5AJ7Z2RP90cjBRUOt
         sVig==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783098854; x=1783703654; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uaErd3idfCYZ9nBzpwZ4jTIj75xKFGwhc0tNJS1QEx4=;
        b=c31b2ppHaSw3eW7xdLUnmsuC86RQdiNyCcB7pdnx1LK80TeKR8avuNw8k7B0ictUwP
         lioKQ3umgpQxnpgMqN06FsKtN1kYcS2DxsyUK7wy6vj+SgLAfMecljf4DCj1YbL7RhnD
         T5xs80QYQbL6l15iEgTt1NYhthLRQMRQsKz0pjsxxkaFFGSOGgOWXk7gh9MvK41rW9Pg
         jkEozFNSD161GuIjTZjGgFZYLKFYJiAaMm3sokr7333ZVJS7dvtEfBQFlwCiHhnv8y/l
         5xpxxqRHr/vdajiv+M6Kz4X26cXJn24zMNvbe3alarqDYE7p+uE6dBCO7VFDfjG/xdDI
         2oBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098854; x=1783703654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaErd3idfCYZ9nBzpwZ4jTIj75xKFGwhc0tNJS1QEx4=;
        b=ewvWNY8IIhl4EKTV5uTroIDVjNf0Tb6lPofNYkPayriPyW6lsWVSKnwuLUYfy7GVeB
         Z0PeZ37L1vWhnPtigW4nbgj2yL2tLpzhTqfZPttwyd4CAO4S7k2Zgz8TF7g3z/qApoJV
         uXzRG6mQJnTUG9XU5HdKOxffwBq2KgY3ORCJMXOsNoGDBYbrrD2SAn0M2AcFj6uhdxp4
         ZcmHPylsZm7vF3904N4eER7uzRhLXY4Fe420eXuIDfV/eYrJXc1svr2IfzSK4gOucVyl
         FpNJ13WiH9Tv1Mi0+eyIFccXR9ROBIYI1qX00+M0oem9we5yMsU8Itz+yxcLPLkUgJNg
         BQYQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro//dRIQXjKQTZyX5mz3nWXsb6orZi2+znPM329oVeBxpU/6QnUKQAy12NkAdeMBGCKcth7Irw9UegcPkMS94K3@lists.infradead.org
X-Gm-Message-State: AOJu0YxBu9NE3rmCyGve5udTWJ0Bvy4bhmGbjfbikDh5lCx7ZBj9akRu
	lUjFhONema9t7dOShAE7dzMwZSKgt3v4A/eVfNuKtLaVxMK00DDSxRGqWTko0iTmHs61E1SOMe2
	BPD258cMQfusI40ubYDUUbfU+xbK2lXQ=
X-Gm-Gg: AfdE7cnPYWSHwqEl5gsIWGVWvQnaz3NpXmgIDKwIcdMdK/2FHWZdcVY4EwsS4LNEQW6
	UOquh1n06P79v1awjyAndol0ss/d1a6FzkcyU/p+VLxbwJgZGzbA92lOvZmOh4qT4O4qPzgdCo0
	4qxZhagmsQVZXPyDv7Wj0flAPJwDlSEL4QA/kbudACSH4onoR8nKc8IV+TyUuvjnwPDkYiJmAB9
	9KwWFB9FPynTZ689EmOPrTyUt8VfwEQq5Y+C3h9YnBqpmZ2DePcz20fBGixDW7YB85pQGCWqJYe
	Qd+FeEp+Lu+6TPZMO8ZhXUM/+YlU/CxzvDe3+PFWJUMVJANpnjIy
X-Received: by 2002:a17:90b:2fcc:b0:37d:f72c:9636 with SMTP id
 98e67ed59e1d1-38280e981b7mr406598a91.11.1783098854403; Fri, 03 Jul 2026
 10:14:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
 <20260703-nanopi-m6-v1-12-8344a1559519@gmail.com> <DJOWK4QYYMI1.F1TOWMR4BM22@cknow-tech.com>
In-Reply-To: <DJOWK4QYYMI1.F1TOWMR4BM22@cknow-tech.com>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Fri, 3 Jul 2026 19:14:03 +0200
X-Gm-Features: AVVi8CfY39OU8Il_NnWqBVTMmpRn6fLaUzCEyD6qk3aZNRwtsleLFP9BaGWo9Ss
Message-ID: <CAPSPb=ustOuAkeWUL8x6aigO=5wkQUupZh2g5g0Pe=qTa3MeEA@mail.gmail.com>
Subject: Re: [PATCH 12/12] arm64: dts: rockchip: add support for NanoPi M6 board
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_101416_410248_CC1B06A4 
X-CRM114-Status: GOOD (  20.78  )
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

Hi Diederik

On Fri, 3 Jul 2026 at 13:34, Diederik de Haas <diederik@cknow-tech.com> wrote:
>
> Hi,
>
> On Fri Jul 3, 2026 at 12:07 AM CEST, Joachim Eastwood via B4 Relay wrote:
> > From: Joachim Eastwood <joachim.eastwood@gmail.com>
> >
> > The NanoPi M6 board shares most of the features of the R6 boards.
> >
> > Main differences:
> > * M.2 M-key slot with PCIe (Also present on R6C)
> > * M.2 E-key slot with PCIe and USB (from hub)
> > * 1 additional USB 2.0 port from an on-board USB hub
> > * RT5616 audio CODEC
> >
> > Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
> >  arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts | 200 +++++++++++++++++++++
> >  2 files changed, 201 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> > index 761d82b4f4f2..2867830eddf8 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -218,6 +218,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-evb1-v10.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-gameforce-ace.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-indiedroid-nova.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-khadas-edge2.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-m6.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6s.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-nanopi-r6c.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588s-odroid-m2.dtb
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts
> > new file mode 100644
> > index 000000000000..64448bf55cf7
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi-m6.dts
> > @@ -0,0 +1,200 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "rk3588s-nanopi.dtsi"
> > +
> > +/ {
> > +     model = "FriendlyElec NanoPi M6";
> > +     compatible = "friendlyarm,nanopi-m6", "rockchip,rk3588s";
> > +
> > +     sound {
> > +             compatible = "simple-audio-card";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&hp_det>;
> > +
> > +             simple-audio-card,name = "realtek,rt5616-codec";
> > +             simple-audio-card,format = "i2s";
> > +             simple-audio-card,mclk-fs = <256>;
> > +
> > +             simple-audio-card,hp-det-gpios = <&gpio1 RK_PC4 GPIO_ACTIVE_LOW>;
> > +
> > +             simple-audio-card,widgets =
> > +                     "Headphone", "Headphones",
> > +                     "Microphone", "Microphone Jack";
> > +             simple-audio-card,routing =
> > +                     "Headphones", "HPOL",
> > +                     "Headphones", "HPOR",
> > +                     "MIC1", "Microphone Jack",
> > +                     "Microphone Jack", "micbias1";
> > +
> > +             simple-audio-card,cpu {
> > +                     sound-dai = <&i2s0_8ch>;
> > +             };
> > +
> > +             simple-audio-card,codec {
> > +                     sound-dai = <&rt5616>;
> > +             };
> > +     };
> > +
>
> [...]
>
> > +&i2c7 {
> > +     clock-frequency = <200000>;
> > +     status = "okay";
> > +
> > +     rt5616: codec@1b {
> > +             compatible = "realtek,rt5616";
> > +             reg = <0x1b>;
> > +             clocks = <&cru I2S0_8CH_MCLKOUT>;
> > +             clock-names = "mclk";
> > +             #sound-dai-cells = <0>;
> > +             assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
>
> s/I2S0_8CH_MCLKOUT/I2S0_8CH_MCLKOUT_TO_IO/ ?
>
> See these links for details:
> https://lore.kernel.org/linux-rockchip/DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com/
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v7.2-clk/fixes&id=946352b2f88fd2378f0341312e47dff1e8dc2fac

Thanks for the feedback and pointers.
I will use I2S0_8CH_MCLKOUT_TO_IO for the next version.

Grepping through the other boards there doesn't seem to any other users
of I2S0_8CH_MCLKOUT_TO_IO right now. But I assume the other boards
will be converted over later(?)


best regards,
Joachim Eastwood

