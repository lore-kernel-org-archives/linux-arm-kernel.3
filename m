Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180ECCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 21:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyPSyRLUOFZ5pN/SoGqXQdqwGa+JGoFeCCOZJivTsn8=; b=26rXy5Dkn+qCg+UofZCr2O7HQd
	ZWAG3GWQJ2oVg3Hmg05c02r3ZSa/2OHR4nW+uT0MS2ZYH2hW9LjjhX7Y7hn5ZHgBRTS+qfPj6iRUm
	7s7Dcs9bqeezg4nUhRmNwRv2Xxnu/YwMRULM8WRGf0CrwgXLedVfboFQAqrLLamcy6Io2xloMWISJ
	QpzYKcuj3oRda3uPGjZ/SF6sAGNHdas8M2/uFObynmcCfdU/ggdepc5RtjjcB959V1QxSayLoNTR8
	fZmJPYajnKjt8S4GCwZRHyQ0j4Q8OZyUlhiTjkqsGUaEFi9b80uazILn763qi5KbgAglcdVgtl23Z
	p2E+YUCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWFj-0000000DnPC-2NSY;
	Tue, 02 Jun 2026 21:02:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWFh-0000000DnOh-35Cz;
	Tue, 02 Jun 2026 21:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=NyPSyRLUOFZ5pN/SoGqXQdqwGa+JGoFeCCOZJivTsn8=; b=BHMrXHkrVaEX4fAoOWSvgiF4om
	/u4wFEh0HbB21HLqcwBI2wNR0UQaqIVhsmYq6hGG4F9YMwwFAf14hXCsvvuq1TYGAhT3Omb0jrKKz
	XVCfVXbdPhkqFA6jBE8SF6t96CjwxGI6As7ZDHpha6GBKKGcYH8yTssbdFxYbLtt1fFsyrbe/n89Y
	2tJqoqQ0inusrDVXbJ5NrenuDVc6pAJUr8aN1jqyvX1caeVuAgXvUlR6pA+pkZ2UZpq41NqljO4e8
	WhPKFNdOMUNMyIsfKAB34adwmhRYiYfjaYwgr54UuajxtVRcsfFT6CDV/RAXmp/zL7gKKi+gXYXXS
	ZUkudMFg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Guochun Huang <hero.huang@rock-chips.com>, Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH 2/2] drm/rockchip: dsi: Add dphy_get_timing support for multiple
 PHY types
Date: Tue, 02 Jun 2026 23:02:13 +0200
Message-ID: <7091445.e8TTKsaY2g@phil>
In-Reply-To: <20260324085838.90-2-kernel@airkyi.com>
References: <20260324085838.90-1-kernel@airkyi.com>
 <20260324085838.90-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_140221_794390_57861D98 
X-CRM114-Status: GOOD (  20.48  )
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

Am Dienstag, 24. M=C3=A4rz 2026, 09:58:38 Mitteleurop=C3=A4ische Sommerzeit=
 schrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> Currently, there are generally two types of DPHY for Rockchip. One is
> the DPHY used by RK3288/RK3399, whose timing is described by Table A-3
> High-Speed Transition Times in the databook. The other is the DPHY used
> by PX30 and its successors. If its timing is still described using
> RK3288/RK3399, it may not perform correctly on some DSI panel.
>=20
> Add dphy_get_timing for different D-PHY types to adapt to timing
> differences.
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 45 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gp=
u/drm/rockchip/dw-mipi-dsi-rockchip.c
> index d3bacfae174e..2d1c9e54ff85 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -247,6 +247,7 @@ enum {
>  	BIASEXTR_127_7,
>  };
> =20
> +struct dw_mipi_dsi_rockchip;
>  struct rockchip_dw_dsi_chip_data {
>  	u32 reg;
> =20
> @@ -262,6 +263,9 @@ struct rockchip_dw_dsi_chip_data {
>  	u32 lanecfg2_grf_reg;
>  	u32 lanecfg2;
> =20
> +	int (*dphy_get_timing)(struct dw_mipi_dsi_rockchip *dsi, unsigned int l=
ane_mbps,
> +			       struct dw_mipi_dsi_dphy_timing *timing);
> +
>  	int (*dphy_rx_init)(struct phy *phy);
>  	int (*dphy_rx_power_on)(struct phy *phy);
>  	int (*dphy_rx_power_off)(struct phy *phy);
> @@ -721,8 +725,9 @@ static struct hstt hstt_table[] =3D {
>  };
> =20
>  static int
> -dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
> -			   struct dw_mipi_dsi_dphy_timing *timing)
> +dw_mipi_dsi_phy_rk3288_get_timing(struct dw_mipi_dsi_rockchip *dsi,
> +				  unsigned int lane_mbps,
> +				  struct dw_mipi_dsi_dphy_timing *timing)
>  {
>  	int i;
> =20
> @@ -738,6 +743,32 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned=
 int lane_mbps,
>  	return 0;
>  }
> =20
> +static const struct dw_mipi_dsi_dphy_timing dphy_timing_px30 =3D {
> +	.clk_lp2hs =3D 0x40,
> +	.clk_hs2lp =3D 0x40,
> +	.data_lp2hs =3D 0x10,
> +	.data_hs2lp =3D 0x14,
> +};

so just to make sure, the timing on the px30 (and later) variant is the
same for all lane speeds?

Please include that bit in the commit description

Thanks
Heiko



