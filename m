Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C59C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zVpWPkQC/BSrKmTaROIAJ2ktAZPNsmJUsbJbTHTQuig=; b=h20uSU5s5i5Pc1/lztoReLSzb2
	e8iKGtBG6gHxBGEFDdG+AHHIGdbwVLzSHwOq3Fw6eus6s4AOyGLzot3Q485O5b8fAfezpJGnyI41i
	DC0zGOfW/qp0CjhtXPmv2C/TbYn7rhtJd8jCKJmSRf4BKcY7fxJkESdnMxIpD83C5CAxurLpLOihF
	yFt9uZkgphD1hTPoSpk+FndYaKeYDKlBH5K+Ub1OmUoqaA6wihSNYEItZC3Pqtcuid85ABYO12n3g
	DTLL/CAW1Gti8nMDgiJDIVDFw8S60VodB39zc3rOKULWISi87kqS6YluAO8Xglxp7R8GhWZ5V9Dln
	77sHyxUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD52n-00000001QHK-0bgV;
	Thu, 08 May 2025 17:28:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD50p-00000001Pu0-0Vw3;
	Thu, 08 May 2025 17:26:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=zVpWPkQC/BSrKmTaROIAJ2ktAZPNsmJUsbJbTHTQuig=; b=WVupt5vKzq+NYFhvA9EtHnjRUJ
	LD/oMvqGztz+HzkcvcY7CfKwH15pJTHlYCxA64rFsiaKm7VsWZIOl2HuKGbtrGd3MVKsknG4iEluO
	+WdSdlg4tfXeKr6j5zOXJ+saBgShePZHNs2fhsnCGto+3vjJI2LRdcpbw3PwEVOhlu+wvwODc9lhe
	V+ETisC8tJWY8eCSIreGGDyAD8HPhkKl84cdB1vm0//SUKPq6zRRoMJ1VPqK4T459u7HW5DiurHsB
	fmCP54Af1nCPFql81lIIY6XU3VdftiJKlhiQGiNJkww9kX+l/1BvkEHLaj6BIjgCFUm8GnAmDa4Qb
	I1dDMv9g==;
Received: from [61.8.144.177] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uD50h-00086Y-9V; Thu, 08 May 2025 19:26:15 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>,
 Frank Wang <frank.wang@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, Chukun Pan <amadeus@jmu.edu.cn>,
 Jonas Karlman <jonas@kwiboo.se>, Yao Zi <ziyao@disroot.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] phy: rockchip: naneng-combphy: Add RK3528 support
Date: Thu, 08 May 2025 19:26:13 +0200
Message-ID: <5349721.GXAFRqVoOG@phil>
In-Reply-To: <20250508135307.14726-1-ziyao@disroot.org>
References: <20250508134332.14668-2-ziyao@disroot.org>
 <20250508135307.14726-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_102623_158283_EB203C1D 
X-CRM114-Status: GOOD (  14.72  )
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

Am Donnerstag, 8. Mai 2025, 15:53:06 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Yao Zi:
> Rockchip RK3528 integrates one naneng-combphy that is able to operate in
> PCIe and USB3 mode. The control logic is similar to previous variants of
> naneng-combphy but the register layout is apperantly different from the
> RK3568 one.
>=20
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../rockchip/phy-rockchip-naneng-combphy.c    | 180 +++++++++++++++++-
>  1 file changed, 179 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers=
/phy/rockchip/phy-rockchip-naneng-combphy.c
> index 1d1c7723584b..7c92f7ac3c7f 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> @@ -20,7 +20,40 @@
>  #define REF_CLOCK_25MHz			(25 * HZ_PER_MHZ)
>  #define REF_CLOCK_100MHz		(100 * HZ_PER_MHZ)
> =20
> -/* COMBO PHY REG */
> +/* RK3528 COMBO PHY REG */
> +#define RK3528_PHYREG6				0x18
> +#define  RK3528_PHYREG6_PLL_KVCO		GENMASK(12, 10)
> +#define   RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
> +#define  RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
> +#define   RK3528_PHYREG6_SSC_UPWARD		0
> +#define   RK3528_PHYREG6_SSC_DOWNWARD		1
> +#define RK3528_PHYREG40				0x100
> +#define  RK3528_PHYREG40_SSC_EN			BIT(20)
> +#define  RK3528_PHYREG40_SSC_CNT		GENMASK(10, 0)
> +#define   RK3528_PHYREG40_SSC_CNT_VALUE		0x17d
> +#define RK3528_PHYREG42				0x108
> +#define  RK3528_PHYREG42_CKDRV_CLK_SEL		BIT(29)
> +#define   RK3528_PHYREG42_CKDRV_CLK_PLL		0
> +#define   RK3528_PHYREG42_CKDRV_CLK_CKRCV	1
> +#define  RK3528_PHYREG42_PLL_LPF_R1_ADJ		GENMASK(10, 7)
> +#define   RK3528_PHYREG42_PLL_LPF_R1_ADJ_VALUE	0x9
> +#define  RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ	GENMASK(6, 4)
> +#define   RK3528_PHYREG42_PLL_CHGPUMP_CUR_ADJ_VALUE 0x7
> +#define  RK3528_PHYREG42_PLL_KVCO_ADJ		GENMASK(2, 0)
> +#define   RK3528_PHYREG42_PLL_KVCO_ADJ_VALUE	0x0
> +#define RK3528_PHYREG80				0x200
> +#define  RK3528_PHYREG80_CTLE_EN		BIT(17)
> +#define RK3528_PHYREG81				0x204
> +#define  RK3528_PHYREG81_CDR_PHASE_PATH_GAIN_2X	BIT(5)
> +#define  RK3528_PHYREG81_SLEW_RATE_CTRL		GENMASK(2, 0)
> +#define   RK3528_PHYREG81_SLEW_RATE_CTRL_SLOW	0x7
> +#define RK3528_PHYREG83				0x20c
> +#define  RK3528_PHYREG83_RX_SQUELCH		GENMASK(2, 0)
> +#define   RK3528_PHYREG83_RX_SQUELCH_VALUE	0x6
> +#define RK3528_PHYREG86				0x218
> +#define  RK3528_PHYREG86_RTERM_DET_CLK_EN	BIT(14)

I'd think staying with one layout would be best, so not doing this
indentation here. Instead maybe follow the other ones like

#define RK3528_PHYREG6				0x18
#define RK3528_PHYREG6_PLL_KVCO		GENMASK(12, 10)
#define RK3528_PHYREG6_PLL_KVCO_VALUE		0x2
#define RK3528_PHYREG6_SSC_DIR			GENMASK(5, 4)
#define RK3528_PHYREG6_SSC_UPWARD		0
#define RK3528_PHYREG6_SSC_DOWNWARD		1

#define RK3528_PHYREG40				0x100
#define RK3528_PHYREG40_SSC_EN			BIT(20)
#define RK3528_PHYREG40_SSC_CNT		GENMASK(10, 0)
#define RK3528_PHYREG40_SSC_CNT_VALUE		0x17d

=2E..

i.e. register + bits + blank line

other than that

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



