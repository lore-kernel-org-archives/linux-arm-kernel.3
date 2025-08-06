Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61181C87FD3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 17:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMbJSOemwxtkr6y2/CO582iIjzf2dNw1IlAGK1bGO7o=; b=rLRbIsb1F5InnGEsMxF9dYTQXH
	SRQC6dmT9FnuHGhGKeNQc4SQAMAibdn8BZfQNM7UWCn+04og/E2FgRJeSwDwLI8+ND7NRHbAL61br
	4meRSgQYXQlTbIeAygoIy70g7m3AvO5QZtZTDIDyfVEMJmwK1McoxzaZjuqI//FRYvnHujL1iruDn
	ntMjs+ic87AHlDmd6lxm/oxK5AbJk39h5kcf8I1J0cd+7DG544akaFtA1AT/5Hs7YQ9Iq14nVi/G5
	6g/20VJ6zDvosgaCnfXVGar8odZ9xEIa5tw1i05rNMyBtIyeZNnK5CZmk2Kt5nIKxnTHPQHA8MDS3
	GRCSgcaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uji0L-0000000FwOv-10lA;
	Wed, 06 Aug 2025 17:32:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhsX-0000000Fv27-2yzL
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Aug 2025 17:24:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bMbJSOemwxtkr6y2/CO582iIjzf2dNw1IlAGK1bGO7o=; b=pTA9JppJ+B7MB16W352UOMqzCo
	qAtXqdsY97iLgR36tYpT7nZw82qt4kR9TNCpFIQPHd9l+K2uaudLmaEHPKLGA7m/wTv+9S3DE/W+w
	dxZQdDAw4fmmi/Mfoked7DNW5es2sNN+qMKL6xNP9BqX3UDnqk76dfEgQ3QNuuHD4vbNqmhrvAxSp
	y6ChwG4aYn/iGvr9tMvp1bBkGY80fBxf4OlAotFmoUQjYxKVB5tvbmSf7811k9fhGrBmAG7gri9SL
	/0xDH/HY4PW5DcW5o3i/GoyMutJrRxCI7RNOAgOx2Q131hbVJ9rTrQaxu8jjQICnhieZyOEyuqOU7
	myFJPI3Q==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhsU-0000000EL8r-2EK5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 17:24:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CF9B43B96;
	Wed,  6 Aug 2025 17:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7784C4CEE7;
	Wed,  6 Aug 2025 17:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754501075;
	bh=bMbJSOemwxtkr6y2/CO582iIjzf2dNw1IlAGK1bGO7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t96kj3itk5/ZNAbM2Gkcrz5K4qoyc644wK1X0JDg1uvVF6gcsjKkK5ocAD8ZCLEY/
	 TsgFXcafXcSxGf40jc5k/YHVE9vVlqX3wtP705KPZ/7UqN7k5Ow/DcM4yHz99QB6dz
	 m1x9AslZ2A1L8CoOpbuHQS/4hN/Gg/fo1hkfRnEfK5/qb0iDAv67SuxCyG7YYVzEie
	 NsFVSoKvy29JjWj09z9l+J+iZ7ANvqlEVkq384pFVF60JA2UaPilweG9At88zkXuFd
	 9E6xrVoo8CjBYejxBtoeW59TV0XtaixVlvZIOcYvZWaHwtgTiNZDSHWQp9lPvVvF9T
	 Ue4gELT7HwyMQ==
Date: Wed, 6 Aug 2025 18:24:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: Spell out acronym
Message-ID: <20250806-recovery-avalanche-044917fa089b@spud>
References: <20250806-aem-dt-bind-v1-1-d14676dfb027@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NZIun3GEgTZluO8+"
Content-Disposition: inline
In-Reply-To: <20250806-aem-dt-bind-v1-1-d14676dfb027@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_182438_875247_82FDBE6B 
X-CRM114-Status: GOOD (  12.34  )
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


--NZIun3GEgTZluO8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2025 at 01:03:08AM +0200, Linus Walleij wrote:
> When I authored these bindings I had no idea what "AEM" stood
> for. Now I know: it means "Architecture Envelope Model".
> Detail this in the bindings.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Maybe this can be applied directly to the bindings tree, I don't
> changed this document much.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NZIun3GEgTZluO8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaJOPzwAKCRB4tDGHoIJi
0g9UAQDfZ2iyhOL4ZhB3bKj8b8pe7bO/XjQPGukWjDkNpmkslwD/Q3LhXJYLt5NF
B3srvt4Bnc49A9tPsCeibN5yDPnFJQg=
=P4OV
-----END PGP SIGNATURE-----

--NZIun3GEgTZluO8+--

