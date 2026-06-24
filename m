Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED74ECDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqATsS2ELDdnfG87dMlA/GHZ4RbhA3e2nMZFlLYGk+w=; b=EFIJ85rAlb2jYFCZTWDgwr6Pjs
	Rn90E4W1+FZqVtCJrXq4Foaud4ixQcpBrdlujKkyTer/6bgRid7LWZB5UnIx+cp102xOHE74/R5Md
	+HKFkKkL6lR+KAxCHkAsy2QxOByfjm5ER2RS5q7JVpToUAgV1fzPI5zvMM5ZhzAIsEYorHTRXeQMj
	kUJYsEkAs1YHLgZkbKB6vVhhmj4EFepRtuZXYKUhdeGLplywcwD3gTAcDkwko05VFINmEqytsTpTy
	U1pmSbhHd7rHQO68Uo42lIeYHWIAjzMSr66FYu92pQoeGHo4Am7kxpSuQYnvpYuIns/EokJwF6LkB
	97QnJXoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM57-00000007hlK-0T2Q;
	Wed, 24 Jun 2026 11:47:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcM55-00000007hlE-47ms
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 11:47:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 94D0660018;
	Wed, 24 Jun 2026 11:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF9371F000E9;
	Wed, 24 Jun 2026 11:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782301666;
	bh=AqATsS2ELDdnfG87dMlA/GHZ4RbhA3e2nMZFlLYGk+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nljSdIkCWaSStImfXfSOcCHVKNsqYveA3x4bG5pws4tF5oNAT86QL1YamoSh1CcON
	 sooy3DMbTHrh9h0TxjI/HYapp6BIXWy7kX4F7Pm4M7ioTsVr7UyEn3bT879Gt8sN55
	 7aOBo8lAas1uTLOpxENNDkd49QsYFC9/0F9cMCY7d8pLX+SsuKzNJrKw3Ll/aYU+ja
	 /sK7WFurMCmvC81JstdmKMrBwwuO8J2IfIL7J8R9rNQAfuifsm9qqk619Jpydt4Hh9
	 fGJcp4AlxityncBK7thkmQHJxK2BU1Y54EKhPdRFQwP32qwFBWxQqc8S0/tx5faWcZ
	 9qA0/s8LHLzyQ==
Date: Wed, 24 Jun 2026 13:47:43 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/37] drm/display: bridge-connector: use a
 drm_bridge_connector internally, not a drm_connector
Message-ID: <20260624-chicken-of-infinite-enthusiasm-8b0e3f@houat>
References: <20260519-drm-bridge-hotplug-v1-0-45e2bdb3dfb4@bootlin.com>
 <20260519-drm-bridge-hotplug-v1-6-45e2bdb3dfb4@bootlin.com>
 <20260608-little-lyrebird-of-competition-c25f7d@houat>
 <DJ736L2DR8H8.35296DRNZ1OW@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nzzwqigi3og2q45b"
Content-Disposition: inline
In-Reply-To: <DJ736L2DR8H8.35296DRNZ1OW@bootlin.com>
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


--nzzwqigi3og2q45b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/37] drm/display: bridge-connector: use a
 drm_bridge_connector internally, not a drm_connector
MIME-Version: 1.0

On Fri, Jun 12, 2026 at 02:57:39PM +0200, Luca Ceresoli wrote:
> On Mon Jun 8, 2026 at 1:41 PM CEST, Maxime Ripard wrote:
> > On Tue, May 19, 2026 at 12:37:23PM +0200, Luca Ceresoli wrote:
> >> Currently drm_bridge_connector_init() always returns the added connect=
or or
> >> errors out. When adding bridge hotplug the bridge-connector can be
> >> successfully initialized without creating a connector, which can be ad=
ded
> >> later when the pipeline will be complete.
> >>
> >> For this the internal function drm_bridge_connector_add_connector() mu=
st be
> >> able to return a valid drm_bridge_connector even without any drm_conne=
ctor.
> >>
> >> In preparation to support bridge hotplug, change its return value to b=
e the
> >> same drm_bridge_connector pointer it gets as input, or a PTR_ERR.
> >>
> >> No functional changes, just changing an internal API.
> >>
> >> Note the return value could now become an int (0 or negative error) be=
cause
> >> returning the same value received as input does not carry any added
> >> value. However this would be change a lot of lines, so leave such chan=
ge as
> >> a future cleanup.
> >
> > You just created that function and changed "a lot of lines" already, so
> > I'm not sure that argument holds.
>=20
> Do you refer to the previous patch?
>=20
> My comment is more about the following patches. It means I separated
> changes moving code to a subfunction from changes to the the return value
> in separate patches, so that each patch is trivial to review for
> correctness.
>=20
> Makes sense?

What confused me is that I took it as "I'm not going to do that work
(yet?)". If you do it later on, I'd drop the "future cleanup" part, or
rephrase it.

Maxime

--nzzwqigi3og2q45b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCajvD3wAKCRAnX84Zoj2+
dvK7AYDVndEeUjfOdtyDo2JmEMo70BhgM2gg/nLlcNmSNiXs/ZF4vaMZKxKbTdP0
ITjmkMsBf3L6kJhrRHn9KfvKW9qJEcqFpDhk9KBsLGWHn+YQhSzpjHt5sEmz0n7g
4bVgFtOWSA==
=PBGO
-----END PGP SIGNATURE-----

--nzzwqigi3og2q45b--

