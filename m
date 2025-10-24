Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9D2CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 17:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=STF0BVLwmmf2zdCzGMSd1qWpVlVaamPq3/R/Tnll1sQ=; b=D4/4G8Eth00VWr3/Jtea2s7HKf
	tw2DR3bA3ATd0fHEvirAB990cHdW/Z/ux9B6AlJ5IKu6O+9xcDvG+NswlVuozO6M572O+meExp7x7
	7lOr+Dwv+XX/OBwq0HNV1QTghow9aTdtuYeHxIIP1AdqjqYw0c2Tbpag1el7ftnLkdVqR00YZssTI
	UF/HZY0dhTxaOmMHjdKTcHyQ+4ei90N6oQjSszGeMiUMjL4eZGLzir+s+ZOjyIQbynbJvnlOxpUZM
	xBP0OOrbR2GuN6bZ8X+NlLjWoCcTlBhHpeKmtgwDfpBbw5pMAvyl1mhWLaFe0jZyntEC7oPVobF7X
	6dApIZuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLXX-0000000A72x-4AAo;
	Fri, 24 Oct 2025 17:25:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCLXW-0000000A72j-2I1q;
	Fri, 24 Oct 2025 17:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80D116023A;
	Fri, 24 Oct 2025 17:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B243C4CEF1;
	Fri, 24 Oct 2025 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761326721;
	bh=STF0BVLwmmf2zdCzGMSd1qWpVlVaamPq3/R/Tnll1sQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Szb7hdPf01uCg3+8lRVJjUaLS94amyMOEba4c6fbtsuZ+Lswn4FxBwm3IPNgOPnxh
	 Sw0uAuH0hcFCwSglKvLZEu6h37x64j209uSByxGjLrNalULmeoVVrraTI0WOfeF3li
	 ldKSQ53t5hEcDwLl7lvSnXAV5uF111Yk4n4cbaqplJ/vIKecMW+G9Ck8yBxPdA1WTz
	 vK+vFPESLgp7O4C6fQD7Poo3x/g2jxiI5580vQxrW4BUHh+Blpm3e6H8Qjac9qOWV1
	 Vqc7lE7BM1rDwwwHFt2e+McnG6opy7mLntTuqQ8VHDVtXuZjiKfwQNOCC/c0SROlWX
	 KhjE1ESUF77Dw==
Date: Fri, 24 Oct 2025 18:25:14 +0100
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 02/24] dt-bindings: ufs: mediatek,ufs: Complete the
 binding
Message-ID: <20251024-excavate-reprint-a9eb3cbb061f@spud>
References: <20251023-mt8196-ufs-v3-0-0f04b4a795ff@collabora.com>
 <20251023-mt8196-ufs-v3-2-0f04b4a795ff@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V451Z6sNr8QduRRg"
Content-Disposition: inline
In-Reply-To: <20251023-mt8196-ufs-v3-2-0f04b4a795ff@collabora.com>
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


--V451Z6sNr8QduRRg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 23, 2025 at 09:49:20PM +0200, Nicolas Frattaroli wrote:
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
> required power supply, but uses a supply property from ufs-common.yaml
> that can be either 1.8V or 3.3V.
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
> supply, and what voltage we understand them as. Mandate vcc-supply-1p8,
> as vcc-supply appears to always be describing a 1.8V supply. The
> ufs-common.yaml vccq/vccq2 supplies are used for this purpose, so that
> common UFS implementations which do power management for these don't
> have to treat MediaTek's 1.2V supplies in a special way.
>=20
> Add the missing avdd09-supply, which so far only mt8183 uses.
>=20
> Also add a MT8195 example to the binding, using supply labels that I am
> pretty sure would be the right ones for e.g. the Radxa NIO 12L.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Thanks for doing this.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--V451Z6sNr8QduRRg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPu2egAKCRB4tDGHoIJi
0lNNAP0VC19k2rBRz7i8IHf9X3g1JTxqMMzVR3u32lMao5ckHwEAhMXWoRLsRBM+
T4cDM7d9lAcfhdyafCjXMKxMlrhkNws=
=fNHc
-----END PGP SIGNATURE-----

--V451Z6sNr8QduRRg--

