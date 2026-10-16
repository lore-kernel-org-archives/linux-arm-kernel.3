Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFF7CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hj1KH8boNQyeqb0RG6bTHrI9yRinPTXtodZqXvdAi2Q=; b=WGBim+N73UWPCcTJRVCGrKsbqP
	zkFC87KyvqiuTTGoXppDVseUL69Hjuq6uWJlyCa0or0DydWi4SD1H0Mg5yWFLCfh4UISnikaccXKm
	YTjzSGYboj/FQxbmn94+4pDHCkhmLIrO2V8gE0Km6OnvzWXy56xWtclBZpi9bNQtdlBC6mw4Vv6SW
	2+NUOYW4LSTkOtAe/QGhWaNoapdU/bZpG5N3/G12Zu6Xpq9WypnQ1lWgNiZ9qV0MWIxxOgH7Iv6kt
	5GcWrHvcUiaT0940/Df/a/N8t9PIInjFCqEveASQo8X+X7qcSqdqDso278d9ZR906yrVsgF1si8+g
	VSvPckXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiyJ-000000039HL-2K8G;
	Fri, 16 Oct 2026 14:31:47 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHiyG-000000039Ge-3KEL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792161105; x=1823697105;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dt+a4a6W70jAxDMgMbHMH1fPbQ/npH5no4bHOhmOJ1Q=;
  b=JnsL+wuucZLIkfT+SrI7YmWny7Wu7TOhVg23dUYGE6EI7dIuLhpZnzXN
   XTV6t5u7CMO3ybPfwp5dDQZyVzvOVrytPr/6Th/EDMlgOk/Wj30xoAuyZ
   ZTCllxJ04PadPeYLHz+bD1NBKVnkJKyhIc1r5UwJP/6uUKh+6mqm+fjJo
   +ng6Ao6vsjI49dZ92/ZyrE36JKqVC+QeCMDoYJz25zOvCdUfEIfpxYVWY
   +8/MpTFl18ywGHGs/pMIyY4s6nUMLg18gbPqgqrpHQM88bsEEihYYE52T
   dG5W/p6oIIJQ8zSK02kUqBOnoUTtOyC34npUekQ0taXaOgPikyP15VuRe
   g==;
X-CSE-ConnectionGUID: XEe2GL+tTJabTNt+VPJIHg==
X-CSE-MsgGUID: x2y40ZQmRLSh2TFE7pINAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="950270"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="950270"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:31:43 -0700
X-CSE-ConnectionGUID: mRWJKeS1S0+qnz5vjEKOLw==
X-CSE-MsgGUID: 52fbFazJTpmxta21tS5qsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1954568"
Received: from dawidgla-mobl.ger.corp.intel.com (HELO [10.94.249.157]) ([10.94.249.157])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 07:31:41 -0700
Message-ID: <f7c98fbe-2880-4769-bf09-53134cdfc63d@linux.intel.com>
Date: Fri, 16 Oct 2026 16:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: add Intel AVCRP BMC
To: Tan Siewert <tan.siewert@9elements.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 maciej.lawniczak@intel.com
References: <cover.1791825961.git.dawid.glazik@linux.intel.com>
 <12f8124fea31a6c6b1401d6aee640842c8d896a7.1791825961.git.dawid.glazik@linux.intel.com>
 <7d703c43-e462-41d6-a488-87342fd139a2@9elements.com>
Content-Language: en-US
From: Dawid Glazik <dawid.glazik@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7d703c43-e462-41d6-a488-87342fd139a2@9elements.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_073144_899221_6109ED11 
X-CRM114-Status: GOOD (  26.78  )
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

On 10/12/2026 7:19 PM, Tan Siewert wrote:
> On 10/12/26 7:39 PM, Dawid Glazik wrote:
>> Add the initial AST2600 device tree for the Intel AVCRP BMC platform.
>>
>> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> 
> You got Review trailers from Andrew Lunn in v1. Unless you think Andrew 
> has to re-review it (which should be then reasoned), please keep them in 
> new revisions.
> 
>  From the kernel docs [0]:
> 
> "Both Tested-by and Reviewed-by tags, once received on mailing list from 
> tester or reviewer, should be added by author to the applicable patches 
> when sending next versions. However if the patch has changed 
> substantially in following version, these tags might not be applicable 
> anymore and thus should be removed. Usually removal of someone’s Acked- 
> by, Tested-by or Reviewed-by tags should be mentioned in the patch 
> changelog with an explanation (after the ‘---’ separator)."
> 
>> ---
>> v2:
>>   - Replace bootargs console=ttyS4,115200n8 with stdout-path = &uart5
>>   - Remove the unreferenced video_memory reserved-memory node
>> ---
>>   arch/arm/boot/dts/aspeed/Makefile             |   1 +
>>   .../dts/aspeed/aspeed-bmc-intel-avcrp.dts     | 315 ++++++++++++++++++
>>   2 files changed, 316 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
>>
>> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/ 
>> aspeed/Makefile
>> index 767f7c7652d5..ea4645ef9872 100644
>> --- a/arch/arm/boot/dts/aspeed/Makefile
>> +++ b/arch/arm/boot/dts/aspeed/Makefile
>> @@ -54,6 +54,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>       aspeed-bmc-ibm-rainier-4u.dtb \
>>       aspeed-bmc-ibm-sbp1.dtb \
>>       aspeed-bmc-ibm-system1.dtb \
>> +    aspeed-bmc-intel-avcrp.dtb \
>>       aspeed-bmc-intel-s2600wf.dtb \
>>       aspeed-bmc-inspur-fp5280g2.dtb \
>>       aspeed-bmc-inspur-nf5280m6.dtb \
>> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts b/ 
>> arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
>> new file mode 100644
>> index 000000000000..7c088c89d417
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-intel-avcrp.dts
>> @@ -0,0 +1,315 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +// Copyright 2026 Intel Corporation
>> +
>> +/dts-v1/;
>> +
>> +#include "aspeed-g6.dtsi"
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>> +
>> +/ {
>> +    model = "Intel AVCRP BMC";
>> +    compatible = "intel,avcrp-bmc", "aspeed,ast2600";
>> +
>> +    aliases {
>> +        serial4 = &uart5;
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = &uart5;
>> +        bootargs = "earlycon";
>> +    };
>> +
>> +    memory@80000000 {
>> +        device_type = "memory";
>> +        reg = <0x80000000 0x40000000>;
>> +    };
>> +
>> +    reserved-memory {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +
>> +        video_engine_memory: jpegbuffer {
>> +            size = <0x02000000>; /* 32M */
>> +            alignment = <0x01000000>;
>> +            compatible = "shared-dma-pool";
>> +            reusable;
>> +        };
>> +    };
>> +
>> +};
>> +
>> +&rtc {
>> +    status = "okay";
>> +};
> 
> Please sort your nodes, as described in the device tree design guideline 
> [1]. There's also a tool called `scripts/dtc/dt-check-style` that can 
> help with this.
> Note on that: we usually run `--mode strict` but it is known to report 
> false-positives, so please check any reported errors twice ^^
> 
>> +
>> +&fmc {
>> +    status = "okay";
>> +    flash@0 {
>> +        status = "okay";
>> +        m25p,fast-read;
>> +        label = "bmc";
>> +        spi-rx-bus-width = <4>;
>> +        spi-max-frequency = <50000000>;
>> +#include "openbmc-flash-layout-64.dtsi"
>> +    };
>> +};
>> +
>> +&uart1 {
>> +    status = "okay";
>> +};
>> +
>> +&uart3 {
>> +    status = "okay";
>> +};
>> +
>> +&uart4 {
>> +    status = "okay";
>> +};
>> +
>> +&uart5 {
>> +    status = "okay";
>> +};
>> +
>> +&uart_routing {
>> +    status = "okay";
>> +};
>> +
>> +&mdio1 {
>> +    status = "okay";
>> +
>> +    ethphy1: ethernet-phy@0 {
>> +        compatible = "ethernet-phy-id001c.c916";
>> +        reg = <0>;
>> +        reset-gpios = <&gpio0 ASPEED_GPIO(C, 1) GPIO_ACTIVE_LOW>;
>> +        reset-assert-us = <10000>;
>> +        reset-deassert-us = <50000>;
>> +    };
>> +};
>> +
>> +&mac1 {
>> +    status = "okay";
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pinctrl_rgmii2_default>;
>> +    clocks = <&syscon ASPEED_CLK_GATE_MAC2CLK>,
>> +         <&syscon ASPEED_CLK_MAC2RCLK>;
>> +    clock-names = "MACCLK", "RCLK";
>> +    phy-mode = "rgmii-id";
>> +    phy-handle = <&ethphy1>;
>> +};
>> +
>> +&lpc {
>> +    lpc_snoop: lpc-snoop@80 {
>> +        snoop-ports = <0x80>;
>> +        status = "okay";
>> +    };
> 
> Why's this named if you don't use it as reference anywhere.
> 
>> +};
>> +
>> +&i3c_global {
>> +    status = "okay";
>> +};
> 
> That's enabled by default.
> 
>> +
>> +&vhub {
>> +    status = "okay";
>> +};
>> +
>> +&video {
>> +    status = "okay";
>> +    memory-region = <&video_engine_memory>;
>> +};
>> +
>> +&gpio0 {
>> +    gpio-line-names =
>> +        /*A0-A7*/ "", "", "", "", "SMB_CPU_PIROM_SCL", 
>> "SMB_CPU_PIROM_SDA",
>> +                "SMB_IPMB_STBY_LVC3_SCL", "SMB_IPMB_STBY_LVC3_SDA",
>> +        /*B0-B7*/ "", "", "", "FM_CPU1_ERR2_LVT3_N",
>> +                "RGMII_BMC_RMM4_LVC3_R_MDC", 
>> "RGMII_BMC_RMM4_LVC3_R_MDIO",
> 
> Why do you name reserved GPIO lines (in this case the RGMII lines)? 
> They're used by the kernel anyways.
> 
> Tan
> 
> [0] https://docs.kernel.org/process/submitting-patches.html#using- 
> reported-by-tested-by-reviewed-by-suggested-by-and-fixes
> [1] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
Hi Tan,

Thanks for the instructions. I'll implement them in the new revision

Dawid

