Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE2DC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25yiAMZ/1b9W5h2xLR5CigmM3pn7DC+Zp5Nh2UiqgXM=; b=3/3ck88qqj3Cuy36NT9FwHskrr
	unkakQyMtYxtMwvCkmxJwvfJsHCfqV0SwCpJPXmxdgPm4/z7hggstse+fFzWA9HKEdszq98oS5gQ4
	LYaeDlb7j49ThBD5aBkb0mKoeYS3ezxKIFL2e7TY7eNuPV0MOV6Yl9lLCL3u0U4h8k3QV+1OAxM5X
	621JofT9AyOmghzrAHbsDQQn2uXlnODzItcRR7KKmNg4U+EHxtPHyPj/gAOzbF3l11WdQc7/hkpJM
	fF0Bm4FpQ49bTBDN27r8FQQcWQxgJ2e51Jfk5mpcwbbDDMYWUadpfFywXHpKkzbT6OOQDPyiayaai
	waVNkeRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjwe-0000000Ds3J-268a;
	Tue, 11 Aug 2026 10:42:56 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjwc-0000000Ds2s-0lxu;
	Tue, 11 Aug 2026 10:42:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786444962; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UDgpdepGLc+/s96UhWWfyxvqKzKcX+Rkee+5j0s/Dw4qEOz1NP7pFaHpnng0oKcFXekb55gkvKHWg1U916TcWJwtRvD04v3g24O0+5gTnQDTp/KrkZbFSUB7brQ+ZVZOjt8nhqIYOspNhN5AOdtJSYJju7/hzKK4XwTjKonU+tc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786444962; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=25yiAMZ/1b9W5h2xLR5CigmM3pn7DC+Zp5Nh2UiqgXM=; 
	b=YJr8HehQbHbqjk7WXfPnVjwP3iyMOf2UDihyQClirwEeelYG6Z5NxoBVdpYwdvR0o4PSDiL1Zj0M0/CyXleIqhw2BL07xbdC/WKV6DTjONDGuIiarRmJRFY9SYoMffWzd54EO5SBA/HmjCaT7BZ/XFlFd2z0xCKr/fH089WpUdc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786444962;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=25yiAMZ/1b9W5h2xLR5CigmM3pn7DC+Zp5Nh2UiqgXM=;
	b=RW7NwS9MiymfTmzMxABWzWGWaapHmGDM7YfPyLk156EYOmFQAzFondjDAODAZEaw
	w4Ilh3PBS7e4ZuenkGmpCs8YUP6etoIH471fUXIgHV61HIf89nSiRIUCpZ4zBHp2KWC
	b5+194SY6uvmaXoZGV7iczHB/IixHDoOPtLERUbs=
Received: by mx.zohomail.com with SMTPS id 1786444959879540.8535890370583;
	Tue, 11 Aug 2026 03:42:39 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 2B83718025E; Tue, 11 Aug 2026 12:42:36 +0200 (CEST)
Date: Tue, 11 Aug 2026 12:42:36 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Cole Munz <Munzzyy1@proton.me>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexey Charkov <alchark@gmail.com>, 
	Alexey Charkov <alchark@flipper.net>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: rk3576: add cache hierarchy
 information to CPU nodes
Message-ID: <anr6ryIsMg84w-ei@venus>
References: <8a8f808a4c7b8325bc253add15e51b396a7d62d1.1785260742.git.Munzzyy1@proton.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c4glmvlaj5ehl2ro"
Content-Disposition: inline
In-Reply-To: <8a8f808a4c7b8325bc253add15e51b396a7d62d1.1785260742.git.Munzzyy1@proton.me>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/286.434.97
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_034254_265773_4CADC57E 
X-CRM114-Status: GOOD (  20.14  )
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


--c4glmvlaj5ehl2ro
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: dts: rockchip: rk3576: add cache hierarchy
 information to CPU nodes
MIME-Version: 1.0

Hi,

On Tue, Jul 28, 2026 at 05:46:14PM +0000, Cole Munz wrote:
> The RK3576 CPU nodes carry no cache properties, so cache_setup_of_node()
> fails with -ENOENT on the first CPU. That error propagates out of
> cache_shared_cpu_map_setup(), which discards the topology arm64 had
> already derived from CLIDR, and the boot log gets
>=20
>   cacheinfo: Unable to detect cache hierarchy for CPU 0
>=20
> Add L1 i/d cache size, line-size and sets to all eight CPU nodes, plus
> per-cluster unified L2 nodes wired up through next-level-cache. Sizes
> come from the RK3576 datasheet: the Cortex-A72 cluster has 48KB L1 I and
> 32KB L1 D per core with 1MB of L2, the Cortex-A53 cluster has 32KB L1 I
> and 32KB L1 D per core with 512KB of L2. Line size and associativity are
> architecturally fixed per the Cortex-A53 and Cortex-A72 TRMs, so the
> *-sets values follow as size / (line-size * ways).
>=20
> With this applied, lscpu reports the full hierarchy instead of only the
> level, type and shared_cpu_list:
>=20
>  NAME ONE-SIZE ALL-SIZE WAYS TYPE        LEVEL SETS PHY-LINE COHERENCY-SI=
ZE
>  L1d       32K     256K    4 Data            1  128                      =
64
>  L1i       32K     320K    2 Instruction     1  256                      =
64
>  L2       512K     1.5M   16 Unified         2  512                      =
64
>=20
> Tested-by: Alexey Charkov <alchark@flipper.net>
> Signed-off-by: Cole Munz <Munzzyy1@proton.me>
> ---

I've checked the numbers against RK3576 TRM and ARM information.
Looks all good to me:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Greetings,

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 74 ++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/d=
ts/rockchip/rk3576.dtsi
> index e12a2a0cfb89..656513aa999f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -117,6 +117,13 @@ cpu_l0: cpu@0 {
>  			dynamic-power-coefficient =3D <120>;
>  			cpu-idle-states =3D <&CPU_SLEEP>;
>  			#cooling-cells =3D <2>;
> +			i-cache-size =3D <0x8000>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <256>;
> +			d-cache-size =3D <0x8000>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <128>;
> +			next-level-cache =3D <&l2_cache_l>;
>  		};
> =20
>  		cpu_l1: cpu@1 {
> @@ -129,6 +136,13 @@ cpu_l1: cpu@1 {
>  			operating-points-v2 =3D <&cluster0_opp_table>;
>  			cpu-idle-states =3D <&CPU_SLEEP>;
>  			#cooling-cells =3D <2>;
> +			i-cache-size =3D <0x8000>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <256>;
> +			d-cache-size =3D <0x8000>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <128>;
> +			next-level-cache =3D <&l2_cache_l>;
>  		};
> =20
>  		cpu_l2: cpu@2 {
> @@ -141,6 +155,13 @@ cpu_l2: cpu@2 {
>  			operating-points-v2 =3D <&cluster0_opp_table>;
>  			cpu-idle-states =3D <&CPU_SLEEP>;
>  			#cooling-cells =3D <2>;
> +			i-cache-size =3D <0x8000>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <256>;
> +			d-cache-size =3D <0x8000>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <128>;
> +			next-level-cache =3D <&l2_cache_l>;
>  		};
> =20
>  		cpu_l3: cpu@3 {
> @@ -153,6 +174,13 @@ cpu_l3: cpu@3 {
>  			operating-points-v2 =3D <&cluster0_opp_table>;
>  			cpu-idle-states =3D <&CPU_SLEEP>;
>  			#cooling-cells =3D <2>;
> +			i-cache-size =3D <0x8000>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <256>;
> +			d-cache-size =3D <0x8000>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <128>;
> +			next-level-cache =3D <&l2_cache_l>;
>  		};
> =20
>  		cpu_b0: cpu@100 {
> @@ -166,6 +194,13 @@ cpu_b0: cpu@100 {
>  			dynamic-power-coefficient =3D <320>;
>  			cpu-idle-states =3D <&CPU_SLEEP>;
>  			#cooling-cells =3D <2>;
> +			i-cache-size =3D <0xc000>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <256>;
> +			d-cache-size =3D <0x8000>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <256>;
> +			next-level-cache =3D <&l2_cache_b>;
>  		};
> =20
>  		cpu_b1: cpu@101 {
> @@ -178,6 +213,13 @@ cpu_b1: cpu@101 {
>  			operating-points-v2 =3D <&cluster1_opp_table>;
>  			cpu-idle-states =3D <&CPU_SLEEP>;
>  			#cooling-cells =3D <2>;
> +			i-cache-size =3D <0xc000>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <256>;
> +			d-cache-size =3D <0x8000>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <256>;
> +			next-level-cache =3D <&l2_cache_b>;
>  		};
> =20
>  		cpu_b2: cpu@102 {
> @@ -190,6 +232,13 @@ cpu_b2: cpu@102 {
>  			operating-points-v2 =3D <&cluster1_opp_table>;
>  			cpu-idle-states =3D <&CPU_SLEEP>;
>  			#cooling-cells =3D <2>;
> +			i-cache-size =3D <0xc000>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <256>;
> +			d-cache-size =3D <0x8000>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <256>;
> +			next-level-cache =3D <&l2_cache_b>;
>  		};
> =20
>  		cpu_b3: cpu@103 {
> @@ -202,6 +251,31 @@ cpu_b3: cpu@103 {
>  			operating-points-v2 =3D <&cluster1_opp_table>;
>  			cpu-idle-states =3D <&CPU_SLEEP>;
>  			#cooling-cells =3D <2>;
> +			i-cache-size =3D <0xc000>;
> +			i-cache-line-size =3D <64>;
> +			i-cache-sets =3D <256>;
> +			d-cache-size =3D <0x8000>;
> +			d-cache-line-size =3D <64>;
> +			d-cache-sets =3D <256>;
> +			next-level-cache =3D <&l2_cache_b>;
> +		};
> +
> +		l2_cache_l: l2-cache-cluster0 {
> +			compatible =3D "cache";
> +			cache-level =3D <2>;
> +			cache-unified;
> +			cache-size =3D <0x80000>;
> +			cache-line-size =3D <64>;
> +			cache-sets =3D <512>;
> +		};
> +
> +		l2_cache_b: l2-cache-cluster1 {
> +			compatible =3D "cache";
> +			cache-level =3D <2>;
> +			cache-unified;
> +			cache-size =3D <0x100000>;
> +			cache-line-size =3D <64>;
> +			cache-sets =3D <1024>;
>  		};
> =20
>  		idle-states {
> --=20
> 2.55.0
>=20
>=20

--c4glmvlaj5ehl2ro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmp6/JgACgkQ2O7X88g7
+po1nw/9G+lG+42+fXZrm08LTFL00t1oNw8LoUhYPM+7n6UwbDJfVEN40XawgOz4
PDKyg/DwYSATccqFdg9YbankJU3hzs1WB6WVto0grv4XkGnn85BMsDp5QO7N1eGW
zDgMQbFbaSTQrHBYsJFAGASWMJcL3i1rxQIX0F0rmCEDlVqUgbHdmO43OsiwyRdH
MVYpIdInKx/xLxpo/z0C5ZMNp5NlfIJ+qYvpJmYOEiFjKzgU6TK+he1+nMM867DH
KCi9eg8GQ+wmITjOaWM1Z81Hs8i/Ntte5YODMcHPt9YDBRiE/Ry0hX3E6ThUCIc6
ti8apfBqFT390KhrNCdlRg6PPx7jlHhunBPffpu6cPEWS5cLba8X/zjaab3ugrlD
jsobXYRcVOxlvIjfb+RnfLqCC0cqYUSZPkSbTffnye0wpl05sbh1y8eBZNtmksNN
L2LObbm8SeDu8YksIdLxnXOAYoLDEhIO3Csj43tU6BKHpDnHVLg7uSSFkeKu2+6c
Gv3Nzo1EATkB9ii0aoXrnDkZb8/3Rh+kCV0g2PDtdi5560UbcfwLl3UMYMyfLp8o
u29D+J/VTtrzxODN8PY+OufE90jjyWZNXfjEo50YkjZwsvl9/e4c/2bzORP52Bnv
c3w1lXhoEgqqtxuE4aEdsC6ORLBz+Oaaf+0BguB7/JsxobjKyYs=
=K2VW
-----END PGP SIGNATURE-----

--c4glmvlaj5ehl2ro--

