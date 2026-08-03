Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ACA8C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXOfikKqyccWdJOmPTIyOaKQPXwqCCx6SW5ye3VQI60=; b=MQW1UlgPsffoNw
	Z3D6JeHIwTAguDZbG6tjbYJzTV6S7raOaeVoht8MoA4I+juuBvUjqcnWqz7SphymBG8idY6LWLGB+
	blApMTT2jJo089b4gXXSxiHdRNCWpRRaWpLf/LlFUYS55VD8/RNlmpTr5w9PbMVY29M2QGvtZ9t1x
	ZrT7b1HXViwcFpr0uvPwumITbG7Bv2Q0xlq5p/BJlZVgxrHkoIFzWUt8toY8TX1JfT0yABm/hY7la
	hs5FiFiyVDlcK9d6+qve+/vYMzb7SoTo+OaN5hsoZo+5SrM+M6pyMtun0dANrHItmghRHW7zyy0Dg
	7km4tsB/K26eWTX0vv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvmr-000000007yU-1nsV;
	Mon, 03 Aug 2026 16:45:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvmq-000000007xM-0WnV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:45:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 49D8260A78
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FA11F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785775511;
	bh=wXOfikKqyccWdJOmPTIyOaKQPXwqCCx6SW5ye3VQI60=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=CXhcWL7mortE0CcKd5DgcgHtjMqibzHh9VXgayuANcJBFLhZY+7AtgZFvbSNEjGWa
	 t3HjFlqALsihyptzu1FwMlEBa5deZ7h0z3aG6joVcg1xNq6gONLoy0mepNFQgTJHhT
	 c/s6RMg85AJFJG6B52m8s+McP5UrKBXiLPKzpFZhJVgJX+qTSHlk8y0j/kFKA3qwJD
	 r7Las/NUVaIrFrI6CuawqmeZPbhO8rza0Uhf3YBVaeKQwaIbf2ditfyV3BoZz9ENa2
	 RyD9iw5kWLOiHdPfXpQRSlkbevx91sSizFDDxtGtiyMH5Fh36LuDjRINbq6t+6a4Up
	 Wv4OIwM+vaFlw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c7ef2b1e2so34939631fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:45:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq+NMvFr0Zvq/JRbNL1avRzXf842hFVYocV5XFlFci9rmk+1+bILAb3SV2FuNKk++Chgix3+elxpWXCbPWUnWk3@lists.infradead.org
X-Gm-Message-State: AOJu0YzpnQGcGNO9aR8wgJJucR6kSMtOGu65M1JcrOmwL92S1/3YMPic
	lJXqXt0vx4YC9gY6/6JCzg0XVgfwrBWgMAIHEup0PUv1h6P7Bdl4n9F/cPolfS4RCam05w1s3io
	dMC3PZUkokqO8BHjCg3WhHJRAsNP9ryw=
X-Received: by 2002:ac2:442d:0:b0:5b0:21e3:672a with SMTP id
 2adb3069b0e04-5b2e4f936cemr1411737e87.56.1785775509359; Mon, 03 Aug 2026
 09:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <52eb247169b268054302afa71e598add0b04748d.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <52eb247169b268054302afa71e598add0b04748d.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 00:44:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v67+AR+UDSM6tJSDtJw_zje164F8CmjUJaFegDr=txmUaw@mail.gmail.com>
X-Gm-Features: AUfX_mwkv5wRgU6YrCVP-n9_AeYgFr7hs0G3AjcJP388guGB69s2xIov8DPXNPg
Message-ID: <CAGb2v67+AR+UDSM6tJSDtJw_zje164F8CmjUJaFegDr=txmUaw@mail.gmail.com>
Subject: Re: [PATCH 04/13] drm/sun4i: tcon-top: Keep mixer routes distinct
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2026 at 12:11=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Both mixer selectors reset to TCON 0. Selecting the same TCON for both
> mixers causes black or corrupted output.
>
> When a route would collide, park the other mixer on another described
> TCON, or an unused selector if none exists.
>
> Since the TCON index is now used as a shift, also reject negative
> values.
>
> Tested on Orange Pi 3 with TCON_LCD0 and TCON_TV0.
>
> Link: https://lore.kernel.org/linux-sunxi/Zn8GVkpwXwhaUFno@titan/
> Link: https://lore.kernel.org/linux-sunxi/20241108-tcon_fix-v1-1-616218cc=
0d5f@jookia.org/
> Fixes: 05db311a792d ("drm/sun4i: tcon-top: Add helpers for mux switching"=
)
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Though I have a couple nits.
> ---
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 71 +++++++++++++++++++++-----
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.h |  6 +++
>  2 files changed, 65 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun=
4i/sun8i_tcon_top.c
> index 8adda578c51b..9cbd655518b2 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> @@ -25,6 +25,49 @@ static bool sun8i_tcon_top_node_is_tcon_top(struct dev=
ice_node *node)
>         return !!of_match_node(sun8i_tcon_top_of_table, node);
>  }
>
> +static unsigned int sun8i_tcon_top_get_tcon_map(struct device_node *node=
)
> +{
> +       static const u32 out_ports[] =3D {
> +               TCON_TOP_MIXER0_OUT_PORT,
> +               TCON_TOP_MIXER1_OUT_PORT,
> +       };
> +       unsigned int i, map =3D 0;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(out_ports); i++) {

You can declare `i` directly in the for statement.

> +               struct device_node *port;
> +
> +               port =3D of_graph_get_port_by_id(node, out_ports[i]);

You could probably use the __free() cleanup macro and make `port`
scoped and put the reference automatically.

> +               if (!port)
> +                       continue;
> +
> +               for_each_of_graph_port_endpoint(port, ep) {
> +                       struct of_endpoint endpoint;
> +
> +                       if (of_graph_parse_endpoint(ep, &endpoint))
> +                               continue;
> +
> +                       if (endpoint.id < TCON_TOP_PORT_TCON_NUM)
> +                               map |=3D BIT(endpoint.id);
> +               }
> +
> +               of_node_put(port);

And this line wouldn't be needed.

> +       }
> +
> +       return map;
> +}
> +

[...]

