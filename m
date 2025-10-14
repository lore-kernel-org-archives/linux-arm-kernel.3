Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A37ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfNs7dFvmbLt53h9POVLQpvwOzXq+QveaKQx6rXQNw8=; b=OgDbauNDhFd0LDYb6PTubwKh3Y
	XcsRq0rlMSkH6Xx9vQghOJtf4qbDvrO9AiVq1ib45Xjn09xyoWKKuZFqLZNaSecQO1ptQo0b+AiWX
	kR4QWkDaUx4ch7lfvizIIkPS0vwPNR+DaqXoymfd5qgIHOc/t6pVyUCLfIaTnPtlj+BtUDeXQNVXp
	RqxQuF109Rwvsu3MNuv18ZpZdJCpWPIY9OePFRi9osbypdTSe4MBKUJoTxtGYC5Bc3Fr9CGwMHQbE
	myoKR9EVY9/XYtDoMHSy5mOwe23nL2+A2W0ZLDZvpKmN0hxomnbPHLJNoKEWtdJdsLV/xxxyGm1Qa
	8/82SxjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jPV-0000000H8i1-06m1;
	Tue, 14 Oct 2025 18:06:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jPQ-0000000H8gj-0QyE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 18:06:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF61144EBC;
	Tue, 14 Oct 2025 18:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCFFC4CEE7;
	Tue, 14 Oct 2025 18:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760465163;
	bh=JfNs7dFvmbLt53h9POVLQpvwOzXq+QveaKQx6rXQNw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSz3Di7btbUQi85if9iBM+pXDgRpQCPe5IPR1EH1XLn9FLC4I/xBB8bZPvvlBU4BV
	 mZ8811SvF95JAtHe/62tJCBxFIVM+5oDa7aXK74sgg9+1SyqcjJTMezUuqnEIlfH6o
	 dNMM+nDzu/i9dF4oKj/YF+tJ6q3FRPDmMCTZ1qM5dhD0M2lNgwG4VbWA2xnng1+SDh
	 eU9Iz4jvrZCPaw1dcKQ6FmAJvytohB24hnLItwHnCASx2feiXgjpmYQglbUrSCjzc3
	 2/Zpb3i9MsczskqAk7ppoRMcJKP1g8YdNN9pR9OiBBZrRDV3azr5VgPk8MbVXgMNN7
	 vPx5mB2cYHvDQ==
Date: Tue, 14 Oct 2025 19:05:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Christophe Roullier <christophe.roullier@foss.st.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>
Subject: Re: [PATCH v3 08/10] dt-bindings: pinctrl: stm32: Use properties
 from pincfg-node.yaml
Message-ID: <20251014-privatize-unnerving-bb26a0626276@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-9-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wigSmc8rrZJKQMu+"
Content-Disposition: inline
In-Reply-To: <20251014140451.1009969-9-antonio.borneo@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_110604_797759_1A0B9146 
X-CRM114-Status: UNSURE (   6.60  )
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


--wigSmc8rrZJKQMu+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--wigSmc8rrZJKQMu+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6RBgAKCRB4tDGHoIJi
0hVaAQDs2t7Df4kI4kyx6xytw0ZMIEL3EaLx1elCU0OeibxfpwD/UIGUJYpE++Jz
HbbMxb2Nhx7TeJ4NiLJbGkxps5OpZAA=
=vh6W
-----END PGP SIGNATURE-----

--wigSmc8rrZJKQMu+--

