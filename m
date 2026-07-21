Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E16EC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sTNN4IGdOQ68gC5tpdHk74zRPT4mRFKQU/Wm1xpDawo=; b=XIXvamVghpvaEdxxJQ9IiVpvzn
	J1bWUCqaJ/PZZeizmzTeVcl/HIKg87TMrVvsj0tdi27+ZvVQSP7VBG8Pq8ultRkaMG4ayUKWtqPUA
	UGILCyimJufudc1jaPA2eX2VvqGZWzfBNM23ZKOXYwukHHGRr2COHlfJYG+emaWTOrshVBt9V0Jmn
	5GbfWl7MJSDRidaL9QuGwO8NFF0z1lVPZ5ng+sEtX4c7rlGeYsEBoFvh523w+Zas/KxLNl8b8d6A/
	Jh96ETDOD3ioZ6ix4VGXxZR2bBo+nkFUyVvIJJl3Jy6OjaukY4nyXlvJdv4ejOmJ0Bfc+ZFFpyXc9
	iF5o6FTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmA85-00000009Tev-3ZJp;
	Tue, 21 Jul 2026 13:03:25 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmA82-00000009TeD-46X7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:03:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784638882; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q2Q6wI8zeXJ35TF9skR/bYBxpy3ca3WNCREOrG5y5uRYqI8PRSlJkQvNEHspWC90YD34bO+RiqLxruAkDQq6CVlU03a+y/EJRSAIidPA1AhXZQ5QAcvzcfRVro6lUVfzwZtlMoR3vpBu8PmVJbv+JdpLs3H3IDDwjae/ELIrj2w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784638882; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sTNN4IGdOQ68gC5tpdHk74zRPT4mRFKQU/Wm1xpDawo=; 
	b=FGQ5B5CvKZWBql1TH+tmhw+SrrsuvQgXEA4SnKB3Wn3ELfhmzblqWL0bLaKkzaKGxXamKsGYWk/jJfD3vOpjG6lm9sI6hWaCplC0XYiSzCG3zURgFZQXdZAEqgikCxKHL2u7VWgpp28/FPTWGl3ZkPyZM+dJbZ6S0kxdupwfJA8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784638882;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=sTNN4IGdOQ68gC5tpdHk74zRPT4mRFKQU/Wm1xpDawo=;
	b=V1Vy2cJBorAveA+KbwDdYluQfzKPHQ+2DyhYHZJ5AllF7x2uft0/P8taOwUU94/Y
	0d9wpc4fljE9OXPDwjXkQ/tPw2UWguRy+Z2OuSfWkozaFSWhMrhyBvEbd3qkLD+FhA5
	r0dQ2FbtWt2mWJpDreMmb/HZvrBiJ4AGtIHKvMVM=
Received: by mx.zohomail.com with SMTPS id 1784638880697663.0291535390921;
	Tue, 21 Jul 2026 06:01:20 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 2/5] drm/scdc-helper: Add scdc_status debugfs entry
Date: Tue, 21 Jul 2026 15:01:12 +0200
Message-ID: <Ds65RxhYQNiDhRyjzYaHhw@collabora.com>
In-Reply-To: <20260721-angelic-gay-caiman-26f7ab@houat>
References: <20260721-scdc-link-health-v7-0-92df1b6ad5fc@collabora.com>
 <20260721-scdc-link-health-v7-2-92df1b6ad5fc@collabora.com>
 <20260721-angelic-gay-caiman-26f7ab@houat>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_060323_078317_63FDF2BA 
X-CRM114-Status: GOOD (  22.87  )
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

On Tuesday, 21 July 2026 14:41:42 Central European Summer Time Maxime Ripard wrote:
> On Tue, Jul 21, 2026 at 10:58:58AM +0200, Nicolas Frattaroli wrote:
> > SCDC provides status information on the current display link. At the
> > very least, it may be useful to expose this info through debugfs.
> >
> > Add a debugfs entry for it under the connector, which displays a few
> > more details parsed out of the SCDC registers. A new
> > drm_scdc_debugfs_init function can be called by the connector
> > implementation to initialise the debugfs file.
> >
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >  drivers/gpu/drm/display/drm_scdc_helper.c | 184 ++++++++++++++++++++++++++++++
> >  include/drm/display/drm_scdc_helper.h     |  32 ++++++
> >  2 files changed, 216 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/display/drm_scdc_helper.c b/drivers/gpu/drm/display/drm_scdc_helper.c
> > +/**
> > + * drm_scdc_debugfs_init - Initialize scdc files in connector debugfs
> > + * @connector: pointer to &struct drm_connector to operate on
> > + * @root: debugfs &struct dentry for the debugfs root of @connector
> > + *
> > + * Creates SCDC-related debugfs files for @connector. Must be called after
> > + * @root is already created.
> > + */
> > +void drm_scdc_debugfs_init(struct drm_connector *connector, struct dentry *root)
> > +{
> > +	struct scdc_debugfs_priv *priv;
> > +
> > +	if (!root || !connector)
> > +		return;
> > +
> > +	priv = drmm_kzalloc(connector->dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return;
> > +
> > +	priv->connector = connector;
> 
> You need to take a reference to the connector pointer here with
> drm_connector_get()
> 
> With this fixed,
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> 
> Maxime
> 

I think sashiko is onto something here with the memleak and the
entirety of the priv thing should go, which is fairly easy to do.
We don't reuse the state anymore anyways.

I'll then just pass the connector as the priv, which will be valid
for the lifetime of the debugfs entry. This means there's no cleanup.

Kind regards,
Nicolas Frattaroli



