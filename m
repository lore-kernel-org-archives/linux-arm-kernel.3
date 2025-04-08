Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DA9C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X2ySDSk4AFlY04h6e4qpoZgIAYu/rTcjr9nmw7qtre4=; b=K0cICPxM6OLWAXxzd6yNA2VS/U
	BoqjflKNR633ppIX+iJlu0RDP/3MWJ+3PUWLnIplC1z9xyqWkx1BnOvrx8lcNqCCOyfhcH/0+C2rC
	IFkVyBfCp6Ohsmy9fubhphVsx0ivIaiNVl6zkkcgzh/6L4k2/HAvG9gBS3yQqx905EO5QHY38P53O
	G6KJh3tu5si+Tl1seZPdLHbow5+t81mW/+NL9eId84eU8JXNJsDZCC/MnB2ncCvNiEt7dY9eytjxN
	lN1nGsrioQcWkmDMFr1AfGclYgy13WauiR5PVpWt0TcsaMdt7kFXizlAAhwzqnvqysufZ/XoJgO5M
	cCQImygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2E5c-00000005AB5-2RwG;
	Tue, 08 Apr 2025 18:54:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2E3s-000000059xT-1PUc;
	Tue, 08 Apr 2025 18:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=X2ySDSk4AFlY04h6e4qpoZgIAYu/rTcjr9nmw7qtre4=; b=H3Jvi7Ts8aTCtQgQnWgk0289ca
	pjYw0P255UAAo3/GcWXjtwU6Gqm020R+e3Kzt2fFGzcbfGcgT4n72MPKLflOgeBWBexxzLGKpqj6Q
	STpZDwTGroOlscWKnFaa4acu2hiig+xAc81+j6H8PwLGgoS78fObRTH5od8OZgEEa4t2uiznm1iMQ
	BJPAgqGsk7OOIu77s6HLx9nNWHLmYw2S9LLOrBSn06M8gMurOWgEeJJEnn9zdjsJl2kpJztiwb+6y
	soyu/rdj94AWA1iJxch+uL0w4XwwIzoy98mdCVyRk+yZBIwhNI3/+PNXT2rK5exl0yWvUDoxT9xUr
	E5xpxNUA==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2E3o-00000008Onk-2f63;
	Tue, 08 Apr 2025 18:52:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 21ECEA49032;
	Tue,  8 Apr 2025 18:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7D2C4CEE9;
	Tue,  8 Apr 2025 18:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744138353;
	bh=mu+QLtbier6NMLYJyK3BwUVJp4CUvrmcEmRBDd0mqTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOTOblY+ZdTcyClr0tGlJuSZQqykvvZQyTFaVP4dUqCRDQa2OjnzVhZijrdnuw44l
	 YfCQ0/VyKQuwLF1JcWogJCgIVOwQDAwCjJmzFUdJZi7rF806Vy4piek8vrrelPeQJK
	 NjTFRujSZUbaue4RrOFUr5nynorD8crW+Jxntnnn+fqpiIZiAna9JhOrf/tSN6BtYv
	 DOh42UOUcGApDjtj1OkzAx0Jj9uoIrFohamjIAM5K8mEy8oWMXyJqNKvVz1HjJ6dcF
	 tVso4l2sRcrDSJhJ3cT1ZK6eT2nRREsRM8n/1tNy9mjyTUUsjCsN4w1fFzEOVX1HAN
	 DQ4uEHNLIXZuw==
Date: Tue, 8 Apr 2025 20:52:30 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] Add L2 hw acceleration for airoha_eth driver
Message-ID: <Z_VwbsjFak7sREYN@lore-desk>
References: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cwckOtaj5kVyqye2"
Content-Disposition: inline
In-Reply-To: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_195236_843108_53D6D2E2 
X-CRM114-Status: GOOD (  12.12  )
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


--cwckOtaj5kVyqye2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Introduce the capability to offload L2 traffic defining flower rules in
> the PSE/PPE engine available on EN7581 SoC.
> Since the hw always reports L2/L3/L4 flower rules, link all L2 rules
> sharing the same L2 info (with different L3/L4 info) in the L2 subflows
> list of a given L2 PPE entry.
>=20
> ---
> Lorenzo Bianconi (3):
>       net: airoha: Add l2_flows rhashtable
>       net: airoha: Add airoha_ppe_foe_flow_remove_entry_locked()
>       net: airoha: Add L2 hw acceleration support
>=20
>  drivers/net/ethernet/airoha/airoha_eth.c |   2 +-
>  drivers/net/ethernet/airoha/airoha_eth.h |  22 ++-
>  drivers/net/ethernet/airoha/airoha_ppe.c | 224 +++++++++++++++++++++++++=
+-----
>  3 files changed, 215 insertions(+), 33 deletions(-)
> ---
> base-commit: 61f96e684edd28ca40555ec49ea1555df31ba619
> change-id: 20250313-airoha-flowtable-l2b-e0b50d4a3215
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo@kernel.org>
>=20

Hi Andrew, David, Eric, Jakub and Paolo,

the series has been marked as 'changed requested' but Michal is fine with
current approach. Am I supposed to repost?

Regards,
Lorenzo

--cwckOtaj5kVyqye2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ/VwbgAKCRA6cBh0uS2t
rMh2AP0RiMzPfMojS+LKe/VnGc+9kAPC0dZn8jlHkdT5JydKhQEA+jqP4K893c4F
fPL4pqO2PtARhomxzYl3AumfteZ96gI=
=nFvh
-----END PGP SIGNATURE-----

--cwckOtaj5kVyqye2--

