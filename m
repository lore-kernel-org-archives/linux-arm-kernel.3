Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B996CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzYuyGs+6TrzNkh6JNP554EuLT+q8pZw4x3vd2nOyGM=; b=M8Bh616AEYkkNClQRsB7rerAjt
	kkywt8xQinVVO6Dr2KwVF7UEau6o1BiHofyfvDpYmCwSdxp1ier1YKsGl6SOkCuPkVVqACZKsbWjN
	8hzs+cpqoFaNrBswqCbTS4r6o9jv2aVGFNNVbTg3qMqThwYKaMqz/scuJ8nOCjB+UiOr++ksRfch4
	qacKVm7ypr9W9GHIsy73VCa9FKGveM8Xe21XNuvBePCNJYHKryLBeVl5HjPumHMq2wmHT9enq/E//
	IWC5UHG38DCOUmsF2UsEBFT5fBiVT3XAjXwI9/VtWnc2hj0e+SukyRAV2P8CP6bB76ZFWxdTXnMd4
	9qxBzElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEgY-00000000w5V-0QCp;
	Thu, 21 Aug 2025 23:27:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up9io-000000008sB-07J3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 18:09:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3A9285C4547;
	Thu, 21 Aug 2025 18:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A88C4CEEB;
	Thu, 21 Aug 2025 18:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755799748;
	bh=EJZmiyPbt2FW7J7B2uq5opO2n/Df0WYHvpZBf3tfFA4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B1DZM6QJ70flQ25VkDsB8ZaRvn6p6tir2J+qFk1eGRgtwb9OkqoJ8opQPWsTfZOqZ
	 ifEAW9k6SKWCDs+3NrjwvtrLE1vtbla5HOnt0MJ8zxXsJb8iRndfb4KuyjN/3Me26z
	 pII+wpS+O98GVdBYf9wK61mWdN6bjfZyi3NVwn9T89gcWqQQff/aR4Y0KxsplXCECc
	 ffl30J8OOX1egfkTzAHKksslozYlO9UfZIQXn6G8wRDJJrOyPkjLBuCfYFuJ4ocEkq
	 NLo+etTUhhgyEf77+CS7XabLnSUhtQS/A4vhKPpnG6v9iB8Rv9PHSwQhoCWFMd6Zss
	 oRtFvdatJknBQ==
Date: Thu, 21 Aug 2025 19:09:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Nishanth Menon <nm@ti.com>, nfraprado@collabora.com,
	Taniya Das <quic_tdas@quicinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eric Biggers <ebiggers@google.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, soc@lists.linux.dev,
	Mo Elbadry <elbadrym@google.com>,
	Rom Lemarchand <romlem@google.com>,
	William Kennington <wak@google.com>,
	Yuxiao Zhang <yuxiaozhang@google.com>, wthai@nvidia.com,
	leohu@nvidia.com, dkodihalli@nvidia.com, spuranik@nvidia.com
Subject: Re: [PATCH v4 1/5] dt-bindings: arm: aspeed: Add AST2700 board
 compatible
Message-ID: <20250821-nineteen-purveyor-a5fe7e86296c@spud>
References: <20250821080214.513090-1-ryan_chen@aspeedtech.com>
 <20250821080214.513090-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eFNKcWxN80Jeyx0s"
Content-Disposition: inline
In-Reply-To: <20250821080214.513090-2-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_110910_146148_07B690ED 
X-CRM114-Status: GOOD (  15.20  )
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


--eFNKcWxN80Jeyx0s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 04:02:10PM +0800, Ryan Chen wrote:
> Add device tree compatible string for AST2700 based boards
> ("aspeed,ast2700-evb" and "aspeed,ast2700") to the Aspeed SoC
> board bindings. This allows proper schema validation and
> enables support for AST2700 platforms.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/D=
ocumentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> index 01333ac111fb..660529c81af9 100644
> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
> @@ -102,5 +102,10 @@ properties:
>                - quanta,s6q-bmc
>                - ufispace,ncplite-bmc
>            - const: aspeed,ast2600

Missing blank line here. Otherwisem
Acked-by: Conor Dooley <conor.dooley@microchip.com>

> +      - description: AST2700 based boards
> +        items:
> +          - enum:
> +              - aspeed,ast2700-evb
> +          - const: aspeed,ast2700
> =20
>  additionalProperties: true
> --=20
> 2.34.1
>=20

--eFNKcWxN80Jeyx0s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKdgvQAKCRB4tDGHoIJi
0rjNAP4oi5C9FbNOm/t79PDWG4cZleruMzdozxf6Qctl5HCZ1gEAqDbhG+pz7KL9
PdVRZR6lS8PNdFBwdqaDS4H3zzJ8Hgw=
=XlDw
-----END PGP SIGNATURE-----

--eFNKcWxN80Jeyx0s--

