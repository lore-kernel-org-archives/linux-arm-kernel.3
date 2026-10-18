Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306AECCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 19:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8OTffWF8ukjcWaybjMzefKafbzxl6mVnAd2P1r2qSE=; b=x8edXaECi6+LswOuX71RtDV9Jb
	or0VF2unUP0Gb2QJSEnZnDetjMspeW//+inLQcoZRc6dcWd+AGJJaWtz0ZKxYwQj8mN6o7yd7+GDu
	sJIoVbQK0wQ0lRCpGGpTNfdUcQN1s6WbTniEl/8npge9PPRvhj+B+0Rfl5rLOOPtaXgd891PFZStO
	UWtpZf4C8HL18R4pzGxtsXVBGvRa5qyhMRS8ZKHvSSlOdpHwNmjS39C/dBaQu+MatmexJO8m0hVm8
	VtTJAxt82tsLpbOYKUhKy5OUtdBFMBw7T0QwdCAcotuz6ESKYKoclDgjGAa+CHvRedVNwnc9nPZfp
	r5Pwgxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIWmf-00000006BJs-3Pxm;
	Sun, 18 Oct 2026 19:43:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIWme-00000006BJi-3SFh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 19:43:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C672260D9D;
	Sun, 18 Oct 2026 19:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7981F000C4;
	Sun, 18 Oct 2026 19:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792352583;
	bh=K8OTffWF8ukjcWaybjMzefKafbzxl6mVnAd2P1r2qSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hzAjqaAMeLVPzFPOoLoqvaFVyKVJzlDlMFVJDfGEeGwh/wjvubLhZKELRQinDAxLH
	 DpnKU/pjJD9DCNX/38GD11YaVhbjGYGz4n1j+SHAo0o3aLIH9GsUH0ef6q5r7bjfgb
	 GOpl2lBnU+BLjEB99/p0N+FvLJW1Fb9o6NIrnuRVXKs9+8CRWX4H9PmTh3SsSflaJe
	 NzAAvBbfFa7PAUmuoDxok7IOl9LCsV+v/jDT9L9TMLap6n4bIdyQbAr4PpekXhEyWH
	 VliMLSK/0EwlDFepHJT6rK3GzYzjdK7Q0EAqz4wC+acnMpMFsN3UrB1eAfuuPF7Sqp
	 mv6cBfmzbZcYQ==
Date: Sun, 18 Oct 2026 20:42:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: netdev@vger.kernel.org,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [net-next,PATCH 1/2] dt-bindings: net: enetc-mdio: Document
 optional MDC clock
Message-ID: <20261018-hug-disgrace-9554d903c8cd@spud>
References: <20261016193344.115518-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/BUjjasNvBLCNQUr"
Content-Disposition: inline
In-Reply-To: <20261016193344.115518-1-marex@nabladev.com>
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

--/BUjjasNvBLCNQUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--/BUjjasNvBLCNQUr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCatUhPgAKCRB4tDGHoIJi
0mYUAP0cgpOV4cp2J5EY7SC64vT+TyNBYGE2nv1GcnKlTteVsgEAqwc0rEwEbpR7
1gHzLECDwo8gwL49yELw1MAfSVG5OA0=
=A5Rp
-----END PGP SIGNATURE-----

--/BUjjasNvBLCNQUr--

