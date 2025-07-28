Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE9CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 22:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0jNYa828sO/MHhyNcQKWPRFIJYIUhvUWbMRbKgJ53k=; b=rgylEU78ozqjJDNyq5CxXF9Dxh
	tAcEQXpl9V7baqbZ3GYZztVBtn9laNfaT7RKkHwMWFsR/oC7W6HskMt97FNjiRhEySGjq7wCDog2z
	PSpAJrZnNFqho16Ld4axsHgP+lBd7lQFvwFPj8uOCbH2hHx53yUQ02Dd4BadgE8EK/3p+47C8E1xC
	7ozpmQLn/HarpFTdlNNmb1CFuibTxGo5/y+P0TrKTQzvCDqde35Me6EmapXY8xJzJQlFpzcOnA6TI
	/HMrJjRxsosAgDl9OSRMcIgkP9FCEhbCe6B+O1lbKYKWwbfYnm4WTjJrBj1Fd5MSfYDHBsfPmc0Sd
	HsvsFvqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWiY-0000000FYAi-2ckB;
	Mon, 28 Jul 2025 22:53:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugWg5-0000000FY4S-42aI;
	Mon, 28 Jul 2025 22:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753743040;
	bh=aUFYEhrBDCMb4rwh/p3Q8a9jltXCwz63SKfYeyEBQ9c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jz3AhKYXHiMcXAa5/TA6plvdh9o27whoXtIwBXldnVh6kY0wZbIFp7Bd0PdmUBkhV
	 JrSb5Qui32vWAwBDerTapR7pJhoeT4wXj4fJJeWefITauKHpqg2AL5Yh1h1qhWqiA/
	 wM7TRDt5Yt7gVJdy1ohMmrHfFyjdZgWcBbjnGzzVGZwIG/+Ov+oZSBVsGyGCGyH3bu
	 LVjpw2IRptw6sFa87JZKElLRc5vpiGkiMDbSo/1tftTGTjrO/+3QLoLvRSDC63Va6a
	 gr5bYx9CTVwRQujAPVn1n4NYndKo7cQ6lZHX3c40SKA2+yKYme+4aZV2jJWgWjJd18
	 7NAzEwERFL0iQ==
Received: from [IPv6:2606:6d00:11:5a76::5ac] (unknown [IPv6:2606:6d00:11:5a76::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E982017E0FA8;
	Tue, 29 Jul 2025 00:50:38 +0200 (CEST)
Message-ID: <0a8391cb368653b91ea73a51e2c0dee35cceb128.camel@collabora.com>
Subject: Re: [PATCH] media: rkvdec: Fix an error handling path in
 rkvdec_probe()
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Heiko Stuebner	 <heiko@sntech.de>, Hans Verkuil
 <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 28 Jul 2025 18:50:36 -0400
In-Reply-To: <b69c20783a7b6f7964ab636679d3da80fc48372e.1753610517.git.christophe.jaillet@wanadoo.fr>
References: <b69c20783a7b6f7964ab636679d3da80fc48372e.1753610517.git.christophe.jaillet@wanadoo.fr>
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
	boundary="=-HBQA1dSSAY++JW3+CEB6"
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_155042_158965_84AE2769 
X-CRM114-Status: GOOD (  17.37  )
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


--=-HBQA1dSSAY++JW3+CEB6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le dimanche 27 juillet 2025 =C3=A0 12:02 +0200, Christophe JAILLET a =C3=A9=
crit=C2=A0:
> If an error occurs after a successful iommu_paging_domain_alloc() call, i=
t
> should be undone by a corresponding iommu_domain_free() call, as already
> done in the remove function.
>=20
> Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested only
> ---
> =C2=A0drivers/media/platform/rockchip/rkvdec/rkvdec.c | 11 ++++++++---
> =C2=A01 file changed, 8 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> index d707088ec0dc..eb0d41f85d89 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1169,15 +1169,17 @@ static int rkvdec_probe(struct platform_device *p=
dev)
> =C2=A0	vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
> =C2=A0
> =C2=A0	irq =3D platform_get_irq(pdev, 0);
> -	if (irq <=3D 0)
> -		return -ENXIO;
> +	if (irq <=3D 0) {
> +		ret =3D -ENXIO;
> +		goto err_free_domain;
> +	}
> =C2=A0
> =C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
> =C2=A0					rkvdec_irq_handler, IRQF_ONESHOT,
> =C2=A0					dev_name(&pdev->dev), rkvdec);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
> -		return ret;
> +		goto err_free_domain;
> =C2=A0	}
> =C2=A0
> =C2=A0	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);

Have you considered moving the allocation of the domain right above the abo=
ve
line instead ? The empty domain can't possibly be used unless the probe hav=
e
fully completed.

Nicolas

> @@ -1193,6 +1195,9 @@ static int rkvdec_probe(struct platform_device *pde=
v)
> =C2=A0err_disable_runtime_pm:
> =C2=A0	pm_runtime_dont_use_autosuspend(&pdev->dev);
> =C2=A0	pm_runtime_disable(&pdev->dev);
> +err_free_domain:
> +	if (rkvdec->empty_domain)
> +		iommu_domain_free(rkvdec->empty_domain);
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0

--=-HBQA1dSSAY++JW3+CEB6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCaIf+vAAKCRBxUwItrAao
HIh7AJ9siqERzUwFpo03WB/ccY47zYm2BwCcDeERz+YrhGQaSfBNmTmJ7h2Kxgw=
=gy7Q
-----END PGP SIGNATURE-----

--=-HBQA1dSSAY++JW3+CEB6--

