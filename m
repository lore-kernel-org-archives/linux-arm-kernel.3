Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68C5C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 17:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjOqoffUv6nOmVjkm22wWdvmrQyYX67LoFIA7eUIS4c=; b=LiLaFuwXFDznMh8bOr99lV+CVv
	E70WSLjqY4k5n41EXjXAmF+JbhwhCtAcdjp3Em+j373RAfgSbyJtXvlPDjFEmsu5T3ToQ1Oi2PT5f
	fb/2EE+fizn+wkuy2Tuzr9ZkoYWwqZhYm3RoJCp59UNJZGFwKnNdUAcVmdNCKhHbTBuDF0PFqkCV2
	xeHrqGf685DBAimzLMHFIswvV9HaXyii0KgbSCeUPjdz87uq8cyZn2nzHqjSaHJf3mOpfEqHQ0r4L
	6R4BzwZXFG18CYRC6N1YFehTnZyLF2Aw1Zpp/o+uLjIQhERFs+vVHyzhev6g3/yhXCgUY1kiOQyzu
	AD9KXWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrx9-0000000Dwnn-1ipX;
	Wed, 04 Jun 2025 17:31:03 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMrt5-0000000DwEg-0GEi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 17:26:52 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so27877a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749058010; x=1749662810; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tjOqoffUv6nOmVjkm22wWdvmrQyYX67LoFIA7eUIS4c=;
        b=hY/tlo+gg92Sbvy8RdgL08Wl+CTIsT2Cg8wyfCtdXGcRck7O9yMTRlrEs3ymRtdzEt
         BgEqgAxgc229noZqJVuPVcrkROSZBprb/TJgvbzSGeEZihQVZp45vLR2CSSNQyovKvzy
         /AxgdV4VBcIbX46H8gT9z4R9HyuaVmfkm6oa4nPkZhC34IPjptn/NJrta5QwocUHAn++
         ca8VH0mnYzH+rGzgxI7C+Vn3hg43m1aEahL1oWj+QkWWXVATc74nQqB2Mfnc3H7wFugL
         Vkd5mjWpVx9jiU4gaVcD2wxbsEmt8c97JNwV/UD/cU/soVk18F7KIvG2UVyVKEfEdfuT
         c+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749058010; x=1749662810;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjOqoffUv6nOmVjkm22wWdvmrQyYX67LoFIA7eUIS4c=;
        b=DljcEAd2Sg5vpqilj0rRV3SluwiVyBFZOzbccVtWxfBE/yQTykz7dsXeJc5Xych1wO
         WV5X4RH4RoUKUyQI8ClGrymaTKBMyAEYJvgQYTJvHX7aUGodrRPqlmzrS6AgEUqcayOL
         ury1oWF2JJYed7HicOsejYckdVcDGAGSkw0PMGAv2fSMtNXR4pxhCzUBrn2hKiAYXkOU
         zzNueoR2T1MwV9y35ZyH5DGFBw/b1idTRv7+oZIawHbp6KYTLrdW/dmBDa9XoM18vhgq
         /lGJ7EU3tu4xgIK1aC7hUejPOKPDVWGFY4PaEJ4zyIKEZJWwqVg4i/GdLJPeyfvSOw/z
         FRUw==
X-Gm-Message-State: AOJu0YwQL2gW9nmFBk0NYx/fRPZ8fed6N2+mSW6u+rdY+0J0Z1LR52ai
	PxFVfn4y+AZu6Wx/CplP9v6R3Fc8fuXepVUR1MABrmFQCPlVVW60iF51ysqUmiQ5Uu8UhAIX2Gl
	j2Uw=
X-Gm-Gg: ASbGnct4a8fjGz8NKatzgfd8m4QxNgGr02g6B8SmKfbGVwMdQRBEuGPZnSZKFtpmwfm
	XHvacem+GnL6BkqVVSKJpqwn840DG96uI7RqUUZzTRgQ503aFhwsYfQ5dPCPUMesDT9mIeqNuwY
	HFooU12rXa7ll6GZLsMLyzdBe0vGTQ4Fc3/f6vZAQ6i2Fk3Vnggx1bWskHorGBsco27fCONgCQu
	PanqpyppTrTB9OzraKx4k8BlPaspPTSd6qPvebwISPqgPW/x9urMNmq0KtURxmG1UJJY7wJWXFY
	+nizqKpqtd5S8f3vddNdpa/Row4g1ucyjwRUGlmT9uXy3/k39my8NuAgMZB8Mw==
X-Google-Smtp-Source: AGHT+IE7pUgMHsiK6fiB03xw5h0r4hqVnNjoiuF0h4s03T9Q5QTp4kFOwhIfaUC9GczffqkQkUVkZA==
X-Received: by 2002:a17:90b:4a41:b0:311:ea13:2e62 with SMTP id 98e67ed59e1d1-3130cd5dd59mr5987202a91.24.1749058010346;
        Wed, 04 Jun 2025 10:26:50 -0700 (PDT)
Received: from thinkpad ([120.60.60.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e322315sm9178577a91.43.2025.06.04.10.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:26:49 -0700 (PDT)
Date: Wed, 4 Jun 2025 22:56:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a779g0: Describe root port
 on R-Car V4H
Message-ID: <mu2zj3ph5px34iyclaeirhry4nknevwqkqhqyyecugio2gpkst@fsaxfqtnc6nn>
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
 <20250530225504.55042-2-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250530225504.55042-2-marek.vasut+renesas@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_102651_101323_50D0E867 
X-CRM114-Status: GOOD (  18.62  )
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

On Sat, May 31, 2025 at 12:53:20AM +0200, Marek Vasut wrote:
> Add node which describes the root port into PCIe controller DT node.
> This can be used together with pwrctrl driver to control clock and
> power supply to a PCIe slot. For example usage, refer to V4H Sparrow
> Hawk board.
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
> V2: New patch
> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index 6dbf05a559357..8d9ca30c299c9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -798,6 +798,16 @@ pciec0: pcie@e65d0000 {
>  					<0 0 0 4 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
>  			snps,enable-cdm-check;
>  			status = "disabled";
> +
> +			/* PCIe bridge, Root Port */
> +			pciec0_rp: pci@0,0 {
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				compatible = "pciclass,0604";
> +				device_type = "pci";
> +				ranges;
> +			};
>  		};
>  
>  		pciec1: pcie@e65d8000 {
> @@ -835,6 +845,16 @@ pciec1: pcie@e65d8000 {
>  					<0 0 0 4 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
>  			snps,enable-cdm-check;
>  			status = "disabled";
> +
> +			/* PCIe bridge, Root Port */
> +			pciec1_rp: pci@0,0 {
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				compatible = "pciclass,0604";
> +				device_type = "pci";
> +				ranges;
> +			};
>  		};
>  
>  		pciec0_ep: pcie-ep@e65d0000 {
> -- 
> 2.47.2
> 

-- 
மணிவண்ணன் சதாசிவம்

