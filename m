Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96F1CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9bY8LkLWVpeRTueT+AQrRldMPFWGbnXdHepPnAE6bg=; b=wYdIwOjKug/irbZmj7sP0Ob9j/
	lnU0GsU9QzeUT6Sn6lwKwnfe5oMq579nU86hDIJp+7ekhn+MY4QUw5BdKd9wUyjR7ewuryi2tY6YL
	qrZ7YmnTBd8oLLeFwAF2FPhUFdTAn5zna30ag/zUNIK9Hj7h0l7zQFomC7bi9ouSf20Z3hPO94IAT
	AbJ3SeSWFuNfmcgPVzruM/ABuKcPimMuH9wTjddj3LraJvJH0ijSlhUq91sVMZHnFjFzJsgvsHrs9
	Y/WM7cVeULyinSY6kZE1iBX9luFlbU9idxRTQqy4oF4b/LGcwOWEScgls+salogCgKmF6owBwB9DX
	gJ3YeSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxk9-0000000EFNx-2Tw8;
	Wed, 17 Sep 2025 19:23:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyxk8-0000000EFNO-309u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:23:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CF476023C;
	Wed, 17 Sep 2025 19:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD10C4CEE7;
	Wed, 17 Sep 2025 19:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758136983;
	bh=B9bY8LkLWVpeRTueT+AQrRldMPFWGbnXdHepPnAE6bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfesLqj88ovMJM1rM6zwayKbjkXOqiv/dyQ4YMIE+lwgfVizxq4oEVYmz7vP2ZUBV
	 9bSnZF4yq7EluFAqnPRO7qiZZWaP3ucsKI4lnytjq5U5X9+z+RUaHG4C+IlF14smgl
	 yCXkBdYlWULwu2EM0gd5vLWE0TPlOiLqHlpFC+601dBKvq72e7IAVc3tkGVWH5N0BM
	 FkIAAkzfhrU0hGOWfzJt8tlgstGzkGdwA2TXqOBGfGSZCAS6uLLRHfIOdfKBxNKnkj
	 5RzkA0o1SBvf5lUcxrB0wHz1NfdWrVM9yzQf0Iqft3M3QzyY4iWVYJFe/6E5oYCNfA
	 Domg3ov07gi8A==
Date: Wed, 17 Sep 2025 20:22:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v6 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20250917-splendor-marxism-5b42f0cc670f@spud>
References: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
 <20250917-csi2_imx8ulp-v6-1-23a355982eff@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3gOtejRn2XFUqrqT"
Content-Disposition: inline
In-Reply-To: <20250917-csi2_imx8ulp-v6-1-23a355982eff@nxp.com>
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


--3gOtejRn2XFUqrqT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3gOtejRn2XFUqrqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsKkQAKCRB4tDGHoIJi
0vIXAP4qdNUMoU6s3FuP9N4PxLJBIPEjbbVI6iWrhBQus6CD4gEAmj5DYjCBn7Dy
M4eTOl2YLYgtqjEPWGGm9HGE2xFHLAQ=
=xNYR
-----END PGP SIGNATURE-----

--3gOtejRn2XFUqrqT--

