Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DA2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/jQln6EvrU5OsZbEU25l6V6bVkwJkGV9R7Ry8hxcQY=; b=2a6wEOaqUIGn9KWizbjkXYpONq
	hdrza2pxhqmlKm64o3CLAHPSKUx/33CW0N7Y3/G2a3ONJvILWr/dpWtdI8T5jeqE3IYnqG/knsqo0
	qFbLs2ti663z/wPPZzxPp5kOvRDOBUHqAWuUFknT42qU9hfUrS934IPmpOzXF+B/Kjbu+1hq5oiC+
	TpEF/AKd1ilsxu8QH9r7AA5YidSYHjhZ6k5IuGnDQ5uloX0uJSZlmomtK4Rm6Xu8DpZJdC4ggk1ua
	6jMlziEf/SJTZUgz3eA8ehcUubn8LNmIbCuAkd9gPEzoB+odRdZx3bdNzLCOKSjVwWourZ3ubiCjL
	H+zcMJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qfv-00000007fSZ-2xfx;
	Wed, 16 Apr 2025 00:30:47 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qe2-00000007fF1-3AOF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 00:28:52 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-af50f56b862so4236981a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 17:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744763330; x=1745368130; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/jQln6EvrU5OsZbEU25l6V6bVkwJkGV9R7Ry8hxcQY=;
        b=KJLaUP29ELCQN9U4lRloI3WJli8f7zluamQbxd9OoFw/tB3q3dzeKXg6e8DPJ19+6H
         tzIE2gJrm+DlrPotR8k+0IYOah7G78xCOtP97u5FC9tgMvlpCZO+Mw7SSruPNSMe/bTM
         QK1WVWXLCCe91GFndIxJxtjYARgrJPalza9E/oM6WFa45yCNM+1LmgYTPaaazL0PkOzt
         cohqhB2CGf4gR/i5ZQmVhIyfIrU1xxRyOWUvxby7xJww05RtKgD7BdqvAa7E8pEMYR64
         K0ce1E8XRr4LSZbjs/XN0+a2k3+xrpC14FYUN5hq0BrB8j+IIu8dExYvPu1yy7HjPAzU
         ooyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744763330; x=1745368130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/jQln6EvrU5OsZbEU25l6V6bVkwJkGV9R7Ry8hxcQY=;
        b=Z5P4/KpHLaFnGlbe6IwcWvsiA3SNG7NA8SBV/iagrjGncAtkWInuTe8l8y5cZGde5/
         d1OBFyFabdth4R6Ia1XGHYZsX8TZWJB/at0DDXPz4gckjwPlmRmf1l4tWcPgHFjWqrod
         U6Pd3X9Ky9yUinLBUpYf43G/7NQN0bZNcG1L567UeIBCFccyrUv9c1NlgKtV6JIeX75R
         lg9IQ0dU8PDflFfd8GclcmRgNI7celUPg4YJcs1x+Odtq5LObRm8lXCDJnPGYN078vXF
         PmBGA0th3XIdogBMDQuEQYUn1VQj0SDmj17DzkihnVW0RtXhW67jypJO14PAFSNWudyl
         YRcw==
X-Forwarded-Encrypted: i=1; AJvYcCXprxz90iPDYRc14k/wZ20WnPUspS+FFOMklobFhBBJCNLoaW5U1oOEEaRqGNNL2oJnMurZ2rqzRz/TH5X23A2h@lists.infradead.org
X-Gm-Message-State: AOJu0YwsQelztfDDcYW8spas/8ak814RZXOeqRofXoG7RamkIm3BKjm8
	aFd2gE3gKYmsk2nobQJTdSTYY2EOdVaVryQ3f4gelzwWX+y8Bxst
X-Gm-Gg: ASbGncvnRB/RwbsYMl1v8MwcSvJvKGh1Q6Fx/W2nXXh9nAozFbrq4K47oPSOMh2glcb
	Iumseg/N6GHjvUXy5HkAgbgYmdRW733AYWGcm6xBTeLOhKer+XSNfms1Q8svm2WnihdIKkAO2LX
	oWShqT48x70SVaKV8gVB3otUnjngZy+1xzywXjdid6AJJyvDxeMtQu/lMW/5apDiCjMHqqWh522
	mqAvpz1lwRp1b29XCv89PvRdgS1jsNL6W4inxLjlzSvN6V2b+A4LtG0/PLBCoi/w8t6Jm7AFjwZ
	lf4z3OKZnwBU4WavsOVNQXYxvkZp76yDiB1dLDFDK5unfpD6NGrksDrheqwGlRu0
X-Google-Smtp-Source: AGHT+IGtQ/Ej18r+8kc7C8PSEgqWMtrQoxZsB9NyLbPlB+AasEwznrdWOuaSLp8n5bhqJPQw3iGZKg==
X-Received: by 2002:a17:90b:2784:b0:2ee:ed1c:e451 with SMTP id 98e67ed59e1d1-3085eedbef2mr2079796a91.15.1744763329584;
        Tue, 15 Apr 2025 17:28:49 -0700 (PDT)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b3719sm263756a91.33.2025.04.15.17.28.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:28:49 -0700 (PDT)
Message-ID: <47643fc7-240e-4af8-80c5-236f1afa8524@gmail.com>
Date: Wed, 16 Apr 2025 08:28:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: apple: Add PMU NVMEM
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-3-22067be253cf@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250415-spmi-nvmem-v1-3-22067be253cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_172850_796334_F49A6310 
X-CRM114-Status: GOOD (  14.08  )
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


Sasha Finkelstein via B4 Relay 於 2025/4/16 清晨5:52 寫道:
> From: Hector Martin <marcan@marcan.st>
>
> Add device tree entries for NVMEM cells present on the PMU
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t6001.dtsi      |  1 +
>  arch/arm64/boot/dts/apple/t6002.dtsi      |  1 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi | 50 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 50 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi      | 50 +++++++++++++++++++++++++++++++
>  5 files changed, 152 insertions(+)

Aside from things that are already mentioned in the feedback for the bindings:

>
> diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
> index 620b17e4031f069874aaabadbf06b7b29ec4031e..d2cf81926f284ccf7627701cc82edff31d4d72d6 100644
> --- a/arch/arm64/boot/dts/apple/t6001.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6001.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/apple-aic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/spmi/spmi.h>
>  
>  #include "multi-die-cpp.h"
>  
> diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
> index a963a5011799a0480f88688fb4372a31f0bbf806..e36f422d257d8fe3a62bfa6e0f0e0dc6c34608a4 100644
> --- a/arch/arm64/boot/dts/apple/t6002.dtsi
> +++ b/arch/arm64/boot/dts/apple/t6002.dtsi
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/interrupt-controller/apple-aic.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/apple.h>
> +#include <dt-bindings/spmi/spmi.h>
>  
>  #include "multi-die-cpp.h"
>  
> diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> index 4c224e686ffe5602329f7f394d3354559c4130ab..9e4402b0bdc085a32d26048ccf1ac4ea20c1e0c2 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -50,6 +50,56 @@ nub_spmi0: spmi@2920a1300 {
>  		reg = <0x2 0x920a1300 0x0 0x100>;
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> +
> +		pmu1: pmu@f {
> +			compatible = "apple,maverick-pmu", "spmi-nvmem";
> +			reg = <0xf SPMI_USID>;
> +
> +			nvmem-layout {
> +				compatible = "fixed-layout";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				pm_setting: pm-setting@1405 {
> +					reg = <0x1405 0x1>;
> +				};
> +
> +				rtc_offset: rtc-offset@1411 {
> +					reg = <0x1411 0x6>;
> +				};
> +
> +				boot_stage: boot-stage@6001 {
> +					reg = <0x6001 0x1>;
> +				};
> +
> +				boot_error_count: boot-error-count@6002 {
> +					reg = <0x6002 0x1>;
> +					bits = <0 4>;
> +				};
> +
> +				panic_count: panic-count@6002 {
> +					reg = <0x6002 0x1>;
> +					bits = <4 4>;
> +				};
> +
> +				boot_error_stage: boot-error-stage@6003 {
> +					reg = <0x6003 0x1>;
> +				};
> +
> +				shutdown_flag: shutdown-flag@600f {
> +					reg = <0x600f 0x1>;
> +					bits = <3 1>;
> +				};
> +
> +				fault_shadow: fault-shadow@867b {
> +					reg = <0x867b 0x10>;
> +				};
> +
> +				socd: socd@8b00 {
> +					reg = <0x8b00 0x400>;
> +				};

Please order by unit address.

> +			};
> +		};
>  	};
>  
>  	wdt: watchdog@2922b0000 {
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index bdb1cb9e406a441e458b1c735359b0148146e91b..03bfe1cb173de009b4cd46508e24358008cf42f5 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -747,6 +747,56 @@ nub_spmi: spmi@23d0d9300 {
>  			reg = <0x2 0x3d0d9300 0x0 0x100>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			pmu1: pmu@f {
> +				compatible = "apple,sera-pmu", "spmi-nvmem";
> +				reg = <0xf SPMI_USID>;
> +
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					pm_setting: pm-setting@d001 {
> +						reg = <0xd001 0x1>;
> +					};
> +
> +					rtc_offset: rtc-offset@d100 {
> +						reg = <0xd100 0x6>;
> +					};
> +
> +					boot_stage: boot-stage@9f01 {
> +						reg = <0x9f01 0x1>;
> +					};
> +
> +					boot_error_count: boot-error-count@9f02 {
> +						reg = <0x9f02 0x1>;
> +						bits = <0 4>;
> +					};
> +
> +					panic_count: panic-count@9f02 {
> +						reg = <0x9f02 0x1>;
> +						bits = <4 4>;
> +					};
> +
> +					boot_error_stage: boot-error-stage@9f03 {
> +						reg = <0x9f03 0x1>;
> +					};
> +
> +					shutdown_flag: shutdown-flag@9f0f {
> +						reg = <0x9f0f 0x1>;
> +						bits = <3 1>;
> +					};
> +
> +					fault_shadow: fault-shadow@a67b {
> +						reg = <0xa67b 0x10>;
> +					};
> +
> +					socd: socd@ab00 {
> +						reg = <0xab00 0x400>;
> +					};

Please order by unit address.

> +				};
> +			};
>  		};
>  
>  		pinctrl_nub: pinctrl@23d1f0000 {
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 950d1f906ba3023c1d118179207a2099345aae94..55ab72cf627efe2e3295409b9af1b2128b829801 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -787,6 +787,56 @@ nub_spmi: spmi@23d714000 {
>  			reg = <0x2 0x3d714000 0x0 0x100>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			pmu1: pmu@e {
> +				compatible = "apple,stowe-pmu", "spmi-nvmem";
> +				reg = <0xe SPMI_USID>;
> +
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					pm_setting: pm-setting@f801 {
> +						reg = <0xf801 0x1>;
> +					};
> +
> +					rtc_offset: rtc-offset@f900 {
> +						reg = <0xf900 0x6>;
> +					};
> +
> +					boot_stage: boot-stage@f701 {
> +						reg = <0xf701 0x1>;
> +					};
> +
> +					boot_error_count: boot-error-count@f702 {
> +						reg = <0xf702 0x1>;
> +						bits = <0 4>;
> +					};
> +
> +					panic_count: panic-count@f702 {
> +						reg = <0xf702 0x1>;
> +						bits = <4 4>;
> +					};
> +
> +					boot_error_stage: boot-error-stage@f703 {
> +						reg = <0xf703 0x1>;
> +					};
> +
> +					shutdown_flag: shutdown-flag@f70f {
> +						reg = <0xf70f 0x1>;
> +						bits = <3 1>;
> +					};
> +
> +					fault_shadow: fault-shadow@867b {
> +						reg = <0x867b 0x10>;
> +					};
> +
> +					socd: socd@8b00 {
> +						reg = <0x8b00 0x400>;
> +					};

Please order by unit address.

> +				};
> +			};
>  		};
>  
>  		pinctrl_smc: pinctrl@23e820000 {
>

