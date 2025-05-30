Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92D1C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 15:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIG3Sui9OiCFTTQa85qTNyKEQhSn2TC454W39iD5xaY=; b=bhPdxOOmRQCuFWewY2K6/W76ZF
	vDgvwHX3DEEeKk65h3qae9+nzc2w0SrsXFE56RyjREleITIY6AFbGjVhdh1S5dYzMPXlXvN+7WJ5V
	uAeANhg189wYq8I7vzY1+Qcq586Dan4hXXve4LqFOAOnT78TkffowhTVFfUxjwl4HTxL+esQmGWh/
	LYqoUl/XqyWGp96nGEYaceH7SyUc7uHHZebuEIrONlPiB7er/+bFwpTkQudt0bcc/9r8Ve9KozzKS
	MXOzspSAxiKqX3oGc5M+gLJwYXqVagQ69aj7Ho/XL9OSNYOwyxpcHbqZMhkoSokkj95r7dapR4h7T
	hufRuPMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL1ga-000000010rj-0KMf;
	Fri, 30 May 2025 15:30:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL1bO-000000010OU-0zEY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 15:24:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AAFE6115E;
	Fri, 30 May 2025 15:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A933C4CEE9;
	Fri, 30 May 2025 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748618697;
	bh=xIG3Sui9OiCFTTQa85qTNyKEQhSn2TC454W39iD5xaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lx1wEBIOAO63u8ZhQUuPgC/vyo7g9uGJ185gwTnofX4yt8gS1kQ0dD2Hs55EVw6Js
	 6rMXqUT7xEXk32NpYu9bDFTOztCkfkq95GNiFvfPE3XL0eI8ZoMebv3T/vQZ1wlxcA
	 M9xoeOVk/a4fvAtUyPtfCx/XGclH6hNLTDQteCaMEWjSL78OhFUUNE4DZzqBGpCtwu
	 wvOP/opjCXJ9otQwldSPYgrlgnpnVPYLHagBjqkF7/FX2gSA2PaX+2coNEHIocN+5t
	 xUhqjinEP68tg6DqstERqqk5Q0DqgPpd0sQjATvv4W2vEQsY/QyGwzEWChc79yWWvf
	 rfG7gBj60pqlg==
Date: Fri, 30 May 2025 16:24:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
	"open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM" <dmaengine@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: dma: fsl-mxs-dma: allow interrupt-names
 for fsl,imx23-dma-apbx
Message-ID: <20250530-those-frequency-f8106275769f@spud>
References: <20250523213252.582366-1-Frank.Li@nxp.com>
 <20250526-plural-nifty-b43938d9f180@spud>
 <aDcw0sgN1ZX0kCCZ@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Aj1tJsIztP5dXenP"
Content-Disposition: inline
In-Reply-To: <aDcw0sgN1ZX0kCCZ@lizhi-Precision-Tower-5810>
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


--Aj1tJsIztP5dXenP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:50:42AM -0400, Frank Li wrote:
> On Mon, May 26, 2025 at 04:28:07PM +0100, Conor Dooley wrote:
> > On Fri, May 23, 2025 at 05:32:52PM -0400, Frank Li wrote:
> > > Allow interrupt-names for fsl,imx23-dma-apbx and keep the same restri=
ction
> > > for others.
> >
> > The content of the patch seems okay, but why are you doing this? What is
> > the value on this particular platform but not the others?
>=20
> Actually it is not used in dma driver, i.MX23 is quite old chips (over 10=
year).

If they provide no value, why not just delete them?

> Just to match existed dts to reduce warnings.

You should mention this in your commit message.

--Aj1tJsIztP5dXenP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDnNwwAKCRB4tDGHoIJi
0plVAP9xUhFgW9G3H70h10nX3DElaVl3XrEFf30bWGpPQbwUvQEAyjrFGC6Voo7o
aa/qdRMjImiKKvS4eMDSOBxpXBeWAA8=
=RMOT
-----END PGP SIGNATURE-----

--Aj1tJsIztP5dXenP--

