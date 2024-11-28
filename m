Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C763D6910B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1M9x+r+YCviBGoZJC9x2b+6oMkUPbXP/SxU+uMpJQBk=; b=sAPEDPEARlMmGNZMZCWQf/sEtM
	YIOhd3s1qIXYAXt5sA6HCgeMzfP6i8ISskZKZeZGzDMy+is1TV26LVcdtN+ERL0BIMcFgG42GwUNN
	B1TKi4Wtb3J7Rrt8wmiX4dndJgnLo46vp0m7X9243+vsP1rAn2wfYeQwIxeVs3rHeqcnWmBe8XLFU
	1gRljQwRHumq52wL2a3aLA0vTSbYc3IUyRjDUBV4JH8agYmR1t6gGj1W3YNKVq5DpDbriw3+NdoNa
	uUDuT0uirV1Dwuxr5t7CtC6ChsIitwCxE1pHIbG64Sm7LSVxVdHnLkYWVL6ipTU2oBnH5bXbHyRCt
	x3MKsfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGeb3-0000000FdFu-415s;
	Thu, 28 Nov 2024 13:30:17 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGea4-0000000Fd2I-1z0j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 13:29:17 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53de035ea13so828821e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 05:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732800554; x=1733405354; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1M9x+r+YCviBGoZJC9x2b+6oMkUPbXP/SxU+uMpJQBk=;
        b=xCRs15lGZaKpsRgd7Saw0kH+ibEvC2iGXIMm2lbb+JTEJApMcgkHIUmM51xuZ3nIgs
         UHGYzutiweATF83W0engpeyluAmOdugwoQ/Veqod1qtV2OLUdRz2hNCtKmcThxLEQntA
         3vRJ0Mk9yHeeFKVzKSHNGyiGsbzjsOVqnmVybebXJU+tMIrtudk2u6gHHyNFvCM96BEY
         PJj4yRbtSQOPEomDQRXXMYegSsp101I0rNuEDnJPW4lKw57gBckJ47qZW8l0EW1AugD/
         ou6kk9yKgiBrtamkzhOEUUyGm9cWZcPT8S07TTfK8kN8CvxaVlztNbrjR0qt7d+j2C/J
         aUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732800554; x=1733405354;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1M9x+r+YCviBGoZJC9x2b+6oMkUPbXP/SxU+uMpJQBk=;
        b=mKcRWThqIYJLLDGZfIRLbaicTBxk7oabewTaoe3pCjKWjfAMa9Ag61FTo1ydo7PhQ4
         Y+I5xEMENOZahPXjCqsSdTjLeJnASpGAuGMJZoA/CAF8M2xnkxHNDkc151zwBrJuNWZ8
         eT/7wkCT7ar4MU2Gn6CwLhUWiXUFcJAmLYnyNxGNE2Wz7KP3RLL+chkWr02tAMDqJWgT
         gceEqokvVaS8s1mQ8Mr1D28h/IbdqfiQqJ9POrAkirTRsfm4zNXD6Q3owrHbN0XBWy+D
         A/MNZLAS0XZ7w884TQAc1MJ4Ik2HdGaCnzgC0V0jf5SwH9kp3VF5Mo6dB6F8YtJkimUv
         5lKA==
X-Forwarded-Encrypted: i=1; AJvYcCVTEo5qd193StlpOd0zxoc93hq3r38bfBGoixPpA+UICEdAe40GyoWJGEYaZjDgKQ/0tt8C3+++5UMXC7HlWrFO@lists.infradead.org
X-Gm-Message-State: AOJu0YxvzwTksgbbRX3BUijq+WX2A8gnVX3efgElKQzv7P4rl0NIjypF
	SVMrO3ZU8xXiImXYVLkqp8HcZoffKTTeS8x18klL/BED/jPZL4uruyEqutvnuf4=
X-Gm-Gg: ASbGnct1KuAh3VYDJ6SlF7dDn4bO8WOUeF+v7TUNac1aPEL7fdgLLAI5tfJKbAb2c7Z
	ibz1ohMAADWwzE7FSdaAIP7FdUBK6Lo2iqoE/LOpCyevPcrAuEVTg/62PB1RWG515tbACrDZUk8
	132+LBsmvmJs1QE0HBwK3CQ3frsVFlm0089y3WZxrIzB9kF8Up4zrVA7b4Pv6lYIrpddB/zjX28
	bd3be+LzbIUmpJm0lV2LXNJE17GGz59qnxQaf98lULGi2pfwc+6w2ty1jLsGV69h3aloco3vIeg
	zTkdoUxLsZ7M9/6Mb4mnCzuVr2lbLA==
X-Google-Smtp-Source: AGHT+IHy0ZGE4Q0Xmg9+8tJl78/gObc6lT7zqEAjjh/Q+2LBS9UBU7Z9bBloHS8dGT7KVHRth1FBbg==
X-Received: by 2002:a05:6512:3b9e:b0:53d:ecf6:aad5 with SMTP id 2adb3069b0e04-53df00d1b2dmr4636025e87.16.1732800554046;
        Thu, 28 Nov 2024 05:29:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df64434d3sm179283e87.97.2024.11.28.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 05:29:13 -0800 (PST)
Date: Thu, 28 Nov 2024 15:29:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, quic_tengfan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: add base QCS8300 RIDE board
Message-ID: <hswfcxj6vlutl7covrbqqzueljv6nkm3q4qrgccii3zh72qrig@spfbtrvrar5f>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-4-26aa8a164914@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-qcs8300_initial_dtsi-v3-4-26aa8a164914@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_052916_517363_802DA831 
X-CRM114-Status: GOOD (  21.12  )
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

On Thu, Nov 28, 2024 at 04:44:46PM +0800, Jingyi Wang wrote:
> Add initial support for Qualcomm QCS8300 RIDE board which enables DSPs,
> UFS and booting to shell with uart console.
> 
> Written with help from Tingguo Cheng (added rpmhpd nodes) and Xin Liu
> (added ufs, adsp and gpdsp nodes).
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile         |   2 +-
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 267 ++++++++++++++++++++++++++++++
>  2 files changed, 268 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 9bb8b191aeb5..d9545743606a 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -114,7 +114,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
> -dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> new file mode 100644
> index 000000000000..7eed19a694c3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> @@ -0,0 +1,267 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "qcs8300.dtsi"
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS8300 Ride";
> +	compatible = "qcom,qcs8300-ride", "qcom,qcs8300";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		serial0 = &uart7;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	clocks {
> +		xo_board_clk: xo-board-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <38400000>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32000>;
> +		};

Move both clocks to the qcs8300.dtsi. If you wish, you can keep
frequencies in the board DT file.

> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pmm8654au-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vreg_s4a: smps4 {
> +			regulator-name = "vreg_s4a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s9a: smps9 {
> +			regulator-name = "vreg_s9a";
> +			regulator-min-microvolt = <1352000>;
> +			regulator-max-microvolt = <1352000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3a: ldo3 {
> +			regulator-name = "vreg_l3a";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4a: ldo4 {
> +			regulator-name = "vreg_l4a";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5a: ldo5 {
> +			regulator-name = "vreg_l5a";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6a: ldo6 {
> +			regulator-name = "vreg_l6a";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a: ldo7 {
> +			regulator-name = "vreg_l7a";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8a: ldo8 {
> +			regulator-name = "vreg_l8a";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9a: ldo9 {
> +			regulator-name = "vreg_l9a";
> +			regulator-min-microvolt = <2970000>;
> +			regulator-max-microvolt = <3072000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,pmm8654au-rpmh-regulators";
> +		qcom,pmic-id = "c";
> +
> +		vreg_s5c: smps5 {
> +			regulator-name = "vreg_s5c";
> +			regulator-min-microvolt = <1104000>;
> +			regulator-max-microvolt = <1104000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1c: ldo1 {
> +			regulator-name = "vreg_l1c";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <500000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2c: ldo2 {
> +			regulator-name = "vreg_l2c";
> +			regulator-min-microvolt = <900000>;
> +			regulator-max-microvolt = <904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4c: ldo4 {
> +			regulator-name = "vreg_l4c";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6c: ldo6 {
> +			regulator-name = "vreg_l6c";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7c: ldo7 {
> +			regulator-name = "vreg_l7c";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8c: ldo8 {
> +			regulator-name = "vreg_l8c";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l9c: ldo9 {
> +			regulator-name = "vreg_l9c";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&gcc {
> +	clocks = <&rpmhcc RPMH_CXO_CLK>,
> +		 <&sleep_clk>,
> +		 <0>,
> +		 <0>,
> +		 <0>,
> +		 <0>,
> +		 <0>,
> +		 <0>,
> +		 <0>,
> +		 <0>;

Move this to the qcs8300.dtsi (and rpmhcc too).

> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs8300/adsp.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs8300/cdsp0.mbn";
> +	status = "okay";
> +};
> +
> +&remoteproc_gpdsp {
> +	firmware-name = "qcom/qcs8300/gpdsp0.mbn";
> +	status = "okay";
> +};
> +
> +&rpmhcc {
> +	clocks = <&xo_board_clk>;
> +	clock-names = "xo";

qcs8300.dtsi

> +};
> +
> +&uart7 {
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l8a>;
> +	vcc-max-microamp = <1100000>;
> +	vccq-supply = <&vreg_l4c>;
> +	vccq-max-microamp = <1200000>;
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l4a>;
> +	vdda-pll-supply = <&vreg_l5a>;
> +	status = "okay";
> +};
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

