Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1209EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 22:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6HQFoAKtM4Eig1pjdtVV39897nG8Lrdk04nnScsT/g=; b=Z/LkTj/v3eYbYf3B/xhFPkfmLM
	u+qAmJAPBXqnDCKbleke3gZbcpRYe6EhMevfeTqeizsf0TqTNOXc0x8ITqPr7HhRs2IX2DXg9DXRp
	cs0cXJcuYcZgA0USB+Npoddd1dEHeXseOvLuch8VTBggbcjqaTIQQl0mIPtbNiL8HRHy+bmnCaTMQ
	kzHEUw29J3d0le3XWm5W5lsz34w6dfhEb2nnBEa77N8fA0hPcuf9QP51XeYHqLs0x06XmbHDysK8h
	toEZqGeTTNe49VW5HOm7P5AcJW/vLQLxbsmQoScoKZ5Ei4uOzKRwc6XvBmcdLUu+Wdy9fSFl4ZDZj
	R6ynccBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLfD-000000096tU-1par;
	Wed, 12 Feb 2025 22:57:03 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiLdF-000000096SV-14Cc;
	Wed, 12 Feb 2025 22:55:02 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c05cda3e3fso25011185a.1;
        Wed, 12 Feb 2025 14:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400900; x=1740005700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V6HQFoAKtM4Eig1pjdtVV39897nG8Lrdk04nnScsT/g=;
        b=PENBHHXrm3PYc37D/coOd9PnlLW0CvuioKvYI3eN3OUKshuQs4lYMr2jGtNGNyQcW2
         Ydhe5DDvsjHt04Z+MeE6SgGMAlSRYd29NJJFezD+R3L2xEYnfgre5fxwBSzx+meaxe9f
         U5Z/RG6SDK7j+y3CA0lIFYrW98JB142JWM4jqpDryetx47CuvxHC1cH9L5WREiYAu0+q
         Z95Qp7WR+l7BuLkEtJJGdyT2MnqYsXl+2c1k63TCFz9rRO/+PUlTjGSgwf2zt+zEU3F2
         G0VimGlGOSY7VHSD3pPa0jNKW6mTbFn2cU/pcNlW11k5x/PmazxFkeWxZ73CqCBN/5pz
         rzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400900; x=1740005700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6HQFoAKtM4Eig1pjdtVV39897nG8Lrdk04nnScsT/g=;
        b=E/f2nELyY55l6m+liSWZw2EH7tuNlBWYC/KdNWpNcFzQPeIW3tXztLE/zFGg8S6SSg
         cNx68PmmqkSEFbwqGmmv+6R1KoF/6KN2pQBu7aLKGL2tnk2Q47T6bSqt30Y9Ka8tsE1r
         /dPf8FBNVV991DtsoXO48DBHr+NO7fCWZEjGCiLkwfQ2Fyl9il838/nVvoTpeciZR4tV
         5CgeqnIGr+r/VUvfx+qOVfgkSQlA3fKIFUkRK5lcXd5nMaqjtO3oPJTKBC6U03QjQs2W
         gfcAj1fL3+/DI2Mqc4SU5ahY26+ox55eStyO4/szOzD/9upf+gXoVnLLTQyjHqK/GpHL
         MN4A==
X-Forwarded-Encrypted: i=1; AJvYcCU8Au4zRFBP48fEQwHH/MOVDOx8kZspmYXoKadCKuTBYzFMZ6jN9gPx97Aqe44Ak8FC/yWmQJvsUFJPuPM=@lists.infradead.org, AJvYcCXwAXRP1SCWpMYYWpQmgffWIEPcFVFpLyYrm0CrVFWIJ+9w6KJzpPgcQKRr+F+NoY2EtZSeyQ7QVs+/vtHoLeln@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfb8zswDdSSTosShEwXJ2Iq4ersbZ0UbTnkhiqSxsG2hgiVQlu
	WaO93sBx3/oEtCzdM4vKPEQS14J8OziuHx1zYFT3cT/Lz3xCCe+z
X-Gm-Gg: ASbGncvD9QXIaQNjSnv2K6OFfSFukKlINKb/xmYCktCcaryqZBzia0C4Eqw3K0NoesK
	XU6xKn2DcYOzDd0/Y+C5mip2naGhQvT9xOUgyAa0sk8ZzH7+MEz7A8Dtc/HxnoSxtJCClbU8RKD
	tHPzJIFop4zbV7nhPcWdRUoIpTx/KvrhjCvKSN6GxEPw5hzL3ztaIoH/Q7ArcChqJG9iAAQDtst
	SynWa3fUOvx/FuA/cCFT2rPlrN18qIJOq4+COYsmVeVfs5mgrhVKDwc5g+CZtghTI0=
X-Google-Smtp-Source: AGHT+IHCyAPxx2twp+cdL0i9qawY2rWtBFMwU6iMbJ7fd7ZqtRa9MEtabZxbz+dLloUrNoDmSclwAg==
X-Received: by 2002:a05:620a:288b:b0:7b6:dd32:ec99 with SMTP id af79cd13be357-7c06fc552a5mr747104485a.5.1739400899012;
        Wed, 12 Feb 2025 14:54:59 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c05cb5725bsm531437085a.47.2025.02.12.14.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:54:58 -0800 (PST)
Date: Thu, 13 Feb 2025 06:54:51 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v3 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
Message-ID: <x4zncooa3lmyf2bikowjw7oabz66dhhbxl44cmujzzkwaslcl5@tj3l2u7e4akx>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
 <20250212224347.1767819-2-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212224347.1767819-2-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_145501_325497_B8244733 
X-CRM114-Status: GOOD (  27.50  )
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

On Wed, Feb 12, 2025 at 11:43:33PM +0100, Alexander Sverdlin wrote:
> Make the peripheral device tree re-usable on ARM64 platform by moving CPU
> core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
> cv18xx-intc.dtsi.
> 
> Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
> into "plic" interrupt-controller numbering.
> 
> On RiscV side this patch has been dtc-compile-tested only. IRQ numbers
> substitution with SOC_PERIPHERAL_IRQ() has been scripted in vim.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
> Changelog:
> v3:
> - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
> were moved into cv18xx-intc.dtsi to reduce code duplication;
> v2:
> - instead of carving out peripherals' part, carve out ARCH-specifics (CPU
> core, interrupt controllers) and spread them among 3 SoC .dtsi files which
> included cv18xx.dtsi;
> - define a label for the "soc" node and use it in the newly introduced DTs;
> 
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi     | 28 ++++---
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi     | 28 ++++---
>  arch/riscv/boot/dts/sophgo/cv181x.dtsi      |  2 +-
>  arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi  | 36 ++++++++
>  arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi | 23 ++++++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi      | 91 ++++++---------------
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi      | 34 ++++----
>  7 files changed, 137 insertions(+), 105 deletions(-)
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index aa1f5df100f0..9fb7dd2dab18 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -3,8 +3,12 @@
>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
>   */
>  
> +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> +
>  #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> +#include "cv18xx-cpu.dtsi"
>  #include "cv18xx.dtsi"
> +#include "cv18xx-intc.dtsi"
>  
>  / {
>  	compatible = "sophgo,cv1800b";
> @@ -13,17 +17,23 @@ memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x80000000 0x4000000>;
>  	};
> +};
> +

> +&soc {
> +	dma-noncoherent;
>  
> -	soc {
> -		pinctrl: pinctrl@3001000 {
> -			compatible = "sophgo,cv1800b-pinctrl";
> -			reg = <0x03001000 0x1000>,
> -			      <0x05027000 0x1000>;
> -			reg-names = "sys", "rtc";
> -		};
> +	pinctrl: pinctrl@3001000 {
> +		compatible = "sophgo,cv1800b-pinctrl";
> +		reg = <0x03001000 0x1000>,
> +		      <0x05027000 0x1000>;
> +		reg-names = "sys", "rtc";
>  	};
>  };
>  

The origianl /soc path can be used to override things, 
why change it to the reference archor? I see no change
for it.

> +&clk {
> +	compatible = "sophgo,cv1800-clk";
> +};
> +
>  &plic {
>  	compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
>  };
> @@ -31,7 +41,3 @@ &plic {
>  &clint {
>  	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
>  };
> -
> -&clk {
> -	compatible = "sophgo,cv1800-clk";
> -};
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> index 8a1b95c5116b..f23c4dd6687d 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> @@ -3,10 +3,14 @@
>   * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
>   */
>  
> +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> +
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
> +#include "cv18xx-cpu.dtsi"
>  #include "cv18xx.dtsi"
>  #include "cv181x.dtsi"
> +#include "cv18xx-intc.dtsi"
>  
>  / {
>  	compatible = "sophgo,cv1812h";
> @@ -15,17 +19,23 @@ memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x80000000 0x10000000>;
>  	};
> +};
> +
> +&soc {

> +	dma-noncoherent;

I think this can be moved into cv18xx-cpu.dtsi file, and let
all SoCs share it.

>  
> -	soc {
> -		pinctrl: pinctrl@3001000 {
> -			compatible = "sophgo,cv1812h-pinctrl";
> -			reg = <0x03001000 0x1000>,
> -			      <0x05027000 0x1000>;
> -			reg-names = "sys", "rtc";
> -		};
> +	pinctrl: pinctrl@3001000 {
> +		compatible = "sophgo,cv1812h-pinctrl";
> +		reg = <0x03001000 0x1000>,
> +		      <0x05027000 0x1000>;
> +		reg-names = "sys", "rtc";
>  	};
>  };
>  
> +&clk {
> +	compatible = "sophgo,cv1810-clk";
> +};
> +
>  &plic {
>  	compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
>  };
> @@ -33,7 +43,3 @@ &plic {
>  &clint {
>  	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
>  };
> -
> -&clk {
> -	compatible = "sophgo,cv1810-clk";
> -};
>
> [...]
>

> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> new file mode 100644
> index 000000000000..90817993a326
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +&soc {
> +	interrupt-parent = <&plic>;
> +
> +	plic: interrupt-controller@70000000 {
> +		reg = <0x70000000 0x4000000>;
> +		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +		interrupt-controller;
> +		#address-cells = <0>;
> +		#interrupt-cells = <2>;
> +		riscv,ndev = <101>;
> +	};
> +
> +	clint: timer@74000000 {
> +		reg = <0x74000000 0x10000>;
> +		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +	};
> +};


I think this file can be merged in to cv18xx-cpu.dtsi.
clint and plic is more like a core specific device.

Regards,
Inochi


