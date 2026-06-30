Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E2FC43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL2Qh3JlwcMGBS2Xp+GdGwlsEo7x8Qy6c5ebOhuRvXM=; b=dyMVdu8AC2GXIYqZU2JtL+gLTn
	xv1oUW4bDe6CstRl9aRW8nT1ALTG4GUuF+jQmmSkCGSKg7//0pe8r0L393VaYDjavS2pX/ndM1xy6
	MC1XGjXGSjYyariHE0UbtIaw1jhSB8YXBDonA46zKHDzlgE6bw5ALRwunFZ2+0VBkqY0MZgw37DEe
	gK/8+xArG7Bm2Fy9kYdTq9XrpIQWRP4l6j99pjMDuqbYOFDJo2Nlr4AT1G9qbJJ15HP8UU/Sc+aRh
	V7gFejPzcJgLvWz6jj9SVTY9rnmvCzXUY9gQZcRnXhRWwYw8rWXDC9UzOrA/wj4EWQTQlparpzT6b
	1n1eK9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wec2R-0000000HYLj-0EAp;
	Tue, 30 Jun 2026 17:14:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wec2P-0000000HYLX-35Kt;
	Tue, 30 Jun 2026 17:14:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C5294600FC;
	Tue, 30 Jun 2026 17:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174F41F000E9;
	Tue, 30 Jun 2026 17:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782839659;
	bh=KL2Qh3JlwcMGBS2Xp+GdGwlsEo7x8Qy6c5ebOhuRvXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IPckqt5KA/8jJBh7o3E+1zaKIw3HHmP0Ha8iqh3DNz08lMmyrAat4Vqsxk0vWlUNZ
	 1Fpq3CaHT/CFIjtL9EPMhkIX5gzwu7lVyA+UqJExC605cULzigG4TS1jkZ2dIhOmpb
	 xgAV39foJ9AsEwpyj9kthoRrfiiH6Jnxw2wUczMdKaAhCIoLT/Z7T4O2ndYD8KXXQD
	 ybf/cRNQXFOgEo9kAf72EQ1cHVj8QoIKWezWdQe/9qspbW2xnJegWoxi9Shc8plDSB
	 tG7jiR5WFggpbeB9mUZe/MBfAfFo19emmPLxN1Tbdq3QsLKbquJxgLft3tpJ7uSfQu
	 gSRHUQq/7hudg==
Date: Tue, 30 Jun 2026 18:14:11 +0100
From: Conor Dooley <conor@kernel.org>
To: lizhi2@eswincomputing.com
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, rmk+kernel@armlinux.org.uk,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maxime.chevallier@bootlin.com, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	pritesh.patel@einfochips.com, weishangjuan@eswincomputing.com,
	horms@kernel.org, lee@kernel.org, wens@kernel.org
Subject: Re: [PATCH net-next v9 2/6] dt-bindings: ethernet: eswin: add
 EIC7700 eth1 RX clock inversion variant
Message-ID: <20260630-kennel-depict-ad1572381eb1@spud>
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063239.1158-1-lizhi2@eswincomputing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FV9cckqVldztFxpL"
Content-Disposition: inline
In-Reply-To: <20260630063239.1158-1-lizhi2@eswincomputing.com>
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

--FV9cckqVldztFxpL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--FV9cckqVldztFxpL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakP5YwAKCRB4tDGHoIJi
0ivXAP9PZtCkBxkZG5rl5e4zSoQMTxB0Fq9zhsdUTq8V3Tq5uQEA12mNGB1ngWZw
6ygV3Z3Xn/OI2pRFvtxK/25tHcy3xws=
=1Xpo
-----END PGP SIGNATURE-----

--FV9cckqVldztFxpL--

