Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A268C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oq3luUbNQrh4sO37NnuDYHxjHPc8/KBLQt1bSPbX55c=; b=S2Vyyss/rfMHcyyTiS+klVQQoV
	qTrFqRE6Ma4FBhhgFvczdOrK5PHtZ4cmoBsegwm3IYWUKxuPbd6AQ4WuHPpso4Um1+vKh2OdRLXh4
	0zd92kuPgpHwpY2jIWR84WPeXRt/ncVhnZBjhih9PAUO+g4qhmW4GYtDhUf2VqZOHC4TMk5D7qG5D
	uy8DQ85KlEIysv0qtGscKl4DEpjcYa4Jz5yEQzoKRa/qbKhu5TQJyEY59x4KJGkn+rCq3BzY5X3Yo
	rOqslyVz4BKukA/NObQtc4wGb6q5RP5q8qB8X0E8jWLnsHoq0BRRI9ufoc6QTZuHGN1j5+F3q62cN
	MeUxj8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWjR-00000000OZV-3TJC;
	Thu, 15 May 2025 11:26:33 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWhP-00000000OG5-3orb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 11:24:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so8089665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 04:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747308266; x=1747913066; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Oq3luUbNQrh4sO37NnuDYHxjHPc8/KBLQt1bSPbX55c=;
        b=Sduo+vGKDZZMOV4tq9fdgsjFQPm23QP3ms8HX1cv88VTxvc39I462OeCAQOxjdlxeA
         zJ175X/HlnVD/J2hF75FpcfPgv7YsQ8tp/z+t3WfB/LXorBXM3fBssOQKXZqsEbn10xz
         bbeRv3dd1XGkjVbgpSFXeN4UReqr+gIj5K8oEYc12f55rG4the66VNJwRYXk0p/Wdt9j
         VDtsv40flcvPGcyFECwXaCtFJnsL8I8dIoLI1NwZ2QUciF5zGzKGe0ln0paOuPYuNLSX
         PHheFb9S68bjnV51YFy0KYiGCj5Bnt9y0urcuXrFOMvrMfUn8s6lxqN473AWIthQk8xd
         3ESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747308266; x=1747913066;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oq3luUbNQrh4sO37NnuDYHxjHPc8/KBLQt1bSPbX55c=;
        b=KQmmLZPz7sKCNqw0O0A+Qx3ncS1+UbcSPtqq8gh0BZbX/5s9im0oJ+U2p9HYkhnvNm
         5LwWpgYI1a1hqXSCMSimLw1HCBuzOwcT9ErOSRn+Am8KANIePTt7kqaCSR3w7eilkwNU
         nfblV0hkG2FqHpe34+T2nVU19Pp83doUqrHvi5f2J/VJC56ga6GGZAWtkOPlygrTbeMv
         E/LOEKf4KlMP8SprVT+B5/PGnnkoMuSQYVbFc5HJghTVnMhvxnIjU41z5b9/+2nmIMDS
         KO3IhRZJX8Z4ZtQrADACk6ALpFcfkwSo24IRpKTVjuxgGYc5zZcI8H8L27yMBn1k+/dz
         vm5A==
X-Forwarded-Encrypted: i=1; AJvYcCUYtwJxoGbjf+bzYS5D20GQsrlUn9r7Xwc0TR3dRb/tWAKQMvC1kBtDTg+NkroUekFjM8b5LACC5KL9EYiQPziL@lists.infradead.org
X-Gm-Message-State: AOJu0YzFZTR6RRqbS7mEubLDUKwuCGRlpywUfRvxTcfS7JTZRY28fVgo
	B/Q/3gcG6BCzO5b7U0kNaTlY7o3cCtoYRqKm3AKe/dFwOfGHiTq1DpBTGaKm1x8=
X-Gm-Gg: ASbGncu9SKwAIJogM1UsGE+EidCweTJjetGqrfgibiAoCDOf/YS19jY82JiaxvFF8aq
	95942bpb0RwJT92oXlZxq/NlsK0K977PpWunq6YBQgFwaVu7HrZ5ChQOk3yRpeeyEgJHdntuD0g
	G2zY1Pb8FW50aI185bb9uH0MP5sobi/qhkLvw1+aw5IXT/OYmsPwOazu+k5wm/JdZCzNI6R1nMJ
	DYKzzvbOKKSmJH4CcMT93VWOgwRxt8Cd7sY5NEJjiJCpkDpz7ucU3w+knDXoL5YSzl11iS8fVrq
	dHjai30zVvty4Evxt/eCyynmnemFnfAgTum/FyiqZnV5uCvu6PnAyOmEqZ7Alb5TM9J6pLsNuXJ
	xeuXBmpqnzdl6sErlZEfc
X-Google-Smtp-Source: AGHT+IHewJ1yK2km4hF4XJnukjwH9B+t5DFAbmZFcOJDYUefiqQ+fuKodfexjRPHQzwg8kOClUt6eg==
X-Received: by 2002:a05:600c:4691:b0:43d:40b0:5b with SMTP id 5b1f17b1804b1-442f2168cc3mr58378255e9.25.1747308265655;
        Thu, 15 May 2025 04:24:25 -0700 (PDT)
Received: from [10.61.0.59] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebd47d39sm62595095e9.1.2025.05.15.04.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 04:24:25 -0700 (PDT)
Message-ID: <7cb062aefa6f8287b30c95bb12274c83ff6df34e.camel@linaro.org>
Subject: Re: [PATCH 2/2] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	alim.akhtar@samsung.com, peter.griffin@linaro.org,
 kauschluss@disroot.org, 	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
 dev.tailor@samsung.com, 	faraz.ata@samsung.com, muhammed.ali@samsung.com,
 selvarasu.g@samsung.com
Date: Thu, 15 May 2025 12:24:23 +0100
In-Reply-To: <20250514134813.380807-3-pritam.sutar@samsung.com>
References: <20250514134813.380807-1-pritam.sutar@samsung.com>
		<CGME20250514133847epcas5p41a1c413aecefa2fab32357c6c69e999c@epcas5p4.samsung.com>
	 <20250514134813.380807-3-pritam.sutar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.55.2-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_042427_940687_E5FCB93E 
X-CRM114-Status: GOOD (  19.76  )
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

Hi,

On Wed, 2025-05-14 at 19:18 +0530, Pritam Manohar Sutar wrote:
> This SoC has a single USB 3.1 DRD combo phy and three USB2.0
> DRD HS phy controllers those only support the UTMI+ interface.
>=20
> Support only UTMI+ for this SoC which is very similar to what
> the existing Exynos850 supports.
>=20
> The combo phy supports both UTMI+ (HS) and PIPE3 (SS) and is
> out of scope of this commit.
>=20
> Add required change in phy driver to support HS phy for this SoC.
>=20
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
> =C2=A0drivers/phy/samsung/phy-exynos5-usbdrd.c | 85 +++++++++++++++++++++=
+++
> =C2=A01 file changed, 85 insertions(+)
>=20
> diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsu=
ng/phy-exynos5-usbdrd.c
> index 634c4310c660..7b4b80319c5c 100644
> --- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
> +++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
> @@ -177,6 +177,9 @@
> =C2=A0#define HSPHYPLLTUNE_PLL_P_TUNE			GENMASK(3, 0)
> =C2=A0
> =C2=A0/* Exynos850: USB DRD PHY registers */
> +#define EXYNOSAUTOv920_DRD_CTRL_VER		0x00
> +#define GET_CTRL_MAJOR_VERSION(_x)		(((_x) >> 24) & 0xff)

I suggest using standard GENMASK() and FIELD_GET() for the version bits ins=
tead.

Cheers,
A.

> +
> =C2=A0#define EXYNOS850_DRD_LINKCTRL			0x04
> =C2=A0#define LINKCTRL_FORCE_RXELECIDLE		BIT(18)
> =C2=A0#define LINKCTRL_FORCE_PHYSTATUS		BIT(17)
> @@ -1772,6 +1775,10 @@ static const char * const exynos5_regulator_names[=
] =3D {
> =C2=A0	"vbus", "vbus-boost",
> =C2=A0};
> =C2=A0
> +static const char * const exynosautov920_clk_names[] =3D {
> +	"ext_xtal",
> +};
> +
> =C2=A0static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_ph=
y =3D {
> =C2=A0	.phy_cfg		=3D phy_cfg_exynos5,
> =C2=A0	.phy_ops		=3D &exynos5_usbdrd_phy_ops,
> @@ -1847,6 +1854,81 @@ static const struct exynos5_usbdrd_phy_drvdata exy=
nos850_usbdrd_phy =3D {
> =C2=A0	.n_regulators		=3D ARRAY_SIZE(exynos5_regulator_names),
> =C2=A0};
> =C2=A0
> +static void exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *p=
hy_drd)
> +{
> +	u32 version;
> +
> +	version =3D readl(phy_drd->reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
> +	dev_info(phy_drd->dev, "usbphy: version:0x%x\n", version);
> +
> +	if (GET_CTRL_MAJOR_VERSION(version) =3D=3D 0x3)
> +		/* utmi init for exynosautov920 HS phy */
> +		exynos850_usbdrd_utmi_init(phy_drd);
> +}
> +
> +static int exynosautov920_usbdrd_phy_init(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> +	int ret =3D 0;
> +
> +	ret =3D clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clk=
s);
> +	if (ret)
> +		return ret;
> +
> +	/* UTMI or PIPE3 specific init */
> +	inst->phy_cfg->phy_init(phy_drd);
> +
> +	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
> +
> +	return 0;
> +}
> +
> +static void exynosautov920_v3p1_phy_dis(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> +	struct exynos5_usbdrd_phy *phy_drd =3D to_usbdrd_phy(inst);
> +	void __iomem *reg_phy =3D phy_drd->reg_phy;
> +	u32 version;
> +
> +	version =3D readl(reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
> +
> +	if (GET_CTRL_MAJOR_VERSION(version) =3D=3D 0x3)
> +		exynos850_usbdrd_phy_exit(phy);
> +}
> +
> +static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
> +{
> +	struct phy_usb_instance *inst =3D phy_get_drvdata(phy);
> +
> +	if (inst->phy_cfg->id =3D=3D EXYNOS5_DRDPHY_UTMI)
> +		exynosautov920_v3p1_phy_dis(phy);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops exynosautov920_usbdrd_phy_ops =3D {
> +	.init		=3D exynosautov920_usbdrd_phy_init,
> +	.exit		=3D exynosautov920_usbdrd_phy_exit,
> +	.owner		=3D THIS_MODULE,
> +};
> +
> +static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] =
=3D {
> +	{
> +		.id		=3D EXYNOS5_DRDPHY_UTMI,
> +		.phy_init	=3D exynosautov920_usbdrd_utmi_init,
> +	},
> +};
> +
> +static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_p=
hy =3D {
> +	.phy_cfg		=3D phy_cfg_exynosautov920,
> +	.phy_ops		=3D &exynosautov920_usbdrd_phy_ops,
> +	.clk_names		=3D exynosautov920_clk_names,
> +	.n_clks			=3D ARRAY_SIZE(exynosautov920_clk_names),
> +	.core_clk_names		=3D exynos5_core_clk_names,
> +	.n_core_clks		=3D ARRAY_SIZE(exynos5_core_clk_names),
> +};
> +
> =C2=A0static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] =3D {
> =C2=A0	{
> =C2=A0		.id		=3D EXYNOS5_DRDPHY_UTMI,
> @@ -2047,6 +2129,9 @@ static const struct of_device_id exynos5_usbdrd_phy=
_of_match[] =3D {
> =C2=A0	}, {
> =C2=A0		.compatible =3D "samsung,exynos850-usbdrd-phy",
> =C2=A0		.data =3D &exynos850_usbdrd_phy
> +	}, {
> +		.compatible =3D "samsung,exynosautov920-usb31drd-phy",
> +		.data =3D &exynosautov920_usb31drd_phy
> =C2=A0	},
> =C2=A0	{ },
> =C2=A0};


