Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADD1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 15:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v94MezOQhRnuevnsFvJKjsqRZa1z/RtCibUzJ1SotTE=; b=L6+eiSJPZS736iasW6p29DPjJl
	P+IqL8fNkGS9tnbTfKEBqN0kt0xnMbFmfnVke4QL1aBI21GYPDUnwx43rwFa89VVsD4bQawTUMN64
	G+a9EjPzQ6YTcytbBvrl5jNO3C6cTOOqlE/DS2NKz+sD3kcdcIYASH987xsJGblu4FyPZCJDCHPlP
	uhf25Rl2ITtJ6tmNiB3jDIlsR5Ba4qNe02dIqp4dM07q6AH9pMkhZSSEYpyXDyjpyWMCStB0bOmVM
	gUqZgQeTf0WSF0oNMBHr4szjFZ3JhNjjV0w0Am8H5pZDly5wbVWf2tgmiEHmhN6t9b0NoMiLHlmVk
	5Qg+eXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa4f-0000000Emnt-41Gk;
	Fri, 07 Mar 2025 15:57:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqa2o-0000000EmMy-1J04
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 15:55:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A1BB7A458B4;
	Fri,  7 Mar 2025 15:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E4DC4CED1;
	Fri,  7 Mar 2025 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741362924;
	bh=v94MezOQhRnuevnsFvJKjsqRZa1z/RtCibUzJ1SotTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/61PfAQ93ufWXMcgKxUgEGqdTNAQgNeJVu9LQxevXTkAsvJquDlOqUdRugmO2pcp
	 NgoSnCjgIcpQGSAQhaWvYFvO7RwRQ/jABlLo/O92DQsbaa2l8x+GOn9GEYfh+d0IDu
	 fuXXlce4ph5eX0jt49En2jbp0IcQkolnt3TXjJOhhm1DFLD5mFEJaTmDY6IVOUzKeX
	 7VgXYpHCGDnNm7ZEweqZlSVEGdVqqR1oFUtQ9QGD3u4iLYNIUW2ieZl6pIJfIW6g11
	 fhEIjOSkDa+emHYGZn0tL3C50jrHYcKCEt8KZ3QE3hQMXRNepGlFJDPGSrlxdd3svq
	 Qq4gt8k8hdWeQ==
Date: Fri, 7 Mar 2025 15:55:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx7ulp-wdt: Add
 i.MX94 support
Message-ID: <20250307-violator-marmalade-87886dc56c83@spud>
References: <20250307154424.2613795-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JWIgyfPzyRrzUsA9"
Content-Disposition: inline
In-Reply-To: <20250307154424.2613795-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_075526_435702_A9C712C7 
X-CRM114-Status: UNSURE (   9.37  )
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


--JWIgyfPzyRrzUsA9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2025 at 10:44:24AM -0500, Frank Li wrote:
> Add compatible string "fsl,imx94-wdt" for the i.MX94 chip, which is
> backward compatible with i.MX93. Set it to fall back to "fsl,imx93-wdt".
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--JWIgyfPzyRrzUsA9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sW5wAKCRB4tDGHoIJi
0q3eAQD4aBNrwfVgzEHcIRDVmVUsrx3rUlqj7jGYo1JtyG2m0wEApKIwEgi9CVW1
m6ZG/qm0OpmWLiDOQ50X8qGLV8M3pwg=
=WgEH
-----END PGP SIGNATURE-----

--JWIgyfPzyRrzUsA9--

