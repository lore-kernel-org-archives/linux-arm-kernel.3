Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B95C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 16:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzAQATy54vCpkwt37K9i8fVvLuJ9F3HtOZNJF5NfmuI=; b=f9CbwqWoHL+cdAHwS3plEqKrEN
	/vxtb07aKBV42vTpDZpPoJSXJCS4KmXsqwUjrw1lFPIhucv5R52KzVnr99Udf/LuG954SU3+OjuO7
	bToCZqzby+0OCA0fPd9EyyGk+yAsrdX6Y2pxFL32+c+C/2di7Re2fP9FQBtd/Z0EUuIMrL0ZscKHi
	/HMgTTbqYZTD+G3gJKDxOdRadhwTSMrxB7E8EAhEtfaqsspkJZSgnFo58eGwhqwkhzS3rtr7ILXqB
	bwI7D9oX8t4EJKEmgtPQX9enEA9zRLllvaoKCneORRCud90NXhlULAIi1RwxuwED9zTrS02RAzLzV
	O88XIMAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3HAh-0000000ELkv-2TJf;
	Fri, 11 Apr 2025 16:24:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3H8s-0000000ELVa-2OZ8;
	Fri, 11 Apr 2025 16:22:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3469968468;
	Fri, 11 Apr 2025 16:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B53EC4CEE2;
	Fri, 11 Apr 2025 16:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744388528;
	bh=wzAQATy54vCpkwt37K9i8fVvLuJ9F3HtOZNJF5NfmuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUDwvmlmGNEOE6UiCuFajisN/+N0W4PsppgK3YKQxxblTRgJXcyGl2fDX3uKbdkJr
	 2+V+sMZvOsWOB80R99rxGcKZe/jhqzm0hntMRCAIy4yRtUp3Z4QdbvxGA5YqfA03A3
	 rYUgo1Y+GdFxYB1N83XbBdrM4GXSFVjUhy41gNQt4vi776Nz1z2pujd5vBTWwcchh0
	 LwBeY4i9+9HM515v7PIK0hiLxAtE6fjRjKg39JQ2sB/mENgOkt6gYw9FHfBK8gy26+
	 5tArMU4Hk5fUZbPjg7m9cwn4VJ8htSVvHAG7uy6YUzsnNBC5x0t8iefCYpo59D3X6t
	 SfC0haIi7PSxQ==
Date: Fri, 11 Apr 2025 17:21:58 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 03/17] arm64: dts: microchip: sparx5: Fix CPU node
 "enable-method" property dependencies
Message-ID: <20250411-ebay-exerciser-392c42daf5ba@spud>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
 <20250410-dt-cpu-schema-v2-3-63d7dc9ddd0a@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gXwATB6SbIWbLkFw"
Content-Disposition: inline
In-Reply-To: <20250410-dt-cpu-schema-v2-3-63d7dc9ddd0a@kernel.org>
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


--gXwATB6SbIWbLkFw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 10:47:24AM -0500, Rob Herring (Arm) wrote:
> The "spin-table" enable-method requires "cpu-release-addr" property,
> so add a dummy entry. It is assumed the bootloader will fill in the
> correct values.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
> Tested-by: Daniel Machon <daniel.machon@microchip.com>

This is already applied, guess I forgot to merge it into the branch that
appears in linux next. I'll do that now..

--gXwATB6SbIWbLkFw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ/lBpgAKCRB4tDGHoIJi
0h05APsEcaA5n4MeMUDF1Ullyde98iLkYYAFaHTFR+km537NdgEAxwuhCZvt2UZz
n9hkciE6jwyE29jkNaUkkhNiH534NAA=
=8lEZ
-----END PGP SIGNATURE-----

--gXwATB6SbIWbLkFw--

