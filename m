Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2285CD6E2DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XJjLZdefB3rFjATsz57WhyB21r3EJBYz8JYK0SddZl4=; b=RpTZ0DfUCJZM/VR9M+b3uxxuLN
	u/vfALLiXJ5S/8lDxW5MKLJCOEcrXQ8RJAjlEhHnTovl53UPduiiVhR4aO59tUov24/Zu3b3F8r2b
	aOfrcE3LRpAKddMIkUjKkVgkUUFmCFT4JFl9edqAvlGjl7Izo0TPggnMxZM2AwaiKrHNpQQ8M3OBw
	z3cOfEZi0tsGBIhRw2Gd++AFcLt44T5tr4RwqSzg6VAeDpPs0lcqQk/Xh2ibRbYpT3okyOyIwI+X/
	9kFtOlEOpEMJpDkQdvWKoBKQMb/p4t9mLXkrrjW0IPc1/099geicN8x4duryRe4jc00ZXVUpq2/j+
	InmIn8Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJpi-000000096VD-03bE;
	Thu, 18 Dec 2025 19:38:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJpf-000000096Ud-3Q61;
	Thu, 18 Dec 2025 19:38:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EC8F044425;
	Thu, 18 Dec 2025 19:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC84C116D0;
	Thu, 18 Dec 2025 19:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766086718;
	bh=XJjLZdefB3rFjATsz57WhyB21r3EJBYz8JYK0SddZl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aE4uGfGSE1RZd+bmVNuLg6Qrcu3P+HfwD3boH2MpXLW/ZLWvns5bEUicKNpGgS9D/
	 Rnh6be4JCCHnyuq6KKSyDyQIyDnW4UrxRC9fz98lUh8/2LKCPdMzOu/p29S4Cyhrke
	 1dJGsFbYd8DE6yR9YGV/d1YIxa/fRnw4Apf7xJIo3d3wFQiqv+zem5QqChFg/0aJId
	 64FXhXwB1WepTSTVT457ZUQfw7tQq6D3qZYJeWkqkUx0M/FE8KHD3NDovVqT+THutA
	 2stygJ9bNzUFL5tcnPh9nm7DMmjhYlmxCfWR80/RZ7XwQN+IhuwMZ1hNRJDLq19PHN
	 uek0BBTTyNPCg==
Date: Thu, 18 Dec 2025 19:38:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chaotian Jing <Chaotian.Jing@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 02/25] dt-bindings: ufs: mediatek,ufs: Complete the
 binding
Message-ID: <20251218-vineyard-exalted-08fe7d9bcb55@spud>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
 <20251218-mt8196-ufs-v4-2-ddec7a369dd2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e36ubsezNTceBFN4"
Content-Disposition: inline
In-Reply-To: <20251218-mt8196-ufs-v4-2-ddec7a369dd2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_113839_920001_E55AF849 
X-CRM114-Status: GOOD (  25.93  )
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


--e36ubsezNTceBFN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 01:54:52PM +0100, Nicolas Frattaroli wrote:
> As it stands, the mediatek,ufs.yaml binding is startlingly incomplete.
> Its one example, which is the only real "user" of this binding in
> mainline, uses the deprecated freq-table-hz property.
>=20
> The resets, of which there are three optional ones, are completely
> absent.
>=20
> The clock description for MT8195 is incomplete, as is the one for
> MT8192. It's not known if the one clock binding for MT8183 is even
> correct, but I do not have access to the necessary code and
> documentation to find this out myself.
>=20
> The power supply situation is not much better; the binding describes one
> required power supply, but it's the UFS card supply, not any of the
> supplies feeding the controller silicon.
>=20
> No second example is present in the binding, making verification
> difficult.
>=20
> Disallow freq-table-hz and move to operating-points-v2. It's fine to
> break compatibility here, as the binding is currently unused and would
> be impossible to correctly use in its current state.
>=20
> Add the three resets and the corresponding reset-names property. These
> resets appear to be optional, i.e. not required for the functioning of
> the device.
>=20
> Move the list of clock names out of the if condition, and expand it for
> the confirmed clocks I could find by cross-referencing several clock
> drivers. For MT8195, increase the minimum number of clocks to include
> the crypt and rx_symbol ones, as they're internal to the SoC and should
> always be present, and should therefore not be omitted.
>=20
> MT8192 gets to have at least 3 clocks, as these were the ones I could
> quickly confirm from a glance at various trees. I can't say this was an
> exhaustive search though, but it's better than the current situation.
>=20
> Properly document all supplies, with which pin name on the SoCs they
> supply. Complete the example with them.
>=20
> Also add a MT8195 example to the binding, using supply labels that I am
> pretty sure would be the right ones for e.g. the Radxa NIO 12L.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--e36ubsezNTceBFN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaURYNwAKCRB4tDGHoIJi
0q7sAPsEFBYWe7WteUvYRPLscugO7jF/qeqwh5oNpsK5iTFYHgEA4FfIV6OJUU/h
uy3jGyM2gNo0F1otONhbNZUky5Matgg=
=JyRf
-----END PGP SIGNATURE-----

--e36ubsezNTceBFN4--

