Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641EDC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q7B9otxjjw86LIN97ls2HG35KDJxQJSkzx4ZMv9DYuA=; b=GOn6XKO6e085ugbzjpYfN3Zc44
	4bzmJwIMiUSNWNrQRkk87TITogTLhV4P+C06jFi3b8GhAP/hDD9Ff6OWfF+95X0iuaQc1B1gp0aPf
	i12r3Ss2rb2oOBmnzHHuNAjvvTd3xtj9xOCAlxiiil/UgLTwpwEWzPeK4IJ4jvCIH8IUEVjQ4/ZAz
	cpK5LjHEa5mencsr/EUstv0EmPH4sA4RtfOqyKZHwQ4JUfshAm+8KPkBI71BL90wzq7GSY0KdWtyK
	VAOLwz3OAHDAN9M0Egmk5UoDCJ1CE6qpEnsSdr+9AKfhqc7f/7IPIu4htjyQ1fgPUTkNTeRtlF7fO
	iB4aFOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrzD-0000000DwyE-0dKN;
	Wed, 04 Jun 2025 17:33:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrtf-0000000DwM2-49UT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Jun 2025 17:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=q7B9otxjjw86LIN97ls2HG35KDJxQJSkzx4ZMv9DYuA=; b=iOM0JYBx5HYfzRjR/weCBa52mb
	Q1LTZ7avCv18NNqjmdqghxejtHunqMEMU+Oh5SLB5fkZGtNpm+p7MQ9idRrVgfnm9+3V2zKU2RtJ0
	Hi+7iSlCN4HY3KOJMcH+ycPIbLPom2gZy+NrPuRihllqTHmP/iRK1sMNhZwhcLAPBXcS0Lkf3Egq2
	QDAQq2cXCVkKFKQaA1zdw2gqlFgE9El0DBeKGiHQUVLv2yYDSspwBDHqd8tgZtNSBRdMUI05GzSM3
	Mi03yN8rfukJd0BFrmfsOeB1KBoDTvjjTdYhiF7AY79UVokSizP20I359y449tchZhmnbyLLU+MT7
	IrqXiCKg==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrtc-00000000wak-43Fk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 17:27:26 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-235e1d4cba0so837455ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 10:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749058041; x=1749662841; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7B9otxjjw86LIN97ls2HG35KDJxQJSkzx4ZMv9DYuA=;
        b=S4maj8bctJcN66F4OXbxv6BChnwGiAJ6tJwo3gEiWPIi9G+C6WKT75NSaDm9ecSsHK
         4gG2EwRidq5GoMhEmvxeF3nJY/goP+N2vGKg4kZBgb0McYfPdFM8NR5h8HbNWtqpCKfj
         dDMmAgS/prIkwnoV3lXvb4gMKbh1a/gIRRt67ZCDhXyNvRnqdkJWaNs+f4s2kCf9u9dm
         z3CbAMj6Z23eg+wmeLMr2HdRCKcpS64EzKWbcH2yWMAuSa/weBA5NRNpQdxPlegbxm/G
         FVtENfpNA8sEmgHmQL4dtFfQEbb3UkYFsG6rwbXhQTUYUCbxoz1C0bGLE9VOS82NkEEC
         kr4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749058041; x=1749662841;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7B9otxjjw86LIN97ls2HG35KDJxQJSkzx4ZMv9DYuA=;
        b=A6N4JJjqp9wCMVGk4kQJan2jfmStvzV2VTIb3jZZMV1CPU4rFd0b1GJOlo7wfaVLGA
         Uqb6pN9rdzGSLrO1kSCEleVCtgors3wy1//TS7gZO5BajfLZ+QCLsjTbob7E0+DIBf7e
         A5Pla6EweS3VQZgcROvyhw5Tn9OA1zsGtBrOFr+HIhq3ACeTA1TxAG4mNWF3xIHx1K5Y
         NNYpY6mREV3WmsGL4wkrRdq92LyBMy64Rk1Xi1Po7FSxVaSweCCJGmyx2uks6HBYm4fT
         han5AfZkp5CFFsJxQfXRLYshKWXu41bpe1L3+I0xCYVHR6k1NNVTQPPcxJF1ZEyHXPwg
         qd3A==
X-Gm-Message-State: AOJu0YyMSS5CAOozt74vHzQozC8GRQri+R0ASQfNtw7If0VEvryyeFaf
	XTrjEie9AASIb5AsENpS9WmO6Gwsos2X4P8bnzO5p/zT7YIa2qqeOblh5DI2dKXpbA==
X-Gm-Gg: ASbGncvohSZLWpQuCk+yAv2bAzn754rKab0W5gQC3WVvw7RyFVNaSzgV35MI7nGNDVI
	53Basgq1op0Kmg9J01AlgYoLXuNI4PS5TDaqQyFN6LBXNmk/Wi+Y5J4yC06PtxHVHxVzSlncxjO
	+Il/nnYfdgGvG/ntnDKnrElZEtC9MTW+89zHumSLpAkW9HOrDiOHBky33NsAp2cpuTw5cp6oEc2
	Y74w1HdFxwYNjtly2cugHm7yxLwX9X5ET0ks0JRQfsAca1qFpxzt+rf/ySBGR1o2WBX98mFg7M5
	cm+QGVAwIS0wohEbaLZ4ZtsZt8JRhC9OUCr0y86jcp4RzlVYlwDlHGLz0xa/Uw==
X-Google-Smtp-Source: AGHT+IH1DWvZbMUTKY0iYBnPsO3u5V0VrOXZgYbT6v4V4ZwUlpiIxHERxxyfrv3KJRUYnHRg6IZfnA==
X-Received: by 2002:a17:902:dacb:b0:234:d10d:9f9f with SMTP id d9443c01a7336-235e11fc8bfmr52595515ad.40.1749058041460;
        Wed, 04 Jun 2025 10:27:21 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd92f8sm106368255ad.88.2025.06.04.10.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:27:21 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:57:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a779g3: Describe split
 PCIe clock on V4H Sparrow Hawk
Message-ID: <gfr63eotna6javssbrxj6lxifo3o3gypv62t5kg3tzjcyp6zbn@skh6th5vggwb>
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
 <20250530225504.55042-3-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530225504.55042-3-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_182725_273041_97684DE7 
X-CRM114-Status: GOOD (  20.35  )
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

On Sat, May 31, 2025 at 12:53:21AM +0200, Marek Vasut wrote:
> The V4H Sparrow Hawk board supplies PCIe controller input clock and PCIe
> bus clock from separate outputs of Renesas 9FGV0441 clock generator chip.
> Describe this split bus configuration in the board DT. The topology looks
> as follows:
> 
>  ____________                    _____________
> | R-Car PCIe |                  | PCIe device |
> |            |                  |             |
> |    PCIe RX<|==================|>PCIe TX     |
> |    PCIe TX<|==================|>PCIe RX     |
> |            |                  |             |
> |   PCIe CLK<|======..  ..======|>PCIe CLK    |
> '------------'      ||  ||      '-------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|======''  ||
> |   CLK DIF1<|==========''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Cc: Bartosz Golaszewski <brgl@bgdev.pl>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Use pciec0_rp/pciec1_rp phandles to refer to root port moved to core r8a779g0.dtsi
> ---
>  .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 31 +++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> index b8698e07add56..9ba23129e65ec 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> @@ -130,6 +130,13 @@ mini_dp_con_in: endpoint {
>  		};
>  	};
>  
> +	/* Page 26 / PCIe.0/1 CLK */
> +	pcie_refclk: clk-x8 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +	};
> +
>  	reg_1p2v: regulator-1p2v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-1.2V";
> @@ -404,6 +411,14 @@ i2c0_mux2: i2c@2 {
>  			reg = <2>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> +
> +			/* Page 26 / PCIe.0/1 CLK */
> +			pcie_clk: clk@68 {
> +				compatible = "renesas,9fgv0441";
> +				reg = <0x68>;
> +				clocks = <&pcie_refclk>;
> +				#clock-cells = <1>;
> +			};
>  		};
>  
>  		i2c0_mux3: i2c@3 {
> @@ -487,26 +502,38 @@ msiof1_snd_endpoint: endpoint {
>  
>  /* Page 26 / 2230 Key M M.2 */
>  &pcie0_clkref {
> -	clock-frequency = <100000000>;
> +	status = "disabled";
>  };
>  
>  &pciec0 {
> +	clocks = <&cpg CPG_MOD 624>, <&pcie_clk 0>;
>  	reset-gpios = <&gpio2 2 GPIO_ACTIVE_LOW>;
>  	status = "okay";
>  };
>  
> +&pciec0_rp {
> +	clocks = <&pcie_clk 1>;
> +	vpcie3v3-supply = <&reg_3p3v>;
> +};
> +
>  /* Page 25 / PCIe to USB */
>  &pcie1_clkref {
> -	clock-frequency = <100000000>;
> +	status = "disabled";
>  };
>  
>  &pciec1 {
> +	clocks = <&cpg CPG_MOD 625>, <&pcie_clk 2>;
>  	/* uPD720201 is PCIe Gen2 x1 device */
>  	num-lanes = <1>;
>  	reset-gpios = <&gpio2 0 GPIO_ACTIVE_LOW>;
>  	status = "okay";
>  };
>  
> +&pciec1_rp {
> +	clocks = <&pcie_clk 3>;
> +	vpcie3v3-supply = <&reg_3p3v>;
> +};
> +
>  &pfc {
>  	pinctrl-0 = <&scif_clk_pins>;
>  	pinctrl-names = "default";
> -- 
> 2.47.2
> 

-- 
மணிவண்ணன் சதாசிவம்

