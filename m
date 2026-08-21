Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87B7C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaEo/Q8DPjC2aRIBe2o2/H6K72zUa3Cj/+YcwwZbnbs=; b=uPuR7+zUoofPpw+S+XdHBGUeTv
	LI2M5SHwmdghan308EexHTssrT5PgTQylb4ykCE62YMjOr0W+leea/pnp1Pe9MeJi9doO6EeEBPtb
	BjhTTX1SWe9h43nek/5elxrUP57eZW7FZ4219icbEzLetCpfoU8hjRSzcaxpAQ/eAXoocfJGbjoZJ
	/22Bg8+695xA3TM10Iz0vouUxL/vtgcXlFsaX3ABZYLnOr14WD7RDvzdXKjHv0mEaA4Ge4I5F8Vcw
	KIAQHMx/z2uEhLE6JX8svhuQAcSpFU/nyHPSJsx3fA0vYxDimW/IpegicBLHVZPH3g45/1KEhibrN
	RfCCTpjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSUd-0000000Dr6J-2dl5;
	Fri, 21 Aug 2026 16:53:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSUc-0000000Dr6A-1MCw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:53:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AFDAD43B41;
	Fri, 21 Aug 2026 16:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2760A1F00A3A;
	Fri, 21 Aug 2026 16:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787331201;
	bh=XaEo/Q8DPjC2aRIBe2o2/H6K72zUa3Cj/+YcwwZbnbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IiLg7fYD2mLzDGhg1ZIVX5mtxwWk9W9LY1e43z+2XG/JU8ynt+bY8ByiZ85e71j6p
	 ELSVKC4xQPmFfV9ivnzhZhq/vGS8Cea6dJ/8k3RVvWLW0DeP0eCt0PEuve1wgNUGsW
	 0+LAFoRuFOJisvFU9UMmA1m1t3pmDI1RDZXv4zlqBCH2QerdVPachu1puaAh34sV+t
	 CUtso9d0ojl86wVFIao808FfLRWhdzEB97NQtYyxUW3Jc6cSjsfeRi6r8OQ+vnBi+l
	 DMBFLl4Bo8qO0pDxaa1WL/uQ9T7uXvnpK0cpNEiXS0LXjdYV0WUM84ldDsuqAEg7gG
	 Mt6fp70/46VOg==
Date: Fri, 21 Aug 2026 17:53:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7
 boards
Message-ID: <20260821-map-zombie-8253e7519ad9@spud>
References: <cover.1787314780.git.stefano.r@variscite.com>
 <2e7d5abd893afb7f5362a5b3b8ee83730546674f.1787314780.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yDB3euLzDHcfq/YN"
Content-Disposition: inline
In-Reply-To: <2e7d5abd893afb7f5362a5b3b8ee83730546674f.1787314780.git.stefano.r@variscite.com>
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

--yDB3euLzDHcfq/YN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--yDB3euLzDHcfq/YN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaoiCewAKCRB4tDGHoIJi
0jGqAQDjp9T4So4L2JtvC9C4rr4NY7BPcQ03c5SD9yuip+zf9gD/WxGCtpoJX6jJ
voEyZu9VSz/C+ghr3z9s6Uuh3BBIGAc=
=7LRq
-----END PGP SIGNATURE-----

--yDB3euLzDHcfq/YN--

