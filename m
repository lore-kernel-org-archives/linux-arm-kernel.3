Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FC2D19517
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 20:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W/s9B8G5AAVa1Ka8hwUbZ0G6I72DbzHIqE5HpGQCPNk=; b=FUFlkcjIuiG8rQ/XAVX8KZZuZ5
	VZ52KUN1yDagBZEiC9iRz0MZpTwmWlBoqvRXHgnz0EfukwFCFF+1RqJzZfpfCIQMztGWDWo1wrVBN
	GnZnmqO6I6B5H3zb0ioCfN1xJf8vczAi4gBPjM2I8LLYKqAxaUH0+0MxEXRLbyQl2aqftmNN7k2EY
	2RlnKQZ5E48w6v5QitJ57htpK+f8PDBHHI9+UXwNNCa77O29tMZYKHl/FuKmABL3P1wqyTjUXzfh3
	71sWVFMCflKCoSctaXs+xVkbUEWywly3pvh9DMYnMf4lB2tnT52nWtdFqUPe1o6X6Jspq9k7sXPq7
	Lf9Jqspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSlQ-0000000DAcq-2SuA;
	Mon, 26 Jan 2026 20:00:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSlP-0000000DAcK-34Vp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 20:00:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 35B8260145;
	Mon, 26 Jan 2026 20:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489E6C116C6;
	Mon, 26 Jan 2026 20:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769457640;
	bh=W/s9B8G5AAVa1Ka8hwUbZ0G6I72DbzHIqE5HpGQCPNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vQpeICeyJSjkOhlUCdhsHfBjOVMQbxJZt5iv694GjcLRSgCdNa70WSlPLusbcNSIG
	 cf7KBZEUGxL7QkUkQmqPRUFfGjPUxIu2D2ugRxPTcbsnbB9AN3a7LhW/vJL0M0n2Ki
	 L5w0znY9rQ5iBzW9JnwxwmEynbt7Hl8LnZ2YNbpywE7BVbGpt1Or/HrmpshUPduDm6
	 OKoBYCLyyvrtN0n25eTeS+/3E84PyvcO1me1ZMeo99FNFowVq2CWwoGlKmj/VEVwYm
	 gno+nZ5oYW8my4Lrun/5mweiK8UP4tn92qiPzifhiby96RbUkuic0livRkinilnaxf
	 DKj7WQMGi/IBQ==
Date: Mon, 26 Jan 2026 20:00:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: net: nxp,s32-dwmac: Declare
 per-queue interrupts
Message-ID: <20260126-blinker-secluding-a745f60caccb@spud>
References: <20260123-dwmac_multi_irq-v3-0-cc53f2be8961@oss.nxp.com>
 <20260123-dwmac_multi_irq-v3-2-cc53f2be8961@oss.nxp.com>
 <20260123-dinner-aloft-e57deb6c546a@spud>
 <aXdiNb92B4HH+ZFt@lsv051416.swis.nl-cdc01.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yK1i+yQq5ZBwutQC"
Content-Disposition: inline
In-Reply-To: <aXdiNb92B4HH+ZFt@lsv051416.swis.nl-cdc01.nxp.com>
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


--yK1i+yQq5ZBwutQC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 26, 2026 at 01:46:45PM +0100, Jan Petrous wrote:
> On Fri, Jan 23, 2026 at 05:13:03PM +0000, Conor Dooley wrote:
> > On Fri, Jan 23, 2026 at 11:09:55AM +0100, Jan Petrous via B4 Relay wrot=
e:
> > > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > >=20
> > > The DWMAC IP on NXP S32G/R SoCs has connected queue-based IRQ lines,
> > > set them to allow using Multi-IRQ mode when supported.
> >=20
> > The binding only supports s32{g,r} devices, why is the existing minimum
> > retained? What devices are going to not have all 11 interrupts
> > connected?
> >=20
>=20
> The original idea was to support backward compatibility, as older DTs
> didn't contain queue-based interrupt lines described.
>=20
> But now, when you asked, I started to think it is not needed,
> the requirement for backward compatibility is managed inside the driver
> and yaml shall describe the hardware not used configuration.

Just to be clear, cos the last portion of that "yaml shall..." isn't to
me, you mean that the driver will support 1 or 11 interrupts but you
will make the binding only allow 11? That would be fine.
Just note in the commit message that all of these devices have the 11
interrupts.

> Is it my understanding right? Should I provide v4 with minimum =3D 11?


--yK1i+yQq5ZBwutQC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXfH4QAKCRB4tDGHoIJi
0tNuAPoDxV/IAeHe/4sVvqAaVI5emQP++yc9VFODMCulOLOD3wD/ZLyJy71N+Tg4
4efjJ30p/XNWBZVQgvn0cruDyAqP1ws=
=0Jjo
-----END PGP SIGNATURE-----

--yK1i+yQq5ZBwutQC--

