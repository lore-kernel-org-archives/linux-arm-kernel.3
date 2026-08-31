Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 276D6C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+j/HMcDeeoZ1SxGQJxVLKBNJDgbVV4ZRTow/yvavFk=; b=BKuAVEIRYj5S2nkH3lkaLrZEkh
	/t3oqL7R+YwdIbo7LVxgVehRjpWHeSW5vaSIaZqLOZdgubsAU79bcDL8ejXvAat5JVo0Uj+h+6lf3
	uTOVUhup+diXJDt5s8YnQeGtyOMGW9mSQ0L0JkfhqTk4tZfkjlxP3n1FOMXsay5xSOAqWiVyVk3jl
	L1WHmU/ISP9PNyRQrUFTIKe3B/O6BG3s1XU0v1xACe+PS3dH5/aOflkt5pkuXuyxUCAqinuhfojTU
	8GiEWAT2HF2g/h2xpUPvAn7H7l4pbKDTGSkqbGIin9wLF7x4TlO2ZPDX7Pr+oQwPIfq4hHHoyKMlj
	+7iTxwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11G8-00000009JHC-2pYy;
	Mon, 31 Aug 2026 12:37:08 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11G5-00000009JEe-2HqA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:37:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48436251906so1454881f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1788179823; x=1788784623; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v+j/HMcDeeoZ1SxGQJxVLKBNJDgbVV4ZRTow/yvavFk=;
        b=OBYvuRMykVhQ7AlNoq5hA/ra7E/TEtj+A7q7AgB9PcU7dKBxt2prQ3rRkqCUKP31Yy
         /XTLvmpbU+nutYbuzlH7F9x6lP44XkDviXWwD1WfN4sLddo24tP+oLR9CNWXGqhBONEJ
         gWs7CnmR7w4yQ8CIgqHnAB9MtHOLMlvFdd1PF/FBjBGdoCzUfBGL8Zm3Jz+v5t7egFhe
         SGSi67cKl2mRO/37OJyy2sbzIEV8AirBi/Jbo/LUADgIp8GHM1zOKe6vCf0rJ9owXG0K
         ET2aV9Bg82JXgqMZ8W27vuMR4Mh3p2ZvhjIJHztE5w3CmOZD5zo6Xlwc4WQWnaYr6Ia+
         dwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179823; x=1788784623;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v+j/HMcDeeoZ1SxGQJxVLKBNJDgbVV4ZRTow/yvavFk=;
        b=gPQGRxAj3NhxQ3qivWh2KI+lZWJqVIQmAxEThzyGs25A4OhMR7MFmvIXm4n6RPv7s1
         0H5diGP8qCVnyVR8kn+B1Q/do3hJKKWrMWKLCD8/wtlQ07nXRUZ4TaWmOI9PPHGONpoW
         NEIcr4hN2lKCOVwm9ElbQMaKLxZPS/82vkAJQ4jBt/w5jANzYi8m7YT9cQQCQVHY50nI
         ePa2JE24Yu5WDsCrhxPm0Hs8SAkBJHR2rdvAHfeC90kZt5/asRkK83iTNphFQZq1AV25
         5JimC/1AIWCEnouKxdzbL9hI7QRYJ77KdNFompJkwE0RMNFxWfaTClfvRl4qqlVgjmTK
         OULg==
X-Forwarded-Encrypted: i=1; AKwUvBz79meyVQR2QDk53Q/9IQWWR8iZ/WtugAmNSk0aiHFo1+WFo7D519t8jMjzB8g4DwB4JG6iRVd1FQzTDJo6jGMZ@lists.infradead.org
X-Gm-Message-State: AFuF++kI5KUHQkGc1cgc9HMNiLOsiEXzofRjU6LqXwKSFaIcybpeu+64
	shYu0kmsXC+0sQkKA2tSnzi7jMnQFJLkNgA6LKdJtm7d1UlB6GnZU/6/h4j2ae1EKQI19MfJeTM
	EW+XJYco=
X-Gm-Gg: AYBFou3HNhVFgxCZefM5DYQvQfgGyt1GbRHt4bVV1//lPnE5vdNL3Lw6iOu6TVQvk9y
	1AOnhMR/AIZ9HAjz3sreuLLIKWMAEfSX8mll+sNjo6Cky9TnkFTfBPy7GrX8/lB2gyMDc3Nuxkm
	YHOuMCa7MxLOw109o6jkw4csEMigGsySl/ekVGi4HC6bed41OXfHS5lMVnRb7LxwbQRvLCcn5u7
	7cQ61qfohgwMWXrCzlPEydrD5xh8uyjYRFTtT2DYhPKoBjLBQq/xgwKzEnsmYddsoaeEferjwxn
	DtwLJ8Tmwx4x5suZxfMPWN5OJeEp7Ov2OlazDabTRMMUMAI/37v9TRUAiLkixPDvSMEXUPOKQPl
	MSPNFXzZDdK18N7KItPVUfXO87ogaZpNZ/C2z2ihJFwnIcZji3ChSigs/n1a5quFKRlqEQYkIZH
	mrKETeMYAg68kBYNM6UCYPJ4HIso+aUjMI8QDUhQZIB4IQJgzX9YTcPrMc0Yme4lZiiTXn6idgV
	r31KVUlopH5mBc6+SsKRYFQRN+6claIpg/LsrEDNmivzbYc+VCOPmAhYZberUTSwAvR
X-Received: by 2002:adf:e014:0:20b0:47f:7129:6e2d with SMTP id ffacd0b85a97d-48441010765mr717293f8f.17.1788179822646;
        Mon, 31 Aug 2026 05:37:02 -0700 (PDT)
Received: from white-mocha.local (p200300e66714e500cb5f91bd76cb96be.dip0.t-ipconnect.de. [2003:e6:6714:e500:cb5f:91bd:76cb:96be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843dcc00a6sm4540003f8f.33.2026.08.31.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:37:02 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
From: Tan Siewert <tan.siewert@9elements.com>
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260830182036.284736-3-prasanth.padarthi10@gmail.com>
References: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
 <20260830182036.284736-3-prasanth.padarthi10@gmail.com>
Date: Mon, 31 Aug 2026 14:36:34 +0200
Message-Id: <178817979463.20922.10263529532171804189.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788179813; l=4261;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=rxafdNkhfDfqTybQYvBD6c3YqwB52Q+nzoEnzCYqAtc=;
 b=t8LGYUPo6IQisrHMFR86MLJkpE4vyOvF+mup7Ma3JedRI7oe9cjXkFGqlpW4+NEa7i1H4cjuu
 KqDrGxOVrRaAPCrbQic/6SFFZLmVlk7lX/4SH0QIWnf7fDdf0cciMtA
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_053706_147959_DF46F5B4 
X-CRM114-Status: GOOD (  23.70  )
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

Hi Prasanth,

On 8/30/26 8:20 PM, Prasanth Kumar Padarthi wrote:
> Add the device tree for the ASRock Rack B650D4U BMC, which is
> based on the ASPEED AST2600 SoC.
> 
> Describe the BMC memory, SPI NOR flash layout, UART console, and
> MAC0 connected to an RTL8211F Ethernet PHY.

Why no GPIOs? Why no I2C buses? You'd need at least i2c7 with an at24c128 to
populate the MAC address on MAC0.

> 
> The MAC0 RGMII RX delay configuration was validated on hardware.
> The RTL8211F requires its internal RX delay for reliable operation,
> while an additional TX delay is not required.

No, it does not. The traces have the same length and don't require special
delays. If you use u-boot/next, then it might be true because it still misses
the correct SoC-specific delays. This is, however, fixed in openbmc/u-boot.

I know that this is not optimal. I'm already working on getting this fixed in
upstream U-Boot too.

> 
> Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
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
> index 000000000000..aa623f0ca36c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> @@ -0,0 +1,95 @@
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

Where's the reservation for video?

> +};
> +
> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;

That's already defined in aspeed-g6.dtsi

> +		label = "bmc";
> +		m25p,fast-read;
> +		spi-max-frequency = <50000000>;
> +		spi-rx-bus-width = <4>;
> +		status = "okay";
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			u-boot@0 {
> +				reg = <0x00000000 0x000e0000>;
> +				label = "u-boot";
> +				read-only;
> +			};
> +
> +			u-boot-env@e0000 {
> +				reg = <0x000e0000 0x00020000>;
> +				label = "u-boot-env";
> +			};
> +
> +			kernel@200000 {
> +				reg = <0x00200000 0x00800000>;
> +				label = "kernel";
> +			};
> +
> +			rofs@a00000 {
> +				reg = <0x00a00000 0x02000000>;
> +				label = "rofs";
> +				read-only;
> +			};
> +
> +			rwfs@2a00000 {
> +				reg = <0x02a00000 0x01600000>;
> +				label = "rwfs";
> +			};

No. Include the partitions via `#include openbmc-flash-layout-64.dtsi`.

> +		};
> +	};
> +};
> +
> +&mac0 {
> +	status = "okay";
> +
> +	/*
> +	 * The RTL8211F provides the required RGMII RX delay. No additional
> +	 * TX delay is required for this board.
> +	 */

No? I do have this board myself with a custom BMC ROM and I can tell you that
you don't have to set delays other than the described SoC-specific delays, but
this is, as mentioned, already done in the BSP. (And no, I haven't upstreamed
my DTS yet bc I haven't had the time to do it.)

> +	phy-mode = "rgmii-rxid";

`rgmii-id`

> +	phy-handle = <&ethphy0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii1_default>;

No nvmem cell to set the MAC address? i2c7@57 offset 0x3f80? Please see the
other device-trees for ASRock Rack mainboards.

For me, it is a:

NACKed-by: Tan Siewert <tan.siewert@9elements.com>

Tan

-- 
Tan Siewert <tan.siewert@9elements.com>

