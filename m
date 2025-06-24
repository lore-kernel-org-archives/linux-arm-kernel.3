Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC87C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3clt5TgJp8a/Sy433KrrPB+SDk6I4MqDsPJQ6rhnMW8=; b=ma/2TLBe5IdIK9pIjOwPXN+RNb
	0iL047fy2bkrNbHLr8twQ/CQ41Gh6Rmi3IJitnIu3l/s/DcnYanqZSi1/dVqjwerWWU92oDN85yVI
	fxSfzVIzjgoknkNIz5YAjI9tUI6Wyp+DHtmabvyT2i0vAc1aR6VMhZyyw/J96CGYSaO6GY7Fsv+CW
	Uf9aYy+f2vnIl3ob7pJT2jlI5fKZgtwdWI01Dz/xGvIqwf5zPo3F3rtl6hyCtUI7aMlp+jsKqJV1x
	ely8pebJswmCEUGT6NugWcb2vZ7xWkRKBEi/4jOJgL1STNT7X3DstMBp/+rJ1X8ntST5SYwOnY3TQ
	M5gQmRzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxqh-00000004qQr-09No;
	Tue, 24 Jun 2025 07:13:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxiU-00000004pXG-0NDg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1158661154;
	Tue, 24 Jun 2025 07:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47843C4CEE3;
	Tue, 24 Jun 2025 07:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750748712;
	bh=eukB8mJ6ncQwPDrZTpnRZ9v5SsQk3rVKzvfudt/NYmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tOZI3s2wfEv1AlWZ4E/MRDxT+dG65Q61XT9WL5mBS3jcZPqAw6VwWgyolFis4w9PD
	 odWzXectA7BGD6HDWWfd0VG6T46J26dFHuhzpUiz19Kro1c5l56Tufn2/tiNXXahfQ
	 mIb5URlRXkOWQ0DML1xRigZnxt7Dd35yKnzpQPkpZKEAwK0jb0t+qZRdQaBt6Y3Mx2
	 aI4yudkky0fXziI/Nk4FWDSKJaYjG5Cyr7b5kyTsXttoLg96GMi5sgCdbrtpzn6vaA
	 IFxws7CZ9ozvLFmEkBLkHNWx/H2ArrKKnn4FIFUwziaZIqf8F3T1VeUakXW70qVedA
	 qT7JWJc+XX5kA==
Date: Tue, 24 Jun 2025 09:05:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 2/5] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
Message-ID: <20250624-precise-loon-of-mastery-ebad24@houat>
References: <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-0-0321845fcafb@bootlin.com>
 <20250620-drm-bridge-alloc-getput-drm_bridge_chain_get_first_bridge-v8-2-0321845fcafb@bootlin.com>
 <be6a4d90-2c6e-42be-9948-df1840fd2f83@nxp.com>
 <20250623160903.01c56bfc@booty>
 <1d8908b1-b38e-4226-9433-cd9405c7ca63@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="n2sylnxjileb3gpr"
Content-Disposition: inline
In-Reply-To: <1d8908b1-b38e-4226-9433-cd9405c7ca63@nxp.com>
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


--n2sylnxjileb3gpr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 2/5] drm/bridge: get the bridge returned by
 drm_bridge_chain_get_first_bridge()
MIME-Version: 1.0

On Tue, Jun 24, 2025 at 10:44:03AM +0800, Liu Ying wrote:
> On 06/23/2025, Luca Ceresoli wrote:
> > On Mon, 23 Jun 2025 10:56:13 +0800
> > Liu Ying <victor.liu@nxp.com> wrote:
> >=20
> >> On 06/21/2025, Luca Ceresoli wrote:
> >>> drm_bridge_chain_get_first_bridge() returns a bridge pointer that the
> >>> caller could hold for a long time. Increment the refcount of the retu=
rned
> >>> bridge and document it must be put by the caller. =20
> >>
> >> To make sure the incremented refcount is decremented once this patch is
> >> applied, does it make sense to squash patch 3, 4 and 5 into this one?
> >=20
> > I see there is a trade off here between bisectability and patch
> > readability.
> >=20
> > However about bisectability the problem is limited for this series. To
> > get an actual get/put imbalance you'd have to be able to remove the
> > bridge, but removing (part of) the bridge chain is not at all supported
> > right now, and it won't be until after chapter 4 of this work (see
> > cover letter).
> >=20
> > However I realize there is an issue if:
> > * patch 2 is applied but patches 3/4/5 are not
> >   (it does not make sense to apply this series partially, but this
> >   might happen when cherry-picking?)
>=20
> Yes for cherry-picking and bisecting.
>=20
> > * an entire DRM card is removed where
> >   drm_bridge_chain_get_first_bridge() is used by some components
> >=20
> > If both happen we'd have a get without put, thus a missing free and a
> > memory leak for the container struct.
>=20
> Yes, that's a memory leak.
>=20
> > Note that, besides drm_bridge_chain_get_first_bridge() that this
> > series covers, there are various other accessors: see items 1.E.{2..8}
>=20
> IIUC, without those items addressed, the issue we have is use-after-free,
> but not the memory leak this patch introduces(without squash).

Given that this structure is going to be allocated a couple of times in
the system life at best, and that the situation prior to the work Luca
has been doing was a use-after-free, I'm not really concerned about a
transient memory leak in a situation that cannot happen.

If people want to come and backport random patches without looking at
the whole thing, that's their problem.

Maxime

--n2sylnxjileb3gpr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFpOJQAKCRAnX84Zoj2+
doGDAYDGXM7w79pHAhwD/Toi8Tf7Ko2GEnXH4ChZ9svR68EvHRbyf0xO9Ks5KkZH
Gsd79QUBfjoS0KN+H67nrkLbjDtRVTDvSyjBZI7nQQ4JPzv7bafVx4WlQaMrji2I
LY0GD5ZnCw==
=ipG2
-----END PGP SIGNATURE-----

--n2sylnxjileb3gpr--

