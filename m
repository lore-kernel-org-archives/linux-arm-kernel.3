Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A30C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 20:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wz9MHW44aeB6pwNnHm1InxQmMZgedGRzOQHdWchZDq8=; b=iqrSOpN1NHfZ35Kq6nHLPgLRRF
	IgFBQyzZNAsUyNsq4lZwhHAGfpl8WJVzfJ9TaGmSTUTOgpf7ulMhLj8Zp7wixtLMi+xvuvltwQA6V
	4hgai07IvX5GDLdIYpCCdjdtvEo7wrvtoQxGS54sT6FOZZbrm5IQXthJ5wFv/k9TtkqBmNpjNafl0
	V+fV3GWecGH3hL5BeTE/H0eVHlUqrRGBCT+yjPS2F8+cAWMZTjmU0Sx6K4vCasotvF7sQH6LQr+dP
	suDipELquWzynsW7QM+dijnJZkra7mT642BlbmtvKNBQgM8VWW4xsEHibHsvb8cOhUm60s4QoabGS
	24imLjjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtszX-0000000EutC-2U08;
	Tue, 11 Aug 2026 20:22:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtszV-0000000EusP-158y;
	Tue, 11 Aug 2026 20:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786479746;
	bh=Wz9MHW44aeB6pwNnHm1InxQmMZgedGRzOQHdWchZDq8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NsSQ6E7c2GhYe0E5c8QOLiVWTQaEZff47w+zb9VuQB01TJ8rHWKqn5CWOvUMP/xDG
	 rXh9+U/zO+4oDHNfXaOA51YB8X+aGcU4Zv1MHslRuMqzf9nEltm6FIegiAfsNX3NFV
	 TREuPuJWEUF9UVZgXXTrDq8PtK5o4GKIBAG/dAi/utNkSPyGsplZYh458T0wLUal9P
	 EV9AT7SgsAa+KC7OZyNCt1sF3dUa9mwW+ZgEtXYmfDFUb1svjBt11t5Ol9bA1Bd8YX
	 buaZQLLU4HksrmDY62W4nTLpAp5u9TeCGxQd+8m792bdabk3yHlE4ec8BoNBOP8r58
	 YppK5RtCN3tgQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AFA317E06DB;
	Tue, 11 Aug 2026 22:22:22 +0200 (CEST)
Message-ID: <c8ab26c2edfa4ee4fbbb83faf5f54547f252464f.camel@collabora.com>
Subject: Re: [PATCH v6 01/14] media: mediatek: vcodec: support vcp
 architecture
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu =?UTF-8?Q?=28=E5=90=B4=E6=99=97=29?= <Kyrie.Wu@mediatek.com>, 
 "matthias.bgg@gmail.com"	 <matthias.bgg@gmail.com>, "fshao@chromium.org"
 <fshao@chromium.org>, Yunfei Dong
 =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=	 <Yunfei.Dong@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,  "fanwu01@zju.edu.cn"	
 <fanwu01@zju.edu.cn>, "jacopo.mondi@ideasonboard.com"	
 <jacopo.mondi@ideasonboard.com>, "haoxiang_li2024@163.com"	
 <haoxiang_li2024@163.com>, "tfiga@chromium.org" <tfiga@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=	
 <Andrew-CT.Chen@mediatek.com>, "linux-media@vger.kernel.org"	
 <linux-media@vger.kernel.org>, "ribalda@chromium.org"
 <ribalda@chromium.org>,  "wenst@chromium.org"	 <wenst@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "kees@kernel.org" <kees@kernel.org>,  "rongqianfeng@vivo.com"	
 <rongqianfeng@vivo.com>, Irui Wang =?UTF-8?Q?=28=E7=8E=8B=E7=91=9E=29?=	
 <Irui.Wang@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
 "linux-mediatek@lists.infradead.org"	 <linux-mediatek@lists.infradead.org>,
 Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?=	
 <tiffany.lin@mediatek.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>,  "benjamin.gaignard@collabora.com"	
 <benjamin.gaignard@collabora.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>,  "sebastian.fricke@collabora.com"	
 <sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, 
 "laurent.pinchart+renesas@ideasonboard.com"	
 <laurent.pinchart+renesas@ideasonboard.com>, "hverkuil+cisco@kernel.org"	
 <hverkuil+cisco@kernel.org>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Date: Tue, 11 Aug 2026 16:22:20 -0400
In-Reply-To: <275503aae6ff76a4c186efe665acf996dec9229d.camel@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
		 <20260720012056.1026551-2-kyrie.wu@mediatek.com>
		 <c3abd49fc12e8cfab6993feb60b361ba07b6fb7d.camel@collabora.com>
	 <275503aae6ff76a4c186efe665acf996dec9229d.camel@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-GldQxjJ0Y3JLQz4hWdAB"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_132229_452241_488B331C 
X-CRM114-Status: UNSURE (   9.79  )
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


--=-GldQxjJ0Y3JLQz4hWdAB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyrie,

Le lundi 10 ao=C3=BBt 2026 =C3=A0 03:05 +0000, Kyrie Wu (=E5=90=B4=E6=99=97=
) a =C3=A9crit=C2=A0:
> I agree. Since the platform data is introduced in the MT8189 patch
> series, I will move fw_type to the platform data and make
> mtk_vcodec_dec_get_chip_name() derive the chip identifier from it in
> the MT8189 series.

I'm not sure I have captured the plan correctly. Would you mind clarifying =
?

Nicolas

--=-GldQxjJ0Y3JLQz4hWdAB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCanuEfAAKCRDZQZRRKWBy
9GplAQDqFehP0p9YkX8g3K/opaqz/gZ9NiNEPga5LbtCDES9cwD/ey7quM27QoKq
481yz3QPt2ziTigIuzbPk6CdIXYoCQk=
=Ilc3
-----END PGP SIGNATURE-----

--=-GldQxjJ0Y3JLQz4hWdAB--

