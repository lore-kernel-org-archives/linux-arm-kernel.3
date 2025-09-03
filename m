Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44BACA1018
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+ZgGU/Y7ymCGJS4a8iBSCEwRU68y0Cdd3gwtYGpdv4=; b=nSuBuK2IiknyDH02MicMKn/DpV
	bLYdyMbV9boA/6fWqsHmCE7EXLmQhF4vQ55kI8JPwW3pzhtpkoER3bk/bDGTe/EUiQ0QAdFW1q32g
	w72nKsJrqVwX5BPy26s3854bvTwyFVkKav7ClbnU++qR2ZFCabTZgUTxVpDvj/LCy55B6levXoAfF
	1UdmnjKVxN58mkopauTENn7j/VWDHZPaYcUwqq1b+uSVl7oVjIqN/fEUcJmdnKVzPoCNzHfd0Sfxn
	jt5LdVW6c6OimUX2l/NZkQ5uZmriAoENkQPH8OYiNbDjEYFgzd673Tx8byck7xybSyLxNKDRvBhAi
	kg3MI7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQS-00000008DzW-2YNE;
	Thu, 04 Sep 2025 02:10:12 +0000
Received: from aposti.net ([185.119.170.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utt25-00000007RW4-1y71;
	Wed, 03 Sep 2025 19:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1756927235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=c+ZgGU/Y7ymCGJS4a8iBSCEwRU68y0Cdd3gwtYGpdv4=;
	b=Z0xvlH/ECfsC59swm4ATc7moQPplDnhXIzmBF4X35r6pJmnBDDeoU1Ie5Ab1yxhe+1ln8W
	GcUQb2ZLGdW9NnPudS1kvJ3oXxwi39axE8bJQYRDLCQpq4QuYcwKIMP6MOFv74jzcnlQqN
	tMc5uO4lOOAAr/7RBg88uyXzuq33+zQ=
Message-ID: <f19aa842d210bf4cd3d7abf03ea7323f9e52df75.camel@crapouillou.net>
Subject: Re: [PATCH 024/114] clk: ingenic: x1000-cgu: convert from
 round_rate() to determine_rate()
From: Paul Cercueil <paul@crapouillou.net>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Date: Wed, 03 Sep 2025 21:20:32 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-24-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-24-b3bf97b038dc@redhat.com>
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
X-CRM114-CacheID: sfid-20250903_122037_672439_B9B8E006 
X-CRM114-Status: GOOD (  13.07  )
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

Le lundi 11 ao=C3=BBt 2025 =C3=A0 11:18 -0400, Brian Masney via B4 Relay a
=C3=A9crit=C2=A0:
> From: Brian Masney <bmasney@redhat.com>
>=20
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/clk/ingenic/x1000-cgu.c | 19 ++++++++++---------
> =C2=A01 file changed, 10 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/clk/ingenic/x1000-cgu.c
> b/drivers/clk/ingenic/x1000-cgu.c
> index
> feb03eed4fe8c8f617ef98254a522d72d452ac17..d80886caf393309a0c908c06fb5
> aa8b59aced127 100644
> --- a/drivers/clk/ingenic/x1000-cgu.c
> +++ b/drivers/clk/ingenic/x1000-cgu.c
> @@ -84,16 +84,17 @@ static unsigned long
> x1000_otg_phy_recalc_rate(struct clk_hw *hw,
> =C2=A0	return parent_rate;
> =C2=A0}
> =C2=A0
> -static long x1000_otg_phy_round_rate(struct clk_hw *hw, unsigned
> long req_rate,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int x1000_otg_phy_determine_rate(struct clk_hw *hw,
> +					struct clk_rate_request
> *req)
> =C2=A0{
> -	if (req_rate < 18000000)
> -		return 12000000;
> -
> -	if (req_rate < 36000000)
> -		return 24000000;
> +	if (req->rate < 18000000)
> +		req->rate =3D 12000000;
> +	else if (req->rate < 36000000)
> +		req->rate =3D 24000000;
> +	else
> +		req->rate =3D 48000000;
> =C2=A0
> -	return 48000000;
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int x1000_otg_phy_set_rate(struct clk_hw *hw, unsigned long
> req_rate,
> @@ -161,7 +162,7 @@ static int x1000_usb_phy_is_enabled(struct clk_hw
> *hw)
> =C2=A0
> =C2=A0static const struct clk_ops x1000_otg_phy_ops =3D {
> =C2=A0	.recalc_rate =3D x1000_otg_phy_recalc_rate,
> -	.round_rate =3D x1000_otg_phy_round_rate,
> +	.determine_rate =3D x1000_otg_phy_determine_rate,
> =C2=A0	.set_rate =3D x1000_otg_phy_set_rate,
> =C2=A0
> =C2=A0	.enable		=3D x1000_usb_phy_enable,

