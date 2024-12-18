Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D94E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6u2L19JS6pbTNNuvH1fm6hioIhl6wEIC6EicTPp610=; b=dIfUY5zR4BxUaZRQNDx06DV3/y
	wEYJmaPCAj29q9Y5AqBRjeUC5TNp1sNKUDUM/9KzrO81NxNaW7TAJlowBBm0EaX65yEmQESuudRBB
	hNkrrVctSpvz15QDk6wbWVzOoUiK6ngP5eCfY9ksOF6YDzZJ8Q9eaFrc2P3KFKUosEKMmLxgS1glX
	N/nmYU7LeRk2UKgMRlVxy8q+Inox8UiAbqr211hCAlJ6RIOOvlVXdhP1KSUStwU6dxc09U5r7vEwJ
	N93j5p3q4wGoxT2vfXyku3ccTrUhIulBoDuoNXevfJJTokutIsImYyFyTbN7kBLuJ+CYxS310o1kQ
	kgqzqG2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNykb-0000000HQyU-0DKe;
	Wed, 18 Dec 2024 18:26:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyjU-0000000HQq1-3tRt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:25:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 598665C5EB3;
	Wed, 18 Dec 2024 18:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626BCC4CECD;
	Wed, 18 Dec 2024 18:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734546316;
	bh=D6u2L19JS6pbTNNuvH1fm6hioIhl6wEIC6EicTPp610=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RIIiVOrJhpS4mof2OVCscKCGFjYkMtydgnNgGl+n07x+zrtd45qEeG3yepUU3d+00
	 JioGl9EWw9Wd8DM5GwWKl0UTaDCVEQ3Fg5oLaY5trT3zIAG43bzPzLBriiLG0epXw1
	 os5hshz4vbltC3BAn4TObhZViNPU9KcGhGd7PVtN53Y0F0aQVJESZyTn4tBTicUXqo
	 cMlViXOom2Tik2+JLWGzIzQEaajTOjKG+zTn99zt3/wXU+LqBdkx/oftVaKb0Lun6M
	 vrcwBsQPjYpsF/7dQk/hF8B+gGiC1aFZKAidMgwORmEgkocYtVSv6FK5iu2ev2GWG1
	 MrRTg4kZIt6fw==
Date: Wed, 18 Dec 2024 18:25:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: media: clarify stm32 csi & simplify
 example
Message-ID: <20241218-yelling-palm-da676b67afb9@spud>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
 <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
 <20241217-crawfish-tiring-792c535301d0@spud>
 <Z2HpVyVEs7jn0VPd@kekkonen.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e6nk/t1HXQvWcK4R"
Content-Disposition: inline
In-Reply-To: <Z2HpVyVEs7jn0VPd@kekkonen.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102517_036048_ABAD89B9 
X-CRM114-Status: GOOD (  13.25  )
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


--e6nk/t1HXQvWcK4R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 09:12:55PM +0000, Sakari Ailus wrote:
> Hi Conor,
>=20
> On Tue, Dec 17, 2024 at 06:24:42PM +0000, Conor Dooley wrote:
> > On Tue, Dec 17, 2024 at 06:39:19PM +0100, Alain Volmat wrote:
> > > Clarify the description of the stm32 csi by mentioning CSI-2 and
> > > D-PHY.
> >=20
> > > Remove the bus-type property from the example.
> >=20
> > Why? What's there to gain from the example being (seemingly?) less
> > comprehensive?
>=20
> As the device has D-PHY, other options are excluded. I.e. that property is
> redundant for this device.

That should be mentioned in the commit message.

--e6nk/t1HXQvWcK4R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2MThwAKCRB4tDGHoIJi
0o0EAQDdidjMXnrkFQSJAvyE/XWYtA2L1k+FW4aOm16Xb96MYwD/eAxuFSIsmUDZ
+vFPpziEjTA32zkU1AjGcSfHJIsolAs=
=TaR/
-----END PGP SIGNATURE-----

--e6nk/t1HXQvWcK4R--

