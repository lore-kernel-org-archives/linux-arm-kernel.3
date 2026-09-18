Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51967C982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 21:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+P7YnXPfz9ptQy86PJm7ONmSOKBYxrU4NYx2d3q4yI=; b=ewGlB/ca7dzTIV137Jk4gOgMqJ
	lD3fzQ0fbFxgkijy8y2JCMyCKoSWjbkvVZ/fkZ3EY4CXdk2axKstMPyJ2zi43GNSI5Zf5mbZJH1G3
	ZfWS2coRQs8F7BiCfmgfMLX5bLAuJd99rh0H91ywVm4orytA/wneZiZQphew0bh1ATWrkR98evR4x
	Kc/JqNydbBSn75dBvQNLm5/kPxGg3JgV9pAAfblLF7CWkvr/uh/LemVWOzI1sU0mBv9iLcBZMKU8q
	RYIEp/UsGB9zWHH5TRp7fqbpK1w7DoGNALJKqSRYI1UF7fLuPIErIG19xaCZsYNDoHko+vRC/L+BH
	/ttyHP3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7g0q-0000000FYl6-1MR5;
	Fri, 18 Sep 2026 21:20:52 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7g0n-0000000FYki-0iAM;
	Fri, 18 Sep 2026 21:20:50 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789766443; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aK8T1LCJElHchFVo//zNjR2sWeqf0MSwb6MNa6AWx6JaIOpmkHAmxrqfJtlDx3QH3gGz11+7fyJKCbwuO0yMzKzI/Z61PbN0fp4Igsde2Rj4//D3a+TdAyZngezj2r7hf5ecUn2855CUbhJowlZEs+uhcsMQJCvfBk7UmB4/lzE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789766443; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=H+P7YnXPfz9ptQy86PJm7ONmSOKBYxrU4NYx2d3q4yI=; 
	b=Ufe2BD5RNyzuwkIIEXSkOL+AcMqsYp04pJu4bS+9s6Xpmr2Ny+voJYdU3lZwh/HQrrDjQBosN5GP+egVzOzjnRrmaNf1ZVOS40n0mHRLZ8nvpgiL2vEY5cAJrpk4angEf5xbORIzlh29EsosS8od7etZKVdPvU88mlONSvfwnp4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789766443;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=H+P7YnXPfz9ptQy86PJm7ONmSOKBYxrU4NYx2d3q4yI=;
	b=HmIQKc6Oei1tc7AfFr/dCrlZ1rqSVfx/+qfYh4en9RZB7AlszKpFSbRQuvZ8vk6m
	9tN17nymSlAtcBjiywF3PGGDQylNDIpm6WpqGX9XiYR5LVpPaYCLN1eFK7awiWo6bDd
	aj2S5Fxlz4SS5/+lok8V80o2Ns3RVJSFRse9FDYE=
Received: by smtp.zohomail.com with SMTPS id 1789766441920465.471558146431;
	Fri, 18 Sep 2026 14:20:41 -0700 (PDT)
Message-ID: <7a419924-01ea-4de7-b662-18b0ca62082a@collabora.com>
Date: Fri, 18 Sep 2026 23:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: add vicap node to rk3576
To: Amin Gattout <amin.gattout@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
 <20260915-vicap-rk3576-v1-3-d3f5eb58a0b5@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20260915-vicap-rk3576-v1-3-d3f5eb58a0b5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_142049_264771_1A0B43F3 
X-CRM114-Status: GOOD (  15.00  )
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

Hi Amin,

Thanks for the patch, LGTM!

On 9/15/26 14:27, Amin Gattout wrote:
> Add the device tree node for the Video Capture (VICAP) unit of the
> RK3576 and its IOMMU, and connect the VICAP to the two MIPI CSI-2
> receivers that are usable with the MIPI D-PHYs in full mode.
> 
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 83 ++++++++++++++++++++++++++++++++
>  1 file changed, 83 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index cbf8b70cc15a..0c46accf5657 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1323,6 +1323,81 @@ vdec_mmu: iommu@27b00800 {
>  			rockchip,disable-mmu-reset;
>  			#iommu-cells = <0>;
>  		};
> +		vicap: video-capture@27c10000 {
> +			compatible = "rockchip,rk3576-vicap";
> +			reg = <0x0 0x27c10000 0x0 0x800>;
> +			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
> +				 <&cru DCLK_VICAP>,
> +				 <&cru CLK_VICAP_I0CLK>, <&cru CLK_VICAP_I1CLK>,
> +				 <&cru CLK_VICAP_I2CLK>, <&cru CLK_VICAP_I3CLK>,
> +				 <&cru CLK_VICAP_I4CLK>;
> +			clock-names = "aclk", "hclk", "dclk",
> +				      "iclk", "iclk1", "iclk2", "iclk3", "iclk4";
> +			iommus = <&vicap_mmu>;
> +			power-domains = <&power RK3576_PD_VI>;
> +			resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
> +				 <&cru SRST_D_VICAP>,
> +				 <&cru SRST_VICAP_I0CLK>, <&cru SRST_VICAP_I1CLK>,
> +				 <&cru SRST_VICAP_I2CLK>, <&cru SRST_VICAP_I3CLK>,
> +				 <&cru SRST_VICAP_I4CLK>;
> +			reset-names = "arst", "hrst", "drst",
> +				      "irst0", "irst1", "irst2", "irst3", "irst4";
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				vicap_dvp: port@0 {
> +					reg = <0x0>;
> +				};
> +
> +				vicap_mipi0: port@1 {
> +					reg = <0x1>;
> +				};
> +
> +				vicap_mipi1: port@2 {
> +					reg = <0x2>;
> +
> +					vicap_mipi1_input: endpoint {
> +						remote-endpoint = <&csi1_output>;
> +					};
> +				};
> +
> +				vicap_mipi2: port@3 {
> +					reg = <0x3>;
> +				};
> +
> +				vicap_mipi3: port@4 {
> +					reg = <0x4>;
> +
> +					vicap_mipi3_input: endpoint {
> +						remote-endpoint = <&csi3_output>;
> +					};
> +				};
> +
> +				vicap_mipi4: port@5 {
> +					reg = <0x5>;
> +				};
> +
> +				vicap_toisp0: port@10 {
> +					reg = <0x10>;
> +				};
> +			};
> +		};
> +
> +		vicap_mmu: iommu@27c10800 {
> +			compatible = "rockchip,rk3576-iommu", "rockchip,rk3568-iommu";
> +			reg = <0x0 0x27c10800 0x0 0x100>;
> +			interrupts = <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>;
> +			clock-names = "aclk", "iface";
> +			power-domains = <&power RK3576_PD_VI>;
> +			rockchip,disable-mmu-reset;
> +			#iommu-cells = <0>;
> +			status = "disabled";
> +		};
>  
>  		csi1: csi@27c90000 {
>  			compatible = "rockchip,rk3576-mipi-csi2", "rockchip,rk3568-mipi-csi2";
> @@ -1346,6 +1421,10 @@ csi1_in: port@0 {
>  
>  				csi1_out: port@1 {
>  					reg = <1>;
> +
> +					csi1_output: endpoint {
> +						remote-endpoint = <&vicap_mipi1_input>;
> +					};
>  				};
>  			};
>  		};
> @@ -1372,6 +1451,10 @@ csi3_in: port@0 {
>  
>  				csi3_out: port@1 {
>  					reg = <1>;
> +
> +					csi3_output: endpoint {
> +						remote-endpoint = <&vicap_mipi3_input>;
> +					};
>  				};
>  			};
>  		};
> 


