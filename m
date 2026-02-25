Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A7CEFD209
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1z9BWz3z5pxfzq2/6/DM6j0C4sXxYJlJrqOJoumJEJ0=; b=MV22175pBkFN9J/avhyktjBTQb
	w9aWpfEJupO4M/xx/IghUuOSkjeEqVE5chDCngGC6KB7nDictGF4q7WIUsAdRL6PZsX/TFEbMdG57
	NzX1xbOOiJKrasIspOgwZ3nuRpRL1RzbPnhYp3dnr/H9MeYTrg+elk+SrOk4NYxihIsxfltbfQR0w
	vqApj99PG3e38F4U/nfKn5C/d6gHg3Yb7rHOM0qJRrJb2PuLjpsN8QkUtzv9Ddqj7wd019NSGJdeg
	8w6fv4WrF/cLVbInwvtQf8RpJAQyTpHXDWuOCR9bRL/LU2r3/DnP9wMZv8njm8Rubgme09JfWU4g4
	QZMsDdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA8I-00000003YBh-2ZG4;
	Wed, 25 Feb 2026 08:20:34 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA8G-00000003YAp-3UGD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:20:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59e614b3dbcso6783127e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 00:20:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772007631; cv=none;
        d=google.com; s=arc-20240605;
        b=gT/uNMH+m43HqfpwkfFh82R3qyrPLJnycGYGtidphhJNJHS0mqwy/kj8hLlLWefpLP
         xZFCrDzGkI3M3PDsWRZLMDAeDE0Zhf7YKmICqOMrVSRggOGf7rvtCWaYYniq1H/fKDtS
         PcnJEWvgkO0MnifcIqmu0Zh7xo3IkN4jjHEEbjib+mMZFN1rjOoPstTnybhb3c88KZRZ
         PgHAXjywDff+eqYN+ZWbpZnBapY7LwHi6mAKBsY8kPaf/SLz5q5mTZkKo1WtHyVbpZeM
         nR9wgdT7QMDZCmgu6dUULky5zW6GbQsq9V2Obc0NfL2HV+O4cZ5hYG2th7BQ2eEetHoq
         YcaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1z9BWz3z5pxfzq2/6/DM6j0C4sXxYJlJrqOJoumJEJ0=;
        fh=TGPumRgDz0UNyPQAhZDg3ICgaHprGkb+2Moy62kw2Ks=;
        b=UNX7vpZ88U/WEw9vWHGGO+z9rrTQEPOigtW1aNEoYFbVuESSId3mzpfpxIqmK1dgZn
         qfpTeOdaTSL+MSXqmMii2PZ19/QDAIftIV23fe2x7ylvmxYpPkdpubNT0GrQZbQYUz4J
         uLLLSFz1sJhUyDfI+SE9z7hkAy7Yc092aNRnH4QEdNDuH7seTQpP7ejwt7iGUMdVMsK9
         4DSrjl21IspPS1TFZoBt40tUFAFdqEBQdbNiVrneNWzOC9Y/vDpBcApZb9CeovJ6f0Cg
         hn5W38Bdj/0XPErYs3PHFDkKej4em4BEWlt743Ze2d2AN40h5YPF/k8SsVbjY5cZCvhN
         idGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772007631; x=1772612431; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1z9BWz3z5pxfzq2/6/DM6j0C4sXxYJlJrqOJoumJEJ0=;
        b=beHx+nm9C7ezLARUWXP3DPRF74Qg1v1SuYWdNAdWgASij0Dp4KV0ecjPWT13QnzOQS
         Zc2+uFzhnliKQfkphjafbZBm2s0AzTjnTIUKTsBo6WNxPvjdNyTrwuQSUC2UhYcp0Z8W
         Kr1MTR//o0HPfqUggRAKhPSOSwLHS3XFYW/kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772007631; x=1772612431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1z9BWz3z5pxfzq2/6/DM6j0C4sXxYJlJrqOJoumJEJ0=;
        b=vEe1vvXODUoindgl+IUjOzMSsAh2S9irwmh/KA7fneGySeNe+Kq037LkzL7EL6vuDr
         uuMwSo7gXP4Csx2hcL1tIj6FBkAv4OpxETNL0Y0Bg5dxgFatAoemy5wnahM0JMDu0bdG
         DowVfWrbk1eLTph7QuidUHDu2HRfQQyqglwTJ22rX9AVhPxci8ED67Gw/C1tofs/bve7
         LhP9wBtJquuQnGrm9awVrqjLfCHmqjTyrgH3ScYeC3HLewM5rccIrFdLGWp2VPtcffqm
         9tUZOgNTc5p5HNPcBF0T77GedLGAxEnnaLpfeXwVFqJp5yPohVT8bB5kHEAn94YnNwW1
         NB5A==
X-Forwarded-Encrypted: i=1; AJvYcCX8C/fr4fe5gp/5WELjHPVj6a4Xe5INbeqq2ydIEIMQWpoQKzvymT8L2ldEa6e7p1POh9uLihvYwmjlv6KhI3tu@lists.infradead.org
X-Gm-Message-State: AOJu0YxTjUyEhnWFJFDQg6I5qOrz9AQMYmO2Z8BE9Z7GmzKPh/veEsic
	WrU4lzsTi0QdP4FWusKzrvDXb0LPHrBX6d4bKMjQe5xTYXuj075uvfMtSvrvlUfPP1+dYLEJTY8
	1d3b0V5GdBEftVZB/NNd2it7KUJJc1PNAxxgnjQlR
X-Gm-Gg: ATEYQzyYvwSgvJqv9t97jDxVCB7Mv0BvzQcHQguz3o/65DloGM5qI9xCpEtScYhIdPD
	yif6EFelWxmeT1sdoXuq2BwrkM1RqEsTDTBDFeJGkfchY5uILpU3tTokCOYMi0XfaM+KgOWi/zD
	UVyheai5DllfCYqNRJ5T2rl+Y6lsQLgXC9iI8kTzyr0HeH36O+56/1Et1cfD9/ypMcKleTDeERm
	YAmzFSCGRwHmDl8zzq0Xhj4JmMqtygAi6q5ft2YkBrvma9lOHBaYEyzVl7WbuPAz6zaglH8rJrq
	HP8vqp5sM4tDjNADPnzEAxGyfypv/HPC+Lk=
X-Received: by 2002:a05:6512:b9b:b0:5a1:430:6222 with SMTP id
 2adb3069b0e04-5a10430638emr227734e87.7.1772007630593; Wed, 25 Feb 2026
 00:20:30 -0800 (PST)
MIME-Version: 1.0
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com> <80cecc13015aca7fe68dd40845e60af4bad42223.camel@mediatek.com>
In-Reply-To: <80cecc13015aca7fe68dd40845e60af4bad42223.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 25 Feb 2026 16:20:19 +0800
X-Gm-Features: AaiRm53aktJkvWRSs_OtrFpEUnAjkj1Xocp5KjXoLsN4g3Olmuw0jfNPNr4TOdc
Message-ID: <CAGXv+5H1=7O36txmf+m08w1fg3kZKjpqnSOuOAOfiPPcCjtMvA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"airlied@gmail.com" <airlied@gmail.com>, "bisson.gary@gmail.com" <bisson.gary@gmail.com>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_002032_951791_D2D52B3E 
X-CRM114-Status: GOOD (  30.30  )
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

On Wed, Feb 25, 2026 at 2:20=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89)=
 <ck.hu@mediatek.com> wrote:
>
> On Tue, 2026-01-20 at 12:36 +0100, Gary Bisson wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >
> >
> > Some bridges, such as the TI SN65DSI83, require the HS clock to be
> > running in order to lock its PLL during its own pre-enable function.
> >
> > Without this change, the bridge gives the following error:
> > sn65dsi83 14-002c: failed to lock PLL, ret=3D-110
> > sn65dsi83 14-002c: Unexpected link status 0x01
> > sn65dsi83 14-002c: reset the pipe
> >
> > Move the necessary functions from enable to pre-enable.
>
> Looks good to me, but this change the flow for all SoC and panel,
> so I would wait for more SoC and more panel test.
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # Chromebooks

Tested on:
- MT8173 Hana (Telesu) w/ PS8640 bridge
- MT8183 Krane w/ DSI panel
- MT8183 Juniper w/ ANX7625 bridge
- MT8186 Tentacruel w/ PS8640 bridge
- MT8186 Steelix w/ PS8640 bridge

No regressions observed.

> > Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> > ---
> > Tested on Tungsten510 module with sn65dsi83 + tm070jdhg30 panel.
> >
> > Left mtk_dsi_set_mode() as part of the enable function to mimic what is
> > done in the Samsung DSIM driver which is known to be working the TI
> > bridge.
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 35 +++++++++++++++++-------------=
-----
> >  1 file changed, 17 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/media=
tek/mtk_dsi.c
> > index 0e2bcd5f67b7..b560245d1be9 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -672,6 +672,21 @@ static s32 mtk_dsi_switch_to_cmd_mode(struct mtk_d=
si *dsi, u8 irq_flag, u32 t)
> >         }
> >  }
> >
> > +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> > +{
> > +       if (!dsi->lanes_ready) {
> > +               dsi->lanes_ready =3D true;
> > +               mtk_dsi_rxtx_control(dsi);
> > +               usleep_range(30, 100);
> > +               mtk_dsi_reset_dphy(dsi);
> > +               mtk_dsi_clk_ulp_mode_leave(dsi);
> > +               mtk_dsi_lane0_ulp_mode_leave(dsi);
> > +               mtk_dsi_clk_hs_mode(dsi, 0);
> > +               usleep_range(1000, 3000);
> > +               /* The reaction time after pulling up the mipi signal f=
or dsi_rx */
> > +       }
> > +}
> > +
> >  static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> >  {
> >         struct device *dev =3D dsi->host.dev;
> > @@ -724,6 +739,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> >         mtk_dsi_set_vm_cmd(dsi);
> >         mtk_dsi_config_vdo_timing(dsi);
> >         mtk_dsi_set_interrupt_enable(dsi);
> > +       mtk_dsi_lane_ready(dsi);
> > +       mtk_dsi_clk_hs_mode(dsi, 1);
> >
> >         return 0;
> >  err_disable_engine_clk:
> > @@ -769,30 +786,12 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
> >         dsi->lanes_ready =3D false;
> >  }
> >
> > -static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> > -{
> > -       if (!dsi->lanes_ready) {
> > -               dsi->lanes_ready =3D true;
> > -               mtk_dsi_rxtx_control(dsi);
> > -               usleep_range(30, 100);
> > -               mtk_dsi_reset_dphy(dsi);
> > -               mtk_dsi_clk_ulp_mode_leave(dsi);
> > -               mtk_dsi_lane0_ulp_mode_leave(dsi);
> > -               mtk_dsi_clk_hs_mode(dsi, 0);
> > -               usleep_range(1000, 3000);
> > -               /* The reaction time after pulling up the mipi signal f=
or dsi_rx */
> > -       }
> > -}
> > -
> >  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
> >  {
> >         if (dsi->enabled)
> >                 return;
> >
> > -       mtk_dsi_lane_ready(dsi);
> >         mtk_dsi_set_mode(dsi);
> > -       mtk_dsi_clk_hs_mode(dsi, 1);
> > -
> >         mtk_dsi_start(dsi);
> >
> >         dsi->enabled =3D true;
> >
> > ---
> > base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> > change-id: 20260120-mtkdsi-29e4c84e7b38
> >
> > Best regards,
> > --
> > Gary Bisson <bisson.gary@gmail.com>
> >
> >
>
>
> ************* MEDIATEK Confidentiality Notice
>  ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
>
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

