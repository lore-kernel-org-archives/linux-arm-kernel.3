Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFB4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 05:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXYcUvZi8iP9/2G1vVDC0LktbbVfVEhz/5iLisBlzSA=; b=JYgxThGcW7SiD5B5MRVBxc+AdY
	LqQCz1zlAt+E/6AB1P+/mVGV43L4D1gL8S7WBTsMsEtpwS4yl+H5I7GYO7juNeIZqTl5oFq+Kko11
	etLsomUMefUVVtEWFTTHDfNNvrRWu5vg6QGTfpYEkmZSGdB/ZAocOOeyYWet9HZky3zhPEwv6jSBz
	xEVnkA2TyHbe1R0EIXJGH55+VE8Xo62YYIczN5h90NXcSOnuoBzM0tF4R+rEPD2Fj9sis6wwOODls
	lrHVTeQSzxp/Y6heSt80av2RgmjYKpdOk1j79mGqTCAbIQYAKNuDTMG6M4gQe+o8SlF2ZE2I0fd0E
	dGRtdubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thMKr-0000000GGuA-2LyN;
	Mon, 10 Feb 2025 05:27:57 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thMJL-0000000GGak-1NvU;
	Mon, 10 Feb 2025 05:26:24 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c04e5018dbso131674985a.0;
        Sun, 09 Feb 2025 21:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739165182; x=1739769982; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AXYcUvZi8iP9/2G1vVDC0LktbbVfVEhz/5iLisBlzSA=;
        b=IkSjwEkedjLMtlKHz+JFjZ6BTA2sWQ7Mlx0y2ou8WKfe1kmocc4seXigxlU9vutN0Z
         N34NsAh/OAofbfJ+57NfY5UqJddI9b/pJmWdgy5sKVlbQrOxth5JO7sd1M9z6WJpXI5b
         4k5u86nsf314dwG4ZOSa3uxo5/QkBWYEpIkjprJBTvHSD366ANF3daQ6On5ePOui+JpA
         IdD5qbPdANAvuNy50BJjxYIyZ6jCJ6J5De2Nsoqg7GgQSRN8yv674+SqhogE6lXCsQeC
         s+VrONhTI1iHHA81sa1/tPuJ8jlNAIppSAfSWVG7RxkVVt/D7iIhD9Puot+7dykmMClJ
         h+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739165182; x=1739769982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXYcUvZi8iP9/2G1vVDC0LktbbVfVEhz/5iLisBlzSA=;
        b=RRD6GzzCfJe4HjGfaH9wuYHrpTjh3rVT+Uylx4UlaBCBi1wTV1DiwtSy+FAvP1qCSu
         a8XCfZ1V7ec5dKGJKDVHXEHhWMqa4ixOMVAqiND4/ZB/hwGGv+KgJaBL5eIiCWEwcUZK
         sDK1VixIYXl1HLrWNe0RHTSBLzFeDdLmv0OKesPEYUIz/JWZez2xLsSFcuzR7du/Pe3H
         MRzK7VPorjTT7oJmrbuIPey7aX7pDuwN0cL7fgPGtKMtWSL32Frh4UFxKL1Bt7nI4A0h
         16RYtYygHt7gSL1M0KlQ47TxTRWDoOBA2lg+sVLL20rJHlAERN5ICZvSFdKC0IBwG16C
         XPIg==
X-Forwarded-Encrypted: i=1; AJvYcCVsD/lDNNDL04eG3eLFmk0vGYHBrgU7qc+zuWmEHr6cEnygUN59DksJ9nq4SqQat1USW9qk5cUpbML90axLwJh7@lists.infradead.org, AJvYcCWLu9RjHuAi7I1KOWg6Z3DtTP9owUB7Vjqh32IqmtZE1u3gkh4z7CSQbSzohUnVHa/clVrZnn0KOn4A2zs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg4jXxwHKvySX5HahLO1+LuHzH/2FpHux3KE99P7sjpYzs5Vn5
	uTXVClcvQ/YvcKWnx3ajnXOZB0WYJQtYrKV6yQejtfAdXcpFzc+eD/iclw==
X-Gm-Gg: ASbGnctGBR1SxXRtd19BjBQAL3V4OVKLRLO7eYk8Cvrgvhue79g6eQJiYlRcJZB3G5Y
	HZADa1VzY8fa6QFFLnAmEYhLwM1Hsn11P25NSBqs124Un3xggjXHFGSFTLksVRpYH/0YvUEj68s
	1jObCuQq8lRRz++DNMfRrw/y2lmR/8azM5hZu5MW/ly/iY9WupKwsTNBiimga8hjoy4njNwi6UN
	N98EpvofkUSymGYQti3OA0xhMGmsT/FKLCtCA05oObpGZ0KTE74FD0LX5QT5cPyag4=
X-Google-Smtp-Source: AGHT+IFAwtxGg0YS49lIs6yVOg3N0/ziSObLsA90REDBDAU+q9pSQjI9Jz7uKB4OPYLwvX/ixw2jPQ==
X-Received: by 2002:a05:620a:404c:b0:7b1:ab32:b71e with SMTP id af79cd13be357-7c047e2d53cmr1763316285a.0.1739165182125;
        Sun, 09 Feb 2025 21:26:22 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041dec2e9sm487596785a.20.2025.02.09.21.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 21:26:21 -0800 (PST)
Date: Mon, 10 Feb 2025 13:26:15 +0800
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
Message-ID: <4pyb47jbypkdx2x2gozx6iz7ecepff2c7k5zkenwhsbssghtgo@n3lyr7h2hu4p>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
 <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209220646.1090868-4-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_212623_373152_5D9CC8B1 
X-CRM114-Status: GOOD (  16.62  )
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

Separate these into a separate CPU file so SG2002 can reuse it.

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

