Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9F3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 20:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zpLgvcFjyvCbRJ2K9eYrKV3wY29rhQ2Migll4tMDKI=; b=F9cZVBM/wkJsCU1gu8dnTwWE04
	WMxzHrWttYQWExNDy6zug4VvblBN7wqg3OW6rGOGebiviCtbvdfOZPmSIaFu/DH6x7o40SXES0wBA
	fgIjnweacQOb0X5OfOjnRcEGH7xRFkU3UvGLnD4e6iAs5q98lma6nXMWOMi4b9TA3/2KBesCIQMYB
	iXuV1ycxTV/Oh7leog2/AfjebeHVqaoEaWvMq9QsJ1XNcYx1XpcOHi3WlABrJF5nLo63fcLAcInsP
	exEAqBQts/x+DTKxmW4uzKEMchQ3lGl0L3Hyf9Cg/twjMJXDsn8D+NVX8+9t71RkO/PYhIsMpMt4t
	1hVNm5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugUXf-0000000FOEc-46pa;
	Mon, 28 Jul 2025 20:33:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugUVB-0000000FNRH-3Pyt;
	Mon, 28 Jul 2025 20:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753734676;
	bh=5zpLgvcFjyvCbRJ2K9eYrKV3wY29rhQ2Migll4tMDKI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QM4F9cAaDDALe1tJ9ZVTGG1R28qF2oJ+isM2Bew938coHxcKgnfLcYEidcQuKQ/ni
	 KzaIUnZuI6UZB540kep3TjAAFDJlyWbSbrbXYHnF38Uoq7NhLAAKlYitEOBM3fD3xN
	 idSz7nBsaXlALrgd8vC370FUt7ZPQowf8g0wn+yPrdM8/qorBPfayu1qCtJr5Gp5ix
	 JsUO13dafFUKzcDyighala6keY3aaAn1IHrLAZ5zsptWt5US0XmlzWgMKdHHVUVek7
	 gkHxTbZiVvmUMxWjWdhe1uCiyvGRrOk78/JRPFAaJMHqidP1eIXIOgQIh1Idg9/T8f
	 5E/GLAmyuTJOg==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A65D717E0DD0;
	Mon, 28 Jul 2025 22:31:13 +0200 (CEST)
Message-ID: <9ed47afadc8f624daff6711b86360cbd9e68af79.camel@collabora.com>
Subject: Re: [PATCH v1 0/8] Enable video decoder & encoder for MT8189
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Sebastian Fricke <sebastian.fricke@collabora.com>, Nathan Hebert	
 <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Irui Wang	
 <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>
Date: Mon, 28 Jul 2025 16:31:11 -0400
In-Reply-To: <20250721105520.5625-1-kyrie.wu@mediatek.com>
References: <20250721105520.5625-1-kyrie.wu@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-FYdGZs1zTcICozY3Py8W"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_133118_147246_E554E497 
X-CRM114-Status: GOOD (  14.97  )
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


--=-FYdGZs1zTcICozY3Py8W
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 21 juillet 2025 =C3=A0 18:55 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> This series have the follow changing:
> Firstly add mt8189 video decoder compatible, profile and level to support
> MT8189 kernel driver.
> Secondly fix some bugs, including vp 4K profile2 and media device node
> number bug.
> Lastly, add mt8189 video encoder compatible.

Since its a new hardware, please provide v4l2-compliance test results along=
 with
relevant fluster result for the decoder part. Please also provide a link to=
 your
submission of the related SCP firmware to the linux-firmware project. This =
way I
don't have to ask if/when the firmware will land.

cheers,
Nicolas

>=20
> This series has been tested with MT8189 tast test.
> Encoding and decoding worked for this chip.
>=20
> Patches 1-2 Add decoder compatible.
> Patches 3 Add profile and level supporting.
> Patches 4 Add core-only VP9 decoding supporting.
> Patches 5-6 fix some bugs.
> Patches 7-8 Adds encoder compatible.
>=20
> ---
> This series patches dependent on:
> [1]
> https://patchwork.linuxtv.org/project/linux-media/cover/20250510075357.11=
761-1-yunfei.dong@mediatek.com/
> [2]
> https://patchwork.linuxtv.org/project/linux-media/cover/20250528063633.14=
054-1-irui.wang@mediatek.com/
>=20
> Kyrie Wu (8):
> =C2=A0 dt-bindings: media: mediatek: decoder: Add MT8189
> =C2=A0=C2=A0=C2=A0 mediatek,vcodec-decoder
> =C2=A0 media: mediatek: vcodec: add decoder compatible to support MT8189
> =C2=A0 media: mediatek: vcodec: add profile and level supporting for MT81=
89
> =C2=A0 media: mediatek: vcodec: Add core-only VP9 decoding support for MT=
8189
> =C2=A0 media: mediatek: vcodec: fix vp9 4096x2176 fail for profile2
> =C2=A0 media: mediatek: vcodec: fix media device node number
> =C2=A0 dt-bindings: media: Add MT8189 mediatek,vcodec-encoder
> =C2=A0 media: mediatek: encoder: Add MT8189 encoder compatible data
>=20
> =C2=A0.../media/mediatek,vcodec-encoder.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0.../media/mediatek,vcodec-subdev-decoder.yaml |=C2=A0 1 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 9 +++++-
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 1 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c |=C2=A0 4 +++
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 32 ++++++++++++----=
---
> =C2=A0.../vcodec/encoder/mtk_vcodec_enc_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 14 ++++++++
> =C2=A07 files changed, 50 insertions(+), 13 deletions(-)

--=-FYdGZs1zTcICozY3Py8W
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaIfeDwAKCRBxUwItrAao
HMzZAKDRnKnZLS0mmgeweRyByWUpJk3rxQCdEEBk7PHedwsGNq6oR45JEjQNdhw=
=4Qqz
-----END PGP SIGNATURE-----

--=-FYdGZs1zTcICozY3Py8W--

