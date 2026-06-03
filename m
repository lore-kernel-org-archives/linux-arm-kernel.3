Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02FC1CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 08:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRjZpsNs43oaDIo6NFyqCqveQQyEyd7nLlm/j3z6ROA=; b=b8i6Hj2tiNB5EVa75p9NRXsAjy
	fNsIfLnHiOPbUkppehPniWx8eL8HxaywcgWCfaMm7/MfLdgd/8O/qENWpXvmwBVq/FKqbF0AXxfA8
	b1X91Fxsk+HALKWVt3MiIAv3many65fN3/P6QE24k9QJgoZSx7fN+67DKWaLQ5CM8UHjDETxd156W
	HEWxoDubRynZOgoIk0ufEIyTUKftwaxn+YkHVXIM0pfaedM0m/s/vWOYSMn2EpJT5iUttBabQnRE0
	9R/qj1ZGTDrCpoVy8K0YnJ2AJQKxShuIrixM9f6yaWG6F0xtcJG8dalMwR/mbCeCxuOzWVTvSIN6e
	591GLb3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgl0-0000000EYXc-33TQ;
	Wed, 03 Jun 2026 08:15:22 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgky-0000000EYWk-3wU9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 08:15:22 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso20663700a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 01:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780474519; cv=none;
        d=google.com; s=arc-20240605;
        b=KnIJFscpuh7ZaHJq9qNkBf1qvPVY6plfDdDwwq35Fw5QLZoJM6LYjLzPV5mQtgHGW3
         6Lc7i39KWLOBwqYxPbjr+Wuwyn8wDqZjybGn1R+NoGbT0HgRguR03lMV+KAlgKb8vGIF
         lR6omrtS5KuF7rP6XNUBIkeW1uGyMxCo6uAlXXLeAS+9VQOVAwYindyKDtahMU9uKOgx
         E9crh5uE++6YgnZqb4cXfuHg5+wGkAsiA1GxK1J+NOkRBDiUOGamy7T3aM3KuKw9XQ4Q
         797POrToUkV+t1nqkt1A1PlvErVYH6gTylQzCxjLW5D4j+O0DH/IsGqSXWv7EeB5hXhO
         XI2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gRjZpsNs43oaDIo6NFyqCqveQQyEyd7nLlm/j3z6ROA=;
        fh=MjytdeCfnT3o42xrOQiD+GRTDSWDUBnXyZ6hPEpsQXU=;
        b=B+Lb+JT5+ZFM8Wp2ND/aC8VFmthgZy9l6DFQfnCgsP1ZQU3rd7uOT5pT45FDbmaVoV
         2MIy47xqBIxKIi7J15OULpvGOX5xIE6+a0AYlufQUXFrnqOOQr+qO3Ezc1H31YbzXi0A
         9TgLuNok6Tq17fdTu8rwH/MgHqcnnRMlJSxUWTfaAEHUyanZNZ/81OaQX/mbetZ0vjaK
         cYU07UiIIBdu4Md4X1uuwqz1yoS63gzs7ri8dD1kuw6rjNJ3AyLO/FMuH4FfTDg64mik
         Mqmb+obSGJXJsSzbVuZiNZpcu6J2TZ1XPObWapdp67FRS3uPzPFlBdFhm3JdmSzPd/ID
         zXtw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1780474519; x=1781079319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRjZpsNs43oaDIo6NFyqCqveQQyEyd7nLlm/j3z6ROA=;
        b=0Z9Bx3ida+eD770p8pGwQhEpajo+RpwFrDd9RGjXq6hwxwj4ujTOOsnLxMhX7OEFkJ
         iViGnZQAObdAI7qdQq5USYZXcNAxHo2g7yNa19Xx0Iej6OaAqIMSr6p9kT40f5H9+Tjl
         LIA3cBW6SIlqu+En+Vu1dbRhnU6ZlCxgwAJl96xsEnIOaK0BD9QDa1KDDnX1Vnv85vts
         29IeAlUjR9F9yvkz4+vfu7mE87bgaFMKrOtxYA2AUbtULwjm+tzjH1/xxK23Wo7C4X33
         0Pq7AmgN9Syubs4MoSDxNoUmoHzd0Nncf3IEUquaU75T3+KEUiW7vhLEOWXhq/PfAkZl
         iW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474519; x=1781079319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gRjZpsNs43oaDIo6NFyqCqveQQyEyd7nLlm/j3z6ROA=;
        b=DB9HANjeM4l9D+blNyv/KK7LACERxrp/RF9w/BfeGaDbEyh3QWwG9ZMqHR+rld7k21
         lM2DmQKf5vb+MSmoGy614MPRv769GkzIRYDYdgxKEnIbFM8vccZr5PwNKgdB/y+n5aGq
         +WZDkQKI5+lZ7ImPic93iWHQlVhM/pGNo0MEFNubhqENlM5WeTKL9QO2yPu39LzgElca
         VZLO2O2xl7iexNgeSBahoAepz6MM9uvU9KjV+kJ+wmcbEQeON9cQAOjknXe+JGpmZOVp
         Nb9Yxb527/Ug6ULoJsXksU+MQNU0heReT7KLIBrb+N7m7aWvjltgWbLkq9S4MRj4H0gh
         3aiA==
X-Forwarded-Encrypted: i=1; AFNElJ+5KxXGDgliYjUZWVWxqdW+bmKXhsUf/PgD5l64opFoL2sYQCxuj0oJ9FvQHXSuLDWM/LaGi/f/7RV8dKHMLHJW@lists.infradead.org
X-Gm-Message-State: AOJu0YwUVLFj0NiV5Ac3UUSijYxk0xp8UO+dCpAIzQwOyPVrdepchDV0
	/mTca6EGt4XGxIbM6eHaj5ukJQkQ06I6EIrBY82ak68SfOsk+kyrECeIbn5sg2oVDxnIlUoDedX
	2Akw7pv4rSFlTJpd8emLojfPT6tNqOBmZvzwJ2qDIpQ==
X-Gm-Gg: Acq92OEaB0J4U0V2KuVbxdErRsOtxTrG3Yt3lUWZBhGMBq7bIs+WbW0fgfCwm2k4ekK
	KjD12Hs3adEO9/saHiA7fy6WfAxJbRx4/r5tB1fvrCaCmmFnb5+PQwP5TXD0HbTFzhB7Ru8lAYv
	gq3nM0GNy3mo0JjH/gcGKn4F00oPg8BxRVA5iEilpldTslSgq/mTjU+tUtM7cdL5bJHlAm4/gnf
	vmHIsRlPTM1+h15oHpVls6XEDwwPxu3PXhL507g6hvGwj5Vd3Q9aoveEBZUk3qZwB01KNMzfy4f
	+doQ+kn+b3ALdqfWUJc=
X-Received: by 2002:a17:907:2888:b0:bee:77ae:331d with SMTP id
 a640c23a62f3a-bf0ab21598amr67736366b.40.1780474518495; Wed, 03 Jun 2026
 01:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260602-hdmi-overscan-v1-0-31f71b817c80@flipper.net>
 <20260602-hdmi-overscan-v1-2-31f71b817c80@flipper.net> <20260603-glittering-vigilant-beluga-0c6bf6@houat>
In-Reply-To: <20260603-glittering-vigilant-beluga-0c6bf6@houat>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 3 Jun 2026 12:15:04 +0400
X-Gm-Features: AVHnY4JpnTW5Hb5wV2KDIa-xAcNMWSVw4PZh0S5vcLCYVB4NPlWeSB2i4m-eFk8
Message-ID: <CAKTNdwE5uAOc9V+L1J7_QJfW45D-K-vTnpHuktxD2=x9e_4jOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/rockchip: dw_hdmi_qp: expose "overscan" property
To: Maxime Ripard <mripard@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_011521_015340_753D294D 
X-CRM114-Status: GOOD (  26.87  )
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

On Wed, Jun 3, 2026 at 11:55=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Tue, Jun 02, 2026 at 09:00:40PM +0400, Alexey Charkov wrote:
> > Expose the "overscan" connector property as recognized by KWin and the
> > likes to compensate for TV overscan cropping.
> >
> > The CRTC will use the margin values derived from this overscan percenta=
ge
> > in its post-composition scaler to add appropriate blank margins on all
> > sides of the output image so that the TV doesn't eat up visible content=
.
> >
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/g=
pu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > index f35484715c2d..fae44d11dbef 100644
> > --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > @@ -137,10 +137,18 @@ dw_hdmi_qp_rockchip_encoder_atomic_check(struct d=
rm_encoder *encoder,
> >                                        struct drm_connector_state *conn=
_state)
> >  {
> >       struct rockchip_hdmi_qp *hdmi =3D to_rockchip_hdmi_qp(encoder);
> > +     const struct drm_display_mode *adj_mode =3D &crtc_state->adjusted=
_mode;
> >       struct rockchip_crtc_state *s =3D to_rockchip_crtc_state(crtc_sta=
te);
> >       union phy_configure_opts phy_cfg =3D {};
> > +     unsigned int overscan;
> >       int ret;
> >
> > +     overscan =3D min(conn_state->tv.overscan, 100u);
> > +     s->tv_margins.left   =3D adj_mode->hdisplay * overscan / 200;
> > +     s->tv_margins.right  =3D s->tv_margins.left;
> > +     s->tv_margins.top    =3D adj_mode->vdisplay * overscan / 200;
> > +     s->tv_margins.bottom =3D s->tv_margins.top;
> > +
> >       if (hdmi->tmds_char_rate =3D=3D conn_state->hdmi.tmds_char_rate &=
&
> >           s->output_bpc =3D=3D conn_state->hdmi.output_bpc)
> >               return 0;
> > @@ -603,6 +611,14 @@ static int dw_hdmi_qp_rockchip_bind(struct device =
*dev, struct device *master,
> >               return dev_err_probe(hdmi->dev, PTR_ERR(connector),
> >                                    "Failed to init bridge connector\n")=
;
> >
> > +     ret =3D drm_mode_create_tv_properties_legacy(drm, 0, NULL);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret,
> > +                                  "Failed to create TV connector prope=
rties\n");
> > +
> > +     drm_object_attach_property(&connector->base,
> > +                                drm->mode_config.tv_overscan_property,=
 0);
> > +
>
> As the name suggests, it's a legacy property only ever used for TV. You
> should be using drm_mode_create_tv_margin_properties()

Hi Maxime, I tried that one before going for the current solution but
realized that the userspace tooling I care about (KWin in particular)
doesn't recognize those properties, but it does recognize "overscan".
Maybe there's a compat helper somewhere that I missed, which would
translate between the two?

It is for TVs. Turns out that having a proper right-sized digital
input interface doesn't prevent them from doing weird stuff with the
image data, i.e. overscanning and cropping it right where one would
expect to see the system tray and panel.

Best regards,
Alexey

