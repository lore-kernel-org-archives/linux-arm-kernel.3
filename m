Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21492C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyLkXDnbrXJEc0OaM1PjirQMqHWiD+iuadWmNBjeA2c=; b=fnhbvmxMPG3PK/qvK8RVQQ5/lK
	kS9mpbMrJeEAS39wviFTs60c1cQ8DS6pvkIbSS0V7RvVtlyIN760e45vV2hIwH0WEfFbBtqhLplIS
	/7kVKPt9dASfEGTsvrId1FvFtfRP0ECtzeo1yGz11u8f34i0FWnuQg+1B4nLioYaKgAc6BtBWfrgx
	xb6rEItGv0dBLXeI/3C0r3c7EvGbs8pIqIInjWV7SI9bv9jh6jlNqzUbgqvzHBFchMrldRsyksmRt
	mni/7+nldip5xEZQEsDCUJQLz/J8ALVo2z+j8KwwT3XaJMvFq9o8ku8qXi/wfy/GjwIq3Fc0HxFO3
	/5SFE/LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA901-0000000Dyil-0eKd;
	Fri, 25 Sep 2026 16:42:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA900-0000000DyiG-1flA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 16:42:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A5FF41B46;
	Fri, 25 Sep 2026 16:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3A41F000FF;
	Fri, 25 Sep 2026 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354532;
	bh=gyLkXDnbrXJEc0OaM1PjirQMqHWiD+iuadWmNBjeA2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a3z20XMQmSM1lABjCbciu7pjC7e9zVg+7qPG0oYNr780XVrmUQkldgdporeBXCi/M
	 oAq24xYlAvFjOuBEgNzFDl8F5aJPLOQ1WabMioBlzUEdPRwqr9mc3d1fQTXJrrl7XR
	 xEAooSj/VqbzCdIj2JuJjTlaRghHlni1A4mf3AKFJm7JwJq+2+9n6lLTmIInwEWouv
	 iCrXD1AQu9kXzMrf0AhGYDhBpN5NE+Ns0kgZI2fubEl/WNA1z0/6sfWPP++Yj+7h+x
	 UwArp1tL7VbEpLaDgi0CxZtSegnoEYelBIrmqnfk02TWWhlR86Fd/QFkGeyY4lVNGv
	 hBCi8S2KyVUSQ==
Date: Fri, 25 Sep 2026 17:42:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Steam Lin <STLin2@winbond.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/6] dt-bindings: clock: ma35d1: Add missing WDT/WWDT
 parent clocks
Message-ID: <20260925-blatancy-swizzle-cf68e2238861@spud>
References: <20260925-perso-ma35d1-upstream-clk-v4-0-f3697553391f@bootlin.com>
 <20260925-perso-ma35d1-upstream-clk-v4-3-f3697553391f@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9g7vGttGi5KFY0fB"
Content-Disposition: inline
In-Reply-To: <20260925-perso-ma35d1-upstream-clk-v4-3-f3697553391f@bootlin.com>
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

--9g7vGttGi5KFY0fB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9g7vGttGi5KFY0fB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarakXgAKCRB4tDGHoIJi
0sIGAPwMU8FEvVOqYnT8J4KS45EZceVo0rtv2fXdjguce/XKqgD/RF6w9eFtMGkM
+ZqUe/H3GmKa1XFwPg913cljeBOTfwM=
=rGSs
-----END PGP SIGNATURE-----

--9g7vGttGi5KFY0fB--

