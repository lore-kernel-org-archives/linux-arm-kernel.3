Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E623C28B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WG7ZsiuS475dtVXBJwK6soufvuYa8fqLgAZG4Rz7z8=; b=KQ36x82ZmCu7jlcXLnuypR3P2k
	Nu3mH2gci45xgl8C1GZ401zL6V337GWtQ5IG90pVuMyxHCM0NezYz6E3UB/4zrfij4J7hCTdraT5o
	6QxJuIaeXKVJu+XghHnMdnQIyg/obezPcj1Vy22m8h42GccWe0E4gBVgnUqtKUJ6lEzu/72TcW/V3
	Bf2HWnEgFTX+ihqc1TEPb8hIx/bLl28TfYtAXStIjuzvqHYcMIWVa4qnVFB2IyZn9CcNiG2bQULvH
	1ScOwuHaQtcVDLLrpEsoPpALtIkhY0LFRohsQbW67445MWAyLKyL2kb/Xe0tMqnXhMlop6Uip0yhj
	4nTk1fQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEAv-0000000BWIu-1Zd4;
	Thu, 06 Mar 2025 16:34:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE9K-0000000BW3E-1plX;
	Thu, 06 Mar 2025 16:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/WG7ZsiuS475dtVXBJwK6soufvuYa8fqLgAZG4Rz7z8=; b=dHOOc/7jK4eB3cklr13NezhKkw
	EnhbDwxEB2Sxq6iDclTgFnLUrPqiTPHQ98KBFZ3RAyKKrkFV75H6Zzop8P4ocMT0XzPEvWaj2gZ4T
	XpdsMIsbyYRGxmcT4EWaMhs3CuFOvj5qWFixMSTAV2eZj86G02VzlWt9zOhIu/c1ecYcDieZrrIBz
	vFAFgrfW3AHX8c8sPwtvtnf++Got1CX3qIW0/1dp8jEqeMa88Ay2SO1HANhM2eHawN8GsbRghp2o/
	I+JXgwhCMpIhm9KmFT2SVkJkz0Tf7X5anvCG18XVULWVjxrp8zzz7qF8MRkd+/Gss0x7U0IEMvVGv
	HGjKSdjw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqE9H-000000019mj-1pPe;
	Thu, 06 Mar 2025 16:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D70865C407C;
	Thu,  6 Mar 2025 16:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340D1C4CEE0;
	Thu,  6 Mar 2025 16:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278755;
	bh=UB0xFIJMHFS7w8vLqZBaThCfyKvFD2YXZNnM8gHeM3I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTq7xNxbkKXiQTNVJfOX1rq1emDqjSz9L2s4N54Cl7FgwwXOoGMBxFisho4fvwxi/
	 alNZk86gzwiZgNCcNsNyXZoxDGTwmFPhC0+ADXipakcORRacWImbjeG7jSCNyIVDk5
	 c74qrExtGJs6TjZovMBeGaPhAU1IJhgorHri+LMi0q06Jd6pVsX2bgVZVBjMMyKXM8
	 YJLHXwIFbUQnuUtVTejPr2hZDcXiR+USQAzfsbi5OW5GWRBVGPq+TLbrChHvuI2LiK
	 aN5L3+IjqBSeSSLvkHA9vgfH2+G5bSGSL6nmcJMFItHbeiLkrkLXJKuHJAWAnLNqwm
	 9ZZhmp2Gm4mxA==
Date: Thu, 6 Mar 2025 16:32:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yao Zi <ziyao@disroot.org>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: syscon: Add rk3528 QoS register
 compatible
Message-ID: <20250306-powdery-jarring-bc74e2d12faa@spud>
References: <20250306123809.273655-1-amadeus@jmu.edu.cn>
 <20250306123809.273655-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tV83nSAA1v8eSfQE"
Content-Disposition: inline
In-Reply-To: <20250306123809.273655-2-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_163239_810911_669F075D 
X-CRM114-Status: GOOD (  12.34  )
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


--tV83nSAA1v8eSfQE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 08:38:08PM +0800, Chukun Pan wrote:
> Document rk3528 compatible for QoS registers.
>=20
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Document=
ation/devicetree/bindings/mfd/syscon.yaml
> index 4d67ff26d445..2836e4793afc 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -103,6 +103,7 @@ select:
>            - rockchip,rk3288-qos
>            - rockchip,rk3368-qos
>            - rockchip,rk3399-qos
> +          - rockchip,rk3528-qos
>            - rockchip,rk3562-qos
>            - rockchip,rk3568-qos
>            - rockchip,rk3576-qos
> @@ -202,6 +203,7 @@ properties:
>            - rockchip,rk3288-qos
>            - rockchip,rk3368-qos
>            - rockchip,rk3399-qos
> +          - rockchip,rk3528-qos
>            - rockchip,rk3562-qos
>            - rockchip,rk3568-qos
>            - rockchip,rk3576-qos
> --=20
> 2.25.1
>=20

--tV83nSAA1v8eSfQE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8nOHwAKCRB4tDGHoIJi
0sc9AP9yj1OCVpL2uHdOkGvCA+utM3+L9+RbDh0HCB994yQUygD+LjiZHyV7Zn50
AUwu5WTkwt1+hfDGv2sa+rqHsZ76OA4=
=/RxY
-----END PGP SIGNATURE-----

--tV83nSAA1v8eSfQE--

