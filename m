Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8275FC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPWi4hoZNDrjC4oNfHd7fHgoe10Ao+nAr9o9Kh5FrzI=; b=OzN4PLxsydOPYZqIQi94+N5Q5N
	WuubFpbo1J0qH54utvPTr4etYnPN5aO0dbiIi/IMRdDADh5k0YdG5CMhttsGZ+HBIDyil+BHLeQgr
	LJlv7xtRXbkS/4wb6qBDF77yONYtHbHoU6tw12ZnMioM8nU+1Gsqj2onR7jS0JugXEduTNtGVCsQn
	plhepuiC/rhh9TE5tIrsEDVoejojupx8UTaa21TJQktXUlz5SnVP6I1NPy+CSGlRd1+1E46h4PQxg
	d9vWVTcdcCaCHhh7leF8ajWnqG5ZG/5QqhSAChPS7GRur6B72a2I/KKu/9Z0jWznsNKXGQznSa+i7
	C5K8C4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SZL-0000000CrmC-1E1d;
	Tue, 01 Sep 2026 17:46:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1SZK-0000000Crm6-3Gx5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 17:46:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 745A640933;
	Tue,  1 Sep 2026 17:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E731F000E9;
	Tue,  1 Sep 2026 17:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788284806;
	bh=iPWi4hoZNDrjC4oNfHd7fHgoe10Ao+nAr9o9Kh5FrzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nXTCt3rNQUkwOrhPzMl0KYcQM0uwZq+OWqHdAykNvQi3KJ3W75V1wgo+nZIlRf+b1
	 GB7VwPNqXnX5Rs6wcx7DZGLSExw0HLvDp4KtZsHLQ02+vRHlhSsSQKbA5ACVa8ikP+
	 AUJJaseGWXkgNdM+O7OlCDrSno6Fwj6ij2L9NAtJ300JlUES0huwhjmZ9c+OXe2KXP
	 xeHoU0eZwxbiUnHGtzfO55eUfSOTKMIZF8T8uk4Ggktc8FlUw+qBpC1QS1Uc0a5ghT
	 x1gyMwBBTWQNPQbKzLTeEfc9AJWgPahIyWpAQLGV5C/81xRCjXoRkh46lAgKJavs4S
	 pKFh39gZDRAvw==
Date: Tue, 1 Sep 2026 18:46:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: snps,dwmac: Add UltraRISC
 DP1000 compatible
Message-ID: <20260901-press-buckwheat-92d17a6b8f71@spud>
References: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
 <20260901-dwmac-ultrarisc-v1-1-f19454814bcf@ultrarisc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jiiFleqVVWDTS025"
Content-Disposition: inline
In-Reply-To: <20260901-dwmac-ultrarisc-v1-1-f19454814bcf@ultrarisc.com>
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

--jiiFleqVVWDTS025
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 09:27:30AM +0800, Jia Wang wrote:
> The UltraRISC DP1000 GMAC is based on a Synopsys DesignWare MAC.
>=20
> Allow its SoC-specific compatible in the common DWMAC compatible list.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Docu=
mentation/devicetree/bindings/net/snps,dwmac.yaml
> index 2449311c6d28..2ed4564ae99d 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -119,6 +119,7 @@ properties:
>          - starfive,jh7110-dwmac
>          - tesla,fsd-ethqos
>          - thead,th1520-gmac
> +        - ultrarisc,dp1000-gmac

This should not be a standalone patch, rather merged with the other dt
one.

> =20
>    reg:
>      minItems: 1
>=20
> --=20
> 2.34.1
>=20

--jiiFleqVVWDTS025
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapcPgAAKCRB4tDGHoIJi
0pJJAQC2MOQ3WQ775wZhL2oOE84EeepYhkoKAGs4AIdvFoIJIQEAs4oDcmd2sGxv
x/CeJ0b0IJ340Tqg8YPgsSiFvur70QU=
=9MSe
-----END PGP SIGNATURE-----

--jiiFleqVVWDTS025--

