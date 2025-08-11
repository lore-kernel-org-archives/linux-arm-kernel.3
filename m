Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBD5CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 16:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gAMJ7tCk5KzCzD3Plb0eao7cEgUnrnO9KreNh8wF/I=; b=TvOcZRON64Q7urQeCTtXfkF5VM
	GeoE34K7viA2dKsDNaoilAP3fq2Ioswz5JFA4LT+JwHrbfoVvX8eTfCjB8pLS2SYC9Y+zlRomeJLM
	XKJGlvW0N6ioEC75tNuhqKnGKCX+BReCZSOlTZrsWq+N+A2MBByFP4weVBQUQDthFHe1kL5zfPqkV
	s/sqEjuFHssOp+er44OlXgy0dY1H1MGPsffgmf20Eulg/gxZl5ViuVFqRjzv39WgY59wjNwdzb2+L
	kTjOUe25/F2ufDL3B37YW+amyrdF7RnsM0p0ZkMcRaLfOpVRJA98Wi2llzYSzQ6n/irk7M+aNa7jl
	gU6KaOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVYN-00000008RFx-2TkJ;
	Mon, 11 Aug 2025 16:39:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTUY-000000081eN-3GUd;
	Mon, 11 Aug 2025 14:27:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754922433;
	bh=ToD+V4Y6QuUockNI5WYMvlxRPFX6OLPNwxY8Q3Oq6ag=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=E6I0/nQsoSr5TDpWWEwo2yfzPByADNf07S4gkE5bY5v4XkVytrh8kcIBVoadWw3FP
	 tSVwdqKz/ssqR0WPGPKOP+W3414PqwcIiVyxe/ot1b9iMEbkF/zXtPFP8IAdQ60dml
	 PZMSAg6dz/LPAABoN2lvcODhsX2z7jao1JkazIxhbBc61X8ZNG9KwkDjCR4Boh0UkJ
	 AsyIZbV1ChEYiuZj3pMP+JPNDdiDhsEPmF+ki03M81o/scNoLEPD8MWFE95Ibu9wVr
	 xgQFXrY023mStztbAI9twO0eB5N7nMqDPR6zZmr6TfR5c3c3uSLSlhsSucaKjl7EnY
	 wghU7U3FMrpIw==
Received: from [IPv6:2606:6d00:11:5a76::c41] (unknown [IPv6:2606:6d00:11:5a76::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E5B8817E00AC;
	Mon, 11 Aug 2025 16:27:11 +0200 (CEST)
Message-ID: <f904836c0bd78f71e0a85d8d924c7862415a3728.camel@collabora.com>
Subject: Re: [PATCH v2] media: rkvdec: Fix an error handling path in
 rkvdec_probe()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Hans Verkuil
 <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 11 Aug 2025 10:27:10 -0400
In-Reply-To: <00b13063525c2aee6a60a7f6810f69c12bf2a866.1753899866.git.christophe.jaillet@wanadoo.fr>
References: <00b13063525c2aee6a60a7f6810f69c12bf2a866.1753899866.git.christophe.jaillet@wanadoo.fr>
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
	boundary="=-19AGW8VvHYkhYtzMHXQj"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_072714_969608_5D6275CA 
X-CRM114-Status: GOOD (  19.56  )
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


--=-19AGW8VvHYkhYtzMHXQj
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 30 juillet 2025 =C3=A0 20:24 +0200, Christophe JAILLET a =C3=A9=
crit=C2=A0:
> If an error occurs after a successful iommu_paging_domain_alloc() call, i=
t
> should be undone by a corresponding iommu_domain_free() call, as already
> done in the remove function.
>=20
> In order to fix the issue, move the corresponding call at the end of the
> function, because it is safe to allocate 'empty_domain' later.
>=20
> Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
> Compile tested only.
>=20
> Changes in v2:
> =C2=A0 - Move code instead of handling errors=C2=A0=C2=A0 [Nicolas Dufres=
ne]
> =C2=A0 - Add R-b tag
>=20
> v1:
> https://lore.kernel.org/all/b69c20783a7b6f7964ab636679d3da80fc48372e.1753=
610517.git.christophe.jaillet@wanadoo.fr/
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 14 +++++++-------
> =C2=A01 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index d707088ec0dc..6eae10e16c73 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1159,13 +1159,6 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> -	if (iommu_get_domain_for_dev(&pdev->dev)) {
> -		rkvdec->empty_domain =3D iommu_paging_domain_alloc(rkvdec-
> >dev);
> -
> -		if (!rkvdec->empty_domain)
> -			dev_warn(rkvdec->dev, "cannot alloc new empty
> domain\n");
> -	}

I've re-applied including Dan's fixes, iommu_paging_domain_alloc() does not
return NULL on error. No action required.

Nicolas

> -
> =C2=A0	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> =C2=A0
> =C2=A0	irq =3D platform_get_irq(pdev, 0);
> @@ -1188,6 +1181,13 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
> =C2=A0	if (ret)
> =C2=A0		goto err_disable_runtime_pm;
> =C2=A0
> +	if (iommu_get_domain_for_dev(&pdev->dev)) {
> +		rkvdec->empty_domain =3D iommu_paging_domain_alloc(rkvdec-
> >dev);
> +
> +		if (!rkvdec->empty_domain)
> +			dev_warn(rkvdec->dev, "cannot alloc new empty
> domain\n");
> +	}
> +
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_disable_runtime_pm:

--=-19AGW8VvHYkhYtzMHXQj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaJn9vgAKCRBxUwItrAao
HP14AKDeWTa5P0d9CA6ywPOUflta+mlh4ACfe9DEE0Ie16V482KxslENbG3kPoE=
=t0j7
-----END PGP SIGNATURE-----

--=-19AGW8VvHYkhYtzMHXQj--

