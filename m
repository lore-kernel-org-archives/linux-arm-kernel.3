Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C045CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 10:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXXxsUugmn169X4drUM7RzLPrz/lxhlOeiRpBENJVew=; b=bSG2kWXjnzSgeb2WCdlAzv++ci
	7dxSPsypOy+ff128RGlGA3nEIlD9zStKFsFPpWzPxPgV4sK248/wTbEMj3GVthgbV3k2uBnKbJVv+
	60lJH3LiWn/XoolRsosgOEC9ogF2U6ijj7moqwhnLJTOsMyJDdagypNcbA97mWx6T6obW8PnDGjTy
	dTnv77hCtKT4qfg1sRNUTzI70ONKRf7TeHP9wbSbV2E/eRmcR83CVECKAjOFjXXNNrHqM32u0wGKc
	Fz/Tq/iOhYK654xyUBXcKJF3Xnr8S7DbhEdyEyZASlbpg+T5yhw77WNHgn/neUI86MGomYLQsnytG
	xF2AaDRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqVS-0000000CvVm-0Vjn;
	Mon, 04 May 2026 10:26:31 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJqVP-0000000CvTt-07kB;
	Mon, 04 May 2026 10:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crapouillou.net;
	s=mail; t=1777890378;
	bh=8pMt52NWWR9RsCZPU2OIuMb9huhWDEe19E7XadE/oGY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=D6/tAwb94e2bfjbOT6gXMv62PDYUFCvTYNI5GD49aO+3mid8eqAtUrRfHYV2okf94
	 Z71J+pmeGym/hzHMNk0YKBitVdt7MPmIX8h5pjnpweXoCOnJqmEhO580qf27fvjIij
	 5vESKsQjz1D1j+mIZmSYSbgRrW5SXq1Gp+Kn9gQ8=
Message-ID: <3eeb3094f1a763ec42a24f0d0edaa0321397543b.camel@crapouillou.net>
Subject: Re: [PATCH 3/7] pinctrl: ingenic: Fix type in
 .pin_config_group_get() callback
From: Paul Cercueil <paul@crapouillou.net>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij	
 <linusw@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang	
 <sean.wang@kernel.org>, Tony Lindgren <tony@atomide.com>, Haojian Zhuang	
 <haojian.zhuang@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Date: Mon, 04 May 2026 12:26:11 +0200
In-Reply-To: <9f50c234c44af9075b5252ee7e59452ed2179b27.1777562725.git.geert+renesas@glider.be>
References: <cover.1777562725.git.geert+renesas@glider.be>
	 <9f50c234c44af9075b5252ee7e59452ed2179b27.1777562725.git.geert+renesas@glider.be>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_032627_540770_DB92CD1F 
X-CRM114-Status: GOOD (  13.08  )
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

Hi Geert,

Le jeudi 30 avril 2026 =C3=A0 17:33 +0200, Geert Uytterhoeven a =C3=A9crit=
=C2=A0:
> On 64-bit platforms, "unsigned long" is 64-bit.=C2=A0 Hence checking if
> all
> "unsigned long" configuration values are equal should be done using
> an
> "unsigned long" temporary.
>=20
> While Ingenic is a 32-bit platform, it is still better to use the
> correct type, to serve as an example.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/pinctrl/pinctrl-ingenic.c | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c
> b/drivers/pinctrl/pinctrl-ingenic.c
> index c7f14546de0528de..29d7f4e54bc7b126 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -4334,7 +4334,8 @@ static int ingenic_pinconf_group_get(struct
> pinctrl_dev *pctldev,
> =C2=A0		unsigned int group, unsigned long *config)
> =C2=A0{
> =C2=A0	const unsigned int *pins;
> -	unsigned int i, npins, old =3D 0;
> +	unsigned int i, npins;
> +	unsigned long old =3D 0;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	ret =3D pinctrl_generic_get_group_pins(pctldev, group, &pins,
> &npins);

