Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2875D2502E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Jan 2026 14:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/KcOMY2Aiby4Ym2c9/9bLw/G2mVDeqsJ5KVEAaYuIM=; b=4O/o8sgfewZM8aCuTbUwkOQLPK
	XmuaLtg5hc2PeGdPujP9duizXYX3xv8h8uqKBaM5Hoh78endM7Af03O6lV+/rhvOcbgZ9ANqvHqZh
	1r/RWZ4sDZkkUMbYIrB/0py1AC8BfLHmsCGF2BMl3FVZYJzv7FNaoN/J6sII6W5sG3A1bZJu2ac+s
	XbhQf4opmDzQkihfjXUswRHnp/aLK4sLvHYrx2+dfqGvafB6ne/iWF+kSw8Q/sTWEt/DEdxsXj9+Z
	/PSOKDMu+eERZFDbUq69VCaK94327ngG8h3tQZ4L/C0RMOmQi61nBf4AE6LzJcRvvSdnbeZFO9x5S
	ZLTq86wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veweU-00000004IFV-2XfP;
	Sun, 11 Jan 2026 14:42:46 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veweR-00000004IEs-3ToV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Jan 2026 14:42:45 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso8278627a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 06:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768142562; x=1768747362; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G/KcOMY2Aiby4Ym2c9/9bLw/G2mVDeqsJ5KVEAaYuIM=;
        b=HGQwv53P7kMROop/Iw+IisAv4laYfV6P44g8b1urwfTu5Hz79sKxWHIBc/moYiSOY+
         SEWWQDC/jY5n/GQ4XPTAX+V0WEkal4NMEPSJBXj9Q5ciSVQzUUjvIircSp/m1wTZvpiU
         hgXU+KuekF71qZBjcH/I4e2JUkJc0v/U1uqFXBHHvl/F8vhVMBbFMt9P+RfuIE7RJpkJ
         pIYN4JDoWgrPeAoMdmWWNcSoQ3J8pITsJ5Ly0iIaqfRdYDF/0p26wTjdlGRdLcflzOAU
         mWjYGpnXeCKCGswKwkD5nE/UZIZc2/UQC0bT7rtvnojj5PS6X+2fb0qTG3tIsoruZwBX
         G0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768142562; x=1768747362;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/KcOMY2Aiby4Ym2c9/9bLw/G2mVDeqsJ5KVEAaYuIM=;
        b=fF6u5EB2RYLmclyGEQrOSKYHBOFQimk6rvlhZeL8lianIZ+ZeLfvn0IK6zU4YVoobP
         f/WldQrGvrEYXUJ2Bg5HMFvpKdveSTiZ4vR2Dh513tB4tAfoSfHcxIsFuZ1QcmIeTtUB
         /J6htzTWY5GaV4TWiSysFGRpy94yfgCVpG02kK4ao2U5J6AEVhhtkKPFHlKRFQtthBrk
         cOffrcsakya5fgaIgMK9o9FrAmrGnroOIENDvahXLJ1FfDqZzyikz03ZiHTgbF0q9mjH
         O1Bp5734wD6RdmP4ToKadL0V9VldCWIhmAzaB9DoBOUBVGj0XIgJ2O9cOJ1EFTubwzEI
         TRkA==
X-Forwarded-Encrypted: i=1; AJvYcCU7XRImtE8eKGN5egSXyHE6qUCaS+alf2arTf5gT4RSUFTXSOt9OmF/zlOJ7pYuKSzAQAkRa75CugyB4MNWBdvp@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4RxTvgmfI2ndoTAnp94Z9THzucb5j3B0F4IxrXgJr51oNsWmC
	7VOc0WXc1HM9dS7aPXdgKaIlk1wSztfI00tj+WGQRY0FsHV8kdiE9kmk8s9qVKZVGfc=
X-Gm-Gg: AY/fxX5B+nZnVCi99rtHTBKlkZiLmI6RgHk/PM7TtQKc6inbp3XY/2G6fz0mH6+02sW
	mLm0L8ieOEJDuQgTeQgMZwKo+422j9t+5YQtUZQs1FbsSlGsabiEQ2wToRjiOiAq6ORmpCYLoxF
	565lW3q0VvJUt4rfbi/REE999HcZGy/rwA8RElRk8gZHmh0ryUeaEh56siOD3YjQbxqAQrvASU8
	oQmLDlmXFZsEojxdztaTRLjoZhN5h0D4aov5pxtXLsXlVn3YrDg6+9PkNkiK9S8vDrftNIzJh2V
	pBmN/K64MKs8mWUevmzOvX5+eHuXnsBS54KrZmcH50WIOUgGAfZxdPy9gWkbWIi1vRsKoAH5q0R
	HruzPFv9PB5qpxH4T92yVDGDRC1zFj1WHZRFpWsT/JYA/FYD7KFVCz6rr945ymLJqlOx/R8WvVl
	OKu3NSK11VHfNM5wC5FWTI4gA=
X-Google-Smtp-Source: AGHT+IE39UCsqaKXvD3F+fxNGt3UWpgz3o9+Q+iDczrztF9S6FJS6cHaS0zXDwLhDt1npYxNq43EAw==
X-Received: by 2002:a05:6402:26d1:b0:64b:5f4e:9e6d with SMTP id 4fb4d7f45d1cf-65097e50c56mr13973823a12.18.1768142561550;
        Sun, 11 Jan 2026 06:42:41 -0800 (PST)
Received: from [10.216.106.246] ([213.233.110.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be642f5sm14853659a12.20.2026.01.11.06.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 06:42:41 -0800 (PST)
Message-ID: <858ca139-61c5-45e3-a2c9-d0af414e3592@tuxon.dev>
Date: Sun, 11 Jan 2026 16:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 15/15] arm64: dts: microchip: add EV23X71A board
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
 lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-16-robert.marko@sartura.hr>
Content-Language: en-US
In-Reply-To: <20251229184004.571837-16-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_064243_904955_12C9A5A1 
X-CRM114-Status: GOOD (  17.25  )
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

Hi, Robert,

On 12/29/25 20:37, Robert Marko wrote:
> Microchip EV23X71A is an LAN9696 based evaluation board.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Split from SoC DTSI commit
> * Apply DTS coding style
> * Enclose array in i2c-mux
> * Alphanumericaly sort nodes
> * Change management port mode to RGMII-ID
> 
>   arch/arm64/boot/dts/microchip/Makefile        |   1 +
>   .../boot/dts/microchip/lan9696-ev23x71a.dts   | 757 ++++++++++++++++++
>   2 files changed, 758 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> 
> diff --git a/arch/arm64/boot/dts/microchip/Makefile b/arch/arm64/boot/dts/microchip/Makefile
> index c6e0313eea0f..09d16fc1ce9a 100644
> --- a/arch/arm64/boot/dts/microchip/Makefile
> +++ b/arch/arm64/boot/dts/microchip/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_LAN969X) += lan9696-ev23x71a.dtb
>   dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb125.dtb
>   dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb134.dtb sparx5_pcb134_emmc.dtb
>   dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb135.dtb sparx5_pcb135_emmc.dtb
> diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> new file mode 100644
> index 000000000000..435df455b078
> --- /dev/null
> +++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts

[ ...]

> +&gpio {
> +	emmc_sd_pins: emmc-sd-pins {
> +		/* eMMC_SD - CMD, CLK, D0, D1, D2, D3, D4, D5, D6, D7, RSTN */
> +		pins = "GPIO_14", "GPIO_15", "GPIO_16", "GPIO_17",
> +		       "GPIO_18", "GPIO_19", "GPIO_20", "GPIO_21",
> +		       "GPIO_22", "GPIO_23", "GPIO_24";
> +		function = "emmc_sd";
> +	};
> +
> +	fan_pins: fan-pins {
> +		pins = "GPIO_25", "GPIO_26";
> +		function = "fan";
> +	};
> +
> +	fc0_pins: fc0-pins {
> +		pins = "GPIO_3", "GPIO_4";
> +		function = "fc";
> +	};
> +
> +	fc2_pins: fc2-pins {
> +		pins = "GPIO_64", "GPIO_65", "GPIO_66";
> +		function = "fc";
> +	};
> +
> +	fc3_pins: fc3-pins {
> +		pins = "GPIO_55", "GPIO_56";
> +		function = "fc";
> +	};
> +
> +	mdio_pins: mdio-pins {
> +		pins = "GPIO_9", "GPIO_10";
> +		function = "miim";
> +	};
> +
> +	mdio_irq_pins: mdio-irq-pins {
> +		pins = "GPIO_11";
> +		function = "miim_irq";
> +	};
> +
> +	sgpio_pins: sgpio-pins {
> +		/* SCK, D0, D1, LD */
> +		pins = "GPIO_5", "GPIO_6", "GPIO_7", "GPIO_8";
> +		function = "sgpio_a";
> +	};
> +
> +	usb_ulpi_pins: usb-ulpi-pins {
> +		pins = "GPIO_30", "GPIO_31", "GPIO_32", "GPIO_33",
> +		       "GPIO_34", "GPIO_35", "GPIO_36", "GPIO_37",
> +		       "GPIO_38", "GPIO_39", "GPIO_40", "GPIO_41";
> +		function = "usb_ulpi";
> +	};
> +
> +	usb_rst_pins: usb-rst-pins {
> +		pins = "GPIO_12";
> +		function = "usb2phy_rst";
> +	};
> +
> +	usb_over_pins: usb-over-pins {
> +		pins = "GPIO_13";
> +		function = "usb_over_detect";
> +	};
> +
> +	usb_power_pins: usb-power-pins {
> +		pins = "GPIO_1";
> +		function = "usb_power";
> +	};
> +
> +	ptp_out_pins: ptp-out-pins {
> +		pins = "GPIO_58";
> +		function = "ptpsync_4";
> +	};

Could you please move this one upper to have all the entries in the gpio 
container alphanumerically sorted?

> +
> +	ptp_ext_pins: ptp-ext-pins {
> +		pins = "GPIO_59";
> +		function = "ptpsync_5";
> +	};

Same here.

[ ...]

> +		port29: port@29 {
> +			reg = <29>;
> +			phys = <&serdes 11>;
> +			phy-handle = <&phy3>;
> +			phy-mode = "rgmii-id";
> +			microchip,bandwidth = <1000>;

There are some questions around this node from Andrew in v1 of this series, 
which I don't see an answer for in any of the following versions. Could you 
please clarify?

The rest looks good to me.

Thank you,
Claudiu


