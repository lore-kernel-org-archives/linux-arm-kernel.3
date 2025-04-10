Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BE2C369A9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 11:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuujSb3+pN9HwkeBqFnNFOiXue0q0pnkeMaA8h8u1qQ=; b=m1wgZQUSEQWf14SNir8y84Of6j
	8GlnzbDiWtfLuk1euM/WFsQYrxP0zXnwRTgdLDl4ykRQao9Di/v6uxzR1lq5QNRFKj1yf5Zx8veIl
	GMTm02B11x9CwX28SMMb62yyBFL3Feq8l9N/dSmRdChRlE3Ei491KmShL2m8udNnXVY7O415kHfnS
	wdYMSpQB4Kd1tBiUArNeqxbIHy2/0SaUXksXV3aNmxHCixG5rHSDA6MYhOGFXmhZBLKwqxllE6s6y
	yCvjFpw3VDXq7zZFDSMAsPgcYREVfkAXM3VH+Av8OVK1foZv7lmQyq/u5/pNWn0jsdlRBq3v73AWM
	NCNGnUYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2psp-0000000AB5N-2vxq;
	Thu, 10 Apr 2025 11:15:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nnX-00000009r8S-2wlI;
	Thu, 10 Apr 2025 09:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=AuujSb3+pN9HwkeBqFnNFOiXue0q0pnkeMaA8h8u1qQ=; b=hUh7sfQFaPTmc3NWjs7W+dFoHE
	HYTlxCD+nLHEKrjCoLAsaKK9s2KLnw3PVPG3jf4mpi/OA3BMFq6Ho7YAyvuwyQBYcBdd87l2C2f/2
	hrm70SEP/+OmBTKiPft0Xo8ahw8DBCuFX/nExrKftlQ7VMJF4VP9JQi92x58GL8r4aC0/0GP0A6p6
	eZs0azEfiBiWd6zCQYsK85Znld+ey62Z4qKahT8tV2t1tjojDFr9nQ0RWbfr39PJHnvp3dEMuu1r3
	THYUX2kfuel2jL5dkdjW96FWXAKDnbDSHPojBpcocr7psibhMSbpZRFLTxuXbeiVebNVJ4i+z4cv6
	rRwrS3vA==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u2nnW-0003Mi-7k; Thu, 10 Apr 2025 11:02:10 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>, kernel@collabora.com,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH RESEND] pmdomain: rockchip: keep PD_NVM on RK3576 always on
Date: Thu, 10 Apr 2025 11:02:09 +0200
Message-ID: <4290403.1IzOArtZ34@diego>
In-Reply-To: <20250408-rk3576-emmc-fix-v1-1-3009828b1b31@collabora.com>
References: <20250408-rk3576-emmc-fix-v1-1-3009828b1b31@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_020211_887426_4769AE6A 
X-CRM114-Status: GOOD (  22.98  )
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

Am Dienstag, 8. April 2025, 17:27:01 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Nicolas Frattaroli:
> Due to what seemingly is a hardware bug, PD_NVM never comes up quite the
> same after being turned off once. The result is that the sdhci
> controller will lock up the entire SoC when it's accessing its CQHCI
> registers.
>=20
> The downstream kernel hacks around this by setting
> GENPD_FLAG_RPM_ALWAYS_ON in the mmc host driver, which does not seem
> like the right place for this.
>=20
> Set GENPD_FLAG_ALWAYS_ON in the pmdomain driver for PD_NVM. I'm using
> the non-RPM version of the flag here because I have my doubts a
> suspend-resume cycle will fix it. Suspend-resume currently seems busted,
> so I couldn't test this.
>=20
> Fixes: cfee1b507758 ("pmdomain: rockchip: Add support for RK3576 SoC")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Can't tell about the underlying hw-specific issue, but this looks like
the correct way to make the domain always-on

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 48 ++++++++++++++++++----------=
=2D-----
>  1 file changed, 26 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 03bcf79a461f5db14173b35c0d110541e6d3f760..2b220b7c77b3d292f49cbc603=
38d3925146fb211 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -48,6 +48,7 @@ struct rockchip_domain_info {
>  	int ack_mask;
>  	bool active_wakeup;
>  	bool need_regulator;
> +	bool always_on;
>  	int pwr_w_mask;
>  	int req_w_mask;
>  	int clk_ungate_mask;
> @@ -154,7 +155,7 @@ struct rockchip_pmu {
>  	.need_regulator =3D regulator,			\
>  }
> =20
> -#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status,=
 r_status, r_offset, req, idle, ack, g_mask, wakeup)	\
> +#define DOMAIN_M_O_R_G(_name, p_offset, pwr, status, m_offset, m_status,=
 r_status, r_offset, req, idle, ack, g_mask, wakeup, _always_on)	\
>  {							\
>  	.name =3D _name,					\
>  	.pwr_offset =3D p_offset,				\
> @@ -171,6 +172,7 @@ struct rockchip_pmu {
>  	.clk_ungate_mask =3D (g_mask),			\
>  	.ack_mask =3D (ack),				\
>  	.active_wakeup =3D wakeup,			\
> +	.always_on =3D _always_on,			\
>  }
> =20
>  #define DOMAIN_RK3036(_name, req, ack, idle, wakeup)		\
> @@ -204,8 +206,8 @@ struct rockchip_pmu {
>  #define DOMAIN_RK3568(name, pwr, req, wakeup)		\
>  	DOMAIN_M(name, pwr, pwr, req, req, req, wakeup)
> =20
> -#define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup)	\
> -	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_of=
fset, req, idle, idle, g_mask, wakeup)
> +#define DOMAIN_RK3576(name, p_offset, pwr, status, r_status, r_offset, r=
eq, idle, g_mask, wakeup, always_on)	\
> +	DOMAIN_M_O_R_G(name, p_offset, pwr, status, 0, r_status, r_status, r_of=
fset, req, idle, idle, g_mask, wakeup, always_on)
> =20
>  /*
>   * Dynamic Memory Controller may need to coordinate with us -- see
> @@ -846,6 +848,8 @@ static int rockchip_pm_add_one_domain(struct rockchip=
_pmu *pmu,
>  	pd->genpd.flags =3D GENPD_FLAG_PM_CLK;
>  	if (pd_info->active_wakeup)
>  		pd->genpd.flags |=3D GENPD_FLAG_ACTIVE_WAKEUP;
> +	if (pd_info->always_on)
> +		pd->genpd.flags |=3D GENPD_FLAG_ALWAYS_ON;
>  	pm_genpd_init(&pd->genpd, NULL,
>  		      !rockchip_pmu_domain_is_on(pd) ||
>  		      (pd->info->mem_status_mask && !rockchip_pmu_domain_is_mem_on(pd)=
));
> @@ -1210,25 +1214,25 @@ static const struct rockchip_domain_info rk3568_p=
m_domains[] =3D {
>  };
> =20
>  static const struct rockchip_domain_info rk3576_pm_domains[] =3D {
> -	[RK3576_PD_NPU]		=3D DOMAIN_RK3576("npu",    0x0, BIT(0),  BIT(0), 0,  =
     0x0, 0,       0,       0,       false),
> -	[RK3576_PD_NVM]		=3D DOMAIN_RK3576("nvm",    0x0, BIT(6),  0,      BIT(=
6),  0x4, BIT(2),  BIT(18), BIT(2),  false),
> -	[RK3576_PD_SDGMAC]	=3D DOMAIN_RK3576("sdgmac", 0x0, BIT(7),  0,      BI=
T(7),  0x4, BIT(1),  BIT(17), 0x6,     false),
> -	[RK3576_PD_AUDIO]	=3D DOMAIN_RK3576("audio",  0x0, BIT(8),  0,      BIT=
(8),  0x4, BIT(0),  BIT(16), BIT(0),  false),
> -	[RK3576_PD_PHP]		=3D DOMAIN_RK3576("php",    0x0, BIT(9),  0,      BIT(=
9),  0x0, BIT(15), BIT(15), BIT(15), false),
> -	[RK3576_PD_SUBPHP]	=3D DOMAIN_RK3576("subphp", 0x0, BIT(10), 0,      BI=
T(10), 0x0, 0,       0,       0,       false),
> -	[RK3576_PD_VOP]		=3D DOMAIN_RK3576("vop",    0x0, BIT(11), 0,      BIT(=
11), 0x0, 0x6000,  0x6000,  0x6000,  false),
> -	[RK3576_PD_VO1]		=3D DOMAIN_RK3576("vo1",    0x0, BIT(14), 0,      BIT(=
14), 0x0, BIT(12), BIT(12), 0x7000,  false),
> -	[RK3576_PD_VO0]		=3D DOMAIN_RK3576("vo0",    0x0, BIT(15), 0,      BIT(=
15), 0x0, BIT(11), BIT(11), 0x6800,  false),
> -	[RK3576_PD_USB]		=3D DOMAIN_RK3576("usb",    0x4, BIT(0),  0,      BIT(=
16), 0x0, BIT(10), BIT(10), 0x6400,  true),
> -	[RK3576_PD_VI]		=3D DOMAIN_RK3576("vi",     0x4, BIT(1),  0,      BIT(1=
7), 0x0, BIT(9),  BIT(9),  BIT(9),  false),
> -	[RK3576_PD_VEPU0]	=3D DOMAIN_RK3576("vepu0",  0x4, BIT(2),  0,      BIT=
(18), 0x0, BIT(7),  BIT(7),  0x280,   false),
> -	[RK3576_PD_VEPU1]	=3D DOMAIN_RK3576("vepu1",  0x4, BIT(3),  0,      BIT=
(19), 0x0, BIT(8),  BIT(8),  BIT(8),  false),
> -	[RK3576_PD_VDEC]	=3D DOMAIN_RK3576("vdec",   0x4, BIT(4),  0,      BIT(=
20), 0x0, BIT(6),  BIT(6),  BIT(6),  false),
> -	[RK3576_PD_VPU]		=3D DOMAIN_RK3576("vpu",    0x4, BIT(5),  0,      BIT(=
21), 0x0, BIT(5),  BIT(5),  BIT(5),  false),
> -	[RK3576_PD_NPUTOP]	=3D DOMAIN_RK3576("nputop", 0x4, BIT(6),  0,      BI=
T(22), 0x0, 0x18,    0x18,    0x18,    false),
> -	[RK3576_PD_NPU0]	=3D DOMAIN_RK3576("npu0",   0x4, BIT(7),  0,      BIT(=
23), 0x0, BIT(1),  BIT(1),  0x1a,    false),
> -	[RK3576_PD_NPU1]	=3D DOMAIN_RK3576("npu1",   0x4, BIT(8),  0,      BIT(=
24), 0x0, BIT(2),  BIT(2),  0x1c,    false),
> -	[RK3576_PD_GPU]		=3D DOMAIN_RK3576("gpu",    0x4, BIT(9),  0,      BIT(=
25), 0x0, BIT(0),  BIT(0),  BIT(0),  false),
> +	[RK3576_PD_NPU]		=3D DOMAIN_RK3576("npu",    0x0, BIT(0),  BIT(0), 0,  =
     0x0, 0,       0,       0,       false, false),
> +	[RK3576_PD_NVM]		=3D DOMAIN_RK3576("nvm",    0x0, BIT(6),  0,      BIT(=
6),  0x4, BIT(2),  BIT(18), BIT(2),  false, true),
> +	[RK3576_PD_SDGMAC]	=3D DOMAIN_RK3576("sdgmac", 0x0, BIT(7),  0,      BI=
T(7),  0x4, BIT(1),  BIT(17), 0x6,     false, false),
> +	[RK3576_PD_AUDIO]	=3D DOMAIN_RK3576("audio",  0x0, BIT(8),  0,      BIT=
(8),  0x4, BIT(0),  BIT(16), BIT(0),  false, false),
> +	[RK3576_PD_PHP]		=3D DOMAIN_RK3576("php",    0x0, BIT(9),  0,      BIT(=
9),  0x0, BIT(15), BIT(15), BIT(15), false, false),
> +	[RK3576_PD_SUBPHP]	=3D DOMAIN_RK3576("subphp", 0x0, BIT(10), 0,      BI=
T(10), 0x0, 0,       0,       0,       false, false),
> +	[RK3576_PD_VOP]		=3D DOMAIN_RK3576("vop",    0x0, BIT(11), 0,      BIT(=
11), 0x0, 0x6000,  0x6000,  0x6000,  false, false),
> +	[RK3576_PD_VO1]		=3D DOMAIN_RK3576("vo1",    0x0, BIT(14), 0,      BIT(=
14), 0x0, BIT(12), BIT(12), 0x7000,  false, false),
> +	[RK3576_PD_VO0]		=3D DOMAIN_RK3576("vo0",    0x0, BIT(15), 0,      BIT(=
15), 0x0, BIT(11), BIT(11), 0x6800,  false, false),
> +	[RK3576_PD_USB]		=3D DOMAIN_RK3576("usb",    0x4, BIT(0),  0,      BIT(=
16), 0x0, BIT(10), BIT(10), 0x6400,  true,  false),
> +	[RK3576_PD_VI]		=3D DOMAIN_RK3576("vi",     0x4, BIT(1),  0,      BIT(1=
7), 0x0, BIT(9),  BIT(9),  BIT(9),  false, false),
> +	[RK3576_PD_VEPU0]	=3D DOMAIN_RK3576("vepu0",  0x4, BIT(2),  0,      BIT=
(18), 0x0, BIT(7),  BIT(7),  0x280,   false, false),
> +	[RK3576_PD_VEPU1]	=3D DOMAIN_RK3576("vepu1",  0x4, BIT(3),  0,      BIT=
(19), 0x0, BIT(8),  BIT(8),  BIT(8),  false, false),
> +	[RK3576_PD_VDEC]	=3D DOMAIN_RK3576("vdec",   0x4, BIT(4),  0,      BIT(=
20), 0x0, BIT(6),  BIT(6),  BIT(6),  false, false),
> +	[RK3576_PD_VPU]		=3D DOMAIN_RK3576("vpu",    0x4, BIT(5),  0,      BIT(=
21), 0x0, BIT(5),  BIT(5),  BIT(5),  false, false),
> +	[RK3576_PD_NPUTOP]	=3D DOMAIN_RK3576("nputop", 0x4, BIT(6),  0,      BI=
T(22), 0x0, 0x18,    0x18,    0x18,    false, false),
> +	[RK3576_PD_NPU0]	=3D DOMAIN_RK3576("npu0",   0x4, BIT(7),  0,      BIT(=
23), 0x0, BIT(1),  BIT(1),  0x1a,    false, false),
> +	[RK3576_PD_NPU1]	=3D DOMAIN_RK3576("npu1",   0x4, BIT(8),  0,      BIT(=
24), 0x0, BIT(2),  BIT(2),  0x1c,    false, false),
> +	[RK3576_PD_GPU]		=3D DOMAIN_RK3576("gpu",    0x4, BIT(9),  0,      BIT(=
25), 0x0, BIT(0),  BIT(0),  BIT(0),  false, false),
>  };
> =20
>  static const struct rockchip_domain_info rk3588_pm_domains[] =3D {
>=20
> ---
> base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
> change-id: 20250317-rk3576-emmc-fix-7dc81a627422
>=20
> Best regards,
>=20





