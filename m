Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4DDCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptw9LWjwcshgBavY2yDU/Ee+H+KyvQTD0coZYZFxVfw=; b=X7kmzkGBtxnk2KTB+x2yJ9usp2
	af+kAq8zeXD/6TUeE39Ww4BlsAsXvJJe2mWXyEXMBEhc3z5GdSlVUcw+MJdj9jtCrzh4X2BnO0WZF
	yfIPc+H3Ch6QwD4roImU3bh+dA/QzcQbGZsyQQ6dsUBABqAY5els8AXIILrXl8Fk3OiAMk/5XevpD
	a+KfGFtIHkCBxo8+TjTeHOvAf5VMDgSAb8NW0h69lyRvskCNz7gjUK/Atx/6zyTd4kq4YGOcvkH6J
	OVVusebh5rFHyxkHZdAj++caiOwkccs7cIVokIOgRjSmKS6aOjWhNKD08wOa3lSi8x49vzzD98RRx
	z4PxJYEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwPa-0000000C2lX-1ok6;
	Tue, 12 Aug 2025 21:20:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwH8-0000000C1b2-0Xof;
	Tue, 12 Aug 2025 21:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755033076;
	bh=ptw9LWjwcshgBavY2yDU/Ee+H+KyvQTD0coZYZFxVfw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iPMgSUEkfNJiAjaNCg4fHebUfF9p4iwEMZYSQwgT3Wag8oCvrrorR82Bq+flfOcAA
	 tJE/Yoicrzw8NxpJCIWPPwA8lhSY3QDThCFfZS0af2JKOocxNwJNPGGFvi52DpWIPR
	 rfp96b9bk+frqd/JoscI7HeslPOnw24WS16oaArSS9knnpRp6StIjNe34jMttiQ/N2
	 PwrCFWxH28cc2bJhESkMhUuieD/1bwztCE2rL1oY3n/B+JDdgpUVuXdnVPPctJe1Nr
	 ggH7Sftmy6AqFFgE9khGPbHMDitLVejnKoL1yJUUDLXdN1bGzQpQ754p+334Mxdt/W
	 JLqzujFi6Sk4A==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A839717E0237;
	Tue, 12 Aug 2025 23:11:14 +0200 (CEST)
Message-ID: <d4f53de2dabce333e9f24fe0036d91b8d60af628.camel@collabora.com>
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, Jonas Karlman
	 <jonas@kwiboo.se>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Cc: Alex Bee <knaerzche@gmail.com>, Sebastian Fricke
	 <sebastian.fricke@collabora.com>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 12 Aug 2025 17:11:12 -0400
In-Reply-To: <3547812.44csPzL39Z@earth>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
	 <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
	 <3547812.44csPzL39Z@earth>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoiZBBMWCgBBAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheAFiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmgssvgFCQll93U
 ACgkQ2UGUUSlgcvRSeQEAjcvEl/A6R2y2nMufL4A8MiKQfPZqJPXlhhno2PZqqUcBAIR87Pv5+cZV
 ZTN26stch5wMyalcKgRNQ9IxtGvVelUCtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc
 25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQ
 TvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZsmBU
 pkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHCAAS0
 LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBFiEE7
 w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAwECHg
 cCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8bRLv
 9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3mQpTUvxe3+s5ASJnZMy"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_141118_317152_3270D7ED 
X-CRM114-Status: GOOD (  12.97  )
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


--=-3mQpTUvxe3+s5ASJnZMy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 12 ao=C3=BBt 2025 =C3=A0 15:57 -0400, Detlev Casanova a =C3=A9crit=
=C2=A0:
> > Detlev reports 146/147 on newer hardware using GStreamer, failing
> > TSUNEQBD_A_MAIN10_Technicolor_2 (9bit chroma) only. On Detlev side, it =
will
> > we important to check why 8K videos (PICSIZE*) passes with a single cor=
e,
> > perhaps we accidently use both cores ?
>=20
> 1 core can do 8K. In theory, it can do up to close to 65535x65535... It i=
s=20
> only a speed issue, so you can do 8K but you won't be able to get to 8K@6=
0=20
> with only one core on rk3588.

now that makes me wonder if that means we can reach speed such as 240Hz 4K =
by
slaving the cores, of if that only works for 8K. If this is the case, perha=
ps
the decoder will need to be target performance aware to make the best
scheduling.

Nicolas

--=-3mQpTUvxe3+s5ASJnZMy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaJut8AAKCRDZQZRRKWBy
9Ih8AQDKyfk0G5x1w5UjIb06h+rwgbK7YR0Lu+0CgbaCFrUrCwEAtl6TV9GOaFhe
Ubqzqi3x44DC0qxKWNjsJ9wdHUCpbAM=
=ANNJ
-----END PGP SIGNATURE-----

--=-3mQpTUvxe3+s5ASJnZMy--

