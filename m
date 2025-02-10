Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F87C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 05:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oN/LMTy1cceeWoHjC4B2UVm8QRxELJjvJ2fUPSe0KWo=; b=kEtPbBburUWPuEp18CtrRwshO8
	U37fp3H1rDH+dXdzmVGmClFDWT2nYuOO6hI8wtqkwYNb2Ok4nDJUVX5T94EdY8XBMpgHcvI45nSSs
	8KRDQq4LeNerWfKkFQR6P8234XvrWQ0P9X9+SRreOps0KO+5HjIkriU9Q+pv3WkERO2BUM59xqgcT
	K8T9flTy4wSkPIndVxO6JTYSCtD1EYmyiXztm5dWDQiTKn2Aihq7u1yoZ2dt95WgP2U8sETsViSML
	TWftXPk4FR/yVULdnkYJL8Rs0l3gkO1c0uOqaeB3SpxnybguQXx7XFLQ3azCxvT6v7sfZ2XS3LCrW
	Yu7vP8cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thM0m-0000000GEQd-3Fwb;
	Mon, 10 Feb 2025 05:07:12 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thLzN-0000000GEEn-2QM6;
	Mon, 10 Feb 2025 05:05:46 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6e4562aa221so11856086d6.0;
        Sun, 09 Feb 2025 21:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739163944; x=1739768744; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oN/LMTy1cceeWoHjC4B2UVm8QRxELJjvJ2fUPSe0KWo=;
        b=gz0b0tt6SBQxZ9N3DclRjtWN2R22O9eMp+TPNkRuCizM8ARaxqCyVHCuACOKelN4dQ
         Yd6ANgBgbigGmlbiHWFL1zneEx6Y3InCLpyoKO+zXqcYzJXQ8Gi+zUWkzc45Ae6mpSLP
         NQAcSbiz1+TUI7OhQBqxmAxr7ENhmSSpiDGGdnY83ExVxqOJS3v0Mg5tgBmYZm5Q5kAD
         NxQyDLP6ELlJJkx4mHiByfI+blOS01XxqAZRuzIpC75EJH3sUJ0jkVaNNN7WRpsocCjx
         RcSBt2NkxSeqCl3rFHCzQJkNOcc/gKDjQpBCwxhuE8aFgXSshNkxyh1G8H0pv1M1Adnl
         rx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739163944; x=1739768744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN/LMTy1cceeWoHjC4B2UVm8QRxELJjvJ2fUPSe0KWo=;
        b=J7ans8CfQYqeWb3BQErEfpdCbkwKH9rRUpavISKmqw1GPYaTdmFhDu7CkKYe/4ziyQ
         kM+yvJ2BZOxnQUC1pgKrPNaftV7Bpw4FlXLiijMnwinNQZR3f5+LV7vs7k8unDH/3uF1
         GdQhaGFGg17Q9FcpCkwjWTNZCN1YfHzPyJB99g3fzetMLRrpuk97WgUdYJ4dFlfpzbqz
         FDoS9uQEk6eQuo8IYTV9Xwc+WxG7ysCV2GWsATPQM3N+S50r2zHSJoaKooQRfCMjQfpX
         B1aq4w+udOlSQV50Yx1WthezgKYoC8S8OHD7ffNhXn+cu5hrCYk8XDVboBVSzcn4uiV/
         hJYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3yMKL/q4UAhE/WBJNNdJBQNbdrehzOUNk6dEnJD18tu0eZKwGYGfu8Sf8kMB9qlQfHnBw00QnRM4UulM=@lists.infradead.org, AJvYcCXqSJXqZswR6REyAkLgYR7oQmaoT+wFxcEYZmltEB9/hdz7yfV4UDpYMYDyrp0XSN+NyXA84andNVlpGz6N5jCF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0+burl5t2c5Zp4aipJy6Ime+9p9hBM8s1KoqPhvc08C4xWY/M
	82ulkEslw3WMLPHL1/o6T6F3sQG4KJ4A3k/enRlRJl72RmVuWtLC
X-Gm-Gg: ASbGnctUGy/3elWdp2YAjACC+aCmIPp1tS597Xft3poLHOH0gdeST996FRpMFdx9umS
	YkRIj5gi3yICcf5qs3egmT+I0OxjrKld9PMIrafOeeJ0npGMU6GwX8E6DDwniDyeMiHlFcNUDWY
	8PnhL2BF1pyVsTIRFK9NbVCTNBRRoiGV5Hc8c5oBjNA8SlAkCK8zgRyhNQ+bvymbs3SYpWNBseR
	8yk9Av+nhboK6ub4grN9eNuh39ng0zhoGoTAu1lqleIXbNKAuRxf0tmut8qdDtSbYU=
X-Google-Smtp-Source: AGHT+IEZ3gIKU0w+qpbzeYWI6N9OGRgytUU07Dxa+Ew5q1n+gnXaeHmksniXAnyip0SvVipgq3ybfg==
X-Received: by 2002:a05:6214:e47:b0:6e2:43d1:5fe5 with SMTP id 6a1803df08f44-6e4456c5b23mr204606956d6.34.1739163944461;
        Sun, 09 Feb 2025 21:05:44 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e453819913sm21711806d6.16.2025.02.09.21.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:05:44 -0800 (PST)
Date: Mon, 10 Feb 2025 13:05:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH 03/10] arm64: dts: sophgo: Add initial SG2000 SoC device
 tree
Message-ID: <g7gruyv5rczuqybblnxy7myh2rakk2dmldy3ks247evjb6k3zj@ffkzilxgp3gy>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_210545_614945_EF4F8300 
X-CRM114-Status: GOOD (  17.63  )
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

On Sun, Feb 09, 2025 at 11:06:28PM +0100, Alexander Sverdlin wrote:
> Add initial device tree for the SG2000 SoC by SOPHGO (from ARM64 PoV).
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Can you add a riscv version of the this file too? This also applies
to patch 4 and 5

Regards,
Inochi

> ---
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi | 79 ++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> 
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000.dtsi b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> new file mode 100644
> index 000000000000..4e520486cbe5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000.dtsi
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +#define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI (nr)
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <riscv/sophgo/cv18xx-periph.dtsi>
> +#include <riscv/sophgo/cv181x.dtsi>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "sophgo,sg2000";
> +	interrupt-parent = <&gic>;
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;	/* 512MiB */
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			reg = <0>;
> +			i-cache-size = <32768>;
> +			d-cache-size = <32768>;
> +			next-level-cache = <&l2>;
> +		};
> +
> +		l2: l2-cache {
> +			compatible = "cache";
> +			cache-level= <2>;
> +			cache-size = <0x20000>;
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> +		always-on;
> +		clock-frequency = <25000000>;
> +	};
> +
> +	gic: interrupt-controller@1f01000 {
> +		compatible = "arm,cortex-a15-gic";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		reg = <0x01f01000 0x1000>,
> +		      <0x01f02000 0x2000>;
> +	};
> +
> +	soc {
> +		ranges;
> +
> +		pinctrl: pinctrl@3001000 {
> +			compatible = "sophgo,sg2000-pinctrl";
> +			reg = <0x03001000 0x1000>,
> +			      <0x05027000 0x1000>;
> +			reg-names = "sys", "rtc";
> +		};
> +	};
> +};
> +
> +
> +&clk {
> +	compatible = "sophgo,sg2000-clk";
> +};
> -- 
> 2.48.1
> 

