Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53278F46453
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 11:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXwiJopPTfeJca7/CePLy+cTjnRvIej3hEugFxqj6bA=; b=qwp2eFp18hohe8CaIhb7j7lNNt
	cswhzpsn7h6ZiUmaLW4IlphSkg3mxrWK5XFD2Kx3asqDATV7qeUfXRu/R5k/9cV82Y1XJEO3oie9R
	qB+92I3T63gB0PIbbytsty3QsrcbBgpwideda0zCnkbocQ6hdNz+CEXLd6vDGFNwvVjXcT0Xmm3wd
	oK0VZzxCEAOluo3w6pmuizybG84nQcNIQE4CyjDxULAk4pJJtp08qKlxqTvjgpdD+DS5W7FJje8I0
	5BywhwmJYHs7f8GZTkuCGcn8PjtllpMJolMa94albWNT1dH6Yl3YRS3ntJl8MktxDf6fV+r37sW5h
	smllxl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26Bb-00000003pCl-0zzB;
	Mon, 16 Mar 2026 11:32:41 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w26BZ-00000003pCD-0JXT;
	Mon, 16 Mar 2026 11:32:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1773660724; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F5QPg5QvClRsgprNIOWkQWiwFQm+dWKe9f8HPyUMho0soxoQbkLiFJfIpez5JZ1PigEn5p2Onftnis86ah6JBlxcsJDUpEKiQlUw3t3rOdVbwY8B1NjqVlnlQsfRfwABdmS/4NLUt57tqvnIqUUTUWfMF7H8/4et17f+VoGbim0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773660724; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CXwiJopPTfeJca7/CePLy+cTjnRvIej3hEugFxqj6bA=; 
	b=NPHsMkbLcQtUOQ2SMvdf0pDuTMLy/4JSD6/lF/IVJS4DHw9Ts8pzy+9H7H6lQgKEHMDF5c0N8fBFb1CnB/2+K5G70mC4bVpd2G7zShMyPfCrSFpNpTWogfNC3sGpEBumVrWNQZz5WMy23+PHY5kPBFVAvPFBSmL+YhML7vxnG5A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773660724;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=CXwiJopPTfeJca7/CePLy+cTjnRvIej3hEugFxqj6bA=;
	b=Qb/gHHBdfTgv/e9eLd1d1KVInpZsAKl9y9HQM5Qb10aD7Ho7wdwJlrXA6f05+YvU
	opCkIGjTDy/QFmlArMrZ1HHUhFRhMXKYRemytIMttdtrG5iCnY282H4Pk5Dc086IIlC
	CFPxsim+VxRyLq9U5QPYCyx39lPuDrID9b6avwhg=
Received: by mx.zohomail.com with SMTPS id 1773660722084398.51922306894573;
	Mon, 16 Mar 2026 04:32:02 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Damon Ding <damon.ding@rock-chips.com>
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, alchark@gmail.com,
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com,
 kever.yang@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com,
 luca.ceresoli@bootlin.com, dianders@chromium.org, m.szyprowski@samsung.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Damon Ding <damon.ding@rock-chips.com>
Subject: Re: [PATCH v1 2/4] arm64: dts: rockchip: Add eDP node for RK3576
Date: Mon, 16 Mar 2026 12:31:54 +0100
Message-ID: <9590182.CDJkKcVGEf@workhorse>
In-Reply-To: <20260310105307.309765-3-damon.ding@rock-chips.com>
References: <20260310105307.309765-1-damon.ding@rock-chips.com>
 <20260310105307.309765-3-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_043237_180020_1E027029 
X-CRM114-Status: GOOD (  13.84  )
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

On Tuesday, 10 March 2026 11:53:05 Central European Standard Time Damon Ding wrote:
> Add support for the eDP output on RK3576 SoC.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index a86fc6b4e8c4..14900a66d3e1 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1446,6 +1446,34 @@ hdmi_out: port@1 {
>  			};
>  		};
>  
> +		edp: edp@27dc0000 {
> +			compatible = "rockchip,rk3576-edp";
> +			reg = <0x0 0x27dc0000 0x0 0x1000>;
> +			clocks = <&cru CLK_EDP0_24M>, <&cru PCLK_EDP0>, <&cru HCLK_VO0_ROOT>;
> +			clock-names = "dp", "pclk", "hclk";
> +			interrupts = <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>;
> +			phys = <&hdptxphy>;
> +			phy-names = "dp";
> +			power-domains = <&power RK3576_PD_VO0>;
> +			resets = <&cru SRST_EDP0_24M>, <&cru SRST_P_EDP0>;
> +			reset-names = "dp", "apb";
> +			rockchip,grf = <&vo0_grf>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				edp_in: port@0 {
> +					reg = <0>;
> +				};
> +
> +				edp_out: port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
>  		sai7: sai@27ed0000 {
>  			compatible = "rockchip,rk3576-sai";
>  			reg = <0x0 0x27ed0000 0x0 0x1000>;
> 

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

By cross-referencing the TRM, I checked the address, the IRQ number,
and the power domain, and verified that there are no new check_dtbs
warnings introduced.

Kind regards,
Nicolas Frattaroli



