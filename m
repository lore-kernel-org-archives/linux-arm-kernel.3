Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1556C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 07:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxTAN64foXIxsH4J2KLUyKcFp7s9RqBMmrw6kLHxeqM=; b=Y+4jZA3n4IFvb50MEE4EfRbp1D
	40YvNe1YvN7Kat5Y+sv8s4Bk/XdTGFIT6ew7nLAY9I+iCjpKeqlCKYn5i4EjZNWSwJjVhCZdTPCcL
	vtH/RhH6jD2mBk7Qq6/aY//QtIhHktSo4/PMnTtDjQu6MFzLG4ORFPJSU47UeMBhEk/hPtMxY1qg9
	VfR9Vt8ldLvydprykX0v1YH5AuSB034ap3kzS8v/D+IXOdEudnhWF/A3Cwq7fAkHc8WS1wkJbbqSP
	oSSYuZigX0Ig14HFqzud3E6mSYVgWx7Mta6aIg7uGkV52+Y6z9D4LqS3HYmfv16PasqRw2zFPHKpF
	Uwq6FC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2s6-00000004aol-12Jx;
	Tue, 08 Jul 2025 07:36:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ2pm-00000004aXI-2s6r;
	Tue, 08 Jul 2025 07:33:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B34A561463;
	Tue,  8 Jul 2025 07:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4330C4CEED;
	Tue,  8 Jul 2025 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751960025;
	bh=PmHqTzW/ysKFVmsSvmen1NCnARGYFMnQHFeLSs8l8lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fdUR9vjrMxIkwiqRNrJVADFdJeji6nypTKhcEihHDRTA2h/J22q1Tmmu8j+Ls0sYd
	 HR4Ru7IFSZYFCA7maYTFO82m5LfMQDGi/q39l1K1vHeOH/+JQ190f+BNZaiBR+Xafk
	 w1Q60OLnd0/3hosS5xzhRLKPaX5uXth4kwH+82PmxB6aWmjkc5cKIKEwTIRNiLh5Xg
	 Yb0TsGHvAqc1HtYeD/zxSctNQGIKtA/33lfA1indcxVVNPehiWnlcvhnhLXyLJvUxJ
	 3tw7xO+t3KUyuo+JyVPn0ZfRE/nZJ6ABBEJTDtBt/TtxHIMctzLA2gzGr2pUvk0JDK
	 /ZU72mRv0fUPQ==
Date: Tue, 8 Jul 2025 09:33:42 +0200
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
Message-ID: <aGzJ1vFufzBts_yG@lore-desk>
References: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
 <20250705-airoha-en7581-wlan-offlaod-v2-2-3cf32785e381@kernel.org>
 <20250707-agile-aardwolf-of-politeness-29fead@krzk-bin>
 <aGt2L1e3xbWVoqOO@lore-desk>
 <679e6fd2-967f-4057-9ccd-92a37ecc4819@kernel.org>
 <aGvmoJ83EtYOIa0K@lore-desk>
 <904d1165-185e-43ac-9b52-a2f17f774e80@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1ik0M2Sq3xJXAfM5"
Content-Disposition: inline
In-Reply-To: <904d1165-185e-43ac-9b52-a2f17f774e80@kernel.org>
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


--1ik0M2Sq3xJXAfM5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 07/07/2025 17:24, Lorenzo Bianconi wrote:
> >> On 07/07/2025 09:24, Lorenzo Bianconi wrote:
> >>>> On Sat, Jul 05, 2025 at 11:09:46PM +0200, Lorenzo Bianconi wrote:
> >>>>> +
> >>>>>  struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *=
stats_addr)
> >>>>>  {
> >>>>>  	struct platform_device *pdev;
> >>>>> @@ -493,6 +573,7 @@ static int airoha_npu_probe(struct platform_dev=
ice *pdev)
> >>>>>  	npu->ops.ppe_deinit =3D airoha_npu_ppe_deinit;
> >>>>>  	npu->ops.ppe_flush_sram_entries =3D airoha_npu_ppe_flush_sram_ent=
ries;
> >>>>>  	npu->ops.ppe_foe_commit_entry =3D airoha_npu_foe_commit_entry;
> >>>>> +	npu->ops.wlan_init_reserved_memory =3D airoha_npu_wlan_init_memor=
y;
> >>>>
> >>>> I cannot find in your code single place calling this (later you add a
> >>>> wrapper... which is not called either).
> >>>>
> >>>> All this looks like dead code...
> >>>
> >>> As pointed out in the commit log, these callbacks will be used by MT7=
6 driver
> >>> to initialize the NPU reserved memory and registers during driver pro=
be in
> >>> order to initialize the WiFi offloading. Since MT76 patches are going=
 via
> >>> the wireless tree, I needed to add these callbacks first.
> >>
> >> Cover letter does not link to your NPU patchset. You cannot add dead
> >> code to the kernel and now it is pure dead code. Post your user - in
> >> this or separate patchset.
> >=20
> > I guess you mean the related MT76 patches are not linked in the cover-l=
etter,
> > right? I have not posted them yet.
> >=20
> >>
> >> Your explanation of dependency is also confusing. If these are added to
> >> wireless tree (considering last experience how they rebase and cannot
> >> easily handle cross tree merges), how does it solve your problem? You
> >> will have it in one tree but not in the other, so still nothing...
> >> That's anyway separate problem, because main issue is you add code whi=
ch
> >> we cannot even verify how it is being used.
> >=20
> > My main point here is wireless tree can't acutally merge the MT76 patch=
es
> > since, without the net-next ones (this series), it will not compile (so=
 I
>=20
> This does not explain hiding the other part. Again - there is nothing
> weird in patchset dependencies. Weird is saying there is dependency, so
> I will not post code.

I have a working patchset for MT76 support. I have not posted it yet just
because I need to clean it up.

>=20
> > posted net-next patches as preliminary ones for MT76 changes).
> > Moreover, this is the same approach we used when we added WED support to
> > mtk_eth_soc driver and the related MT76 support.
> > However, I am fine to post the MT76 changes as RFC and just refer to it=
 in
> > this series cover-letter. Agree?=20
> >=20
> >>
> >> So far I see ABI break, but without user cannot judge. And that's the
> >> hard reason this cannot be accepted.
> >=20
> > if you mean the dts changes, I will fix them in v3.
> >=20
> No, I mean driver.

Sorry, can you please explain what is the ABI break in the driver codebase?
airoha_npu_wlan_init_memory() is executed by MT76 driver and not during NPU
probe phase.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof

--1ik0M2Sq3xJXAfM5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaGzJ1gAKCRA6cBh0uS2t
rJ70AQDKW9DjcfHQlFHvXGhHzlDeXGR1AkdPDGOzsgKZe3hC4wD/QgxrN3+Nr8M7
U9rFLAgI8fC2gByAD0uk/fsm/2EGDgE=
=0IG7
-----END PGP SIGNATURE-----

--1ik0M2Sq3xJXAfM5--

