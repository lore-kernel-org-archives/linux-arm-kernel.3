Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E775C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 03:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGgy5iGp9aoxhG6XSqRIfdUfb9DnMNCDo6A3zqvZ/yY=; b=KxHM7aiyfpFeTKFr72//t43GkZ
	V9RXnnHIYqBLHgsoZmoD9Ms6BN/VHh1c2hnC1wLHvvDK8qJNF5OTbYqUswtwT5ZTY5i6FnnSIN5XU
	UPuu7/aj+M8qBLLFRNP8TpeLQcpVvM6spI2a8sIxWKnzHiCAz7Bu+iun/0Xstl3CoUcG8DxySynUT
	G1zkeBXzEXHEUDUHWyhqoRK0xWyyvSx6KX83O7lXPGB7cBpTzEx6pHxP2MAApz4lB+T6YsfMjUfPd
	Xorr7vlzsO8cEfXJO/4yWXsvJMdqntljMKxnclKMA+Yd4cM0gNUIXd1fsBZQ/S90CwuaP5UiLeeQF
	/O+ffOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK7rs-0000000C69m-33xo;
	Wed, 28 May 2025 03:54:16 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK7o2-0000000C5Nh-2X9Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 03:50:19 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7376e311086so3869810b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 20:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748404217; x=1749009017; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cGgy5iGp9aoxhG6XSqRIfdUfb9DnMNCDo6A3zqvZ/yY=;
        b=ELeHI6+p+uEpaMFaXzKcduIZVk5xmVyLTJvn6ucxV0dx7oztkHcEUWytM716kmJ7v1
         hWcn0dCj2bw9vxfENzov0j56BTE3UJkJswyzcsjAZilZVh21ef/QMYLF4K7oqIPkW9By
         YC4ppyAAgP9BAqkUJrN7vF0s17KTbFf6xQv+IlC32CRZnVFStJF+d/4Jkpc/+WMHohQC
         ZlxHVhR9+a9l3qCI6dXCdfXiWHLb81CKcTaTFbjRNoOL/XZdxWTk70USrN8LL+4I3D9S
         W+7WfFlVE2oKSS4z2OqXPH/QK4WUf929ICXluL6HcsuEz+KW2Q5r8IstB9bInf26Izqr
         IwtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748404218; x=1749009018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGgy5iGp9aoxhG6XSqRIfdUfb9DnMNCDo6A3zqvZ/yY=;
        b=vfiIy/ggg7Wvjg73ytiYJn3KXh0/XnrZDcklCE5pkMRChvqvVpDh92f7ro41RqiHOT
         KnONfRr9Cv5YmhXkFZ8vG+bH6PIBPQxyE+afOBXYOwkMJlIj3A2vzK+KkbIEh5lYwsHG
         VgPHazcJixsYLRRqoy2AXIPKY+5RlFdiX9iGX+YyMBYv+3GsEAAdt8M49aSCHcZfr/p3
         oIk1DZLs5PWAQn0UZitHWYN6gi1EZBDWcqMgVd3yWOKxPukEz0KzfDE90YtEgexMnSFQ
         lZ2bVD6HxORhpTTGG+dp/dRuN7xccL87EPtj8WHWF6kb8n0nskCJuBcLsJ9FDdTT5+uP
         cJqw==
X-Gm-Message-State: AOJu0YyHPoyuQhZzSLjqmO+kAC6GcG0K4sC30e3teH5HBVEZW6dnSTuz
	RjX55Pz6kzcvtkULV2/DCdcY6gNerrfAu6qzsHdsj+6yNvYFE6h9H6lLg1m4lyJu9w==
X-Gm-Gg: ASbGnctSWxh7mpWig9Or6/N6dJugj85KMXoPcFVnAfpipGBMF7cJH3Noi5vh7Y5r6GE
	ZnLBZfw6WetSmhISFi9I3nZyn3p68CAuy81MWJ3DcPUEgoQBUg4p5stN7F8jjFF1Gw32gusd/zf
	EH8iHi4gvGyYWlVzIJwzB1T2YYIcV4YEhDqXUD4ts6ddaLe8y9lI/hldlCzmL/jXZ2ES5uzbIoj
	wyo+XOYR23oYGmAtLOrR1jrHyBS2xBbpKcS3wm4JEQLzbxcP7Lmk6ktP9Z18H+y3+zUQRirbtAu
	GVokkx2ghUIXIJ/CNrwUNJM52l0Y0OVQP8v8UZDDo/5pW6rTcxYuv5NReEQz29yWL1NesBsBpg=
	=
X-Google-Smtp-Source: AGHT+IFUg0ybCkxV9cVD6ImAvsCkPwN2GU+1Gin3HrLAz48XZrqKVx6Y7BYUJ82hEBOb61Pon9+3CA==
X-Received: by 2002:a05:6a00:3997:b0:740:b5f9:287b with SMTP id d2e1a72fcca58-745fde794a8mr21016644b3a.1.1748404217601;
        Tue, 27 May 2025 20:50:17 -0700 (PDT)
Received: from thinkpad ([120.56.198.159])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2d9872c835sm256519a12.14.2025.05.27.20.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 20:50:17 -0700 (PDT)
Date: Wed, 28 May 2025 09:20:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779g3: Describe split PCIe
 clock on V4H Sparrow Hawk
Message-ID: <b7vnm66igh3b3ahyjqhegnbteij3bj2ypxcq6ccwi4i77k3af6@g62yhfervtvt>
References: <20250525160513.83029-1-marek.vasut+renesas@mailbox.org>
 <20250525160513.83029-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250525160513.83029-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_205018_643983_E4771FBA 
X-CRM114-Status: GOOD (  22.06  )
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

On Sun, May 25, 2025 at 06:04:04PM +0200, Marek Vasut wrote:
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
>  .../dts/renesas/r8a779g3-sparrow-hawk.dts     | 45 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
> index b8698e07add56..7c050a56290fd 100644
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
> @@ -487,24 +502,50 @@ msiof1_snd_endpoint: endpoint {
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
> +
> +	/* PCIe bridge, Root Port */
> +	pci@0,0 {

PCIe bridge mostly is integrated into the SoC itself. So it should be defined
in the SoC dtsi. Only the vpcie3v3-supply is board specific, so it should live
in board dts.

- Mani

> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		reg = <0x0 0x0 0x0 0x0 0x0>;
> +		compatible = "pciclass,0604";
> +		device_type = "pci";
> +		clocks = <&pcie_clk 1>;
> +		vpcie3v3-supply = <&reg_3p3v>;
> +		ranges;
> +	};
>  };
>  
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
> +
> +	/* PCIe bridge, Root Port */
> +	pci@0,0 {
> +		#address-cells = <3>;
> +		#size-cells = <2>;
> +		reg = <0x0 0x0 0x0 0x0 0x0>;
> +		compatible = "pciclass,0604";
> +		device_type = "pci";
> +		clocks = <&pcie_clk 3>;
> +		vpcie3v3-supply = <&reg_3p3v>;
> +		ranges;
> +	};
>  };
>  
>  &pfc {
> -- 
> 2.47.2
> 

-- 
மணிவண்ணன் சதாசிவம்

