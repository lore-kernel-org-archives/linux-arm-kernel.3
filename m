Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E49CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 15:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/Wu5buoWq8ZI+3ZBm+yr8RnGsLB+4jjsmCKY+87MzU=; b=ya69MhtkRkiLVW3z3bx3Q4D51i
	VX8OrxYR7lMMphwOUy9m6Pko88UMi5MDRnAGJQfMzSjh/Wi+pa5XbenDO2v9IZmTkeKEYwzIJgrOo
	yi+tZG/EbKjihferdhgoHGep5b11t7veA+bPLQlwG0a+5qIhFF/UJsPotfuz5ojCQWo9TOoiXGYIe
	bQWE/1HrTE4mokv3RuvYYdp96GkpB9iD+PYey7WjDiJKTsX2+fyvnNthbMLRd9H/VBxYPqEAJtKfs
	gSXezRJMs3nlPa2nMfLVQrlgET/bw9iFeAvaEYzfTVtnwokAmJUGompgFY9cR4gOx/JhY2Owk9Vyh
	fJkicW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm5X-0000000GFuX-03hA;
	Tue, 28 Oct 2025 15:58:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDm5V-0000000GFu7-1q2M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 15:58:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A12461257;
	Tue, 28 Oct 2025 15:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8151C4CEE7;
	Tue, 28 Oct 2025 15:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761667100;
	bh=z/Wu5buoWq8ZI+3ZBm+yr8RnGsLB+4jjsmCKY+87MzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sV8YOsDvOHTWzPkGKDzyNmb3v/wc/w3O5dBBZVjt4goUUkI5Bjra/rz3GP92djT8d
	 hAvHn6eNWdAawDH8wzAdM1rKSZtuAYkGhBJ8FWPtoJjDCtJ6rSdzFzTSmQKhIz2krB
	 iOP2cdSCrWeFvtakPxO6OQoGq5eWl7uX70CRAdYGamWZ9frZDIj5NXCFTPEHMJuxwG
	 v0AjVzQdTgFDqkxzSvJd38uHYSAoIPjffm4pZx267ztTGzeKtig98hjxmWVpsrHJ8a
	 2gMxDqs7NBDJLYxgDNf1SbbFCYnCvPrc218J3n4vlqi9ayJwggk4Zux4g3dGdQN+1F
	 fRN1D1Ny9kBdA==
Date: Tue, 28 Oct 2025 15:58:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Carlos Song <carlos.song@nxp.com>,
	"mkl@pengutronix.de" <mkl@pengutronix.de>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PACTH v2] spi: imx: add 16/32 bits per word support for target
 mode
Message-ID: <3004d4c5-4a5a-41cc-972a-c94fe75f5c2c@sirena.org.uk>
References: <20251024113107.513604-1-carlos.song@nxp.com>
 <aPt+JJhaB9dUOwL8@lizhi-Precision-Tower-5810>
 <VI2PR04MB11147AB20690F99BB6CEE2300E8FCA@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <aP++6ghId1LvQ1NF@lizhi-Precision-Tower-5810>
 <VI2PR04MB1114746F42268876E27C1B93FE8FDA@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <aQDko60j5lB1ngCl@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xTlnFY8BrN4Nh6BU"
Content-Disposition: inline
In-Reply-To: <aQDko60j5lB1ngCl@lizhi-Precision-Tower-5810>
X-Cookie: Your canceled check is your receipt.
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


--xTlnFY8BrN4Nh6BU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 28, 2025 at 11:43:31AM -0400, Frank Li wrote:

> Does SPI require send MSB/LSB first of a CPU's word?

Default is MSB first, users can specify SPI_LSB_FIRST for LSB.

--xTlnFY8BrN4Nh6BU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkA6BUACgkQJNaLcl1U
h9A4XAf+KtYjk/onJTf0IGV/Kcfy5Lz5Oqa/OJY8feX2oxlN+v826m6UKoqYMKkw
LrGCh1LdvznChXisujQayy0NKFi6NC9lnu6MG/1D42TN5dcH+9o45zz9XPhlimdn
t7YNi8QGxqbl+LPEV57TdB4uSP5yfXgZbPnW0FzE24dsZG6swxJX91b0owFIeu4U
A3q+dqJRedUOkc2bY1ULWpUdX5tGbXM8HbNwh9nuurjkI1HfBcV4wWYX37yjYBnj
Br0UblmjM5xUl7FkTHF7mCbTP7h2N8WoOosdKODL4cba66r9iVDZXTZkZUJ5UT7P
exFxSPSoLbdL8Ny+IaolsZ0whwNsnw==
=uDAT
-----END PGP SIGNATURE-----

--xTlnFY8BrN4Nh6BU--

