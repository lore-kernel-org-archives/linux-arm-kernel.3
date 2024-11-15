Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FEED68BC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/yPbX6d8qnwsQSq0idPhwK61jM6DG729KCLrzeQHZE=; b=ztdW/bLo6ChO0RXt5X6Os74j8R
	eCeGnI2VPLhZequw0Gmsn6c5iGUnZ9OEbLcDJVu6vCJstnFME/y3grhP9CPJgKrKshXm3mwadocfP
	DECvZp5oZ0iX5Ggn/X6N5mNkCYjvsrSiiFWDfpdKvYrnDBRYgJsNlo9IxqakbmTTQKeBsA+LeLy6I
	OFzTZOeSqgc2ljsgXGJyL6RBPL4Jd88/WN/o1j653/oJBnGP0G1NnRqT0ErNefcghS44tsiXRd+1s
	EW8yTPILAKG6nHGiVS/C5sYXaF7JbglsSxWfBm8cPH1Vz4ermVplSyvocDqY93wX5DR1ltauRIrsa
	9M//QjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxtO-000000035v6-1aNe;
	Fri, 15 Nov 2024 15:05:50 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBxmT-000000034Cr-2REp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 14:58:42 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539e59dadebso2208441e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 06:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731682719; x=1732287519; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8/yPbX6d8qnwsQSq0idPhwK61jM6DG729KCLrzeQHZE=;
        b=QoyjZC4fHmpMOPDZfLoSFAkxXLqj2xkTSfUDQykJQEG73RqDNcrYz8fx4W4Cuorbww
         NH3Ca7/GySGZnXi3JeTPCQv69p36Xvs1wfenSYS/G0YnKcfSMr0mumzW9qCWUbE2dmb5
         U0rtOK9t/tFDnX6n9PY2x3iAtGm52xx40q/PFtFFFQoZzDQukwr75CQVOVv3r+P9bKQ2
         PenQuNUwiwUf5jHK6ZhDiGU9nERnVJhxBBKRSh9d5RnunyX97qRsl944Kvzg9JI3osEM
         P0fpRPePLcw5cut4fJ2aT94aeIp0z+ugit43pE5DFPa5+m3BVIF3VVY08rjNVxdYk/qr
         jXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731682719; x=1732287519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/yPbX6d8qnwsQSq0idPhwK61jM6DG729KCLrzeQHZE=;
        b=sUx/Ordu5ovGcvEEkggUiuXbIJGnKzv6dvXX04DUREJcI6w6J8xg0jzqni/2RuvnJ7
         eLOUl5r/rtKm6yPqloHpLtnuC2TGNyK4OlnSbVri7mwoXyFilme4+xC15u86QWgswbnf
         43gqA4JF/fEfu89ce+VkI6bvNsZx0RUJXqo7zOjcsXlwTbr6ES5IGzYNXrfvZbRHhvfc
         A52ImZg9N0W27c1rj0CApimswpWHpc+sSzjq6MDOaTCSY8ewDhv8oZL5H0NzqXOAo2HW
         n4qMWDYwtx2Og7dzDiaLCPphCJcn5V02FBaErw6Ci4yf1W/zOaOFmQ3ctHGeJ1mvLcCU
         jbLg==
X-Forwarded-Encrypted: i=1; AJvYcCXenAuD/6X9J1WTZ0EhrnCPfhriQsPY4xjuIACEglkD29jj+dTbKc1OVwa9GG0zT+Cyigohvc8kJmEpFyPKfz3+@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3lYYBZOjxdMYAWg++blN82HMlk1TstLBjeYFS1ExkhATDjIbj
	5VBtA5YVDh3Hs39zdJPAao7uGOUakWZFMoj4HW55neNcQTpUe+Gt99/CV1RJjgE=
X-Google-Smtp-Source: AGHT+IGM7VYPBGqesim+t7hs9KzzN+BSQYtR3TO4u2eRlYMxp9E+CqEav7rt4qbZuYt0jOh+d9Lvlg==
X-Received: by 2002:a05:6512:2823:b0:535:3ca5:daa with SMTP id 2adb3069b0e04-53dab2919f6mr1745737e87.7.1731682719177;
        Fri, 15 Nov 2024 06:58:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da653e32fsm581786e87.201.2024.11.15.06.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 06:58:37 -0800 (PST)
Date: Fri, 15 Nov 2024 16:58:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: Add pmd8028 and pmih0108 PMICs
Message-ID: <r4slda74u7rpqiybsylrnoqiqo5qm4442rfwzhtjkwkkgqt25g@n5idmspl7sfd>
References: <20241112004936.2810509-1-quic_molvera@quicinc.com>
 <20241112004936.2810509-3-quic_molvera@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112004936.2810509-3-quic_molvera@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_065841_623564_565CEB15 
X-CRM114-Status: GOOD (  19.24  )
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

On Mon, Nov 11, 2024 at 04:49:32PM -0800, Melody Olvera wrote:
> From: Jishnu Prakash <quic_jprakash@quicinc.com>
> 
> Add descriptions of pmd8028 and pmih0108 PMICs used on SM8750
> platforms.

Up/lower case?

> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/pmd8028.dtsi  | 56 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/pmih0108.dtsi | 62 ++++++++++++++++++++++++++

Those two are independent changes. Please use two separate patches.

>  2 files changed, 118 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pmd8028.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pmih0108.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmd8028.dtsi b/arch/arm64/boot/dts/qcom/pmd8028.dtsi
> new file mode 100644
> index 000000000000..f8ef8e133854
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmd8028.dtsi
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmd8028-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmd8028_temp_alarm>;
> +
> +			trips {
> +				pmd8028_trip0: trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				pmd8028_trip1: trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";

"critical" ?

> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&spmi_bus {
> +	pmd8028: pmic@4 {
> +		compatible = "qcom,pmd8028", "qcom,spmi-pmic";
> +		reg = <0x4 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmd8028_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmd8028_gpios: gpio@8800 {
> +			compatible = "qcom,pmd8028-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmd8028_gpios 0 0 4>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
> new file mode 100644
> index 000000000000..3907d8fbcf78
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +
> +/ {
> +	thermal-zones {
> +		pmih0108-thermal {
> +			polling-delay-passive = <100>;
> +			thermal-sensors = <&pmih0108_temp_alarm>;
> +
> +			trips {
> +				trip0 {
> +					temperature = <95000>;
> +					hysteresis = <0>;
> +					type = "passive";
> +				};
> +
> +				trip1 {
> +					temperature = <115000>;
> +					hysteresis = <0>;
> +					type = "hot";

"critical" ?

> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&spmi_bus {
> +	pmih0108: pmic@7 {
> +		compatible = "qcom,pmih0108", "qcom,spmi-pmic";
> +		reg = <0x7 SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pmih0108_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x7 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		pmih0108_gpios: gpio@8800 {
> +			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
> +			reg = <0x8800>;
> +			gpio-controller;
> +			gpio-ranges = <&pmih0108_gpios 0 0 18>;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		pmih0108_eusb2_repeater: phy@fd00 {
> +			compatible = "qcom,pm8550b-eusb2-repeater";
> +			reg = <0xfd00>;
> +			#phy-cells = <0>;
> +		};
> +	};
> +};
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

