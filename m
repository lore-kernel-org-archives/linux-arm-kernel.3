Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C272EC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 15:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F6Qt9T9axDWKZdW0V8mxJy404waRLPFG48iRbR59dpk=; b=QUDimV9Y3IBv9kVSsLtCZkuhu2
	tgy2fMSuEqqSbo4kQPAt+Q98rbHzCZUBfIN0J9uxApucJpngzIr8tjNoHpDhgcp0Q+O2u/xsDATvl
	4DdXfOPTbAYOgnOM0Fj331ZbCNYqM6FgGJSMhrrOuyhWCM+boqZ5nhX3Kh6EPhlWbTON/0oE7+RMC
	XZ5piQ0fHVA50u+MPFvD6/0n2/0jHdIUUSI61jb/M8jPEmS1k0i4/kIHjnV+6C8Cowbzz6CallsD5
	0OasUVDCq2OGIw7F1pyIjxVZ/mtb413FhjEEH/2VJ1ksGELst0HNJJtjawghhbvYRg+85JKdihnku
	35Fq/M0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUk8-00000004Je3-3r3y;
	Fri, 23 May 2025 15:55:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIUPz-00000004GQi-1V15;
	Fri, 23 May 2025 15:34:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9AF0D61154;
	Fri, 23 May 2025 15:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE6DC4CEE9;
	Fri, 23 May 2025 15:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748014482;
	bh=F6Qt9T9axDWKZdW0V8mxJy404waRLPFG48iRbR59dpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B4ErdVDmid5x5FjBT7zdcDcwqvS6y2Zg1cGoX/3VCvsofX4TZd//EdBMLzQDfoEwX
	 qhe2Gar4rUBt/791S01+eWFT/jBP0/uupI6DLb9sO9R+NgCIWcqATQmf/gXWhcvpKd
	 ZobWmHRfj0Xl/JTccDihsbnCotdlWkgf1RAQ5Wqoz3FYBA/sH73Xp4nJ7aHjAg1ey1
	 yASJAJ7xxKpRu0veigdDSC4RMYzVE3q0w2gcul7xQsjqSdFir9Z0yc5QNaV/WJp1/o
	 x9Ujb4xNuqDZtkN0lG/dP1+x7a2jhFK09WU50SCjyIA+s9NP24yr03zyMsvy4R1En1
	 zp8nGJZZwyd8Q==
Date: Fri, 23 May 2025 16:34:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH 1/3] dt-bindings: net: dsa: mediatek,mt7530: Add
 airoha,an7583-switch
Message-ID: <20250523-poster-suffix-8a15978bc704@spud>
References: <20250522165313.6411-1-ansuelsmth@gmail.com>
 <20250522165313.6411-2-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aKTWQfuzzRjxJz4t"
Content-Disposition: inline
In-Reply-To: <20250522165313.6411-2-ansuelsmth@gmail.com>
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


--aKTWQfuzzRjxJz4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 22, 2025 at 06:53:09PM +0200, Christian Marangi wrote:
> Add airoha,an7583-switch additional compatible to the mt7530 DSA Switch
> Family. This is an exact match of the airoha,en7581-switch (based on
> mt7988-switch) with the additional requirement of tweak on the
> GEPHY_CONN_CFG registers to make the internal PHY actually work.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--aKTWQfuzzRjxJz4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDCViwAKCRB4tDGHoIJi
0kQPAP9frHNQgSGAHPA5uunYjumQhgnmnzyhTpQjs9+iFOrwaQD/dJcW9+a4KFNn
9Mou2j6ietaV+/YWiSjzhzjlzbUPAwM=
=dZL2
-----END PGP SIGNATURE-----

--aKTWQfuzzRjxJz4t--

