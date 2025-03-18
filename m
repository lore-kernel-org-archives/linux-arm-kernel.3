Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92616C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 14:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioS2cZEy0ukzwLsu1UzbYL55bIz2RUYjyFsEjQ2qJY4=; b=QjX5Ok5PnEEgN/UnMEYM6XAubc
	D2aokhPOdrTkQv4wXPwZnRNC5T6aUOdQklBa/PDXyjwldMg/nx6ykP3oscjSimfVmTnbDLgyTvjg4
	RGGiQuYMNXkoE4VdcH4Pbfrg9sl/bbyuxfM6s/xG/VcqH7HyZi/FD4gv2QEu/pzflCMgFuKS/PV6F
	CrTT4ikceQDcjtdryhL9xZsHCEluNVF+xuiTZh5JAflJd5yJskrLidH5iHkscQF2K8gNUS50lA4LS
	PzISPZpQHbRWmrN/x+9BY1h+dASwi2DVWqPEP/fvrJnbArToKrk6EMrzA+jzthN1KhZHa6EJUtuzQ
	jqIvyM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXUg-000000066e2-0Wqi;
	Tue, 18 Mar 2025 14:00:34 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXOU-000000065Yd-3zbO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:54:12 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso169089966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742306049; x=1742910849; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ioS2cZEy0ukzwLsu1UzbYL55bIz2RUYjyFsEjQ2qJY4=;
        b=BFIy/fF2zlAiCthYH+OthmMZdufLGJZRQq2f7yzthE76zv6pSKRZW8Nr9C4efppPKQ
         /3aBUK/Dakiog+GVcAABptbpkP7set7NLt77Ij5UULBqTMN2OkUAPc1DcrrfGCYYTUYc
         0dkfreT9aVatKbMwfGJ8tpYber1nDr1fExVDOmmUy3jR/fJZEfFR7Dmt//KQqIEBbDsM
         ZsUKR4rs6gbhwOKDiizYiIT9n8TyHmUFTN1J14zBfq3qmD+ucXLqJroPghusUSNyZ/Au
         iCZLHzv/q2+719NbjRjT9m3/qBNSocEBOJxEwTmJPpEFC1nS47sxOB9ffzQQNdYANc5f
         taNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742306049; x=1742910849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ioS2cZEy0ukzwLsu1UzbYL55bIz2RUYjyFsEjQ2qJY4=;
        b=mUtUC5Ch7fTsiERn0p76EvL8yn3JrJbLGAjQ/Yd7QwxLSPBAsU2itnd10IFdqGilv4
         WV40EzNQ5Un3igbbU2WVUWrXAp7PcH/mNXtvUGQSMD8eccVsgNHrM29JvnY5GlAiDMDD
         zv+0c1Ea6R+NCh+uPu8szA9IymxrY4djxn/Up0qia5IpnPFQgvb6dhAhCmasO0DMmLot
         6aixUsozLErH2r7t8mI8Qe54QVeQk/JFvnK9pLr4/M+SITnjDliM36w4YsISyrGacpq/
         64yiZnqTyBov2p2WwjJLgKJg929VpO4h3RxDBkkStqaHlZwN3lB6UKE4EZ8rNQKIe8AO
         n3Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVnEfMiboErBKUfIx/+TmJCNEbYILerGRaYyHAgUB4De1VAVzh4WOew8j6rfEDIquayBp/X7iLPNJi+WqxjMcok@lists.infradead.org
X-Gm-Message-State: AOJu0YzxPtVZcdxJS442WgwvEn2FBn3TPCJyhgIcBglFnzRYXU1BoDtg
	9BmQZmC9mrYfQijJOUIHc0W1EJ3lMDQF7v/ldK865KmPmvNDreTF
X-Gm-Gg: ASbGncvYD4pExB8WXKS7IEsjW/1hMDV9QZceDWDq+zs4iP36wEgpSlppAJrswMu68sP
	fVBvbJ5I/Uwj49hNlhlqiDjfvNLWxmpXt/gZqgjHaXbRPZyznJD4j+dd2Fiiii12zevskDuJMV+
	Uzhad1YVhvQdizBmwuWuclK5igZjXsf++Rz7fs/KvlPuXciVIYtyzmE6sd/Mf/iPj73we5Tb/lm
	nJvQWDZ9RWmsQ0APC8wxFMAQGdFajgxjK1X81xReabCmiEObHz5+s9lUgwdTFVPYHAI9nsqEi5o
	9rz4kOAIxyQ8tqRt5Ukx68zVmuJYjPo9bkHHwno0LAvBCkmSJmUcJFNBefD3sECTayf4VsGpKcK
	E0cOEp4VrJG3oPR6Z+bFz3nQmbepM1aTdQtzCxWEGCW3cuQ==
X-Google-Smtp-Source: AGHT+IHmjQU+EohyzzTayMACB/7/c62nd81pThtraC244l6FOU5kzeMBypubUIwPfYcCsaGXQp9bZw==
X-Received: by 2002:a17:907:6ea9:b0:abf:74d6:e2b0 with SMTP id a640c23a62f3a-ac3301db34fmr1803410066b.3.1742306048621;
        Tue, 18 Mar 2025 06:54:08 -0700 (PDT)
Received: from alb3rt0-ThinkPad-P15-Gen-1 (host-95-251-108-181.retail.telecomitalia.it. [95.251.108.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149cfb96sm840601766b.119.2025.03.18.06.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:54:08 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:54:05 +0100
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v13 3/5] arm64: dts: imx8ulp-evk: add nxp secure enclave
 firmware
Message-ID: <Z9l6/WKTmBvzjEfn@alb3rt0-ThinkPad-P15-Gen-1>
References: <20250311-imx-se-if-v13-0-9cc6d8fd6d1c@nxp.com>
 <20250311-imx-se-if-v13-3-9cc6d8fd6d1c@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-imx-se-if-v13-3-9cc6d8fd6d1c@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_065410_989631_B8EBCA37 
X-CRM114-Status: GOOD (  20.30  )
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

On Tue, Mar 11, 2025 at 09:09:34PM +0530, Pankaj Gupta wrote:
> Add support for NXP secure enclave called EdgeLock Enclave
> firmware (se-fw) for imx8ulp-evk.
> 
> EdgeLock Enclave has a hardware limitation of restricted access to DDR
> address: 0x80000000 to 0xAFFFFFFF, so reserve 1MB of DDR memory region
> from 0x80000000.
> 
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 17 ++++++++++++++++-
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 13 +++++++++++--
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> index 290a49bea2f7..a25d71bf2c26 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2021 NXP
> + * Copyright 2021, 2025 NXP
>   */
>  
>  /dts-v1/;
> @@ -24,6 +24,17 @@ memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0 0x80000000>;
>  	};
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		ele_reserved: ele-reserved@90000000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0 0x90000000 0 0x100000>;
> +			no-map;
> +		};
> +	};
>  
>  	reserved-memory {
>  		#address-cells = <2>;
> @@ -259,6 +270,10 @@ &usdhc0 {
>  	status = "okay";
>  };
>  
> +&hsm0 {
> +	memory-region = <&ele_reserved>;
> +};
> +
>  &fec {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&pinctrl_enet>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index 2562a35286c2..c79a5de227b3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>  /*
> - * Copyright 2021 NXP
> + * Copyright 2021, 2025 NXP
>   */
>  
>  #include <dt-bindings/clock/imx8ulp-clock.h>
> @@ -154,7 +154,7 @@ sosc: clock-sosc {
>  		#clock-cells = <0>;
>  	};
>  
> -	sram@2201f000 {
> +	sram0: sram@2201f000 {
>  		compatible = "mmio-sram";
>  		reg = <0x0 0x2201f000 0x0 0x1000>;
>  
> @@ -169,6 +169,8 @@ scmi_buf: scmi-sram-section@0 {
>  	};
>  
>  	firmware {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  		scmi {
>  			compatible = "arm,scmi-smc";
>  			arm,smc-id = <0xc20000fe>;
> @@ -186,6 +188,13 @@ scmi_sensor: protocol@15 {
>  				#thermal-sensor-cells = <1>;
>  			};
>  		};
> +
> +		hsm0: secure-enclave {
> +			 compatible = "fsl,imx8ulp-se-ele-hsm";
> +			 mbox-names = "tx", "rx";
> +			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
> +			 sram = <&sram0>;
> +		 };
>  	};
>  
>  	cm33: remoteproc-cm33 {
> 
> -- 
> 2.43.0
> 
> 
Hello,

I'm trying to test that solution with imx93-evk-11x11.

Driver is loaded fine:
[    2.098390] fsl-se firmware:ele-if@0: i.MX secure-enclave: hsm0 interface to firmware, configured.
and I was able to expose /dev/hsm0_ch0 to userland.

Can you share me tests that I can run against that device?

Thanks,
Alberto

