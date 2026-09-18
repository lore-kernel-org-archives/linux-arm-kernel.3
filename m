Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D22C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhbCvqkLOCxtGzOowJm4ZGkHasZqPYRgd2nxTv+Iq1c=; b=ub9hyvJYCvn+ijuZBBWGEQfHmk
	tHFeEtZ2NYJFNAnG7VjL8zRXXxS6j/s8vM+lcFF6xkCpMkv5V4feryOmG4vSRv/ob6nnAxqOfwswK
	4+EZpBjcQqVCii9DcBHDrVmNY0ujqvTbfFkvrVN1LmLUr9j096SqTCEl5ktNf9yfq7XiA2ATcn2IB
	/ZX7QJIRCOEOJYNcijiAOC5Y2V9lkn2bQbJuPiPWIDXlYDV1dQkj8ciYvrrX8ju8p9oGLHn7Qr59y
	I/rFt8uFwnuypFIQStGeyCW56AFUUTe0E/7sNqQLygNrJ8dtOnOWKktog6e8o30A2i4I6iO7v2iwE
	LeHWEzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Y5v-0000000EPuf-1ZQQ;
	Fri, 18 Sep 2026 12:53:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Y5t-0000000EPuI-3pu4;
	Fri, 18 Sep 2026 12:53:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 554A6438AB;
	Fri, 18 Sep 2026 12:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EE3A1F000FF;
	Fri, 18 Sep 2026 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789736013;
	bh=AhbCvqkLOCxtGzOowJm4ZGkHasZqPYRgd2nxTv+Iq1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CuplAGqVtJZdmud8CyZGNsl/qs2GWmdR6czxDZ2jw0vwGg/ayErIbymm+Ry13KAGo
	 suIRlrFmSSVNQeqx2BA1psr5xa6dWq6tksDkglD0i5/iGbQbZHLrQOvqLYK9S/lsGq
	 d9N9Lx84bgL9Vt3Hi1NeWyot0F/mXX1NjyALsHvud7ls2nGbgbn9K086rBHa1E3QUz
	 xGbn0i6EvsZPan0Sta2UfkhAL70x+h6mPv/24+mQ38z+w8HznjIB/Xt/4OZsU01on5
	 e5E8GuePKMouhslFmufgVyKMyN1SdL85j56/5ZSM6ULl/J9cTte8sy8ZvPNqymOSTi
	 bz5HAbXOQwIog==
Date: Fri, 18 Sep 2026 14:53:31 +0200
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
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Convert to new media
 orientation definitions
Message-ID: <aq00O6B6a97-U1zq@orome>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-2-5e8b1f01be29@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ubntogsuc7im7b3l"
Content-Disposition: inline
In-Reply-To: <20260918-kbingham-orientation-v6-2-5e8b1f01be29@ideasonboard.com>
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


--ubntogsuc7im7b3l
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/6] arm64: dts: qcom: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 11:44:14AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the qualcomm device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
>  arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)

With or without the extra hunk:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ubntogsuc7im7b3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqtNEoACgkQ3SOs138+
s6GLNA//fHK7Y+AcCJBPVlFMVGbPQEPy6hKVsG38sPnye/va/IBn/nm0LH7cp9t/
ba0iH5ljhyqOnElNahajerFyiCYFTF4Ec8ZUMb9rmM8aHeBNzNRxIGZjUhh58HOi
MPftYh+LbMdliAuPfCEaa5ncdmF2K/DbD4MQmYq0J+YULJoQ8dC7IuXBBd8E3gdE
KrfpxbVQVDSr3Sc8e9D8UFnA4Wt1GyE6UKthfdH3o8H5/CTRkBonBAz55bkEYIlK
KrKP3g0f8490YgANlSTDWvEz1DIz2oXhmMnoQRQy5M8zAubwj3GeIy1NeiM9liGp
bGUmtparCp1u9Cn9hrTA2AlXztOhWyGuPyVX5LMJH8cHX/Nuv4eKB3gBfapTr3bG
jcKZQggT/itoT8CYm9YEynf/7+yxi8GZjA760Ok9b1Ffqc2gzbGjb/0rm1312wM3
m402Ewgs7caQZMTfLkN+m4okE9lXyrspzRtEqEdhg2tI/Dw19vMPclLnH649xlBi
+IlEQf1iE8GN8/rKps49s8IQg5H01w8YnZLl+/E3/ZdZUu/wvBQLka05RkAEARq1
RkiwqQFUSd0meo+yni1Knh4nwCB4JPSHVNRs0IOCg5lv1hK16zh/NbeWySRW+hQK
kzdyL4SbmI18Gj82ytYE7DgqdfogX3H+zmf8gSTdgqeT3xLOoIY=
=czZS
-----END PGP SIGNATURE-----

--ubntogsuc7im7b3l--

