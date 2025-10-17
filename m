Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E2BCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hH7dF9cQAKchmw5u3mniBQjr14Sz8+exCeFEIusrxh4=; b=ELQZQM9BpFphmojND9Dc0I1/KZ
	2VS56ZxtERLjcGLFij93WYMTDPzfIggGL7tgqd0SpV9xRhPCk5Mn4awOYp/Dujpdu8VOqFb0Psjli
	C//VfmSLN0V2q2CUqXH8mAz86rwm9PebUavwuCyU2aFZU82SI0tcDQwrMFSOfW24a39+ShB1BiJOC
	aXzRPHJzwaxzodDjTnZFvWDYOB2BDkNlpJ6/OxBpyNL4xKF18AeGB7wUlotFjc492lsAb0nU9VWwM
	pzwHZJiqVHbCzFvS+gvHUbIRpiDYPtgTBVllWVdsXeKTPqpE1I4O2KFm+XBJ67BBDx37N85eRY0pU
	5mXuXvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9max-00000008J2w-3SYh;
	Fri, 17 Oct 2025 15:42:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9maw-00000008J2g-1jwL;
	Fri, 17 Oct 2025 15:42:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D18AA64622;
	Fri, 17 Oct 2025 15:42:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1137CC113D0;
	Fri, 17 Oct 2025 15:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760715737;
	bh=hH7dF9cQAKchmw5u3mniBQjr14Sz8+exCeFEIusrxh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KMluMiL5QoCe7NxG9pTDm3lGLS/3U5xqQFUCnxWm0DoLLTuuUJadY6q0V3lhTUjsO
	 gPBwjhIfAHmmhqf4CHufb+JXCBYBAmyym6CFW6SRyBDtiWwqU07+r3jWcY+Xt/tUhd
	 YOdzbe45XsTy7ei8kWhzxU4stCxVOpssx9WHvH1veZoMjle8Ay3qD23l3qd7N/d7jf
	 prACDTrxQAOnWMfoiDNG1gFHA1a7RzyCsz/zqzyA2tczpnjOQRqOJqEemnL1vOrcpF
	 NL1ADDkF/ZRQsFuYew43aqmuVAM80DDEEmzBwfZUuTL+Ujniwg5GqEtdP+mVDWT/IO
	 R3Y1XtUbvlHTA==
Date: Fri, 17 Oct 2025 16:42:10 +0100
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
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: ufs: mediatek,ufs: Add mt8196-ufshci
 variant
Message-ID: <20251017-remnant-spud-a2a21c2385e6@spud>
References: <20251016-mt8196-ufs-v2-0-c373834c4e7a@collabora.com>
 <20251016-mt8196-ufs-v2-1-c373834c4e7a@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GINMMiGuzGFK5NYP"
Content-Disposition: inline
In-Reply-To: <20251016-mt8196-ufs-v2-1-c373834c4e7a@collabora.com>
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


--GINMMiGuzGFK5NYP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 02:06:43PM +0200, Nicolas Frattaroli wrote:
> The MediaTek MT8196 SoC contains the same UFS host controller interface
> hardware as the MT8195 SoC. Add it as a variant of MT8195, and extend
> its list of allowed clocks, as well as give it the previously absent
> resets property.
>=20
> Also add examples for both MT8195 and the new MT8196, so that the
> binding can be verified against examples for these two variants.
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

I provided a review on v1 of this series yesterday, although I think
after this v2 was posted.
https://lore.kernel.org/all/20251016-kettle-clobber-2558d9c709de@spud/
I believe all of my comments still apply.

pw-bot: changes-requested

Thanks,
Conor.

--GINMMiGuzGFK5NYP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPJjzwAKCRB4tDGHoIJi
0nLnAQCslCfZeTa+X+DOAoIqdM8SHSTrhRFTAANagkMF0n4O0wD9GLihTxkbKovz
a0mrB8+Q494nk9NX6yCVg7GZYid3yQE=
=FIdn
-----END PGP SIGNATURE-----

--GINMMiGuzGFK5NYP--

