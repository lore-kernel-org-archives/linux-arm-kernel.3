Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F28C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 21:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CxvYpumBEozSHV1DnKr6eE5OC/BNJCiIXETzkliOdRU=; b=Qyix1hxSzvUCY6D+t5xbBwBmiW
	dsuj2/HP71VkKGLGj6Ps376mcYvvKEq9dI5SEUasw1DswKDgptxkgFcGCTNe6+8JPvUn6cnUOLFGD
	KHnrAU+WX0ucFO5Ecghgcn38+YE7zIU8GhXC1W7ifw2+kkGh/ulnYbfQ2vSijpuhMxosIdk12cHK5
	GN+DXhcPe/fMJhQZkqhGtxTgwgajzYuPfMR4liGKNx6u03Gizwh4KfSKIrgHonQ0vfTmp5NO8GLRK
	nJ+/z7L3fqLtZm2DLiMgSOM5fXuvVeioJVHdLQmAQYHPeU79hjmfbW9s7zNdf1NqoD0j676SIVGKc
	k46Ze2Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Wmj-0000000ENgV-41KA;
	Thu, 17 Apr 2025 21:28:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Vj4-0000000EGWT-3SNj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Apr 2025 20:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CxvYpumBEozSHV1DnKr6eE5OC/BNJCiIXETzkliOdRU=; b=fRSDY3jl8ZyhdPjkOrtOwtL2wc
	q2vwV1pB0sg2nQyepFwZ4PsaxA+ObQD4+BVEfLSGxrgelRmz2jbNJIjonD+EzeTtLxlYPEa/KEVaj
	28SqEUcE4JbJfB9WzrBn5Sctcz/dI+TMYLWR3fCONtTL6LF6CjfcrQe5anr0jJ4HjRYD5A/ObeSQI
	tGqnY9cVZGB5PswKYIyy+g55HaZu2jJyZEXXZwg8p+2mOMW8fB2PfFP6DHT7xfHBUdb0ybDlfJogF
	QHM6QaTza9qOxDHY5FTpRu9w40fF6K8yqCXFMXGhUgpItazqnum+Too/1sHNDDzCnvBhB+lBush85
	9m08pccw==;
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5Viz-0000000AOut-2AKo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 20:20:45 +0000
Date: Thu, 17 Apr 2025 16:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744921215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CxvYpumBEozSHV1DnKr6eE5OC/BNJCiIXETzkliOdRU=;
	b=UOHhvVBmkAgd9WPNP7A5w8ORvh53ti6pcpvBWVConhhHfLt9Ugsr6o2Shy84/azCIHLw1H
	QSOBOqgRmlbhVRoAWfjInC3LY0E5a3xRx/YlDLiu4fAQvviI9yuq+UrItgYhjZDKwU9WBD
	u7wtaDjpDbEdmPpjOdVMZGei9lVtmNQNYoAFWuL+ia9uUMCRV1qsa2B0Zk641GEs+Aciti
	MHt0M3lJcZFRv3ooqkdF6Enc3Q9K4jr7oYbbP3ZmThFVP4FtLwpmxV9LYZUkcqRVlUmiI4
	r3dndD7W7iKWfdN0JEfPv54uFOM9UDEZRLxIvND4WJg+0QhnqAUuvSXf/jqczQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 3/3] arm64: dts: apple: Add PMU NVMEM
Message-ID: <aAFid7N3XiERXTbl@blossom>
References: <20250417-spmi-nvmem-v2-0-b88851e34afb@gmail.com>
 <20250417-spmi-nvmem-v2-3-b88851e34afb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250417-spmi-nvmem-v2-3-b88851e34afb@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_212042_520616_E2DD1F39 
X-CRM114-Status: GOOD (  13.11  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Thu , Apr 17, 2025 at 10:14:51PM +0200, Sasha Finkelstein via B4 Relay a écrit :
> From: Hector Martin <marcan@marcan.st>
> 
> Add device tree entries for NVMEM cells present on the PMU
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  arch/arm64/boot/dts/apple/t6001.dtsi      |  1 +
>  arch/arm64/boot/dts/apple/t6002.dtsi      |  1 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi | 50 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8103.dtsi      | 50 +++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8112.dtsi      | 50 +++++++++++++++++++++++++++++++
>  5 files changed, 152 insertions(+)
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
> index 4c224e686ffe5602329f7f394d3354559c4130ab..fba01727ee8bd67990cb001a5727d5dd2d01e2ee 100644
> --- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> +++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
> @@ -50,6 +50,56 @@ nub_spmi0: spmi@2920a1300 {
>  		reg = <0x2 0x920a1300 0x0 0x100>;
>  		#address-cells = <2>;
>  		#size-cells = <0>;
> +
> +		pmic1: pmic@f {
> +			compatible = "apple,maverick-pmic", "spmi-nvmem";
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
> +			};
> +		};
>  	};
>  
>  	wdt: watchdog@2922b0000 {
> diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
> index bdb1cb9e406a441e458b1c735359b0148146e91b..3892fbe6a955513cad2ae836acc3e83009ab7cc5 100644
> --- a/arch/arm64/boot/dts/apple/t8103.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8103.dtsi
> @@ -747,6 +747,56 @@ nub_spmi: spmi@23d0d9300 {
>  			reg = <0x2 0x3d0d9300 0x0 0x100>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			pmic1: pmic@f {
> +				compatible = "apple,sera-pmic", "spmi-nvmem";
> +				reg = <0xf SPMI_USID>;
> +
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
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
> +
> +					pm_setting: pm-setting@d001 {
> +						reg = <0xd001 0x1>;
> +					};
> +
> +					rtc_offset: rtc-offset@d100 {
> +						reg = <0xd100 0x6>;
> +					};
> +				};
> +			};
>  		};
>  
>  		pinctrl_nub: pinctrl@23d1f0000 {
> diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
> index 950d1f906ba3023c1d118179207a2099345aae94..325e2ac22b3c88d863b2270c39a0a05d625e3f10 100644
> --- a/arch/arm64/boot/dts/apple/t8112.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8112.dtsi
> @@ -787,6 +787,56 @@ nub_spmi: spmi@23d714000 {
>  			reg = <0x2 0x3d714000 0x0 0x100>;
>  			#address-cells = <2>;
>  			#size-cells = <0>;
> +
> +			pmic1: pmic@e {
> +				compatible = "apple,stowe-pmic", "spmi-nvmem";
> +				reg = <0xe SPMI_USID>;
> +
> +				nvmem-layout {
> +					compatible = "fixed-layout";
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					fault_shadow: fault-shadow@867b {
> +						reg = <0x867b 0x10>;
> +					};
> +
> +					socd: socd@8b00 {
> +						reg = <0x8b00 0x400>;
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
> +					pm_setting: pm-setting@f801 {
> +						reg = <0xf801 0x1>;
> +					};
> +
> +					rtc_offset: rtc-offset@f900 {
> +						reg = <0xf900 0x6>;
> +					};
> +				};
> +			};
>  		};
>  
>  		pinctrl_smc: pinctrl@23e820000 {
> 
> -- 
> 2.49.0
> 
> 

