Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BC2E68944
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 08:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3iIIsHdt0hU8MfSeZgGRpSJ44GLBXxPqNvTCuiOI5A=; b=i1aZCY4lq0kKEQiJspJ3bmo/Fg
	98RDQBucOPVbUyCGOFQhgK+TM7jXz5FlmrPWkSXmmHRn8bVLBBpaahYnPL6oFE7nRVGO3p2QRmgkV
	vs4RDTX9hHYeH67XuAKQbOEQGviUa1+jodaDlGtnPTqMexeUUbnc9HqhlZWgCO8UpNW3Nx/ci6fsQ
	g6hSsTQKyPk6a2SKNurGTP46WvIJWWdjDsfo0ErIxAIueLE4C6PfM+eZKiRzADs/8TmNYNoxKUhjo
	XQ/+62W3PrEn+LEHs9uhLHGBD5NCok918R0Gtz7p7HqQGji2YSIv0McFGQoaJtZaEU3W74oIzOzaP
	XzinbR2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6QKA-00000002uQM-2oFh;
	Thu, 31 Oct 2024 08:14:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Q6G-00000002sf3-1gGJ;
	Thu, 31 Oct 2024 08:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 77D70A43D54;
	Thu, 31 Oct 2024 07:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6E2C4CED3;
	Thu, 31 Oct 2024 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730361610;
	bh=e3iIIsHdt0hU8MfSeZgGRpSJ44GLBXxPqNvTCuiOI5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M0I08RCdez8G0E5woyLMg+7nH8n1if0hCokbc43feCFXLjAP1iiginHANInomDPat
	 orlS1Kpim6rQZdnR9H7sLn3HWkXIbCvVkfOff5aOPqi3rneD/rRc3qCHl5LoEhhm5u
	 m/VYHtAXB/Pa4Mgqvcnc8lu9et9aqE+Z6DNOThN/LYPh7XVG1CLtH00r0ecvVcTtKf
	 9jG3sDwezSomJcC9zPsnk5zWX6CzXiLwiShF4HsTU1Q7zkA1J/Mi0dSNYFe46nYK8X
	 918eyfWUHHAMsnBIAZGjdl6OOyVDF3P9MWgfS8m9efdA0PpockdhNyNN4Pe6qapQBy
	 3WZkflGpFjsFw==
Date: Thu, 31 Oct 2024 09:00:08 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: Add TBF qdisc offload support
Message-ID: <ZyM5CPfQYHc_Eolh@lore-desk>
References: <20241030-mt7530-tc-offload-v1-1-f7eeffaf3d9e@kernel.org>
 <a66528bd-37cb-46b2-90e5-37b10dfa9c78@arinc9.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CRyyJPZZJWWbrdrI"
Content-Disposition: inline
In-Reply-To: <a66528bd-37cb-46b2-90e5-37b10dfa9c78@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_010012_703102_4992F157 
X-CRM114-Status: GOOD (  13.03  )
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


--CRyyJPZZJWWbrdrI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 30/10/2024 22:29, Lorenzo Bianconi wrote:
> > Introduce port_setup_tc callback in mt7530 dsa driver in order to enable
> > dsa ports rate shaping via hw Token Bucket Filter (TBF) for hw switched
> > traffic. Enable hw TBF just for EN7581 SoC for the moment.
>=20
> Is this because you didn't test it on the other models? Let me know if
> that's the case and I'll test it.

yep, exactly. I have tested it just on EN7581 since I do not have any other
boards for testing at the moment. If you confirm it works on other SoCs too,
I can remove the limitation.

Regards,
Lorenzo

>=20
> Ar=C4=B1n=C3=A7

--CRyyJPZZJWWbrdrI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZyM5BwAKCRA6cBh0uS2t
rJU8AP9azI73svyRHG9RCHfUeyWXViqHMnwQqtgO+m4YcEk0NQD/RabxUzVWEZIN
1FkIS7NJ9hfIsvxHuZ9X16moqYkPeQM=
=QqDa
-----END PGP SIGNATURE-----

--CRyyJPZZJWWbrdrI--

