Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F01CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 20:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7EbwWPtFVUiR5ohjPExsa3zm6rrMiaNEomibrJvyck=; b=nFMzd3oJxvUTbAOu33FnruJFE/
	0U7wvwi1DoQgI2/hgoeBUjUovw5gFhywASa9beH+cW05/gp7B6z15mFNcWvdHbDGFl77a762SPLOW
	eDyd6Qm+ZENFkPCfP6rh+FjdZ7kA+LtAgb7d9gaRouvAk5eu9ZOZp276OHMnlfqZLRjyv8UxXcQPw
	d3NmUb0c5739Xda7KA/IYpoZkR9a3od8QqglO21klKwJ1zkrnxtZb1LbdZSiefj/KmmsJFjXa9LuP
	QCAiLMa/W0y9nvjyi3/P/L8Oi+SM/RrRMVu/XU9PXYKDnKPJ1Jq2bxXPCUtjhuMf1t6MZdmi0qtiJ
	cYQfjENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyz3z-0000000Efte-2igT;
	Wed, 17 Sep 2025 20:47:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyz3y-0000000Efsb-1nRb;
	Wed, 17 Sep 2025 20:47:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AA71260055;
	Wed, 17 Sep 2025 20:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89650C4CEE7;
	Wed, 17 Sep 2025 20:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758142057;
	bh=h7EbwWPtFVUiR5ohjPExsa3zm6rrMiaNEomibrJvyck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WqGs4CbnpHy6Bt3gI8wx8EWawzsqwaeP2wz6vTB01vDIg7VHzLxAXkLqno9igTVGl
	 LC3H5PwwIV6kZCLoKA7vgy1BON2d6mY7kwY3m5OM8ZrN+Phm773G10ho2C9tMlU5UA
	 WOmk8dUuZdRobMexzQaqe84QSM0ARbUO8/RdzFsVsmiTp2ENKa0HqF9tPq60/hPpfs
	 ExGp3MpA6jHR013wvmRILUJVwxPkrcoplSsqa1uKnx6pnlujVxrCPPj+AZuzBT8F9D
	 MqxoB5qHSTYdMmLI7xOPexw1CfTw1UhnhPYzGf15/NRRLZ8t4p03J25OpSTI+nSaTy
	 ly7Ce/zdY/8aw==
Date: Wed, 17 Sep 2025 21:47:30 +0100
From: Conor Dooley <conor@kernel.org>
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-unisoc@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH 03/25] dt-bindings: gpio: rda: Make interrupts optional
Message-ID: <20250917-muskiness-broadside-d4084721444f@spud>
References: <20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org>
 <20250917-rda8810pl-drivers-v1-3-74866def1fe3@mainlining.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pdly0o93g8e34Y+L"
Content-Disposition: inline
In-Reply-To: <20250917-rda8810pl-drivers-v1-3-74866def1fe3@mainlining.org>
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


--pdly0o93g8e34Y+L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--pdly0o93g8e34Y+L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMseYgAKCRB4tDGHoIJi
0vmfAQDRxr0wpcgba117QZqX2neyCChoWuE/qC/DvDfBaKoUOAD5AbFsTT/TbEQD
tk3zzM+/PFL6bzxDTlnOOVsPOoZznAo=
=Ywgk
-----END PGP SIGNATURE-----

--pdly0o93g8e34Y+L--

