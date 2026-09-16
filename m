Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 433B6C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 09:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtUJCPsoaKTejj6x2QLMIpjL9EPoJFwA0KNqad74re0=; b=0pCJtmuR9KLPjIkLiqi8nJQ2Eb
	gEysOATjp3hItvRlHazBBYWBPRXsFn6wObyeQ9pYUYFScp29AIFCBoGvZMgl6q7WhcvIKVDegRd9h
	IECMv5LLMnZ1rMYlVfvdUreQPUKh1df9czE1ZJvZonaNJkfiLVF2492vaZfoxSzbRZyXmBmJPkpcA
	/6VfoekJhuFVzUZMr3qsCAWX1bbOSC9dAUTYtTQEAO96KF/sMIFmOfE7OdMRQVi+7QlGz7Q5LyTiF
	LJ/SYqCCeIuw1HEm8cjzN953TW+MKKzLuhD4LNKKlVBEe9fryyUqrvnINWPgpzh1NWWlxdQvh7CT7
	zUGIxASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lhq-00000008o0D-2HKj;
	Wed, 16 Sep 2026 09:13:30 +0000
Received: from mail-ed2-x1c.google.com ([2a00:1450:4864:33::1c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6lhn-00000008nzM-3pyy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 09:13:29 +0000
Received: by mail-ed2-x1c.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso1223745a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 02:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1789550005; x=1790154805; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UtUJCPsoaKTejj6x2QLMIpjL9EPoJFwA0KNqad74re0=;
        b=J27W0GGTQ+QecFqmEB+76M/COuqHDO4IrmmUrTy61BOLoYNep4W8RGJvlEWcpb5fGE
         zNnz62xehJ7PDPB5VNwpITk0UhssEWvMBedSgx7TOPibqH5fk47hpVuD/YEewzyRxtHm
         v8dIRakbmdcR0Bth4hFePOlVfbxZyncOi0UoNq39T11dT/m3BXtWo+ZUYtBwirTXiUOl
         1Cy0Iub60z71ImO9EAXOurXYJIo9xylpxo1f9nq70OfPqHOc/KQQRvIMhgeRbsUWO5a5
         vjcFHku2CttHNRvQo67vnB/f11cu+5zx7rLtMuHgl36jatG7CYBJkhEeUlUDQ7rZFY1t
         qYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550005; x=1790154805;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtUJCPsoaKTejj6x2QLMIpjL9EPoJFwA0KNqad74re0=;
        b=NiLlIFDPRXVRty2bs32zBS770+QE5RwetBdSmAAp43Y6j/0me8nN3FbG69QOxsq/GJ
         40KbWxhgmQDvBJ57vAKI80v7G1zdswezQbVhWRK9h5tSleZYZQZhkC3HiLrv5gT+HCJ/
         p3IqoXJTZjy6yBvcjaE7qcPeiVefpICaN/2Xj19X8BkmQrKGP/gGdnnKtRq/gLxr3mFJ
         K5D+qlx7LFT/Nxhj+ZO2QU8Q5QiztCQ7pqh2rv26di9GTJ1Yzml2BzucIbMr1XeogE5o
         WbFuFHmAP1bCPW4DlhbdDjK5zw4VFzF4OlZWhMX4uNXoonQMZGaCD3ER/hATLCcE4D5Y
         NLsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMwJpUI8kttKqZXqIX8zoSaWM+HIcTimvzIZC2fblTZVIlkD+2tc6S+jaGybc93flsn3dQMa0AT0FN2qO6iThV@lists.infradead.org
X-Gm-Message-State: AFuF++np241ktgad6hDwLFzOH5u5JcpwWRoK1DY/4HpTvw1nd3ca8hkN
	taa1b3AvfXyzZqXlS+Dgu9F1qpsN7uFK3SvQLQYJ+4xyIt7gC9OOhwrI3ID+gj3l8qM=
X-Gm-Gg: AYBFou2ldjDFm1lyHGUs8YddWU5FP3PHwE3L3ORnszWr+npLHWh1GtS9VziU4Pm0YSG
	Bjjl6dPukrZ9xw52amNaAMRe24DRRcO3UsPACY2f+ukenePQed9hoUAw4owiFhZTrDRWwvq8aT9
	qk2b/tkgcJHBFh1W/EaeMI3ct9VJMlp/pVzvsOQcsCXslH2qNEJPOc+6xtd354nf5Bs7DFsEGaX
	9qFRmKdqGjiQ+DCAl/MTHrSmLP0zzTTfcHTRLKCH41vyk3+/7/uIgHOc49vmO4NDZ5QDOUaBCfa
	1iAIeagai0+K29KLNGd33mCG82c56ba+VHFv+R4K15QSIyJ0vI7k8dhxGXc/X7UWaZWwXkOMrmn
	2Zwmgw5Igt/F3Yf/ZmuXkJ49+VQyXlxijAQYail5XA5zpc3CN4dnxjvhZ3MbqeqGeQF4fPDC7mB
	fKK8dHkVWYlGWzG54tSg1lpFEryRn9bWg7oEjSZ9nmspKYWDMrQ3UsxV11ICPupZtcsfFIMLDwh
	G9iuHgYSQpF8fQ=
X-Received: by 2002:a05:6402:24c5:b0:6a9:e7eb:f52f with SMTP id 4fb4d7f45d1cf-6aa22418ef3mr1053990a12.28.1789550005374;
        Wed, 16 Sep 2026 02:13:25 -0700 (PDT)
Received: from white-mocha.local ([195.169.148.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2a874esm1148454a12.29.2026.09.16.02.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:13:25 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260915013110.4780-3-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-1-prasanth.padarthi10@gmail.com>
 <20260915013110.4780-3-prasanth.padarthi10@gmail.com>
Date: Wed, 16 Sep 2026 11:13:14 +0200
Message-Id: <178954999459.14468.3220034594197550391.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549995; l=5936;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=bPkxAYoE1nt+KRIvjS+PEE9IbJV3hXHoXuLeG8ZhedM=;
 b=cRryfJU6A7jVHO0Nx61Kd8fo8PmCnV1ZH14DLV0RISA+/+nuTe7JNI6y7jUo1FxKFiwHnboWS
 oWWxG1ZTPrBBOHlDo3PTtKo3lC1H5uosZY0hKaAzuzQOVg6ToMR+V/Z
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_021327_996142_63DE4922 
X-CRM114-Status: GOOD (  18.87  )
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

> Add the device tree for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> Describe the BMC memory, SPI NOR flash layout, UART console,
> GPIO line names, video framebuffer memory, I2C EEPROM, and MAC0
> connected to an RTL8211F Ethernet PHY.
> 
> Use the EEPROM on I2C7 as the NVMEM provider for the MAC0 address.
> 
> Configure MAC0 to use the RTL8211F in RGMII-ID mode.
> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>

dt-check-style --mode strict reports issues:

    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:8: [property-order] property 'compatible' out of canonical order (should sort before 'model')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:26: [property-order] property 'ranges' out of canonical order (should sort before '#size-cells')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:30: [property-order] property 'alignment' out of canonical order (should sort before 'size')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:31: [property-order] property 'compatible' out of canonical order (should sort before 'alignment')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:39: [property-order] property 'memory-region' out of canonical order (should sort before 'status')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:70: [property-order] property 'spi-max-frequency' out of canonical order (should sort before 'm25p,fast-read')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:72: [required-blank-lines] "status" must be preceded by a blank line
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:80: [property-order] property 'phy-mode' out of canonical order (should sort before 'status')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:81: [property-order] property 'phy-handle' out of canonical order (should sort before 'phy-mode')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:83: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
    arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts:85: [property-order] property 'nvmem-cells' out of canonical order (should sort before 'pinctrl-0')

>
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 6b68671f9379..b109491d5c8f 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-ampere-mtmitchell.dtb \
>  	aspeed-bmc-arm-stardragon4800-rep2.dtb \
>  	aspeed-bmc-asrock-altrad8.dtb \
> +	aspeed-bmc-asrock-b650d4u.dtb \
>  	aspeed-bmc-asrock-e3c246d4i.dtb \
>  	aspeed-bmc-asrock-e3c256d4i.dtb \
>  	aspeed-bmc-asrock-paul-ipmi-card.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> new file mode 100644
> index 000000000000..6585bda56a4c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +
> +/ {
> +	model = "ASRock Rack B650D4U BMC";
> +	compatible = "asrock,b650d4u-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial0 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gfx_memory: framebuffer {
> +			size = <0x01000000>;
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +};
> +
> +&gfx {
> +	status = "okay";
> +	memory-region = <&gfx_memory>;
> +};
> +
> +&gpio0 {
> +	gpio-line-names =
> +		/* A0-A7 */	"","","","","","","","",
> +		/* B0-B7 */	"","","","","","","","",
> +		/* C0-C7 */	"","","","","","","","",
> +		/* D0-D7 */	"","","","","","","","",
> +		/* E0-E7 */	"","","","","","","","",
> +		/* F0-F7 */	"","","","","","button-reset-n","","",

How did you confirm this? According to the schematic it should be P0 (P0-P5
have GPIO passthrough functionality).

> +		/* G0-G7 */	"","","","","","","","",
> +		/* H0-H7 */	"","","","","","","","",
> +		/* I0-I7 */	"","","","","","","","",
> +		/* J0-J7 */	"","","","","","","","",
> +		/* K0-K7 */	"","","","","","","","",
> +		/* L0-L7 */	"","","","","","","","",
> +		/* M0-M7 */	"","","","","","","","",
> +		/* N0-N7 */	"","","","","","","","",
> +		/* O0-O7 */	"","","","","","","","",
> +		/* P0-P3 */	"","","","control-power-n";

Personally, I'm not a fan when `gpio-line-names` doesn't match with the amount
of defined `ngpios`, but that doesn't mean it's wrong. Maybe Andrew Jeffrey has
a different opinion on that.

> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		label = "bmc";
> +		m25p,fast-read;
> +		spi-max-frequency = <50000000>;
> +		spi-rx-bus-width = <4>;
> +		status = "okay";
> +
> +#include "openbmc-flash-layout-64.dtsi"
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;
> +
> +	nvmem-cells = <&eth0_macaddress>;
> +	nvmem-cell-names = "mac-address";
> +};
> +
> +&mdio0 {
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@0 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <0>;
> +	};
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&i2c7 {

Please sort your nodes, as per the device-tree style guideline [0].

[0] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

