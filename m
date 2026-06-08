Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D318CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iugGz6M//lGt1WaaURxU6mN8ZBLqHGwXr3QAOF+fdCw=; b=p9Jy6CXnovox5odOi8ECs8yopU
	vDTCuQha23Gkxq3bQLcuo1YZ2PLR3OrCmaec8of6GfnJkFB6Z3vp3BRYdlQ1+vqNgeDfhg49gamN5
	lk/VSTdPdNIYPz4n/2gaMSVArAjJsdjJEDy9qnNmXnqFsPlnzXRULbA6rzKNn0WQcQRaoPemhC5i+
	+dkfHOs/JgufGrRJaG0njspx5tCLKJX5TG7Z0oXJKlAZuTWrcR8bIGknDeJ2EiZSgv629y7mIixSr
	wkZ1NCLL50MLC8HKbYbULtvgu3m51RgPXtmgQK1bAgn0ySIPbcWvOSalCyO5KGk4XRck87arf3hIW
	Bp5pVshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb2X-00000003ldi-3mKG;
	Mon, 08 Jun 2026 14:33:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWb2W-00000003ldP-0Q3W;
	Mon, 08 Jun 2026 14:33:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C67E3401D4;
	Mon,  8 Jun 2026 14:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 371F31F00893;
	Mon,  8 Jun 2026 14:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929199;
	bh=iugGz6M//lGt1WaaURxU6mN8ZBLqHGwXr3QAOF+fdCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mYVBFu6e9WWA45iSVRzpYm0svnNFfwQPHSuuXORY8vfPTaR5obncugfO9ZPjUMV3X
	 ZyFGDfGY6c1/0KyL1RL4PT/VQwnPWHjDpMmYhGjfR+NC6kO1c/ZkvQl1xZeHsE6/RB
	 +g0UZn7wj9o1XfE1Y89+eFVvTCESCkovpi5z6AyKBYVsvacUpFhp8kJd3i6TotlU5E
	 HLNjChOoS5j25xG83iKaYOVMyHTofUNV1G76/icgPzQtScldgnudlyM6accRQPgY+T
	 jHTjyf1KZevN7p8sOLmeIiw7KDy2YwIcSe5X73M8r8/hfxo0QIFGDDP5IxMMzYQk7e
	 ycpGs0w66ROWQ==
Date: Mon, 8 Jun 2026 16:33:17 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Daniel Stone <daniels@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 02/22] drm/connector: Add HDMI 2.0 scrambler
 infrastructure
Message-ID: <20260608-unbiased-fine-civet-ef81ac@houat>
References: <20260520-dw-hdmi-qp-scramb-v6-0-24b74603b782@collabora.com>
 <20260520-dw-hdmi-qp-scramb-v6-2-24b74603b782@collabora.com>
 <20260521-sweet-devout-panther-44d73c@penduick>
 <bfdbf194-b400-4de3-bb68-74652dece74d@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dz5oq2q557ojbffs"
Content-Disposition: inline
In-Reply-To: <bfdbf194-b400-4de3-bb68-74652dece74d@collabora.com>
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


--dz5oq2q557ojbffs
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 02/22] drm/connector: Add HDMI 2.0 scrambler
 infrastructure
MIME-Version: 1.0

On Fri, May 22, 2026 at 01:57:16PM +0300, Cristian Ciocaltea wrote:
> Hi Maxime,
>=20
> On 5/21/26 10:52 AM, Maxime Ripard wrote:
> > Hi,
> >=20
> > Thanks for working on this!
>=20
> Thanks for your quick review! :-)
>=20
> >=20
> > On Wed, May 20, 2026 at 09:38:13PM +0300, Cristian Ciocaltea wrote:
> >> Add the connector-level infrastructure to support HDMI 2.0 scrambling:
> >>
> >> - .scrambler_src_{enable|disable}() callbacks in
> >>   drm_connector_hdmi_funcs for source-side scrambling control
> >> - A delayed work item (scdc_work) with an associated callback (scdc_cb)
> >>   for periodic monitoring of sink-side scrambling status
> >> - A scrambler_enabled flag to track whether scrambling is currently
> >>   active
> >>
> >> These are intended to be used by SCDC scrambling helpers to coordinate
> >> scrambling setup and teardown between the source driver and the DRM
> >> core.
> >>
> >> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> >> ---
> >>  drivers/gpu/drm/drm_connector.c | 14 +++++++++++
> >>  include/drm/drm_connector.h     | 52 ++++++++++++++++++++++++++++++++=
+++++++++
> >>  2 files changed, 66 insertions(+)
> >=20
> > So we would need kunit tests for this.
>=20
> Ack.
>=20
> >=20
> >> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_con=
nector.c
> >> index 3fa4d2082cd7..91e58362fbc0 100644
> >> --- a/drivers/gpu/drm/drm_connector.c
> >> +++ b/drivers/gpu/drm/drm_connector.c
> >> @@ -220,6 +220,19 @@ void drm_connector_free_work_fn(struct work_struc=
t *work)
> >>  	}
> >>  }
>=20
> [...]
>=20
> >> +	/**
> >> +	 * @scdc_work: Work item currently used to monitor sink-side scrambl=
ing
> >> +	 * status and retry setup if the sink resets it.
> >> +	 */
> >> +	struct delayed_work scdc_work;
> >> +
> >> +	/** @scdc_cb: Callback to be invoked as part of @scdc_work.
> >> +	 *
> >> +	 * Currently used to monitor sink-side scrambling status and retry
> >> +	 * setup if the sink resets it.
> >> +	 *
> >> +	 * This is assigned by the framework when making use of
> >> +	 * drm_scdc_start_scrambling() helper.
> >> +	 */
> >> +	void (*scdc_cb)(struct drm_connector *connector);
> >> +
> >=20
> > I'm really not sure what the monitor thing is about. If we have setup
> > the scrambler at enable time, and we set it again on hotplugging, why
> > would we need to monitor anything?
>=20
> This is similar to 257d36d493e9 ("drm/vc4: hdmi: Add a workqueue to set
> scrambling") in order to deal with some displays needing a retry on scram=
bling
> setup.

Ah, I see, sorry :)

It looks pretty generic though, should we have a helper for this then?

> > Also, scrambling is only relevant for HDMI 2.0. We need a way to expose
> > that somehow and make sure that HDMI 2.0 drivers actually have
> > scrambling setup.
>=20
> I assumed drivers that do not reject the HDMI 2.0 rates in their
> .tmds_char_rate_valid() are implicitly expected to support scrambling.=20
> Thinking again we could extend the framework to provide some additional c=
hecks,
> but let's discuss the topic on the SCDC patch.

HDMI 2.0 isn't just about scrambling though, YUV420 is another big
addition, and iirc you have more audio formats too.

Maxime

--dz5oq2q557ojbffs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaibSqwAKCRAnX84Zoj2+
do7YAYCfrpxaHg3m6G+IiRqezJuRRmyQNwjovYNFLjuREFLQxghM4gMvGmE7pmAW
3hOQ6BEBfRxz2jWMK3nc4dR6/Qj1A5+0DESQ0ehAECjdv51IDnfVHM3N9dMPhRvg
A81cnhvAvA==
=xhk/
-----END PGP SIGNATURE-----

--dz5oq2q557ojbffs--

