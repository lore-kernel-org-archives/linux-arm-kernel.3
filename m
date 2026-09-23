Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0988C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0UgemaKsCxL7NgY0GfCbHgSsetKZN08mxyxF7mZd1o=; b=ET7nCgdsjpxX3DV6BURh2Ss6zY
	zOZCsx1K2DgxnT3fRPFtAlofwMrDRnGjj1jvo+M1Swh016lXvEpSjRbRSDm+PK8lS5v6qqOn0RV9G
	q18Pc8/ZuhAFeVtxmCsvhQzyEIXijfTuGKArk1OWjIzDBim0hHdU5puqrDRrMhe/Ry8iqj5tw9x79
	GXTL0vZMWwCAu0JFFoyG9BExsAvOGZnInbn58fA5df982nLCE5tlNt8w+EQHVF6oVfIzT6np67HSF
	0WzKoOtHHPqW6sbIatIhZCHm3QqBZuOdi1hYcH8qEbSkZ2EoiP0E+76u4LuYkc917fFbYu1AvBnXW
	T0WXtovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OP4-00000008bVs-0cK0;
	Wed, 23 Sep 2026 14:56:58 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9OOy-00000008bUt-2J7K;
	Wed, 23 Sep 2026 14:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790175412; x=1821711412;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+NoCwNQno1x3g8OGbl0mW+5uJcHCveny72+JeTY7Ez0=;
  b=XoollXcBmiNB2tb/4PVotc1uiAkUbWHHKxwE/y/F8xD28x1sH+2uRSNC
   qkC+4CAVrFuLsR0xq2yBylAPPO6zHxgrAZ3pLQ5jc5qeZqhqtzcfw2t0G
   pddtB+kOJb7oeSehdWWUYVPhOgrqq3Lo6FjyLoslv+EL5fiWAmY4Gvvur
   szWOW8j9nvPbcp6vngQqGB7ZL9HSpoHHvYKZu7IeYfce2+pE8WiK97NYc
   GqHSS8o8ULiuN/n0pY7IwHsX+AX3RGHEPAajIpqncOvRXuZN1qJOPSmhg
   J3B3yRqFW46/pCXL9Ou5jSyaIGyPtClPec/QecDmStwD5r2EMlzNY4ris
   A==;
X-CSE-ConnectionGUID: +cypgvSkRUep44/PtZte1Q==
X-CSE-MsgGUID: a6yvdw5MTFW+aFL3Yqxyfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="90994725"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="90994725"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:56:51 -0700
X-CSE-ConnectionGUID: Ttchn/a4TTCaFMrPmeaoOQ==
X-CSE-MsgGUID: olsR4xbuTqq4VohNXYcoVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4730903"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:56:49 -0700
Date: Wed, 23 Sep 2026 16:56:41 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: add vicap node to rk3576
Message-ID: <arPoWFbmckTv3m2H@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-5-0a4582e20c72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-5-0a4582e20c72@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_075652_786788_BAB980A2 
X-CRM114-Status: GOOD (  17.35  )
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

Hello Amin,

Thank you for the patch!

On Mon, Sep 21, 2026 at 05:30:01PM +0200, Amin Gattout wrote:
> Add the device tree node for the Video Capture (VICAP) unit of the
> RK3576 and its IOMMU, and connect the VICAP to the two MIPI CSI-2
> receivers that are usable with the MIPI D-PHYs in full mode.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
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

small nit:
Maybe add a blank line before vicap.

> +		vicap: video-capture@27c10000 {
> +			compatible = "rockchip,rk3576-vicap";
> +			reg = <0x0 0x27c10000 0x0 0x800>;
> +			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
> +				 <&cru DCLK_VICAP>,
> +				 <&cru CLK_VICAP_I0CLK>, <&cru CLK_VICAP_I1CLK>,
> +				 <&cru CLK_VICAP_I2CLK>, <&cru CLK_VICAP_I3CLK>,
> +				 <&cru CLK_VICAP_I4CLK>;

[..]

--
Kind Regards
Mehdi Djait

