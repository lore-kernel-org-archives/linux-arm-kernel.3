Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB98E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 12:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFrk9B4Z7mdoTzpBnuLcBenrDHv77JNnBq7+6dFbTlI=; b=vyPBEx6gQfu6YH+Hd43W4ON0wV
	5bW004D8TJwMvuq8aXA2s86Lj817EVhjRXxHGVhsB5R/pjh9RwVzULs2yv7kmXw5aq/6XT6hjluio
	oFWSNzrFLf6L7+3HDybL01SkGJMjKQaRaegNFaPOPTBLIuckPTS4zohtVzNc00UXJ8MxntjBm0JSV
	S83Q8Z4bj/wVpL6b4/wfXQwpbagqQFdBvk6jw9jpaqPLFGU2sd25WKLWbe4uBD9IWVsfBezQZkAGR
	7gaRIwSsx9D/r9BKuUAPG+OZD13zSMTpsIpdn+4+NJAHsCWuowsUrdxwJXvQKUjRwX+ad8V3L2Bkj
	pilJlabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNX2e-0000000DR4k-1W7M;
	Tue, 17 Dec 2024 12:51:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNX1Z-0000000DQuy-0L2X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 12:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734439803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wFrk9B4Z7mdoTzpBnuLcBenrDHv77JNnBq7+6dFbTlI=;
	b=KJzpCZ1fpFOxDRR7OUmv1fNofn55QUKPt9ZsqAg5sc7VagHVA5oJI0ofzIZu0LB8dCimNp
	o1eQuV6an202TDd1rQMQusWDpX91jfisN5+epZAsQk8ZK9Kij9d5lYC6WzW39C1eNwSbCs
	ohm23Y1jXf4sI8/p3TWqTwwlrtY0UYU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-gBRmuIIzMXG8J03rDHLuxw-1; Tue, 17 Dec 2024 07:47:56 -0500
X-MC-Unique: gBRmuIIzMXG8J03rDHLuxw-1
X-Mimecast-MFC-AGG-ID: gBRmuIIzMXG8J03rDHLuxw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43582d49dacso13811215e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 04:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734439675; x=1735044475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFrk9B4Z7mdoTzpBnuLcBenrDHv77JNnBq7+6dFbTlI=;
        b=AZqiubZ/ZNG+2GsmWIc4iSey2QaLUGZhCgZQQa6sims2x8spGipoVW5P687KK0fTS8
         OUklTEMhYkF1Bod9/4XGOVMqhpkWiC+zFMwFN8HXvw1Z0Otw7JDZCu22DyRCLDfcRWvt
         oYTvADhNKHZnlWvz8MxcwHjDDMdiAQm7Ru9FwCZOYSjVgG2qS+ltgcbozDBRw6H8IOgo
         DpWU56+WU9RYNBAeoDZe6vuwOV6B8aWWMXQNPy0VW32OWKNiicAdd4d0JgqNw6dRzfm6
         GVjGZsv58/EieZpZL7KC2D3Q8wkl9qTbZqq24xp2GQVet9vk9gavjg/DSsq0NoOz95yY
         8JUA==
X-Forwarded-Encrypted: i=1; AJvYcCUPoxzLSM+sZ/FON5rqqEZK00TLrfLFa9FJIHoyYy8ow3fz2XueILkZphzLcOf38kpTPfZ8XCZ3oiZ14YDKYiCD@lists.infradead.org
X-Gm-Message-State: AOJu0YyoYsaHRUZkMrtRzTa1EKFE41XyYqHnuAxF3Ny1YzjxzUhEzw3g
	jI0H6L1B3J18Ya2c5kB+Fvr2GXhK4NVU9tZHNxZa3T2AEkmwr0tOkDFYPlIZ7nlXcNP0JxWLd9q
	cMoPbnfrvD2xHKdwQZvjA30nl8b+7dhD92IS3w829a3zVWrWrWQGu1R3So4qtwQXQ8LVcqk9c
X-Gm-Gg: ASbGncuNe61nixq2HmVlHEw5K8k+1ivfoLH14EVueoOay0GSz3HUpBmBtn2VSjQaGcf
	vQCrgmEiRZjdBubt3k1Vsz/6cJLBrCcIbkH799zqpXTn8/YbRAidIMzyiQXRoZcQoATrtxWX+I8
	mRQ9jIAMtvL59ZGEryirljd+QCwBmpt9Js48H9QGgifET5r+UVniH6r/h1ebYPoF6S0weIkjg+6
	iLtsMRAESunZ16LeenXRN5YoeqhN6lz
X-Received: by 2002:a05:6000:4026:b0:385:f07b:93da with SMTP id ffacd0b85a97d-3888e0ac2f9mr14313190f8f.47.1734439675428;
        Tue, 17 Dec 2024 04:47:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHwsMdejiDMGaW3ubV5E8L0Ddxnjtm2Ra+UQjEkInSvg2c1ns6wObShSkwv0I/OwFbb7T5qA==
X-Received: by 2002:a05:6000:4026:b0:385:f07b:93da with SMTP id ffacd0b85a97d-3888e0ac2f9mr14313145f8f.47.1734439674844;
        Tue, 17 Dec 2024 04:47:54 -0800 (PST)
Received: from localhost ([2a01:e0a:b25:f902::ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80163b8sm10895392f8f.35.2024.12.17.04.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:47:54 -0800 (PST)
Date: Tue, 17 Dec 2024 13:47:53 +0100
From: Maxime Ripard <mripard@redhat.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Ying Liu <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Abel Vesa <abel.vesa@linaro.org>, Herve Codina <herve.codina@bootlin.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
Message-ID: <20241217-brown-wapiti-of-promotion-e3bec6@houat>
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
 <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="naq5whtgj6roz2n5"
Content-Disposition: inline
In-Reply-To: <20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_045005_253226_035F72D5 
X-CRM114-Status: GOOD (  33.08  )
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


--naq5whtgj6roz2n5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
MIME-Version: 1.0

On Thu, Nov 21, 2024 at 06:41:14PM +0100, Miquel Raynal wrote:
> There are mainly two ways to change a clock frequency.

There's much more than that :)

Off the top of my head, setting/clearing a min/max rate and changing the
parent might also result in a rate change.

And then, the firmware might get involved too.

> The active way requires calling ->set_rate() in order to ask "on
> purpose" for a frequency change. Otherwise, a clock can passively see
> its frequency being updated depending on upstream clock frequency
> changes. In most cases it is fine to just accept the new upstream
> frequency - which by definition will have an impact on downstream
> frequencies if we do not recalculate internal divisors. But there are
> cases where, upon an upstream frequency change, we would like to
> maintain a specific rate.

Why is clk_set_rate_exclusive not enough?

> As an example, on iMX8MP the video pipeline clocks are looking like this:
>=20
>     video_pll1
>        video_pll1_bypass
>           video_pll1_out
>              media_ldb
>                 media_ldb_root_clk
>              media_disp2_pix
>                 media_disp2_pix_root_clk
>              media_disp1_pix
>                 media_disp1_pix_root_clk
>=20
> media_ldb, media_disp2_pix and media_disp1_pix are simple divisors from
> which we might require 2 or 3 different rates, whereas video_pll1 is a
> very configurable PLL which can achieve almost any frequency. There are
> however relationships between them, typically the ldb clock must be 3.5
> or 7 times higher than the media_disp* clocks.
>=20
> Currently, if eg. media_disp2_pix is set to 71900000Hz, when media_ldb
> is (later) set to 503300000Hz, media_disp2_pix is updated to 503300000Hz
> as well, which clearly does not make sense. We want it to stay at
> 71900000Hz during the subtree walk.
>=20
> Achieving this is the purpose of the new clock flag:
> CLK_NO_RATE_CHANGE_DURING_PROPAGATION
>=20
> Please note, if the kernel was setting the ldb clock before a pixel
> clock, the result would be different, and this is also what this patch
> is trying to solve.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> In all cases, the LDB must be aware of the device configuration, and ask
> for a clever frequency, we will never cope with slightly aware drivers
> when addressing this kind of subtle situation.
> ---
>  drivers/clk/clk.c            | 9 +++++++--
>  include/linux/clk-provider.h | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index adfc5bfb93b5a65b6f58c52ca2c432d651f7dd7d..94d93470479e77769e63e9746=
2b176261103b552 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1927,7 +1927,6 @@ long clk_get_accuracy(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(clk_get_accuracy);
> =20
> -__maybe_unused
>  static unsigned long clk_determine(struct clk_core *core, unsigned long =
rate)
>  {
>  	struct clk_rate_request req =3D {};
> @@ -2272,7 +2271,13 @@ static void clk_calc_subtree(struct clk_core *core)
>  {
>  	struct clk_core *child;
> =20
> -	core->new_rate =3D clk_recalc(core, core->parent->new_rate);
> +	if (core->flags & CLK_NO_RATE_CHANGE_DURING_PROPAGATION) {
> +		core->new_rate =3D clk_determine(core, core->rate);
> +		if (!core->new_rate)
> +			core->new_rate =3D clk_recalc(core, core->parent->new_rate);
> +	} else {
> +		core->new_rate =3D clk_recalc(core, core->parent->new_rate);
> +	}

Sorry, it's not clear to me how it works. How will the parent clocks
will get notified to adjust their dividers in that scenario? Also, what
if they can't?

Maxime

--naq5whtgj6roz2n5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ2Fy9QAKCRAnX84Zoj2+
dpvBAYC0JG03qrT2KpyfhWHAqJ5sfZn8G59BZ1L3eb8a1FP1Ve8FJuWCBsWF9bVX
CXfoByQBf0rzds0VJsH7s7/WVkbIlNGw6T1cDMU2x6WW2ywBG8h0QGxr3b8AwMlw
5MsXjXxJHA==
=pi7k
-----END PGP SIGNATURE-----

--naq5whtgj6roz2n5--


