Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57DE2C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 07:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G4xKySEczjJKlV50yKNxN3atJelGibN9yGRp2vrzooU=; b=xRkysfRT6Ne/81gE0JVzMgb3/a
	R6fdt0a6T40NC4Q8PTjN13QGBrWMTj1CV7Q6j2gtBMO9vtGJYTRNury4JRF/enXxmyglLYEXhxJvm
	6/rZ/CdnSbc3mAnYtioTeK0hqpRNzh2K8NeuqS0EyxyI8KKmbFDC7tKGlTW1b5nfptyTdChmZ5S9z
	5QXENRyWSOT/ABcARvnlilA+fbofUVroHE1wViD15J0kMJQ8G2ulaQAPTypRM9OM37xA+gvcSZcpX
	ru40stbwiZFfy4Ib37MXEvjACO9OcOlugihIhhyFl2RflDyTb0bUq10QVMCjBZfaD731bBfnRO2GR
	sb0TBxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVlI-00000003NQ7-086l;
	Wed, 05 Aug 2026 07:10:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrVlF-00000003NPI-2Xut;
	Wed, 05 Aug 2026 07:09:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C909040DC3;
	Wed,  5 Aug 2026 07:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25AE1F000E9;
	Wed,  5 Aug 2026 07:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913795;
	bh=G4xKySEczjJKlV50yKNxN3atJelGibN9yGRp2vrzooU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QijWH5jeUl1w3T5g/U+UIRCah49Z2j7Fro2KNIi5knm8wE+WmgJb6hGUiRVerdGwr
	 Ir8mUr5npj+GJC4wq+Ddcm9vaUKQdhJhbTnZFX8ormAiQ+dEw8AUDgpdklRzaVldbb
	 oCemOovogmvlD5ylxpMFMG+ZDbIYebv1laShUx+ALlOCREK2sEa+Q/ggvRhCHvWpYf
	 l9kF/yp20fPNWJmXCP/o0gGnAc1AaoJnnV9jMURR95QVRRK0WuWTvNKHI2s04Ixysc
	 aJ/AGOZWu5bLJBQCj7vzHBLjlZk+y9cAxs8feAgM9/26bgpib1GXGwOOKVJkuTN+oV
	 A8f6vmg5sZEnA==
Date: Wed, 5 Aug 2026 09:09:53 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
	Matthias Fend <matthias.fend@emfend.at>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 7/7] ARM: tegra: Convert to new media orientation
 definitions
Message-ID: <anLhnbJ3h4G792uq@orome>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
 <20260804-kbingham-orientation-v4-7-336998dd63b4@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="njba5wbvog4atzxq"
Content-Disposition: inline
In-Reply-To: <20260804-kbingham-orientation-v4-7-336998dd63b4@ideasonboard.com>
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


--njba5wbvog4atzxq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 7/7] ARM: tegra: Convert to new media orientation
 definitions
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 08:43:34PM +0100, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the nvidia device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
> v2:
>  - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

And if the plan is to merge these through the media tree:

Acked-by: Thierry Reding <treding@nvidia.com>

--njba5wbvog4atzxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy4cEACgkQ3SOs138+
s6GX7xAAiUn50cg1N3IYryCjW1HFvtOEELAbn3WbEabsf8ChY6p27lszsD2u1SWA
ljxp3aiozUzCDwS4rO/auUa1ubQ4YRFi+KmviEMAaNlx+odGBEP9OmYdo8CsKq78
8+xxglQ3WizUEMIc0B7j8IVwUsAvE32qOnrr56XTx1YaqrA66BNENIq9wlURELrw
bh40y7Cc+hRdum3b85woDbChECrG6q3Y0JFQQuZovQvs/bhWJ27/Z1ILLVkjy5pD
Ases5xrdbEn7iYc2w80khRpu4aqUycjsCBf6E/bYZj/2TDHK6ir5W4wpB6E00E5D
AuQo8CmAW+l5aWJDbfBcBPC3xcduHHH9D4dGpO4Cd52Yntu9cgDmfTk+kEgHJ6EC
adEIuD3pHuqgQWSpOUfSlGFNDq+HhUpXZWH2lx/abGSyjcydQE+urtU3XQilKpOk
j+Lq191FrKk7epLKNrqklsyKV3xNIBZnkLIb0SxVV9SCWs4qdoRWN9gfHB3VmaL4
kR2WQrc9xpnabF+v0Mele7z45YdHdoHY/5ttfZAdm53Q1/Zgz058i8Unn5U9GVDM
pqt/pJjTGqKKn8Z2AHRe2zKw9S4dDTDSybfzC8RdjE5OB8TKjKyjumwpkxGiIUIn
jogEFjQcRrmyO5tbZ96lii8IL9M+aMr5EeyMpcrJJaxZRSV3cGg=
=n6SN
-----END PGP SIGNATURE-----

--njba5wbvog4atzxq--

