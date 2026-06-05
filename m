Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C332CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 16:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THNpxThsfSQ5q0NoFb0ByoK4k8Hy0TqI7gl/VqmkI6g=; b=LRVwrtuQMH7CdvvzUOhIl33Duk
	KM12SeDyQzH4qbE4DzZu8Iy+j/MB9iA+BAYC/jsi4GXbOhpvpxV8AEaoXWFIXjP0kji8eFBsRV9Ae
	cGBpbenODI41QplLeKzbK7jr6lePMPgv7NrXZUg9NEJGh/Z4q/UbqlBIM+3Vaq0qtbuIMavtaA5Yc
	bzYhsZGfZ6L2M/psDJ7Bpg9fXrRWrhiEb11vT0GyciFdd6PZMnzLGInJ8VAtrMm5j7S+DaSUISKbS
	zBEexx5v612Re7kK7R83ou40Ts59TdHaczCPJTK9TqUo7/OdPHf9dRHbrkjqA4qHg8EtGFrSrnZvz
	g51S5lmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVX8Z-00000000t3W-49Fd;
	Fri, 05 Jun 2026 16:11:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVX8Y-00000000t3N-3yVm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 16:11:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 60BD9601F9;
	Fri,  5 Jun 2026 16:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71201F00893;
	Fri,  5 Jun 2026 16:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780675870;
	bh=THNpxThsfSQ5q0NoFb0ByoK4k8Hy0TqI7gl/VqmkI6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iki9GiRvZWexLI/dKepIIPf42Ls5mfz3AraduxedE+IqJ5xuulE10BcoLemUhXGCU
	 KiICLIkuX8DUwZrncFVCmtJ1uVElzDsq2TfxHPAfVVqmMJhSVXxzt9mY94fnxCWnuI
	 surd4Lxkcvf5Ni+QhiPLkvsxSGv7k4tMfLwZz1n7jcZvpVul+5HusQCsyV2dW92L6d
	 12/i4OJdn2tG/Cu/LuAp5r2S5ojUW19zqpos42alGqz2J6ajTBplAEi7cNAwqxWwGW
	 shFuRAXxpKNErqqpxcqkp3JPcGoj3sTkY9ihJBaUeMV/AsWN5Qe/7jOe0jr8Hrm1UX
	 trbpDt8bANszQ==
Date: Fri, 5 Jun 2026 17:11:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans de Goede <hansg@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	=?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.ne@posteo.net>,
	Eric Biggers <ebiggers@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Luca Weiss <luca@lucaweiss.eu>,
	Sven Peter <sven@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v4 4/7] dt-bindings: input: sun4i-lradc-keys: Add
 A100/A133 compatible
Message-ID: <20260605-iciness-escapade-29764b0f52c4@spud>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <20260605070923.3045073-5-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8XOEFWoS8IYeKQQa"
Content-Disposition: inline
In-Reply-To: <20260605070923.3045073-5-alexander.sverdlin@gmail.com>
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


--8XOEFWoS8IYeKQQa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--8XOEFWoS8IYeKQQa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiL1FwAKCRB4tDGHoIJi
0hU3AP9o1TBwdrTrp0JHQJyNK1YL98B6p2dudAMEacv6gn9T0QD/cWA+agbYLfpd
2TK5za4mqwGmQMDd4iURSwLJrzwNEAg=
=m51E
-----END PGP SIGNATURE-----

--8XOEFWoS8IYeKQQa--

