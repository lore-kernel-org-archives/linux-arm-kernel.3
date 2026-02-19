Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E348BE9A050
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fA3pKx5AN5x/APCEfqAvfW0pxwW9zZ1rtfJ16/Xi50A=; b=2rzYqXivWomyroS8neuVPh/jZU
	Qwywv0EM0nzy/xuAROROONoHt9nORgtLLcgGCHmV/Nv4za4Nuyok2dL0ijQ2am3WzrJ6GbtwLHtvg
	I3jW4OrzO6qK+S51tZ0fkHf0tVv/DWYMrP+DtSCOe7BKEchrIxdysedZUTH4Do3DwSnV44hIeG8fx
	1g5UiKW1fxv7WJuFnlA7hrAkRE6dr8LMfnGOAYcM/GSycLbkFNECeHiTIMvS/Gb7d7iJkQv6qQJea
	1pUWMim6SvQJ0PK7IVEsYcsUbeaPoK/Gw8OIgQvtkJcB6DZdyfozYyTWDsuqXAOBgV9gbSzFOcA3b
	9ACsWTqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7U6-0000000BfzS-2u2D;
	Thu, 19 Feb 2026 17:06:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7U3-0000000Bfyu-2jPL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 17:06:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-436356740e6so1313860f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 09:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771520794; x=1772125594; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fA3pKx5AN5x/APCEfqAvfW0pxwW9zZ1rtfJ16/Xi50A=;
        b=Vf7rgWoYoJ+Fz/fXfTvoOcQsq1iHqbL3POSlMEsmOsf3+xTAzsDVVfEmw2EbyPq2yM
         dERh/eF+i3ygv2m7SXid5WpuxtkFvkNWioBC5+MjWTq7hTchnaeQ6pEDjkxmn0fvuaN0
         tN9+5bzGf2Ur2Uoz+44FOK0ald118oM3IPaXEeC5Q4sB0gDF4+0HwoWKdkrZ1eOl7QlF
         oNOIG4fY7EjCM2fbB4ZbH1Zit7F5F5eVhRHJsJCfbINj1nd8gpjSqYdcCu5M2aG5G5by
         jOk9X1BPMxM4zHurSnwYfjeOHEc/2ZuOM94nkidEvLKVDz+07GKKgEDb0jGEU/DbaE9E
         8HDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771520794; x=1772125594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fA3pKx5AN5x/APCEfqAvfW0pxwW9zZ1rtfJ16/Xi50A=;
        b=S19iVMuqYcnzqwV/C9dRLP93iMyRTidIbikGLFHInTYD4gFiapuaMmBrAYdEsYuAHd
         ZLny+z3n4+168P+tna47tGelm5HKauf+BmXq6qUGhuDPyJ+5Q4k9C4X4taUzu0VrtW/B
         RCY4hgE8Im1km0Qy7wLYG+hSd9jGrUG2ZYwlaBjDlxE3GM2X6tCdgQTFVFBI8znICHOa
         dxuc2p39c/MweLyNfN5oyJVXqEmsII/mDyw7Hr099rzU2qsU+AFTaPDu9S+JXd1u9S29
         GXvib8Ly0vWHb8uZxRCLIom91v1VKr9WgVWVEdEnyQd8DxX9I0ZLPFH8kXqVaO2rY4ic
         n3xA==
X-Forwarded-Encrypted: i=1; AJvYcCWQLFZlHENBpelI41HkXBOz4/y8t1cJN6ph90t9RQlJb5AHlJ71XqJOsKJ86/BUsE3wuBe2rclXBGx1h7PRj6mW@lists.infradead.org
X-Gm-Message-State: AOJu0YzVdpVf8ubNBZZZlJbHW/t5zWQ7HsWm657IAFoG0v6WryPcwgGM
	JXw4Yk4ITj69oIYsxWokTB400GtNqwzmLawsnkRQ1uPOdQniknBVFOfM
X-Gm-Gg: AZuq6aIy+X42ZFHjIvOyAiO75Kaa1+paAtjZ5xo0zVA7qXDoXjOFh6cZobczanCHeEH
	MFx9N93N4qv5arZf6GMwV6neZGk3s15gyRwDrp9uFHAOK6vzYw+O3lvhByWXgnHR8hnJFwPMORp
	hqJqOyKsi8rMNoSjHUjWrGfc05VXfCJkkNyRi1wdx0wB41V/iPywJCTp46N8BgHAejJ9IzHlES3
	/ApmQE67LRAKLNS715Z+P/pnomLBEDL7hgKJRYFUbMm7U2O8GiofnHYy/lqmNQMQJ2xEIIbPbr/
	LY0Ev5txr1LQd4MNF/+xbWtMhvCzvUurYLiDq1D6mnuH5wARqwWyTfIJkBvdpCq4OYyt9Kmkzig
	XsNZ+MKUBBBmOHbnaUljC2vNgHgSnwtq+7SX2SlMumgp3rAHfKlzlBxX8WoGyNZQGCIYiAlM4nA
	bi0SvUBdaYc+F7FG6Hoc85tl1NcFfCGA4MtDf0y+fgXrTiXcQFdsuObgG9ZfqR5vAK04w1ay+/W
	HHTJnU=
X-Received: by 2002:a05:6000:615:b0:435:e440:f518 with SMTP id ffacd0b85a97d-4379dbad3d7mr36702033f8f.54.1771520793387;
        Thu, 19 Feb 2026 09:06:33 -0800 (PST)
Received: from toolbox (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abd793sm49031868f8f.25.2026.02.19.09.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 09:06:33 -0800 (PST)
Date: Thu, 19 Feb 2026 18:06:31 +0100
From: Max Krummenacher <max.oss.09@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
Message-ID: <aZdDF6BObEu_C4KJ@toolbox>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
 <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_090635_773156_83C62E04 
X-CRM114-Status: GOOD (  30.60  )
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

Hi Frank

On Thu, Feb 19, 2026 at 11:01:26AM -0500, Frank Li wrote:
> On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.com wrote:
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.
> >
> > The change introduced a regression: at least Colibri iMX6ULL and
> > Colibri iMX7 no longer boot with that commit applied, while they boot
> > again after reverting it.
> >
> > Although this has only been verified on these two modules, the issue
> > is expected to affect all device trees using the gpmi-nand driver.
> >
> > [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> > [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> > [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> > [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> > [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> > [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> > [    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
> > ...
> > [    0.960443] ubi0: default fastmap pool size: 200
> > [    0.960476] ubi0: default fastmap WL pool size: 100
> > [    0.960500] ubi0: attaching mtd4
> > [    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
> > ...
> > [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
> > [    1.650029] UBI error: cannot attach mtd4
> > ...
> > [    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)
> 
> Can you help found the real reason why not boot?
> nand@0 is preferred format for MTD raw nand.
> 
> Frank

I guess the root cause is that the driver for gpmi-nand predates the
update of the binding rules which want the nand device described in
a child node 'nand@0' also for nand controllers which only can
control one nand chip.

While it is possible to update the driver in the same patch set as
changing the device tree to understand the new dtb rules, maybe even
falling back to the old definitions this likely breaks other users,
most notable U-Boot.


So I don't see a quick fix other than reverting and living with the
dtb_check warning.

Regards,
Max

> >
> > Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> >
> > ---
> >
> >  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
> >  .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
> >  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
> >  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
> >  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
> >  .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
> >  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
> >  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
> >  .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
> >  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
> >  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
> >  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
> >  15 files changed, 22 insertions(+), 82 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > index f452764fae00..547fb141ec0c 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > @@ -36,12 +36,8 @@ &clks {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	status = "okay";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &i2c3 {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > index 58ecdb87c6d4..9975b6ee433d 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > @@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	status = "okay";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &i2c1 {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > index 6f3becd33a5b..aa9a442852f4 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > @@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	status = "okay";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &i2c1 {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > index f2140dd8525f..85e278eb2016 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > @@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	status = "disabled";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &i2c3 {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > index 131a3428ddb8..c93dbc595ef6 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > @@ -260,14 +260,10 @@ fixed-link {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	#address-cells = <1>;
> >  	#size-cells = <0>;
> >  	status = "okay";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &i2c3 {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > index d29adfef5fdb..57297d6521cf 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > @@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	fsl,no-blockmark-swap;
> >  	status = "okay";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &i2c1 {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > index 40d530c1dc29..2a6bb5ff808a 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > @@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	status = "okay";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &i2c1 {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > index 776f6f78ee46..e34c8cbe36ae 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > @@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	status = "disabled";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &i2c1 {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > index 27e4d2aec137..a3ea1b208462 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > @@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	status = "disabled";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &i2c1 {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > index dc53f9286ffe..1992dfb53b45 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > @@ -296,13 +296,9 @@ &fec2 {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	fsl,no-blockmark-swap;
> >  	status = "okay";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &i2c2 {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > index eaed2cbf0c82..ec3c1e7301f4 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > @@ -160,15 +160,11 @@ &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> >  	fsl,use-minimum-ecc;
> > +	nand-on-flash-bbt;
> > +	nand-ecc-mode = "hw";
> > +	nand-ecc-strength = <8>;
> > +	nand-ecc-step-size = <512>;
> >  	status = "okay";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -		nand-ecc-mode = "hw";
> > -		nand-ecc-strength = <8>;
> > -		nand-ecc-step-size = <512>;
> > -	};
> >  };
> >
> >  /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > index 3dfd43b32055..43518bf07602 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > @@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-ecc-mode = "hw";
> > +	nand-ecc-strength = <0>;
> > +	nand-ecc-step-size = <0>;
> > +	nand-on-flash-bbt;
> >  	status = "okay";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-ecc-mode = "hw";
> > -		nand-ecc-strength = <0>;
> > -		nand-ecc-step-size = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &iomuxc {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > index fc298f57bfff..83b9de17cee2 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > @@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	status = "disabled";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &uart1 {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > index 8ec18eae98a4..2d9f495660c9 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > @@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
> >  &gpmi {
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > +	nand-on-flash-bbt;
> >  	status = "okay";
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  &snvs_poweroff {
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > index a41dc4edfc0d..8666dcd7fe97 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > @@ -375,14 +375,10 @@ &gpio7 {
> >  /* NAND on such SKUs */
> >  &gpmi {
> >  	fsl,use-minimum-ecc;
> > +	nand-ecc-mode = "hw";
> > +	nand-on-flash-bbt;
> >  	pinctrl-names = "default";
> >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > -
> > -	nand@0 {
> > -		reg = <0>;
> > -		nand-ecc-mode = "hw";
> > -		nand-on-flash-bbt;
> > -	};
> >  };
> >
> >  /* On-module Power I2C */
> > --
> > 2.42.0
> >

