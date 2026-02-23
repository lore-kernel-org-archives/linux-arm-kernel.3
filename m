Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084B7EC1118
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QpMmW40kIat1kKs1ek+xBkNlj1NYSZ0QLAmvTB0cy0=; b=C9Wc7uTkmunq6TG2kXYQhK2SZd
	/FY06XM6zAwJG9xmEsAv9M+NeVp7Jl/zroYO1KsimczDJ+mSIBEmEk6omAmwFzBhzIQjAoAtkLQ/p
	ZMMc5zPvm3OV2Jbj1l1+a3ROGEozNMadDpqEhwtMEJzg0D5bMf9/3o9vZYZ0Gv8urGQkEKt8aEFZ1
	0ubXoCuwUDrVQMhE0rWFCYs/IQqAZUUXAEQIPWETMEPvi7E6V7LjjIuKeYIidybkxDL9DlNmLPcLb
	Jr1Wdz3YC82yxPr+WrZgd3yH+qSPbuYjLoThQNqqlmQv0ZicFTjDNytX0rc4DOZzOnPPaJSdHNC1y
	3e4I0sJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaYp-00000000rPW-29mS;
	Mon, 23 Feb 2026 18:21:35 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaYn-00000000rP0-2TEK;
	Mon, 23 Feb 2026 18:21:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1771870880; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LO0OJrIIIXkzCrQQfCcvrpHXM3U/oezz4wUsYvMrIrlH63GDypik3xEP7aAOJ3X2+AGxC2Sq5cjzVvUNtuLh/1IJTxBUmeBBvFfKMA3eIknI6y4/573sCJ0ZLjHXhHwTNe3lAdlJHs1Xzf7Nz0Q/2Eg1yeoXcu/YotcWyQ4YoRE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771870880; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3QpMmW40kIat1kKs1ek+xBkNlj1NYSZ0QLAmvTB0cy0=; 
	b=fSmyZHMSc7NxjKmgF6y9yDv5piUZBSrfxAb6ghCod+pvxlBQJSISZQtbvRCSBDUL9ClSb36bmu+12UhvWxqtPTfjVvHBD1gFzh5yXTwJyI5fKBq40hGhEV2PciG2DQqAweLYEbWPd1SlfR51GDcIICalMyikihujCWznB+iHSVM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771870880;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=3QpMmW40kIat1kKs1ek+xBkNlj1NYSZ0QLAmvTB0cy0=;
	b=AG73FSNF0slb9gErO5ktr5aF1uRpJS6fYJFYRLDZ/2dXZSU5Cu5Ox60ilETlb9KO
	wUtThLTEA9P+sxo8w+VCHc2ag+n+3fFBGW4KBUAzgny8ZLvH/3OE/0R38vf3BtXy5D9
	/Bf9ZvaLp18WAG6UNkcjLp7kFurj7eaYnUVM1T64=
Received: by mx.zohomail.com with SMTPS id 1771870878966356.47662130272647;
	Mon, 23 Feb 2026 10:21:18 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 4E4231806CB; Mon, 23 Feb 2026 19:21:14 +0100 (CET)
Date: Mon, 23 Feb 2026 19:21:14 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Diederik de Haas <diederik@cknow-tech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Detlev Casanova <detlev.casanova@collabora.com>, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576
Message-ID: <aZyaLG0lYao6_xxb@venus>
References: <20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com>
 <aZxkDGzEQCCLKR-M@venus>
 <DGMF3IX3J3BP.1XT41P0G8P5OD@cknow-tech.com>
 <b4eb3031-69e8-4a73-b4f1-91dd4192bb21@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n35exwrn3ee26t2a"
Content-Disposition: inline
In-Reply-To: <b4eb3031-69e8-4a73-b4f1-91dd4192bb21@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.1.1.4.3/271.848.75
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_102133_672445_B39DA01D 
X-CRM114-Status: GOOD (  12.90  )
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


--n35exwrn3ee26t2a
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576
MIME-Version: 1.0

Hi,

On Mon, Feb 23, 2026 at 07:07:42PM +0200, Cristian Ciocaltea wrote:
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -34,10 +34,12 @@ properties:
>        - description: The cache configuration registers base
>=20
>    reg-names:
> -    items:
> +    oneOf:
>        - const: function
> -      - const: link
> -      - const: cache
> +      - items:
> +          - const: link
> +          - const: function
> +          - const: cache
>=20
>    interrupts:
>      maxItems: 1
>=20

With that change the descriptions in the reg section are wrong.

Greetings,

-- Sebastian

--n35exwrn3ee26t2a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmmcmpIACgkQ2O7X88g7
+praVQ/9HoWHCL/V04hsruUcyyQNCJwHHNdFoiO6VWn6/wdlfmfFoSWWn2GUQ0L9
TvizIFInVev87p+PLnXE6qWH5F1i3jmJ1Tj+x4SEHZL3zZ9mCferejCDvmISmAls
5ab9QudefSeGPKQiJ6yYmmWlILD0/vYCQi2B/0PLNT75XiasWDZGXcL/EGP6qCqQ
2J8KDJQTsqYvrTcf5fwXP6a5+pVc8V1V+DZgOBBJDcvw2qPEWR1hTPPkUdififEf
TI3voWFDe7XTBb1R+EGQkjQSA2NzwyHc3kEzoUsf6VtRyEmzsDUUXuCI5dgYLLi3
s2TBXhOiMneKy5FfGaAdeJolNrstJ72VWFFTHe2OKj3qhHaH/rbOuobF3MLRmT7T
UUtrXdN/qTSSt3o8GLFaWp3iPAPOPcPCnfaMQ44HAkH/3U1sHzVlWHVEYHfFYwrQ
4hMHVo2QBd6UQmnU9CXzA/VurS9jwQ9dprhJBD6fsYIDzrPzC+IO35JdCfQ3pyHd
JGbBSZcXOuoo1sk/liIvZggcMfWYJs1NwZM+gk/3DWhV/MKpEzEBhugciHC5Fh+g
xuwu0IIIpGkbLRtCfMdulYtR20svlzsrH7VfV0YDnSVKhF8/EXn9lEP5tDlblXBj
OucwIXC/q9TQZI4phd45tPwfibr3k6qPQxwdba2LAQFHR1Vf63Q=
=XXNn
-----END PGP SIGNATURE-----

--n35exwrn3ee26t2a--

