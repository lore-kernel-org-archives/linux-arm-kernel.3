Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A82EC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SXxFPuDCxz3Aji6z4V5I94Ca9I9A0J3OETny9fcwk9g=; b=bAEtqFoPkXQocw
	yyC1WVep67JGQwXIHxrpJwBr+HJlwB5WvJCtTDJoUw/2kZ3+SQe2L0GKtZ8HDg6OSp1HKPRjmh3Lh
	l8bGipPz+HtP+EQBAnMvQ6SN8Iw1f2cC2ekTcwJ30/tQ2dmayaA3Xe/Xxq+vaABEdrFWCrXmfAJKS
	C72PFgXOrscSa97NDgAwxUKMm4dYpupAXv8fF+VAA9PgEF9uoS95eQjQs2Fo4RUDBz1oYFnV903Da
	koRHBN3QfZ9RxF3ScLRqIMNb/imdEPHnYBYrO8sTVXAK8BrDJKO8ad4yuidr53RnD/yYckISnvIf1
	JCbL3nq0y8HuVLW0XH5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvnT-000000008Ho-3BcH;
	Mon, 03 Aug 2026 16:45:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvnS-000000008HG-2mft
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:45:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1179660AA8
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45D01F00ADE
	for <linux-arm-kernel@lists.infradead.org>; Mon,  3 Aug 2026 16:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785775549;
	bh=SXxFPuDCxz3Aji6z4V5I94Ca9I9A0J3OETny9fcwk9g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=P7Y32Wwu5CLcyaG4uHJwQw/yPwMDH8PRwLZoe8YqxPZjHQ52LTeR9XnqX2Iv407og
	 1E0m0JDC58qFlh/g78Yq5DDM4PFeUOA8eF8JybeQq/jxx4Tj4PdQAfCrLQmnfHO/oM
	 RiY1HbG00m7mBpr12/n0JgS5UFeln7WWtH1tXC2uFlZ78GqbJzkJfb7Ba573dJBm0q
	 uAIfwKNoYyvQ+rteuURYqIIzkBzh2cRpJJDD/PBE5pd15CdJvVqXhGtWdePk7bwhP6
	 PuHK+gn2EnFx6jxIOT5eFGNtb8QE5Zs0l6ET60LWCvQpfy0j8x1/ufcLewW1QJXmcM
	 M/UT+WZ7zzo7g==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c8ee87f7eso31806521fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:45:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqQrTOCK1qlGwlmeyuVYxtxYKG0ZSnsIdWdtl6nITFNw3grdoqPKz3Z78TJWoXVdbDTwbyLGjV+U9Cc5YwCZH+H@lists.infradead.org
X-Gm-Message-State: AOJu0YyDv0g9Zunyw3c9+0HdJlKrMNBHIeUVkGBL4SivAZHNQX9w0lCC
	6Ld7JeA9rm8GEkLoEfh5z1M738h2u8cbCbrr9TtPILbLn0AxnsnBDYy6SYtjOnDuOoSnlhp0a38
	Lt/sRbs8cRzNiChRO6F/9H55ODWxf2fU=
X-Received: by 2002:a2e:bcc6:0:b0:39f:fbd:69e4 with SMTP id
 38308e7fff4ca-39f8647da2emr21946901fa.41.1785775548162; Mon, 03 Aug 2026
 09:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785772659.git.jernej.skrabec@gmail.com> <7e9dad9eed2e91a79c4e1202caa8fed7c2427531.1785772659.git.jernej.skrabec@gmail.com>
In-Reply-To: <7e9dad9eed2e91a79c4e1202caa8fed7c2427531.1785772659.git.jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 00:45:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v64MMcUQW-6X3Hb=ifO87VhEDicjXtpHvq+pBYczyLECrA@mail.gmail.com>
X-Gm-Features: AUfX_mwZCPbOCHuxVBeBJfg0hkv1k_HMStH-Sat9nWvpFIL9sOzUuH6ZR1uJGfk
Message-ID: <CAGb2v64MMcUQW-6X3Hb=ifO87VhEDicjXtpHvq+pBYczyLECrA@mail.gmail.com>
Subject: Re: [PATCH 05/13] drm/sun4i: tcon: Set output mux for DSI and LVDS
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
> DSI and LVDS skip output mux setup, so TCON TOP cannot route the selected
> mixer. Configure them like other channel 0 outputs.
>
> In practice this matters for D1, where channel 0 TCONs are fed through
> TCON TOP. The remaining set_mux implementations only handle TMDS and
> return an error for other encoder types, as before.
>
> Fixes: b9b52d2f4aaf ("drm/sun4i: Add support for D1 TCONs")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Chen-Yu Tsai <wens@kernel.org>

> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index 960e83c8291d..ea7c90fef316 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -717,9 +717,11 @@ void sun4i_tcon_mode_set(struct sun4i_tcon *tcon,
>         case DRM_MODE_ENCODER_DSI:
>                 /* DSI is tied to special case of CPU interface */
>                 sun4i_tcon0_mode_set_cpu(tcon, encoder, mode);
> +               sun4i_tcon_set_mux(tcon, 0, encoder);
>                 break;
>         case DRM_MODE_ENCODER_LVDS:
>                 sun4i_tcon0_mode_set_lvds(tcon, encoder, mode);
> +               sun4i_tcon_set_mux(tcon, 0, encoder);
>                 break;
>         case DRM_MODE_ENCODER_NONE:
>                 sun4i_tcon0_mode_set_rgb(tcon, encoder, mode);
> --
> 2.43.0
>
>

