Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CDCC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQU+aov6YDTqhzdGUekqkqlenNGfg+CwyREmgIagw+M=; b=a3He3gk88jKacHTgvAfO9u3fIu
	cYEAfCh/IlMx7RkS8q9FzveoQOESUfmQLdNkWDN1FNQ6ubAA56Je17kSZY9Cn6+0U/FQ8Px79k3+0
	ep/Agxpn/Wk9v5658si9uAO4Ec2bFd15xXuEfj6buViBr/VXERGUUs3RONVCjpJ7iFj40Ka3/5+d8
	x+u6yRJBqj7uW6sTvpCpgL4ESkKzjV0xXVEeEIXK2RBJfgumFFOXXqIKDug8JFN4A3mmccGkzqkWp
	4jZaD3YSLFlCY4PiOz0Df5Z1dY8IUukxykyYW+YKlKDQ5ksg/9k8DGuvprRqdfv0WJKWd0ICOdAOg
	Fq0sXSyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7sf-0000000Dusi-0YIa;
	Fri, 11 Jul 2025 07:09:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua7p4-0000000DuXv-1khG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:05:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A98095C0C8A;
	Fri, 11 Jul 2025 07:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D676DC4CEED;
	Fri, 11 Jul 2025 07:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752217527;
	bh=Tm8gBt2rCLU6XAuJPmoqrUODd/ncKUQlIgBb8XS0mrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NPudT0N+mxlarrk3a+ZdBPT0+i6l+ahSnKq8zT6TATF9ipiN09TgKZFu2CSWSVhGe
	 Bu04DDZ1P6cZcV2fceK1CEKTt6UciKAtYRWlHk1h0HbZK9DUjjnZYrgCKX42YBE0fi
	 8QWkYWV+CENcSRehs0EIQ6oOEM/fAxWkLaTkzS/RUf0JRFPO2Fd5NTS+wvuPaeOP/z
	 ZdcuuHCdsYq95WYpI1SX1qlYkmIKTbFgKiYq7o6JJQVCrd93+rUvFmxcns2LylWjIM
	 kFvdR8zWqLae7Kp5ubDC5r80MoDWjnFi2DJ3pqDClBk1E7U0soVVMmo1TZSzh9VqI3
	 yGoPqB1xN9vdQ==
Date: Fri, 11 Jul 2025 09:05:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate()
 to determine_rate()
Message-ID: <20250711-adorable-winged-petrel-3a55df@houat>
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zivgql4bvkmipb2l"
Content-Disposition: inline
In-Reply-To: <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_000530_532860_2C8DA59B 
X-CRM114-Status: GOOD (  17.43  )
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


--zivgql4bvkmipb2l
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0

On Thu, Jul 10, 2025 at 01:43:10PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/su=
n4i/sun4i_tcon_dclk.c
> index 03d7de1911cd654f395ea85ad914588c4351f391..9b85bf512d4c81d0a12e8cf72=
6d5d5440343519c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
> @@ -67,8 +67,8 @@ static unsigned long sun4i_dclk_recalc_rate(struct clk_=
hw *hw,
>  	return parent_rate / val;
>  }
> =20
> -static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rate,
> -				  unsigned long *parent_rate)
> +static int sun4i_dclk_determine_rate(struct clk_hw *hw,
> +				     struct clk_rate_request *req)
>  {
>  	struct sun4i_dclk *dclk =3D hw_to_dclk(hw);
>  	struct sun4i_tcon *tcon =3D dclk->tcon;
> @@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, un=
signed long rate,
>  	int i;
> =20
>  	for (i =3D tcon->dclk_min_div; i <=3D tcon->dclk_max_div; i++) {
> -		u64 ideal =3D (u64)rate * i;
> +		u64 ideal =3D (u64) req->rate * i;

There shouldn't be any space after the cast.

Once fixed,
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--zivgql4bvkmipb2l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaHC3tAAKCRAnX84Zoj2+
dobzAYCVVcAYpql/C3KJ0/eU3AQjFHauPT2cGsLWyUy+n9tXNFVQlKPXp/mq6Oxv
JCN1APUBfj/Ztn6ba5LNjzk128VAzJlXRG36IVPExTtZksSGPtrh4+2d1RJgpCFc
s5a30/t7DA==
=Ftr2
-----END PGP SIGNATURE-----

--zivgql4bvkmipb2l--

