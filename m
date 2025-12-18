Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81DDD70E0C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 19:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ck6JnuZO2IHf4mFhwwyyGq/NgmnS+f2cFjCiZKFJGss=; b=Q687H8a7WR1wkcILxIK3yde7za
	0KKEv6sEEk7HvTjdUy1hllARM9JBJUH4cLzOcOd3jKMhXBpn8NysBXNARrwPiwDMs0p2fHgPdE88L
	+Kudgf085WP9piGBoAJNWuILAlw1njdn7hDYJo3ut80WaoK2OYySVE9z+w2h50VuYXU1WFKulGCOg
	WvypCvlXLqvfdzhfFFjsch7PaeWtPVH1G4sc0Op5p3ahcsD1skJwmtVSgAS5kV/i9/BryEmfO2pLu
	W00bgPKghhlgxJHLsNhozvX2OciLl/lT9lqdES5/hfwMPwsuYroRdhLgj/ohRGNerQawUfMKiGfna
	aZpQQEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJe0-000000095Xk-2Kvz;
	Thu, 18 Dec 2025 19:26:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWJdy-000000095Wo-2CKL;
	Thu, 18 Dec 2025 19:26:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0E991418D9;
	Thu, 18 Dec 2025 19:26:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4D66C4CEFB;
	Thu, 18 Dec 2025 19:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766085993;
	bh=ck6JnuZO2IHf4mFhwwyyGq/NgmnS+f2cFjCiZKFJGss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfS6HBdHt82WZwMLQLjJSUWAg/kz84o620inHVuyW+kQLja133R76s5UaYNz7Guo2
	 UfuR5OCd5BqyHI2gUdpmdmLXnCY4ZSjZHEY2iARR9+keZ2OH5wpP6Gjlpu8i5LpAVI
	 2bbGNlKkQe1CSj6yaAXViHEQduSLsyAa1pFpc3EPXrw1/Jck6HmO4pyNVKTSUUb01a
	 nHL1TFX48SKvOTR1X743RTsS0EZpuvoKFEw/Gjit23U/hLxv8n1nOXjuRP2eE53SxD
	 2yk8pZoQPwRQFLA4k7E3IY2ITqakRrzzfWc88p67gEdWtth4yy693BUCU4ZsdOqEN5
	 PGlGoJhnGFRkg==
Date: Thu, 18 Dec 2025 19:26:26 +0000
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
Subject: Re: [PATCH v4 03/25] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
Message-ID: <20251218-crib-mutilated-0fad21809466@spud>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
 <20251218-mt8196-ufs-v4-3-ddec7a369dd2@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QtbfyB59VQR63T5H"
Content-Disposition: inline
In-Reply-To: <20251218-mt8196-ufs-v4-3-ddec7a369dd2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_112634_580224_47503084 
X-CRM114-Status: GOOD (  15.16  )
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


--QtbfyB59VQR63T5H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2025 at 01:54:53PM +0100, Nicolas Frattaroli wrote:
> The MediaTek MT8196 SoC's UFS controller uses three additional clocks
> compared to the MT8195, and a different set of supplies. It is therefore
> not compatible with the MT8195.
>=20
> While it does have a AVDD09_UFS_1 pin in addition to the AVDD09_UFS pin,
> it appears that these two pins are commoned together, as the board
> schematic I have access to uses the same supply for both, and the
> downstream driver does not distinguish between the two supplies either.
>=20
> Add a compatible for it, and modify the binding correspondingly.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--QtbfyB59VQR63T5H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaURVYgAKCRB4tDGHoIJi
0qxYAQD7Sv8qLHWhH0i1qWr84q/8ta4jRgBqJn9ugDnf6JCr7gEAn23RjYh3TAP0
FZSkIbg5O3vu/QV6XTlDz72GWCkj5Q0=
=Gykq
-----END PGP SIGNATURE-----

--QtbfyB59VQR63T5H--

