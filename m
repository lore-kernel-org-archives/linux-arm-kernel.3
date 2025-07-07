Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6B9C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tbMPXxhvpgl9gB5jqtJ3zLdGn3BnaX0ozabRRokp71E=; b=t+E87AgBWEFnLfygLpG/l4EIj7
	4mpFn8hGkfXuNn5H2DZzj786/XwegivlG3ZcK8yfvaUUJzwOd8gwTP2eX7iUyVrd1nTNtxyqHrgGB
	dx2zyRIZF72JVu0yozwQQyjleBoi7HtYo7eQ/1Hr6zoJfUjntQrux49MebgDGb1nI2a00A40QAmWo
	GoZFhmkgxi0inJk43MG2FJRpY1M50/lkRxKwzgoTVqMT9a+b5cSCBF2wGMdJZ/ploxa5OceIac1rt
	jvOAkW2e8yAyzqln5PH7da+qFRCBh59PGVj0grRNcbJqnGjmwA7atECAjYXE5S+OXiZSywSM7RZ/9
	NjOtBXNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnnl-00000002rr1-0mUJ;
	Mon, 07 Jul 2025 15:30:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnhd-00000002qZH-0CVo;
	Mon, 07 Jul 2025 15:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D222161466;
	Mon,  7 Jul 2025 15:24:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16595C4CEE3;
	Mon,  7 Jul 2025 15:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751901859;
	bh=oes/+xn1RurzvrkWTc5SPMVdbj1/SKqgEqmxACEehrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vCuz4onVvZwugFdTpv7P/0j4lrHYxUcEusn5UZ6Sc3j7ztX/K+Gpa453lYKJ13EmY
	 z73CmYgE5BggoGsBNG5/6zY9fi98PeDM+w1CSjMwqWyqgM7Ul78pQk0mEtzaY9GIGc
	 QJsjHURQIfWsqtV6KZwGq/Z0xRsrUpk9RdMopt9wi8VtTduJvP6Ss1E0ZQrqPfgoZ7
	 XJQHZMgFVGIS2XWGtbkQKAZK+NZntMD0y28Zwk1/CGDBtGBj5ZwM/muNm8GFJVRRTq
	 8qPt404gevgFXZzBS/3g6qkNxDEKs8rvNdwx/TRROq9pFCHoW8EDcbbV4pHIRSTUCO
	 UQO2KdE3eXKtg==
Date: Mon, 7 Jul 2025 17:24:16 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>,
	Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next v2 2/7] net: airoha: npu: Add NPU wlan memory
 initialization commands
Message-ID: <aGvmoJ83EtYOIa0K@lore-desk>
References: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
 <20250705-airoha-en7581-wlan-offlaod-v2-2-3cf32785e381@kernel.org>
 <20250707-agile-aardwolf-of-politeness-29fead@krzk-bin>
 <aGt2L1e3xbWVoqOO@lore-desk>
 <679e6fd2-967f-4057-9ccd-92a37ecc4819@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OT/S5wyakOFftJE4"
Content-Disposition: inline
In-Reply-To: <679e6fd2-967f-4057-9ccd-92a37ecc4819@kernel.org>
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


--OT/S5wyakOFftJE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 07/07/2025 09:24, Lorenzo Bianconi wrote:
> >> On Sat, Jul 05, 2025 at 11:09:46PM +0200, Lorenzo Bianconi wrote:
> >>> +
> >>>  struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *st=
ats_addr)
> >>>  {
> >>>  	struct platform_device *pdev;
> >>> @@ -493,6 +573,7 @@ static int airoha_npu_probe(struct platform_devic=
e *pdev)
> >>>  	npu->ops.ppe_deinit =3D airoha_npu_ppe_deinit;
> >>>  	npu->ops.ppe_flush_sram_entries =3D airoha_npu_ppe_flush_sram_entri=
es;
> >>>  	npu->ops.ppe_foe_commit_entry =3D airoha_npu_foe_commit_entry;
> >>> +	npu->ops.wlan_init_reserved_memory =3D airoha_npu_wlan_init_memory;
> >>
> >> I cannot find in your code single place calling this (later you add a
> >> wrapper... which is not called either).
> >>
> >> All this looks like dead code...
> >=20
> > As pointed out in the commit log, these callbacks will be used by MT76 =
driver
> > to initialize the NPU reserved memory and registers during driver probe=
 in
> > order to initialize the WiFi offloading. Since MT76 patches are going v=
ia
> > the wireless tree, I needed to add these callbacks first.
>=20
> Cover letter does not link to your NPU patchset. You cannot add dead
> code to the kernel and now it is pure dead code. Post your user - in
> this or separate patchset.

I guess you mean the related MT76 patches are not linked in the cover-lette=
r,
right? I have not posted them yet.

>=20
> Your explanation of dependency is also confusing. If these are added to
> wireless tree (considering last experience how they rebase and cannot
> easily handle cross tree merges), how does it solve your problem? You
> will have it in one tree but not in the other, so still nothing...
> That's anyway separate problem, because main issue is you add code which
> we cannot even verify how it is being used.

My main point here is wireless tree can't acutally merge the MT76 patches
since, without the net-next ones (this series), it will not compile (so I
posted net-next patches as preliminary ones for MT76 changes).
Moreover, this is the same approach we used when we added WED support to
mtk_eth_soc driver and the related MT76 support.
However, I am fine to post the MT76 changes as RFC and just refer to it in
this series cover-letter. Agree?=20

>=20
> So far I see ABI break, but without user cannot judge. And that's the
> hard reason this cannot be accepted.

if you mean the dts changes, I will fix them in v3.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof

--OT/S5wyakOFftJE4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaGvmoAAKCRA6cBh0uS2t
rDczAPsFgaNtjWprKaC6Z+VfmUNzguMJ9HSaKYKBDoZw5TyM1gD8CclHT+w5VNy/
s041k48snp6/uVkoTA4CjRMJt0+DKQM=
=aXb3
-----END PGP SIGNATURE-----

--OT/S5wyakOFftJE4--

