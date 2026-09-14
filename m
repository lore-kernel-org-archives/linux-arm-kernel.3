Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3853C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGo0cQe5RUvA1pEqpyWe0VKk5fAHVfkva3qo0Book8c=; b=q5N0xUPGO4sBeyN6G1JFr98cYr
	nOfxOYWMDakKmLO2CQhFxl6lYFWoudKcg1gsPMk+IksnSTRaga927L1Vg2cc9ez5oLZ5SXFJ4ZJM9
	OCxIkH4kucTGlixsad/EA0gsP7oOw062ZQYslQ3ce+Xwp9AkQtMEzRnIA0F44kpiP39fPjpQas/D5
	RSmw0AVKEeDEN/eXwkvtpCJxrwuhtOAM+LUwX8y+qtcfyjeNvp8EKwpHl/yW+XKRgtChW6TnphG4N
	U+uOMMElG/iiZiM4WIBNSQWzoKjpoAp3Jx+uLi2aHTyyPDZx7J8S1WfQsXIRJSKmKEq/ee5v/5a40
	SEVYMuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66fk-00000003kPL-33T2;
	Mon, 14 Sep 2026 13:24:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66fi-00000003kP3-2fAc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:24:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D6FE0601FD;
	Mon, 14 Sep 2026 13:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 680D71F000FF;
	Mon, 14 Sep 2026 13:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789392273;
	bh=AGo0cQe5RUvA1pEqpyWe0VKk5fAHVfkva3qo0Book8c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RH29AyMADeBplUhRdzuH322YE0rBY5mwfxaEv0Ylx1nB+3oV2jCQPYturbnXStjsh
	 dc+kPfy+CxkFGZtDfAlJeCwG949WVoOKZ6S1HctP9GweSiUwTDb8gkdbZD8mtwbO5U
	 RcX6A7XTODILEC201Df9+m3klYZOoTUuG8b2eazn+kYOeqTEQ88Xv5V3qAGN1fgYwz
	 rTpQj/DaeMtWPmU//3mn1SlDXA+NP+fZJwsZhIzzGO+//Y4K3qM5UdYnCeiL3r8jv/
	 rBkGFOhWNi+vOcUpiGEmHrfFSMUXxT8UJ3Q2VLHVOiA+2DrL8NoQpikf1pPTLWMYHS
	 VDmWbki8quvsQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id C0AD01AC52F1; Mon, 14 Sep 2026 14:24:30 +0100 (BST)
Date: Mon, 14 Sep 2026 14:24:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 18/20] mfd/regulator: db8500-prcmu: Remove EPOD
 regulators
Message-ID: <aqf1jhI0UdHQYnl5@sirena.co.uk>
References: <20260914-ux500-power-domains-v7-1-v2-0-9d0c17e1f816@kernel.org>
 <20260914-ux500-power-domains-v7-1-v2-18-9d0c17e1f816@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M0B3+yp1tc+tP1Jj"
Content-Disposition: inline
In-Reply-To: <20260914-ux500-power-domains-v7-1-v2-18-9d0c17e1f816@kernel.org>
X-Cookie: My vaseline is RUNNING...
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


--M0B3+yp1tc+tP1Jj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 01:54:46PM +0200, Linus Walleij wrote:
> Remove the obsolete DB8500 PRCMU regulator drivers.
>=20
> Drop the regulator build hooks and the db8500-prcmu-regulators MFD
> cell now that EPODs are power domains.

Acked-by: Mark Brown <broonie@kernel.org>

--M0B3+yp1tc+tP1Jj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqn9Y0ACgkQJNaLcl1U
h9BdoAf/dEOtWG3iotyx06v4OT6lFrlCgXHtzOOsPxGmNV34ytKFoJrP0cOuA5q9
QwgdN+JAxDdLrMOYl3BY99HAiOC3pQYBnJhzFn03SON+5xF/NaMJxQQcs1hItfFW
QpTcJmRGscNzHghHIGD+8hFEa2wiFj4+7wpe+QfESFAbP9vun4Aw2UKMyWHaCTTp
XxKXQuj0SARuoSju/Yz7b3luP5JLWfRgaAwb5cmfs99V36iAolC18X3LdFW9Y/6G
16IArek7oOkNl0dlBBgRcO+yT809lQePpzJ+tYRTSDs4YTBvJTR+jXq/JXBo0jik
fDcwJRSoK93znfZkRuA8X2U1YRHsiA==
=uRjg
-----END PGP SIGNATURE-----

--M0B3+yp1tc+tP1Jj--

