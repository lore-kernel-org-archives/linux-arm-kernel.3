Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D470DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 06:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sIcvxrX099LtAxbJT25rmi+yeCJ3k33A3mIelkkExA=; b=l2RE2gHnJphORvEY5IcjHD3e9o
	5GiQZ19V2DfbmlqGqKcNRwymr8J4KbGtXxripO7gTivOqdhsqYv/owSIw5Y2FZLA7q8B3oz/cc5A8
	5PcMo/T1DhTrIdezKpHgL88N5mJY0ZKnNrQmlBqgsd9Vg5AA6o2ZTfwWjbw2HjEhUAUDkvCm5kBxs
	D+C7IiR7hvRV3lldg0hYYaapu3XAszhhlXI2yOezEta1AeoSsC0N2sJtdzQ8QKOx2bur4d0x/nhQP
	PsWK2WoKwU7GTqkqwby7MfsGx7E2NLabccabo9nEXOgDpcl18X7q/GG7q4wSNFDp3rkLWiOTjYMbJ
	1qd4o8dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tip2a-0000000DnqL-2Q9u;
	Fri, 14 Feb 2025 06:19:08 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tip19-0000000Dnh4-0qTV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 06:17:40 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-520335ff378so485021e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 22:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739513858; x=1740118658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4sIcvxrX099LtAxbJT25rmi+yeCJ3k33A3mIelkkExA=;
        b=B0O8w928IY1G3UyvKHxMq1cxHkhYJmqpGRfxCnZUVpkSKc8orQ8hoU+feFVCIJzOWQ
         kG7z6poFHtCaA4N6tWKbeVTDzdb0DCEHxfgP+UWE11aphh93w4PRkuflGMlCg2C6f0eQ
         Ln/trzmY3T3Ev1BUm5daPG13NGSr0wZNCpyA8UmlnbTONZQGBDEzOeKv6JaZc3sM8DcY
         M0gwXegeG/NojYyrCoyA/9Plbii3Q43wsmxUHAHhLgXVVvfOH2sxm3nbyow0SPXGLdWv
         9jdAjykgL4l5NHTUuJlZY1FXpuAjdutDhk/lVv/quy4b8IddSKAV+1bEBwY+aIFGKDRJ
         oz8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739513858; x=1740118658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sIcvxrX099LtAxbJT25rmi+yeCJ3k33A3mIelkkExA=;
        b=vXB65oPYpGglzFGeacOXTu4fwqo0TehEQX1taBwkC6xUIdWPHgDbyG1y3yMJcaArgr
         cnkBNPx5imnY4LZvAfyOd1pD9gpHeFztTgBxdgGans5KqNMvmBBIV4Zxi5vQlK6hpNaX
         7M5OgWEu74GEtd9jxCHBfdOVfxiZPzjoei42ARcahK2NHtK0D/F8Ufw5u2Z+VSRINg7G
         CBB4CZ2V+TsAjbdDtmC/TgwxyCBZc5inHAr2HkSEyfL9FNfZsPJ60s3cZ8sv0Ht8NKn5
         6xREC3OFawfs4JQG6HkS6hys9Id0vMUiwmatMwugekciPPZm3g1tIbcPrx2422inrvlT
         AIoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYBi6wIQvShZ8XXlS/81yYoVXXRzmUuK+B9bKo3WpU+FK/21TDUV448oyJpJIZoMRIuH4eO0822kxc/3obL4bt@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/r8iarR6XPmn6owbAARbX6b3qr+0VLtawvU44hFDBTekToDAb
	rQVd+FZrdnVcaZjXakhk8rxLe0/nsmkEDNQDE/SpnrsVfbk0cQzD
X-Gm-Gg: ASbGncucy5UFwyjNEtqhKc8EW1+cLyMNFE9U8omTNpypKuDJDXCG2CzXDR0Jm4aFXu8
	WLT+gr8ooDLV9L7vRVanyTcOY5rIYjOgC4Pi0xgtCL3z/gu04LDAERWvjBhcxyF702sjt41cgt9
	sVrQg4zMEeaE1wBeQTgMGVT5UfTtQYCMDHzB1uy/gc61zwgfFlqyF3/ZPIA3i+SWf8Xe+DlQXEi
	J89SEhap0CT0KXZBC0dwuH7QN/PNLjl67XhGvsRfzqv4bVhQloGotS1f8d1GoOXWj6ha3XfLHNd
	I4TQNNraQoo7UqTiMsETNb8x2u3Zvba5TAsMMQSd0VTLLtGPBGts4F85yBQf8g==
X-Google-Smtp-Source: AGHT+IHRLYoJKdwZm1YCd9aBf7aEL7V8Zsi2JM2MJI5ygyPB2inPNLw5h4kckPoKN1ULpGO4ZArePw==
X-Received: by 2002:a05:6122:8c0c:b0:51f:405e:866e with SMTP id 71dfb90a1353d-52077dbf86dmr3546146e0c.1.1739513857884;
        Thu, 13 Feb 2025 22:17:37 -0800 (PST)
Received: from droid-r8s ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5207ab4fc73sm487086e0c.36.2025.02.13.22.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 22:17:37 -0800 (PST)
Date: Fri, 14 Feb 2025 06:17:30 +0000
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: alim.akhtar@samsung.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
	robh@kernel.org, semen.protsenko@linaro.org,
	wachiturroxd150@gmail.com
Subject: Re: [PATCH v1 3/3] arm64: dts: exynos990: define all PERIC USI nodes
Message-ID: <Z67f+lDxISVubiJJ@droid-r8s>
References: <20250212234034.284-1-wachiturroxd150@gmail.com>
 <20250212234034.284-4-wachiturroxd150@gmail.com>
 <40370a0e-775b-42e3-bb6c-8cacaa0482cf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40370a0e-775b-42e3-bb6c-8cacaa0482cf@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_221739_241213_A6BA0B79 
X-CRM114-Status: GOOD (  14.70  )
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

On Thu, Feb 13, 2025 at 07:38:35AM +0000, Tudor Ambarus wrote:
> > +		usi_uart: usi@105400c0 {
> > +			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
> > +			reg = <0x105400c0 0x20>;
> > +			samsung,sysreg = <&sysreg_peric0 0x1000>;
> > +			samsung,mode = <USI_V2_UART>;
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges;
> > +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
> > +				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
> > +			clock-names = "pclk", "ipclk";
> > +			status = "disabled";
> > +
> > +			serial_0: serial@10540000 {
> > +				compatible = "samsung,exynos990-uart",
> > +					     "samsung,exynos8895-uart";
> > +				reg = <0x10540000 0xc0>;
> > +				interrupts = <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>;
> > +				pinctrl-names = "default";
> > +				pinctrl-0 = <&uart0_bus>;
> > +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_4>,
> > +					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;
> > +				clock-names = "uart", "clk_uart_baud0";
> > +				samsung,uart-fifosize = <256>;
> > +				status = "disabled";
> 
> node properties shall be specified in a specific order. Follow similar
> nodes that are already accepted, gs101 is one.

Not all Exynos SoCs will follow the same order

> <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_4>;

Is

GATE(CLK_GOUT_PERIC0_TOP0_IPCLK_4, "gout_peric0_top0_ipclk_4",
     "dout_peric0_uart_dbg",
     CLK_CON_GAT_GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_4,
     21, 0, 0), [Mainline CLK]

You can find it in the cmucal-node.c driver downstream of the kernel. [0]

> > +			};
> > +		};
> > +
> > +		usi0: usi@105500c0 {
> 
> cut
> 
> > +
> > +			hsi2c_0: i2c@10550000 {
> 
> cut
> 
> > +
> > +			spi_0: spi@10550000 {
> 
> cut
> 
> > +			serial_2: serial@10550000 {
> 
> why not serial_0 since you're in USI0.

Because it is simply displayed in the exynos9830-usi.dtsi [1]

> > +		};
> > +
> > +		usi_i2c_0: usi@105600c0 {
> > +			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
> > +			reg = <0x105600c0 0x20>;
> > +			samsung,sysreg = <&sysreg_peric0 0x1008>;
> > +			samsung,mode = <USI_V2_I2C>;
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges;
> > +			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>,
> > +				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>;
> > +			clock-names = "pclk", "ipclk";
> > +			status = "disabled";
> > +
> > +			hsi2c_1: i2c@10560000 {
> > +				compatible = "samsung,exynos990-hsi2c",
> > +					     "samsung,exynosautov9-hsi2c";
> > +				reg = <0x10560000 0xc0>;
> > +				interrupts = <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>;
> > +				pinctrl-names = "default";
> > +				pinctrl-0 = <&hsi2c1_bus>;
> > +				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_6>,
> > +					 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_6>;
> > +				clock-names = "hsi2c", "hsi2c_pclk";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				status = "disabled";
> > +			};
> 
> shouldn't you define serial and SPI too?

As shown in the node it only uses i2c which
corresponds to the exynos9830-usi.dts. [2]

> > +		};
> > +
> 
> cut
> 
> > +			spi_8: spi@108e0000 {
> > +				compatible = "samsung,exynos990-spi";
> > +				reg = <0x108e0000 0x30>;
> > +				interrupts = <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
> > +				pinctrl-names = "default";
> > +				pinctrl-0 = <&spi8_bus>;
> > +				clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>,
> > +					 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>;
> > +				clock-names = "spi", "spi_busclk0";
> > +				#address-cells = <1>;
> > +				#size-cells = <0>;
> > +				fifo-depth = <256>;
> 
> that's a first. Does downstream define any SPI node with 256 bytes
> FIFOs? Would you please point me to the downstream sources?

Here :) [3]

> Cheers,
> ta

[0] https://github.com/ExtremeXT/android_kernel_samsung_exynos990/blob/69515fbb7a4395898c05a8624f76a12afbac11c5/drivers/soc/samsung/cal-if/exynos9830/cmucal-node.c#L2719
[1] https://github.com/pascua28/android_kernel_samsung_s20fe/blob/3be539e9cd22b89ba3cc8282945a0c46ff27341d/arch/arm64/boot/dts/exynos/exynos9830-usi.dtsi#L1954
[2] https://github.com/pascua28/android_kernel_samsung_s20fe/blob/3be539e9cd22b89ba3cc8282945a0c46ff27341d/arch/arm64/boot/dts/exynos/exynos9830-usi.dtsi#L170
[3] https://github.com/pascua28/android_kernel_samsung_s20fe/blob/3be539e9cd22b89ba3cc8282945a0c46ff27341d/arch/arm64/boot/dts/exynos/exynos9830-usi.dtsi#L1638

