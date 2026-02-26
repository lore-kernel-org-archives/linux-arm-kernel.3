Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8B8FD9E0A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aG1xWWc8EdSqvFAlhgQ31P7qyW73SGSmDz40wAFzb0I=; b=VhzlOhkQZ2cfMh893sCKGIrXyg
	1N1nq5FLMXjD+OmJZspb2Zr/6mDocSpTDNkEeZocDSgFUoqr5CBYAtqMNzPO7OlxNsTCnIIe6tsr4
	QGHCAfc9Zx4KPfpiSqEMkwjlBVlXgdlOYwn4wqNFjH8pbtzi68lNDlvuP786Q1swxIpU1/IfqYuC7
	bjEZk1DdAorM8SFesjmM12ZLlv9nHcLr/hD1nKz/K4gweQITIMMYYLyo3H8V3RrENZBATzY2LRMIL
	sptzWXhaeQdjsrNRsnpNAl1WWf1VPD0oVddth9nQ5NOtN+FQL+ANxO47nCkQv/CLrsjMc/I/FX/yc
	vB1/ogfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvib4-00000007CbO-0VBF;
	Thu, 26 Feb 2026 21:08:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvib2-00000007Caz-0aRQ;
	Thu, 26 Feb 2026 21:08:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D5814187C;
	Thu, 26 Feb 2026 21:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B353BC116C6;
	Thu, 26 Feb 2026 21:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772140111;
	bh=lvfOpg7Q8B6PQTUDRETaioIBfNXDdU4p85aEpRkDPOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=okPxQoNNaXjtAHqbKapEVhYnnFPHYkR3E2EUG40wOSSEOLr4PJaNr1MRVGPG0qfG8
	 mBOH8D1uR19BK5b8TbcQRhDsWJx5vCtcOCPVOjLwxo4hDhgG6FLwmEhilXtdOsMkSW
	 vp+KM+cFo6ZxSiHQQtHsNkVhPCoR6BSsHtwaN7BtymqDcnDFoQ+2eYvWFuUU8TRInk
	 ZzyU5XdhN+nsFL9FP0pWzTv2pAvdiGzdXnK90vkTMRHhbRajsyoRewD1QxjZ0vGRbk
	 Q39H0419rUtEoySHeTIty+ybr0a71yLnBXAFS/jOM5cfaDe36b0cO2Wu1xvvnIbkuK
	 0Udtksr66NM7g==
Date: Thu, 26 Feb 2026 22:08:28 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>, Deren Wu <deren.wu@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hao Zhang <hao.zhang@mediatek.com>,
	Nelson Yu <nelson.yu@mediatek.com>
Subject: Re: [PATCH wireless 0/3] wifi: mt76: Fix possible out-of-bound
 accesses in mt76 driver
Message-ID: <aaC2TBksZcml-DDT@lore-desk>
References: <20260226-mt76-addba-req-oob-access-v1-0-b0f6d1ad4850@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S9cDFWTiBubiysDv"
Content-Disposition: inline
In-Reply-To: <20260226-mt76-addba-req-oob-access-v1-0-b0f6d1ad4850@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_130832_216008_263DF4CF 
X-CRM114-Status: GOOD (  10.77  )
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


--S9cDFWTiBubiysDv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Check mgmt frame length before accessing header fields in order to avoid
> a possible oob access for injected frames.

Hi Felix,

do you think these patches can go directly into the wireless tree or do you
prefer to get them into your tree?

Regards,
Lorenzo

>=20
> ---
> Lorenzo Bianconi (3):
>       wifi: mt76: mt7996: Fix possible oob access in mt7996_mac_write_txw=
i_80211()
>       wifi: mt76: mt7925: Fix possible oob access in mt7925_mac_write_txw=
i_80211()
>       wifi: mt76: Fix possible oob access in mt76_connac2_mac_write_txwi_=
80211()
>=20
>  drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c | 1 +
>  drivers/net/wireless/mediatek/mt76/mt7925/mac.c      | 1 +
>  drivers/net/wireless/mediatek/mt76/mt7996/mac.c      | 1 +
>  3 files changed, 3 insertions(+)
> ---
> base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba
> change-id: 20260226-mt76-addba-req-oob-access-848280920814
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

--S9cDFWTiBubiysDv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaaC2TAAKCRA6cBh0uS2t
rHhKAQCot+MHK/5KIrSE0/KTRx1gyVUHvLhpk9gAlg/5EadIsAEA2JrMGDHYx42t
r5l7H27eW/uMNIW4K/jrBJ25uZ+dtA4=
=PxUT
-----END PGP SIGNATURE-----

--S9cDFWTiBubiysDv--

