Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2912F107527F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 09:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KV71yq24ZTNhgBIUdlDKcfofTCO5qP51/4EIapZ81wY=; b=dG1VhaLA/+CLwvmIdQ5plv34aT
	1JkroK2y0/bwHDdOGF5wJwyaYeQcgtGEQ0lLxjbGC66TnqYNMXbaGWcTDGtsw/HzeImrDKsgu9aKx
	qo5RglmVBOmGg/0l7zSjRSAEGmWQlItY6VB6C131/ZEV3QmB9eDt2yNxyyVRC2dwEkNfPbz2PpjGd
	8fIyS8fDkwVCrdGgAWleE/S16WmDohXhUL+/mxJECgRAOC0OIVamYGkAjMAIfiZT7VAKTaOxP8a9A
	MfCF6LoP9Nbx1Ge88ovtZzFTLsJo4E3eTdH2w+sZOYuCPqBSzJ8Gyua1gu2urd9HJ6MT0cr/UA/KD
	vi7Cc6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39H9-0000000AHlY-1tPy;
	Thu, 19 Mar 2026 09:02:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39H8-0000000AHkp-1FrA;
	Thu, 19 Mar 2026 09:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KV71yq24ZTNhgBIUdlDKcfofTCO5qP51/4EIapZ81wY=; b=ng9mkFm0LlGop6yOLzyhOMeL5F
	KKKNGK6iYl3Thrv6eyTwg22BJsIgm5YXlhX0JaoJ23no7DMl35jHnmfSaZvcKmiFDIzDLXkH78AtH
	dIfgCRE3DOmRAleMq3WtRDm9sRfyJP5XRoz+MWsh/6WxKG1Crbkp0ELKFNE9XF5aDyFzgkNFhD2cp
	Bat2gWck4btaJCMbEJ1y3HHS/0fI3fpnpUs4VOb+xnG+O8riWkQczGEsORWE2oFTN3bpPF7elLJT2
	PO/D6C/EwkYNpmzqiyyxdwwF2JdfqiQZC/yys0q8x3TYT/NnyX5fRv5s8++0AayancXO+tptf/0Ya
	YNaf0ZBQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w39Gz-0000000D57K-17TY;
	Thu, 19 Mar 2026 09:02:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C683443DF;
	Thu, 19 Mar 2026 09:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7871C2BCC6;
	Thu, 19 Mar 2026 09:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773910949;
	bh=7VaarauVAUlZAF8hWS497Tc062mkllGjXCpmZsHJ+uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K3/vYhrzVWItNRYWpKWFWCn0Af38vhj2aOuqCs+BVorOCkalSLc4Dzt2HMw0/6ScR
	 dnrUOC1EgUWUACklVH5wSLc/b3i5xMVLRVFsjzbSjdV8cOeefx5186q8L5Dc62QvkI
	 ZqABWhHLSoVBmS7fTHlFY642WO2lvJlxpaopF2KDZNyNjhKPGrLvowUECAfmejEVJV
	 SzfXoRjy/DaCPb2VoaqHlEWPEBIaEYZ16prqPPcLqEuBcKyq1KqZ5xHWsqzzPvALa3
	 GEV8VZdxD7bx1KdkAY4qyBXXQBp2KlcaHfsP6to+ThHIJU6OYJjqqhIUzTMhBYFvut
	 OKVOWnx2JxMfg==
Date: Thu, 19 Mar 2026 10:02:26 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Qingfang Deng <dqfext@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [PATCH net] net: airoha: add RCU lock around
 dev_fill_forward_path
Message-ID: <abu7oifGm-OW74e9@lore-desk>
References: <20260319032649.337812-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hVix+0JsXNG2f6eM"
Content-Disposition: inline
In-Reply-To: <20260319032649.337812-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_090233_612098_75A4AC5F 
X-CRM114-Status: GOOD (  15.04  )
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


--hVix+0JsXNG2f6eM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Since 0417adf367a0 ("ppp: fix race conditions in ppp_fill_forward_path")
> dev_fill_forward_path() should be called with RCU read lock held. This
> fix was applied to net, while the Airoha flowtable commit was applied to
> net-next, so it hadn't been an issue until net was merged into net-next.
>=20
> Fixes: a9af709fda7e ("Merge git://git.kernel.org/pub/scm/linux/kernel/git=
/netdev/net")
> Signed-off-by: Qingfang Deng <dqfext@gmail.com>

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>

> ---
>  drivers/net/ethernet/airoha/airoha_ppe.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index ec5ce41dad80..02deb739a1c7 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -227,7 +227,9 @@ static int airoha_ppe_get_wdma_info(struct net_device=
 *dev, const u8 *addr,
>  	if (!dev)
>  		return -ENODEV;
> =20
> +	rcu_read_lock();
>  	err =3D dev_fill_forward_path(dev, addr, &stack);
> +	rcu_read_unlock();
>  	if (err)
>  		return err;
> =20
> --=20
> 2.43.0
>=20

--hVix+0JsXNG2f6eM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCabu7ogAKCRA6cBh0uS2t
rOgBAQCIxff9R0PFxxGK2Xf7PNsoJs3MKg/JgyhCTFimM4plUwEA3uRTHFbu2J0/
0/u8vg4OXU00HB05uIfaAiQ0jcdCAAU=
=fFpm
-----END PGP SIGNATURE-----

--hVix+0JsXNG2f6eM--

