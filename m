Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99F061125863
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 18:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASGMOVVlKPraU2epURzctOrNGTJoobbm41HEI2fCR1Q=; b=FMA4ySZ+c4m+paDnwZOR23KhaV
	CGj8WZ75D9G6WW2htxlLiDf+Nm78IYRJmGkWXtysD4HD08XEGyagZMmADVCzq3RLhVSVi4T/1vuHx
	q+twZKvo0CMudpn+x0pKiiUC0eTRkYi6Jfp0wYpNHFcbtFQH4SulgjDGB2htUC/0NrOCBRC7j1c/v
	DZFZmzZCCTZN7FfhoRkyy9crTjDdnDb9DByLyP5dSitS6J+PPfb/ng1wrdGdRpDVcDwQ2oB0NkGRa
	py/3hCaro6NB04PQdp6Yf4Ab3VQLv9T2B0zSAtvqhMYug57d6aCIj06ak+AuofPDplw/VAw/bY4NZ
	uIHd3GkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OT6-0000000CD1r-3Due;
	Wed, 11 Mar 2026 18:39:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OT5-0000000CD1Q-0sVw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 18:39:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 672FD40E20;
	Wed, 11 Mar 2026 18:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28FA8C4CEF7;
	Wed, 11 Mar 2026 18:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773254378;
	bh=ASGMOVVlKPraU2epURzctOrNGTJoobbm41HEI2fCR1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ua9W7DXTZhgcWR4Msm26H1ymyCpNtCktO4mEDuKUaRU8/TQf2VQYMBeEYjqXWMvNC
	 Y2VRQgVu5ET/dFEkhMm0K+TVe7hzaJfwms1jOXumguH0bErw80PBGWID+o07SdSL40
	 k8BAT2HFa9GSXZPtW3AskBTkTN0I4peF55s/0xpfyT8ZRfdkMxAT8+LPh3suv55/BK
	 CYn96CLuCQ7YAEhoROMK9g6MQNPH82HirWEGDtNT5zjGTM12hxh0dqjHZTiagj+R77
	 ZwzKEOPY8rEWJOMlXEpj51kWn3o08M66DKocs2Htr74hv5tNW9ZBZxniD/JbjEbT8C
	 l/g22wevnwhWA==
Date: Wed, 11 Mar 2026 18:39:30 +0000
From: Conor Dooley <conor@kernel.org>
To: jan.petrous@oss.nxp.com
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
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	rmk+kernel@armlinux.org.uk, vladimir.oltean@nxp.com,
	boon.khai.ng@altera.com
Subject: Re: [PATCH v10 4/5] dt-bindings: net: nxp,s32-dwmac: Declare
 per-queue interrupts
Message-ID: <20260311-surname-implode-7ca49ed23079@spud>
References: <20260311-dwmac_multi_irq-v10-0-7ab1669759b5@oss.nxp.com>
 <20260311-dwmac_multi_irq-v10-4-7ab1669759b5@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gzKQwFqV6iz70t2h"
Content-Disposition: inline
In-Reply-To: <20260311-dwmac_multi_irq-v10-4-7ab1669759b5@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_113939_267377_078B0E25 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
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


--gzKQwFqV6iz70t2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>


--gzKQwFqV6iz70t2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabG24gAKCRB4tDGHoIJi
0i4EAP9b10n2cCkM9UMFiKRsDjhMNgnKFLf691BlIJH3dXwU+QEAt2QDDb5EgdT5
KAbTSCGw9hwrM99VxedaO6ntRecwBA4=
=xY2z
-----END PGP SIGNATURE-----

--gzKQwFqV6iz70t2h--

