Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD548C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 12:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5wGgorETCqTSQgcruZExoXNbzVr4OcDf9l3Y4Gaork=; b=HQjRaPCeyDsWOsD8vsGn3p5Rmx
	7bxtOX2fwls5oOARjZf/j77MYqBL2UtV4LsaIyN2PIZCtOF8XPvhvrz+0RZhOJij+uwKeZ2nFFmIi
	TA/WcN1NDFekUUHS6T8DhTF6IC7O2/uhWKWauuXjK/VKhtz7NKouPGGcJKS7oDFjLfCy4TrNd55AT
	RQc0J79Eh0mXkZ1FHt0P4zlWEZ+uNetD2XGjwn0ZoWduiOvhXT0wQ3OPI0FWtveMY6ZSaF1PhErpT
	mFLi3mIzrznWzIX0bD83nwZucczySmCj8RnVYS3toQ0EumkpIGJ5uR9wBRRUUj6Nj8Hn86Uz4xTLH
	QGU3T6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGxO-0000000Cjkm-2vec;
	Tue, 05 Aug 2025 12:39:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujGPv-0000000Cf6E-3fdk;
	Tue, 05 Aug 2025 12:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754395517;
	bh=u8ZXPWzbXElhYtM4KU8eWaIl56pJiSBCxWJL9BLCWwY=;
	h=Subject:From:To:Date:In-Reply-To:References:From;
	b=a8q1esYTS25g40DMBzzkxyY9LU18Ik6v/VARhCxypbcw/2EC0mncWQuoGji3o8lKS
	 5R3I+a2C58B+FXNKe6nyDvGuzXJHP0g7nMHbrzpeXhsBH+RXjj+WS67AwVUGEbBLXr
	 XOi4eyRYeZqUTYLvqXfalCE/gEy3LyNV1hTxn4O7gauUsY3FjWvHKe8rN9m7YyxuxM
	 2zF//nSCYfDPv2ACwQhwkHgvjrcp+ZLjLvcs6xHIlcxaocN6fkkWXmEJoYrvcBVfkq
	 mY3kx1zzBWQGv5euDZhRCi4TxeyQwKCo3/GShaQeOP8d6ngaJj4h3XBUJvvNcHkqIZ
	 sRaMEnjBlqogw==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8CC617E04EE;
	Tue,  5 Aug 2025 14:05:16 +0200 (CEST)
Message-ID: <800b190c9f1c213c81d0d1dbf09015892edab29e.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Fix incorrect NULL check for
 iommu_paging_domain_alloc
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Miaoqian Lin <linmq006@gmail.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Hans Verkuil
 <hverkuil@kernel.org>, 	linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 05 Aug 2025 08:05:14 -0400
In-Reply-To: <20250805061833.3670085-1-linmq006@gmail.com>
References: <20250805061833.3670085-1-linmq006@gmail.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mQGiBEUQN0MRBACQYceNSezSdMjx7sx6gwKkMghrrODgl3B0eXBTgNp6c431IfOOEsdvk
 oOh1kwoYcQgbg4MXw6beOltysX4e8fFWsiRkc2nvvRW9ir9kHDm49MkBLqaDjTqOkYKNMiurFW+go
 zpr/lUW15QqT6v68RYe0zRdtwGZqeLzX2LVuukGwCg4AISzswrrYHNV7vQLcbaUhPgIl0D+gILYT9
 TJgAEK4YHW+bFRcY+cgUFoLQqQayECMlctKoLOE69nIYOc/hDr9uih1wxrQ/yL0NJvQCohSPyoyLF
 9b2EuIGhQVp05XP7FzlTxhYvGO/DtO08ec85+bTfVBMV6eeY4MS3ZU+1z7ObD7Pf29YjyTehN2Dan
 6w1g2rBk5MoA/9nDocSlk4pbFpsYSFmVHsDiAOFje3+iY4ftVDKunKYWMhwRVBjAREOByBagmRau0
 cLEcElpf4hX5f978GoxSGIsiKoDAlXX+ICDOWC1/EXhEEmBR1gL0QJgiVviNyLfGJlZWnPjw6xhhm
 tHYWTDxBOP5peztyc2PqeKsLsLWzAr7QnTmljb2xhcyBEdWZyZXNuZSA8bmljb2xhc0BuZHVmcmVz
 bmUuY2E+iGIEExECACIFAlXA3CACGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sB
 qgcJngAnRDBTr8bhzuH0KQwFP1nEYtfgpKdAKCrQ/sJfuG/8zsd7J8wVl7y3e8ARbRDTmljb2xhcy
 BEdWZyZXNuZSAoQi4gU2MuIEluZm9ybWF0aXF1ZSkgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29
 tPohgBBMRAgAgBQJFlCyOAhsDBgsJCAcDAgQVAggDBBYCAwECHgECF4AACgkQcVMCLawGqBwhLQCg
 zYlrLBj6KIAZ4gmsfjXD6ZtddT8AoIeGDicVq5WvMHNWign6ApQcZUihtElOaWNvbGFzIER1ZnJlc
 25lIChCLiBTYy4gSW5mb3JtYXRpcXVlKSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY28udW
 s+iGIEExECACIFAkuzca8CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFTAi2sBqgcQX8
 An2By6LDEeMxi4B9hUbpvRnzaaeNqAJ9Rox8rfqHZnSErw9bCHiBwvwJZ77QxTmljb2xhcyBEdWZy
 ZXNuZSA8bmljb2xhcy5kdWZyZXNuZUBjb2xsYWJvcmEuY29tPohiBBMRAgAiBQJNzZzPAhsDBgsJC
 AcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRBxUwItrAaoHLlxAKCYAGf4JL7DYDLs/188CPMGuwLypw
 CfWKc9DorA9f5pyYlD5pQo6SgSoiC0R05pY29sYXMgRHVmcmVzbmUgKEIgU2MuIEluZm9ybWF0aXF
 1ZSkgPG5pY29sYXMuZHVmcmVzbmVAdXNoZXJicm9va2UuY2E+iGAEExECACAFAkUQN0MCGwMGCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRBxUwItrAaoHPTnAJ0WGgJJVspoctAvEcI00mtp5WAFGgCgr
 +E7ItOqZEHAs+xabBgknYZIFPU=
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-GUyJd8Bie7c9ushUvXKa"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_050520_093073_86A47E95 
X-CRM114-Status: GOOD (  15.30  )
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


--=-GUyJd8Bie7c9ushUvXKa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 05 ao=C3=BBt 2025 =C3=A0 10:18 +0400, Miaoqian Lin a =C3=A9crit=C2=
=A0:
> iommu_paging_domain_alloc returns error pointers on failure.
> Replace the NULL check with IS_ERR to correctly handle error cases
> and avoid invalid pointer dereference.
>=20
> Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index d707088ec0dc..1d40e81f44b9 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1162,7 +1162,7 @@ static int rkvdec_probe(struct platform_device *pde=
v)
> =C2=A0	if (iommu_get_domain_for_dev(&pdev->dev)) {
> =C2=A0		rkvdec->empty_domain =3D iommu_paging_domain_alloc(rkvdec-
> >dev);
> =C2=A0
> -		if (!rkvdec->empty_domain)
> +		if (IS_ERR(rkvdec->empty_domain))


Thanks for the fix, but Dan Carpenter have already sent this fix. It will b=
e
included soon.

https://lore.kernel.org/linux-media/696219e9-a1c7-4c87-b15c-1ffd42c95d58@sa=
binyo.mountain/

regards,
Nicolas

> =C2=A0			dev_warn(rkvdec->dev, "cannot alloc new empty
> domain\n");
> =C2=A0	}
> =C2=A0

--=-GUyJd8Bie7c9ushUvXKa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJHzegAKCRBxUwItrAao
HMlmAKCfv5hoBmBLX6tlUdQpzxk963M+rACgvfn53WoJ+Bkca4EluHQ8KDLqOKg=
=t/8B
-----END PGP SIGNATURE-----

--=-GUyJd8Bie7c9ushUvXKa--

