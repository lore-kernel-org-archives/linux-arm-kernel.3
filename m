Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD49C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 10:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GkK3DkT/hUKSXHtNHhvB+gzC2lGV+LnAwQSWbGSKE6M=; b=mQoOMON18WQGiFokUIfGIVBgaq
	w7lGLvH+WGMApQVmLZf6wu0JOK9OvaKmCLKodu+Tw331JifwQFVppssC/Kgc7cCouwZhK1Dsw7bn7
	BWmQ35D+VDEdVBNgKZsQCoNQ3v15ozcHbqpr+JtpnPQbgfxMGeOLmO7md3YymnpZe/Y9O8bcGpdh+
	dcKOQtJOQf8UR9pI06Oo6ByN5TStt31/KhVeHuY9SuLL/ShZgoOm2bzhWmCJzj73kz56KLYsv4CRI
	ahnZS9tnocrXc45tnVepEG5uN+Tg99cQKAMOvauEljw8A7ycPFsmUPDFZBEwxyzNw3SSbzMaX15jV
	YeLl7WTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubGK5-00000001u10-1TA9;
	Mon, 14 Jul 2025 10:22:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubG7m-00000001spk-2tHi;
	Mon, 14 Jul 2025 10:09:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CADA45F34;
	Mon, 14 Jul 2025 10:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09072C4CEED;
	Mon, 14 Jul 2025 10:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752487768;
	bh=GkK3DkT/hUKSXHtNHhvB+gzC2lGV+LnAwQSWbGSKE6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faV4IGhrwwPm7Xk3HAdpOK/5RPiCiaXiNxiuanEBjOZEaylhB1pK8uGlt+ACEdbJy
	 WStnLqumD05CeQsonqRO9aH+3G8tlby5aQJYsdw6IIrmsml8mH9dqlzjiJeQoIyuQZ
	 3iMeGUqixcmo6LlALxvp6uI6i4ErSip066C+9K7xXMpk+ZeuI5Gf3NvrjRLhscApq4
	 ONPUiNiFXooFhhDG4R9YsGQmwn06HCN+AKymqoxIiFt9Y/lUX2GF51BqCe2rbnUhY9
	 6k3z9F8CxNfgF/4PPzT0UHIKPUTNkwGr1Tk6EJTaxbh/XerCWxAYLTvJvi2dT7f8nq
	 RRc6R9x7VBbwg==
Date: Mon, 14 Jul 2025 12:09:25 +0200
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
Message-ID: <aHTXVQzo5pf9WvaF@lore-desk>
References: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
 <20250705-airoha-en7581-wlan-offlaod-v2-2-3cf32785e381@kernel.org>
 <20250707-agile-aardwolf-of-politeness-29fead@krzk-bin>
 <aGt2L1e3xbWVoqOO@lore-desk>
 <679e6fd2-967f-4057-9ccd-92a37ecc4819@kernel.org>
 <aGvmoJ83EtYOIa0K@lore-desk>
 <904d1165-185e-43ac-9b52-a2f17f774e80@kernel.org>
 <aGzJ1vFufzBts_yG@lore-desk>
 <623a647b-806a-4324-9c59-fcad3127f906@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N4sH5cZnV86fq74t"
Content-Disposition: inline
In-Reply-To: <623a647b-806a-4324-9c59-fcad3127f906@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_030930_770240_D9D89C78 
X-CRM114-Status: GOOD (  23.15  )
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


--N4sH5cZnV86fq74t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 08/07/2025 09:33, Lorenzo Bianconi wrote:
> >=20
> >>
> >>> posted net-next patches as preliminary ones for MT76 changes).
> >>> Moreover, this is the same approach we used when we added WED support=
 to
> >>> mtk_eth_soc driver and the related MT76 support.
> >>> However, I am fine to post the MT76 changes as RFC and just refer to =
it in
> >>> this series cover-letter. Agree?=20
> >>>
> >>>>
> >>>> So far I see ABI break, but without user cannot judge. And that's the
> >>>> hard reason this cannot be accepted.
> >>>
> >>> if you mean the dts changes, I will fix them in v3.
> >>>
> >> No, I mean driver.
> >=20
> > Sorry, can you please explain what is the ABI break in the driver codeb=
ase?
> > airoha_npu_wlan_init_memory() is executed by MT76 driver and not during=
 NPU
> > probe phase.
> >=20
>=20
> Read the first problem I pointed out - no user. Your new ABI returns
> error and you changed binding in incompatible way.
>=20
> Binding change is ABI break and its impact is impossible to judge due to
> missing code. I am speaking about this since beginning, but if you keep
> insisting that the driver does not matter then this is a NAK because you
> change ABI in the binding.

Please do not get me wrong, I was just trying to understand where the ABI
breakage is. I will post my MT76 changes as RFC and I will link that series
in the v3 cover letter so you can look at the new API user code.

Regards,
Lorenzo

>=20
>=20
> Best regards,
> Krzysztof

--N4sH5cZnV86fq74t
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaHTXVQAKCRA6cBh0uS2t
rACZAP9AyexJu6kQuZxCmXszphY7ttX/lmGO9BeyGtpAO+ZQXQD/ebhUOlm76q1y
hnCfV8C2VTjzBYpD1r7+JuQmdd0i0gc=
=9MXq
-----END PGP SIGNATURE-----

--N4sH5cZnV86fq74t--

