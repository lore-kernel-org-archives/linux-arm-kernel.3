Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6604C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 06:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gWSeKvpcppphKo4JuhaQYfS686HzGPt1n2IjvkPZLEQ=; b=kaXhv+boyBzgktWhReBeLp2pnS
	M3HYifABpqy+XLzppdric+rI52rDJgGoQpoYUieEG0JJyUaKMWQMtPhVS0HFXUvrGXA3vDIfFUB64
	+f0ENzRsOu61qUIUziuP6vDAk/Wk1U+wsHPhHu+In79b+9dFp1k8zQM7xCtSFfBAq6KuChiHekJKx
	5I9j1HfOBLapR6zmj4Dq+J3rlD2DPlyf5QmYkTMjsJvIwx6EMwdXziIwlPRp1ALT/9x0ukcYySapC
	qCxKigCxEwC03grfUzHkcknt3dL8y9SgfMMGmcMLtMVHAbPkyKwtdwBZ7jPduS+9vqs16uDmV5aqA
	AZYcNhSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt5D-0000000Dtvu-0n6s;
	Wed, 15 Jul 2026 06:27:03 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjt4w-0000000Dtss-0Ncn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 06:27:01 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-667b9bee563so628341d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 23:26:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784096805; cv=none;
        d=google.com; s=arc-20260327;
        b=XS5mlp/QLF8CY2Nm7s7ik1Hghb60Q5IQR2+bLzo9X5NrtX3QN28wv5uM+xsTKvb5RL
         ITB24FqfCfzV7doEMHd9PN1YnREpOzAR8Hd3jBjAQNeGp+tbfyD/nod2gLRXGF4bub9y
         A2ByZXbcnlLjoIztnmvuVHvdoQbsx9FbOLYyyTpDpwerGeURGkzsiccPgn4NUqDtOhwO
         IIAIDMoEJhieS0ho92t1RZm3NgsVH07BzAgm0y2SxeEfUwFkWAnBPSQPPuRzr/DCr9Pb
         ZecOgz1+SRLlrY0yz9UL3PX1YOH/8wkaqrPChv9KvbqGvBAK2Ta6aR4jACsxuXuh0adM
         uM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gWSeKvpcppphKo4JuhaQYfS686HzGPt1n2IjvkPZLEQ=;
        fh=afFLTeQDyWniKYLrNuTdtRTaVGtynb5M4q3mWtetoWo=;
        b=EZCj87/gbvMfCtbxEGgxeHZqz+tm5nP4YZUdJJ2NYDN9HMfs4CCLV3ATajWF+PL7Ep
         Y7emQGjD58eVWanxWpsr3jMHFgIGvvGeEGez8gfo/eXrBCDcM4A9wWot9j9/tMYsIjME
         6kS3dYdBNt+8/XdBmZKbpRo8Oo6abiUnrqr3h6I2IMogsW4W/lPAJo6SwWjdBbn2q84G
         Z5v10h1UbHNaBeHQTCByTI3d7y/BjyyG7t6MWlns/coecls2HMKFA8YCmcEvoNxr7Sb2
         E27Dqux/6GrcjiarilgOyph4PKC63Si8KRo2jy5aMVPxmHo0WS/uBBkv6cMMIaBaw2Ta
         2BlQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784096805; x=1784701605; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gWSeKvpcppphKo4JuhaQYfS686HzGPt1n2IjvkPZLEQ=;
        b=DY4+HB9+4ta4b0DJxKTX5geeWPNTJrLpm/G/68rH1Et24eSL7O8i+/B4RqHXTpjVB/
         a8qfPM5/SuifCFqeOZiHzC4q52qR3SgBTZGCHH8tLk3ArIeB8QeQx6USigSDpMihbk6w
         DXWl6NTjqmk4QJ7r1syfAw+IPhTovaYVUen1ivg0s1z6rHuD8Vh9wiPZRsDcQJDAF6ZC
         4YNpKwsOFCGurfI4LZhM0Xd2suTiwaV9EYq9/00K90ab5DUHJOqxIrY3amkayZJuOXzb
         mRry0DM3tQBdMKatUfNKg6Kyq1G9X0SNebuf5ipkD/1zyqu7RTgxG5ppbQwGRQM+RQMu
         pCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096805; x=1784701605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWSeKvpcppphKo4JuhaQYfS686HzGPt1n2IjvkPZLEQ=;
        b=hYxTlIUgbf4+h8hqOhtwQFfRiOGpQnfNBfdtLGQZuT+tFnI2ENbf1rJvIujg6o8Qjv
         F6bJHT1DU4tK+FYZIbcKqbJck5LHJ7iwFIkeAO7JT0CH0/y+MqSVxQj/7BUutpalZW2I
         6DyKGWIMuUqqyrpBXOdF+KC+wgk3p5z13/jjxdhPEg/BMxmtqy+YGZGj1CrPlWwto31U
         QhUP8qLKqSDvjEHugXziE3TkZiRBjr/P7oTo5y43DwlV0sY3zn023U1VIvNsp7n8qd4g
         WygVzUYe68dQQeEM+Ru/71IYT1967vIRQjh8iwlKcvORJ8TiytVuiWQP96WEVZqjSEr6
         j+HQ==
X-Forwarded-Encrypted: i=1; AHgh+RppQQkROc153Vg12+j2U6IhkGBXFs9Vaa/LrBx8Xw0utiTYVHs7/PxW0MUerNa0/wpgiwrGGlQvbC9TtbsfFpZe@lists.infradead.org
X-Gm-Message-State: AOJu0YyPMFK1EfP0B0wYrd9TZt6xXQy0OEcE0mUqHgMCwnZkuxnw6Ozj
	T7WtNSK/pGy43R1wX1dIBsGNFYmoap7fsgdahF2MYnq3ni2UTO4ptarYxOsaZmomBGvimE5a2kI
	lrP0RmLCg32O7AOH9/I51CKVVfHqF9MobsPv+4Xo=
X-Gm-Gg: AfdE7clzQAbZxjm+p/2OaFEvXF6KSkRV2Tf0/Do2SfmL5DX3WhqcptvIeb9oUq3h7KG
	2cZgVQPfVXiaoA6Lfgc4HC3pOIjZhagT7XBGf3snCzKhO4bWJUHVvvKWPpY4H/8JpW2mB/Ja+Q0
	2qf61siSU3CGyoN6yBKT9dQz156sGPtSUFBQAYWbqCFXf6oSkE6R1Y8KJXIjg750sDKChT9NH5F
	graYEcm0HCFdykF0PeIo98TwJ8PWYl8plpsADOTCtym7a6OWOA1qcSo4Jh6yiZkqvRVEqMlTpBH
	f9qNu+nqKQLPx3hjPvM8eeN5Reag1Rg=
X-Received: by 2002:a05:690e:4883:20b0:668:7e4:b078 with SMTP id
 956f58d0204a3-66807e4be6dmr2370313d50.5.1784096804761; Tue, 14 Jul 2026
 23:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260714202850.40999-1-royalnet026@gmail.com> <20260714204026.84B601F000E9@smtp.kernel.org>
In-Reply-To: <20260714204026.84B601F000E9@smtp.kernel.org>
From: Royal Net <royalnet026@gmail.com>
Date: Wed, 15 Jul 2026 08:26:32 +0200
X-Gm-Features: AUfX_mx_GykK3yZd7csrMrPNJbBaiwMkpZUk534rlKvfi9UnpbROgKKA1H36E9M
Message-ID: <CAEWPSH5KVBDE6s+7EYsyGEJ5BNv2Y6dtXXcKOfS=9xxjw6MtPA@mail.gmail.com>
Subject: Re: [PATCH] drm/rockchip: dw_hdmi_qp: attach the HDMI Colorspace
 connector property
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_232646_139388_CC4E9184 
X-CRM114-Status: GOOD (  29.54  )
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

> [Severity: High] This is a pre-existing issue, but by adding this
> error path, the patch exposes it further. Does returning an error
> here without cancelling hdmi->hpd_work risk a use-after-free?

Thanks for taking a look.

The window you describe does exist, but it is not introduced or
widened by this patch: hdmi->hpd_work is initialized and the HPD
interrupt requested early in dw_hdmi_qp_rockchip_bind(), and the
function already has several error returns after the interrupt is
live -- encoder init, dw_hdmi_qp_bind() and drm_bridge_connector_init()
-- none of which cancel the delayed work. This patch adds one more
return immediately after the last of those, following the function's
existing error-handling pattern.
Since the cancellation gap is common to all of bind()'s error paths,
I think the right fix is a separate patch addressing all of them at
once (e.g. switching to devm_delayed_work_autocancel() or a devres
action) rather than special-casing the new return. I'm happy to send
that as a follow-up.

Igor


On Tue, Jul 14, 2026 at 10:40=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Returning an error from `dw_hdmi_qp_rockchip_bind()` without can=
celling `hdmi->hpd_work` leads to a Use-After-Free when the delayed work or=
 HPD interrupt fires.
> --
>
> --- Patch [1]: [PATCH] drm/rockchip: dw_hdmi_qp: attach the HDMI Colorspa=
ce connector property ---
> commit 77d2f0e8bc60d50755aec22dee119ad08bb92b3c
> Author: Igor Paunovic <royalnet026@gmail.com>
>
> drm/rockchip: dw_hdmi_qp: attach the HDMI Colorspace connector property
>
> This commit creates and attaches the standard HDMI colorspace property
> after the bridge connector is initialised. This allows userspace to reque=
st
> BT.2020 colorimetry and enables wide-gamut/HDR output on RK3588.
>
> > diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/g=
pu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> > +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> [ ... ]
> > @@ -695,6 +695,20 @@ static int dw_hdmi_qp_rockchip_bind(struct device =
*dev, struct device *master,
> >               return dev_err_probe(hdmi->dev, PTR_ERR(connector),
> >                                    "Failed to init bridge connector\n")=
;
> >
> > +     /*
> > +      * Attach the HDMI Colorspace property. The HDMI connector framew=
ork
> > +      * already consumes conn_state->colorspace for the AVI infoframe
> > +      * (drm_hdmi_avi_infoframe_colorimetry()), and HDR_OUTPUT_METADAT=
A and
> > +      * max bpc are attached by drmm_connector_hdmi_init(), but withou=
t the
> > +      * Colorspace property userspace cannot request BT.2020 signallin=
g,
> > +      * which keeps wide-gamut/HDR output unavailable. Passing 0 selec=
ts
> > +      * the full HDMI colorspace set defined by the core.
> > +      */
> > +     ret =3D drm_mode_create_hdmi_colorspace_property(connector, 0);
> > +     if (ret)
> > +             return ret;
>
> [Severity: High]
> This is a pre-existing issue, but by adding this error path, the patch
> exposes it further. Does returning an error here without cancelling
> hdmi->hpd_work risk a use-after-free?
>
> If a hardware HPD interrupt fires right before the devres cleanup
> unregisters the IRQ, hdmi->hpd_work can get queued. The DRM master
> teardown then frees hdmi (which was allocated via drmm_kzalloc),
> leaving the delayed work to execute later with a dangling pointer:
>
> drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c:dw_hdmi_qp_rk3588_hpd_work=
() {
>         struct rockchip_hdmi_qp *hdmi =3D container_of(work,
>                                                      struct rockchip_hdmi=
_qp,
>                                                      hpd_work.work);
>         struct drm_device *drm =3D hdmi->encoder.encoder.dev;
>         ...
> }
>
> Could we ensure that the delayed work is properly cancelled before
> returning errors from dw_hdmi_qp_rockchip_bind()?
>
> > +     drm_connector_attach_colorspace_property(connector);
> >
> >       return 0;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714202850.40=
999-1-royalnet026@gmail.com?part=3D1

