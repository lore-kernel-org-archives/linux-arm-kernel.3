Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3D0C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zmq7LwoPt7MZJE/08CV/hmDhdIJv4EK5akZLX8g6Swk=; b=1vVCe0iQP50/Os0fYdXjuxM4zH
	9BkahvRrWrlmaYdz9yvZ6PHEJUIFoHOG5+R6gBc8O7D/XZyFXM085euNyI2y/KEo4GqY403aSOkZN
	lG+ZubwvMoz6hHN66Jljysx7fSvvTUHXdCi+0j5ladsh3K8g/+Y0kMK1Dww50rKzKZ6ejWQCfp994
	G7Qn346AYPqnznPN8G0aD5DL56cg1YvlsfW0qhfDoiH1FbJvIvVGlIwkti+uH1ccTMA4v0Cww7njT
	sk1bIDmV0mqK3LneSyc6dsVLX7Rq2ficqp8iHzWx67LUeCEUgmn/y1rGXU6ogwYmsg/yWk4K7GIY/
	g02xD/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnnn-0000000EEwq-1WFU;
	Thu, 12 Jun 2025 19:41:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhq7-0000000DNVx-0UFd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:19:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C15D62A06;
	Thu, 12 Jun 2025 13:19:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E44C4CEEE;
	Thu, 12 Jun 2025 13:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749734369;
	bh=Zmq7LwoPt7MZJE/08CV/hmDhdIJv4EK5akZLX8g6Swk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bofp8ZTgYCZ2pKDEwAV3kCP1qSAF8tHnj2pTmRuDfrO/7pyE48oSyygMGr9VP2UY5
	 JXdXbyGdib651JSC0XTB52jFYIm0BPEf1NnG+mbvlhIydtGImsD33guECyqhiqrH+d
	 rvM0KJLYUU4vEPDjKUmvzsyMJX/x5gAWg9PZEfS5Juf37qpMogSDxYEYVJ8je8AUdV
	 mCb/XyjcZ/d7zax6KRCaE6upz6qRGllGARlCmwDN9E+LOIDIxiZWRlRMGn8AWn3v6E
	 olQnFfGYN8bSLRJceUGIwPKgIUs1lNPpTA+IylkfFQFyBxYzBm+IRuXRiTPJ3xi4pr
	 SsGc66ndSd40A==
Date: Thu, 12 Jun 2025 14:19:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/5] arm: omap2plus_defconfig: Enable TPS65219
 regulator
Message-ID: <90c50d23-1a70-47e4-a80d-c951f7afc5df@sirena.org.uk>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-5-5278026b7498@bootlin.com>
 <1d87fa3b-c3b9-44fd-9e61-7f1ffadcfb0c@ti.com>
 <20250612081255.255be21e@akair>
 <ef6d6315-6517-4c8b-bf76-e41bb72bae8d@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GNSy8GOpRYA2RVtl"
Content-Disposition: inline
In-Reply-To: <ef6d6315-6517-4c8b-bf76-e41bb72bae8d@ti.com>
X-Cookie: Biz is better.
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


--GNSy8GOpRYA2RVtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 12, 2025 at 08:09:59AM -0500, Andrew Davis wrote:
> On 6/12/25 1:12 AM, Andreas Kemnade wrote:

> > So there need to be a bunch of patches to add the missing stuff.
> > omap2plus_defconfig is there and support for boards are added.

> Yes multi_v7 is still missing stuff for some boards we want to
> support, and we are working on adding those needed modules now.

> We won't get feature parity in multi_v7 if we keep adding new
> boards to the old omap2plus_defconfig. For this patch series
> how about we add support to both defconfigs?

Keeping the more specific defconfigs around is handy as they're much
smaller and therefore faster to build, but I do agree that the
multi_vX_defconfigs should also work.

--GNSy8GOpRYA2RVtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhK09oACgkQJNaLcl1U
h9BQ4gf+LYAiC+6SJGmRoNcTP/UfS3rf/D+1XLuJJYKWsIh7wkg6m3pLmH2zMtG9
QmBwEAumEqTdKxNiujtRn5Y4wFw3w2WA3PLQtPpr+o1qSVfxxFLxggM/BNz6uQH8
ALc56Y8Ft/mUSfEod2xzbUe31gnfGyQ3X2TrwXyEd/97Shu4T89o8nNBcZPLLZkM
ETR3Raif3ZXYRwMefhT/eDl0Qd8S95Yoyj754c9wcd4Al0KFJpKw9z4F8gkLM6jb
13GP3UQ4w5kW7Qft4OkPeV1bufB31Xo7zx6DYT9SXjfZGgyCQteRDym5y6QKgCv5
gPJl3KnWCXq/IauwmreGj56PaPQKvA==
=xL1X
-----END PGP SIGNATURE-----

--GNSy8GOpRYA2RVtl--

