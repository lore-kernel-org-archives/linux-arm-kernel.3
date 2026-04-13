Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18778F34C51
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 12:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h3FUUOILacuSgM+ABHMGfQupbtWpVZVev0K7QR0S3PA=; b=O4cSfHJX0BuVe7MWXnmZQBdwBo
	H3vkvStOFYiv+JE1aBszU4B7ec66jM51+kmWLv1jBJPN6RPaeZ7TmloSGSmP78e5NwjazDUky/oU+
	TKQ75qIZDQvq47cK9HA0NVV3f3SGaP8l+Uxc+upQJRsmozvt9ls3M+HG2ieOp4zC38jPUU15q/RAs
	Jio8y0g+RPqB+bg6OZmpbFbbcX6qDRnB4sSv9CFTVFztupijlzuFQcHyHXG+0SICZ67sTgrAlIdQ2
	NN6SloNwdTbAZebfRuwvyczv3q1fd/R/rETnebt7SUraEma2MDIQoG2wWRLMwyuNLYVa/dBgIbx3G
	znr3JXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGtK-0000000FhDt-0fCc;
	Mon, 13 Apr 2026 12:59:50 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCGtG-0000000FhBV-3Weq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 12:59:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5D8E2C5B19E;
	Mon, 13 Apr 2026 13:00:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B42DE5FFB9;
	Mon, 13 Apr 2026 12:59:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05B5810450229;
	Mon, 13 Apr 2026 14:59:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776085182; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=h3FUUOILacuSgM+ABHMGfQupbtWpVZVev0K7QR0S3PA=;
	b=wDi4rylprXYa5KvrF5XClhZwCqdBhIRvrj68umpv0rOZCRw+SHIMqqb9J6A5OlpXFegLXb
	1v1yWAis2ur92VlhEUydt8lyKrp3p55Mm8z+cYDV+L0hnrTR+erxW8efuL3L8dxN5VzCkr
	zU/YVxQzBaq+vUFYst8ScqPRT6rtP+1OJUU/axL3iUbwIQxAhQxyAuWdIIfxwRFUKKgp/6
	th235XxhexkP7slAiEV8kDSum6Qom6jTajuknHPdnSpgRF4Y9gRdntzSjMMsboitxLJD2v
	2oOiT4IQHWd8cguLrclzB4T7Rk0CCw8IEvepPTsgnrO/+IRlae+TSlDZSMjNuQ==
Date: Mon, 13 Apr 2026 14:59:30 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dave
 Airlie <airlied@redhat.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Eric
 Anholt <eric@anholt.net>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Mark Yacoub <markyacoub@google.com>, Sean
 Paul <seanpaul@google.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH RFC 09/12] drm: Introduce drmm_connector_dp_init() with
 link training state properties
Message-ID: <20260413145930.140ba461@kmaincent-XPS-13-7390>
In-Reply-To: <gmaxonri7y3k43pxsnxfnd23mydgrwsw2322v6m4yjoksqm7aj@4ehgvhzg2ubb>
References: <20260409-feat_link_cap-v1-0-7069e8199ce2@bootlin.com>
	<20260409-feat_link_cap-v1-9-7069e8199ce2@bootlin.com>
	<gmaxonri7y3k43pxsnxfnd23mydgrwsw2322v6m4yjoksqm7aj@4ehgvhzg2ubb>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_055947_029419_3A602AAB 
X-CRM114-Status: GOOD (  19.97  )
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

On Fri, 10 Apr 2026 00:53:08 +0300
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Thu, Apr 09, 2026 at 07:08:25PM +0200, Kory Maincent wrote:
> > Add a managed DisplayPort connector initialization helper,
> > drmm_connector_dp_init(), modeled after the existing HDMI counterpart
> > drmm_connector_hdmi_init(). Cleanup is handled automatically via a
> > DRM-managed action.
> >=20
> > The helper creates the following immutable connector properties to expo=
se
> > DP link training capabilities and state to userspace:
> >=20
> >   - num_lanes: bitmask of supported lane counts (1, 2, 4)
> >   - link_rate: Array of supported link rates.
> >   - dsc_en: Display Stream Compression supported
> >   - voltage_swingN: per-lane voltage swing level bitmask
> >   - pre-emphasisN: per-lane pre-emphasis level bitmask
> >=20
> > Link rates are passed by the driver in deca-kbps, following the DRM
> > convention, but exposed to userspace in kbps for clarity.
> >=20
> > Two additional helpers are provided to update and reset those properties
> > at runtime:
> >   - drm_connector_dp_set_link_train_properties()
> >   - drm_connector_dp_reset_link_train_properties()
> >=20

...

> > +/**
> > + * struct drm_connector_dp_link_train - DRM DisplayPort link training
> > + * information report
> > + */
> > +struct drm_connector_dp_link_train { =20
>=20
> THese define the current DP state. As such, they definitely make sense
> to be a part of the drm_connector.
> > +	/**
> > +	 * @nlanes: The number of lanes used
> > +	 */
> > +	u8 nlanes;
> > +
> > +	/**
> > +	 * @rates: Link rate value selected in deca-kbps
> > +	 */
> > +	u32 rate;
> > +
> > +	/**
> > +	 * @dsc: Display Stream Compression enabled
> > +	 */
> > +	bool dsc_en;
> > +
> > +	/**
> > +	 * @v_swings: Array listing the bitmask voltage swing level per
> > lanes
> > +	 */
> > +	u8 v_swing[4];
> > +
> > +	/**
> > +	 * @pre_emph: Array listing the bitmask pre-emphasis level per
> > lanes
> > +	 */
> > +	u8 pre_emph[4]; =20
>=20
> Please consider following struct phy_configure_opts_dp (or using it as
> is). Overall, please refer the talk and (more important) the lightning
> resumee at this XDC. I have some bits and pieces ready in spite of that
> proposal, but I didn't have time to finish it.

I didn't know this phy_configure_opts_dp struct. This indeed could make sen=
se
to reuse and modify that structure for our needs.

About your XDC talk. What were the developments you were talking about? Cou=
ld I
have a look at them?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

