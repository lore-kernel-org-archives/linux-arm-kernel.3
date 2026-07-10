Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45626C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 16:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+87cri3jOCre4gN5g3PJi59fqdvefMnbXISUfYiK2HI=; b=Gx7WWV/SdnD4L7HQpiz8STfR5W
	0cy23DYtfKUmylFVLKPrkyRqhJIPvUwtNvxeC31W0y0WpU1ugAPnyr/+/ki2E47Bv9LI9/1vMPOY4
	KLWtGB9pcli/ljbs4oCs2pcOoVTYF23n2NQV9dBLVa5nsXaEpJWIGdMajKEWQh5NqIfOKvBsrO5Uh
	TBA+s+8BbrJ4XsFOS6RyGxMPe0R2teoHJ7AixRv54UL3Wsfoivina2pxoqATIAcOTjZSGGys0E9Bs
	boGx7Z7K38QhLgku57TSeZaeighnyzdZLXWPi8alJd/fuzXdQMpvEl3FpfMYUADEmfsZImp+BB+Sd
	0W9muo0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDvU-00000005GpZ-10Fe;
	Fri, 10 Jul 2026 16:18:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDvT-00000005Gof-2tDS;
	Fri, 10 Jul 2026 16:18:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2001740112;
	Fri, 10 Jul 2026 16:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B435C1F000E9;
	Fri, 10 Jul 2026 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783700287;
	bh=+87cri3jOCre4gN5g3PJi59fqdvefMnbXISUfYiK2HI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XOquKgoCaxsnb/bbVs7Q+TqE+IqITlwbiPXeb27zeCjMGRVbVtUPSOK1EjNemhgeQ
	 grvSfNq025jnbDCqDHlFf9QOOrRf57k/GC2kgLcaNpCr3jkziAl+AnKXDDoiiur3kB
	 ZYARdkxCAE0/pmvZakCFb2dyGwmp8ERHxRWdXepzZdoK1phg2gOEArwE4JJdrivzej
	 Kj97PFaBAwBEErgWV6FGr+YnHO/QJUzG+qs9NK1TpOz8jsvcImSDSkWLNxsgxbst45
	 lqAoSu2Sffo+7hEG6FHTG3bEZt3DoSMcS9rt4PC0yMPcmrasBhkqfOaS44H/6VTV/6
	 ujUHPks4zzxPg==
Date: Fri, 10 Jul 2026 17:18:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: netdev@vger.kernel.org,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Vladimir Oltean <olteanv@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: dsa: mediatek,mt7530: add
 econet,en7528-switch
Message-ID: <20260710-coil-clothes-d316a54585aa@spud>
References: <cover.1783680864.git.naseefkm@gmail.com>
 <68e85666b6dfedab719aaa388450eb86312eccd0.1783680864.git.naseefkm@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="neuiONwNeDF1oEBK"
Content-Disposition: inline
In-Reply-To: <68e85666b6dfedab719aaa388450eb86312eccd0.1783680864.git.naseefkm@gmail.com>
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

--neuiONwNeDF1oEBK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 02:54:23PM +0400, Ahmed Naseef wrote:
> The EcoNet EN7528 MIPS SoC integrates an MT7530 Gigabit switch,
> memory-mapped in the SoC register space like the built-in switches of
> the MediaTek MT7988 and Airoha EN7581/AN7583 SoCs. Its four user ports
> are connected to integrated Gigabit PHYs and its CPU port is connected
> internally to the SoC Ethernet MAC.

Please note what actually makes this different from the other devices
such that it cannot use a fallback. It's not clear from this description
if the described features are shared with other devices or unique.
pw-bot: changes-requested

Thanks,
Conor.

>=20
> Add the econet,en7528-switch compatible, with the same constraints as
> the other built-in switches.
>=20
> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.ya=
ml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index 815a90808901..90b3582b7619 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -100,6 +100,10 @@ properties:
>            Built-in switch of the Airoha AN7583 SoC
>          const: airoha,an7583-switch
> =20
> +      - description:
> +          Built-in switch of the EcoNet EN7528 SoC
> +        const: econet,en7528-switch
> +
>    reg:
>      maxItems: 1
> =20
> @@ -318,6 +322,7 @@ allOf:
>              - mediatek,mt7988-switch
>              - airoha,en7581-switch
>              - airoha,an7583-switch
> +            - econet,en7528-switch
>      then:
>        $ref: "#/$defs/builtin-dsa-port"
>        properties:
> --=20
> 2.34.1
>=20

--neuiONwNeDF1oEBK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCalEbOAAKCRB4tDGHoIJi
0kIhAQCUBiplgyxEntk6QyhZt9CXKwFJOJ7gva/4BQwVdFxyiwD8D6hZszUurWV/
K0wbb9440qRylthWGC8R34zydOrj4QE=
=0iY3
-----END PGP SIGNATURE-----

--neuiONwNeDF1oEBK--

