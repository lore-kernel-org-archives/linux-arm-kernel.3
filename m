Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94254CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 04:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L8L/AG5G7UAoXL1PYS/u6Nnpj1wCsKju5KEwMHdal5k=; b=l2MpvEP5HiB8W1NW1CM4Try/PH
	91TByrA5f12xlpw6hgsPevDdAMQRrr7JBgGEc4HXjIjvm+rIvjgXvSIA5W0DKSG2PdXQr/80maLEV
	A1fb+xVkpO7ZHBHA8OjQBnRxtD52yZiRzzmRD0ovdDLK3fOOmh+b16RLhn2Z0lJDJYR4lJ8bfPCmR
	bztBTWtXEP0CV7alwEnhGyxB7aDJ3lwrq08n0o0DIUUCbyownH4EdJdwHnwGpvNf/T+46+ae8eXa8
	1jfnNrXGhWJnnDo645uqZBIbI3gOFfjBBNqnFfw7NGhI5g+DPykOF4NxqNJ8qMnbPN2QdpfP1uO5W
	FT4d1tkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulgyD-00000009oVx-3uY8;
	Tue, 12 Aug 2025 04:50:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulgvb-00000009o6S-0uZi;
	Tue, 12 Aug 2025 04:48:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 08B6A457E2;
	Tue, 12 Aug 2025 04:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578E4C4CEF5;
	Tue, 12 Aug 2025 04:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754974081;
	bh=L8L/AG5G7UAoXL1PYS/u6Nnpj1wCsKju5KEwMHdal5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t14BuTRSKl7Vt728N9usBcoblwvlD2/EKJKXoCuYFngh0woOOWAanrRi9rKD2m7zA
	 oggmfQDUn9MAKQ9frbyl2aUe+Ahz38AU85z9QIUvDlinAgkVgvZAdJcv3e7DTuHrXO
	 7lwb/cMnclDw1apnuZZPNJQF5lHA/R3MiMUXaF5NUqTxm2XOdtuQ0h6tH5tK1hb3C6
	 bRLXHjBtpqXDKMiDqVyGt2BPFRG8ErTumatjseTugpO05MpP90Q+It0EiD58FKS8L0
	 DI84EiQMM3wkLk9uDUp8rtLxms6LjgdR7S2evdjDfO2NTOcm7lOG8IwPsLifmZGTNG
	 S42SlpPaDbYNw==
Date: Tue, 12 Aug 2025 06:47:57 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
	Rex Lu <rex.lu@mediatek.com>
Subject: Re: [PATCH net-next v2] net: mediatek: wed: Introduce MT7992 WED
 support to MT7988 SoC
Message-ID: <aJrHfUo5QFs-MmM7@lore-rh-laptop>
References: <20250811-mt7992-wed-support-v2-1-e43024c05305@kernel.org>
 <aJoK7e4aEKR96V4h@lore-rh-laptop>
 <20250811084414.6089720d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N1vBIlflFVXeQRN6"
Content-Disposition: inline
In-Reply-To: <20250811084414.6089720d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_214803_314540_1F44EBB2 
X-CRM114-Status: GOOD (  12.75  )
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


--N1vBIlflFVXeQRN6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 11 Aug 2025 17:23:25 +0200 Lorenzo Bianconi wrote:
> > > Introduce the second WDMA RX ring in WED driver for MT7988 SoC since =
the
> > > Mediatek MT7992 WiFi chipset supports two separated WDMA rings.
> > > Add missing MT7988 configurations to properly support WED for MT7992 =
in
> > > MT76 driver. =20
> >=20
> > I sent this email twice wrongly. Please ignore this one.
>=20
> patchwork decided to ignore the other one.
> Are they identical?

Yes, they are identical. I will repost v3.

Regards,
Lorenzo

--N1vBIlflFVXeQRN6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaJrHegAKCRA6cBh0uS2t
rAn9AP0bWrDJy2M1CQQq6ydQl8W40coUDAJ2wAj0bRJ3LjVQZQD/Skw/G0OSM9++
iqiVRAF7bNmVxGzHSAF1T0D3HNVL1gk=
=PIXt
-----END PGP SIGNATURE-----

--N1vBIlflFVXeQRN6--

