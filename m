Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE997CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmWhe9edetnI1XYoSUk/a0gFm8QWgHCjQdahFD9uVho=; b=vzi4sYik3tTMqnuXmTSNisACCv
	Hvf+KY7k0ecSL4NJtZBaX7V5jKhRglV6msof9HLWJUhPADwYwsJqTSGDe26yMuWV9v+7xaAZ9zNyl
	nvWs5U3E2SNxb52mKXUu//QxUluJtUjS610X2QmZNyMss2hVT/Sx7wTM39LBa3Ic8+EkPxaXGXZIK
	TxQgRVCl2wAE5Q5KF4mlpZsErAU8nD3uE9JBfWNLI9d2mk3y51ki5282Yd1X+4nWJW6o7dvNgemtQ
	yGEwlKeSr9n9U/vjY0GC1dK4mn2lBqBIMcZZ02PAC+fraMKSXQ2d6QMoe9tt3NCXZoOBB5/OH5jlU
	zIGoYPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJgI-0000000B4ex-2knP;
	Mon, 12 Oct 2026 17:19:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJgF-0000000B4eV-3R2X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:19:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48afe75f055so1977036f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1791825557; x=1792430357; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmWhe9edetnI1XYoSUk/a0gFm8QWgHCjQdahFD9uVho=;
        b=Zb8AxrrkpWJ1oU+Q+90SgANFthCoL8kjWOwnAf9d+77HrbGKMJXJ9gY+YRDi82jkxi
         tR3MBcIeB2wzO0tGPlV54qye+0vBZ4pT4Y+nhVAemQZSiUaQOdPFy84dV2nIXOCC6qMv
         /EYg3t/NLBlzMAv/uTRdK3BsGI6Pz5pigSJPOiK3g7oUJuWN+jvDgEetGEvdjWfiVDwK
         +07wMu4apW2vpd307R/1ISTnOb0V28jXSIqZfA5nLpCPk9kV7WWjTAi7yxCgoigE0eLX
         g1Z67dr8qxza9qsinbyJIxEiRW72pdE98pXXoZ1u8zUAHhBtu4RdZ8g5LI1Qvpde2HoY
         r1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791825557; x=1792430357;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmWhe9edetnI1XYoSUk/a0gFm8QWgHCjQdahFD9uVho=;
        b=KUpFvwZtJRIHqMxfJhK7ZHHK5+6tcNMjJPlp5g3JgPuwfuhy0VhxxgoLczCK+5uAOr
         FdcOp8aJZo02e2GLjw4v0ccImhKt2IJeNYUfGgfydndIFTzfWW6+Ekp9ImXw9fnZIRyw
         UnhwM3yEJG1xwy1ioKX1bkdM4B32EvGjUMsjIrH9qsF+itAfA3VTSxPR39aTrAurXpe+
         +mD99UfrxdLXEdj9sIFqFI1Dv588SLO92X92m6pQKkoVtGZaXMLhEa6jfMHSInBl1rym
         aFnsttRbRLWIUi58/as04QnFWEptLh9o/VVO3rtEhS4mxaH2BSb3pYGmwxvr7VUd0FlC
         dW/g==
X-Forwarded-Encrypted: i=1; AKwUvBwMLhJnwj9WaHgrUKjYW167G2Ea15WH5NQmjrGmvLSTgKxDC+Q06yIcaHYsf8nERls/oTDnnRrAq0A5n6GaJQtO@lists.infradead.org
X-Gm-Message-State: AFq9FYKcaARw277nbMnrBvwqSSFoKFtCAd60yIaV8qOMdZtMYMYPL8vZ
	+ULO87o11AMu604fOagpdVVEsmhwCxLZMKmWHCsiAspQx333mN6mFkZyZKfJOMMjBWY=
X-Gm-Gg: AYBFou3yrh3oRXGsSDxaHmkCp6rv2bv+oM76MYAWetfAofJi9GLrWllYI8+yyN+4Veu
	xlzHY+cYuJav70+QWvg3kwyNuezY/4sDCEUpoBaZZjXHWb1aBOyxaG/CvU1EnprpIuUDgKCTWo8
	NZiN3wKFbq8CMOwKh/rh8n9x+kmNmE+ROj0IrYL0jGT//AuH3ln1EcOpygqScuE79osObigFR/e
	qRZTrq3F0cXZhll73BfgxVjLk4H5loTqMIztyRzToTE19OiX6wVeNgK9n7KykZg9SkyQRyAOr9O
	uVSIrNTZPcHM1tihmjMxjvf1SNqL4oLx0+r2S1NoV71WmN8uzIQc6dZzqaawGumgnPmOuvBOOhB
	LFuirEBThj5aa8ULReOQoec5793b6lWqwZwziaDTq+rF01cLEP3VMXlGKbDKviZBuH63AwgHHlE
	x7/tNYlL6ngoSW7DSxjcy5HT7tXRbCvnyJKik1dAx6zsDn+ag2CpQYTRU478/gkvienKrq6mm8E
	lRwnF7larttoz2SHqVx6fQb5NIw/EPa9RfN3BxOM7w8GglLWgP2A4N23YSeASU=
X-Received: by 2002:a5d:5291:0:b0:486:f3db:e0f2 with SMTP id ffacd0b85a97d-48dbaade0b3mr13920551f8f.14.1791825555359;
        Mon, 12 Oct 2026 10:19:15 -0700 (PDT)
Received: from ?IPV6:2a01:599:840:e202:6f88:7a35:3ae9:6d10? ([2a01:599:840:e202:6f88:7a35:3ae9:6d10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm437267f8f.48.2026.10.12.10.19.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:19:15 -0700 (PDT)
Message-ID: <7d703c43-e462-41d6-a488-87342fd139a2@9elements.com>
Date: Mon, 12 Oct 2026 19:19:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: add Intel AVCRP BMC
To: Dawid Glazik <dawid.glazik@linux.intel.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 maciej.lawniczak@intel.com
References: <cover.1791825961.git.dawid.glazik@linux.intel.com>
 <12f8124fea31a6c6b1401d6aee640842c8d896a7.1791825961.git.dawid.glazik@linux.intel.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <12f8124fea31a6c6b1401d6aee640842c8d896a7.1791825961.git.dawid.glazik@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_101919_986185_605537C2 
X-CRM114-Status: GOOD (  24.04  )
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

On 10/12/26 7:39 PM, Dawid Glazik wrote:
> Add the initial AST2600 device tree for the Intel AVCRP BMC platform.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>

You got Review trailers from Andrew Lunn in v1. Unless you think Andrew 
has to re-review it (which should be then reasoned), please keep them in 
new revisions.

 From the kernel docs [0]:

"Both Tested-by and Reviewed-by tags, once received on mailing list from 
tester or reviewer, should be added by author to the applicable patches 
when sending next versions. However if the patch has changed 
substantially in following version, these tags might not be applicable 
anymore and thus should be removed. Usually removal of someone’s 
Acked-by, Tested-by or Reviewed-by tags should be mentioned in the patch 
changelog with an explanation (after the ‘---’ separator)."

> ---
> v2:
>   - Replace bootargs console=ttyS4,115200n8 with stdout-path = &uart5
>   - Remove the unreferenced video_memory reserved-memory node
> ---
>   arch/arm/boot/dts/aspeed/Makefile             |   1 +
>   .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 315 ++++++++++++++++++
>   2 files changed, 316 insertions(+)
>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 767f7c7652d5..ea4645ef9872 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>   	aspeed-bmc-ibm-rainier-4u.dtb \
>   	aspeed-bmc-ibm-sbp1.dtb \
>   	aspeed-bmc-ibm-system1.dtb \
> +	aspeed-bmc-intel-avcrp.dtb \
>   	aspeed-bmc-intel-s2600wf.dtb \
>   	aspeed-bmc-inspur-fp5280g2.dtb \
>   	aspeed-bmc-inspur-nf5280m6.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> new file mode 100644
> index 000000000000..7c088c89d417
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2026 Intel Corporation
> +
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model = "Intel AVCRP BMC";
> +	compatible = "intel,avcrp-bmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 = &uart5;
> +	};
> +
> +	chosen {
> +		stdout-path = &uart5;
> +		bootargs = "earlycon";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x40000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		video_engine_memory: jpegbuffer {
> +			size = <0x02000000>; /* 32M */
> +			alignment = <0x01000000>;
> +			compatible = "shared-dma-pool";
> +			reusable;
> +		};
> +	};
> +
> +};
> +
> +&rtc {
> +	status = "okay";
> +};

Please sort your nodes, as described in the device tree design guideline 
[1]. There's also a tool called `scripts/dtc/dt-check-style` that can 
help with this.
Note on that: we usually run `--mode strict` but it is known to report 
false-positives, so please check any reported errors twice ^^

> +
> +&fmc {
> +	status = "okay";
> +	flash@0 {
> +		status = "okay";
> +		m25p,fast-read;
> +		label = "bmc";
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <50000000>;
> +#include "openbmc-flash-layout-64.dtsi"
> +	};
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	status = "okay";
> +};
> +
> +&uart5 {
> +	status = "okay";
> +};
> +
> +&uart_routing {
> +	status = "okay";
> +};
> +
> +&mdio1 {
> +	status = "okay";
> +
> +	ethphy1: ethernet-phy@0 {
> +		compatible = "ethernet-phy-id001c.c916";
> +		reg = <0>;
> +		reset-gpios = <&gpio0 ASPEED_GPIO(C, 1) GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <50000>;
> +	};
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default>;
> +	clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>,
> +		 <&syscon ASPEED_CLK_MAC2RCLK>;
> +	clock-names = "MACCLK", "RCLK";
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +};
> +
> +&lpc {
> +	lpc_snoop: lpc-snoop@80 {
> +		snoop-ports = <0x80>;
> +		status = "okay";
> +	};

Why's this named if you don't use it as reference anywhere.

> +};
> +
> +&i3c_global {
> +	status = "okay";
> +};

That's enabled by default.

> +
> +&vhub {
> +	status = "okay";
> +};
> +
> +&video {
> +	status = "okay";
> +	memory-region = <&video_engine_memory>;
> +};
> +
> +&gpio0 {
> +	gpio-line-names =
> +		/*A0-A7*/ "", "", "", "", "SMB_CPU_PIROM_SCL", "SMB_CPU_PIROM_SDA",
> +				"SMB_IPMB_STBY_LVC3_SCL", "SMB_IPMB_STBY_LVC3_SDA",
> +		/*B0-B7*/ "", "", "", "FM_CPU1_ERR2_LVT3_N",
> +				"RGMII_BMC_RMM4_LVC3_R_MDC", "RGMII_BMC_RMM4_LVC3_R_MDIO",

Why do you name reserved GPIO lines (in this case the RGMII lines)? 
They're used by the kernel anyways.

Tan

[0] 
https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
[1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html

