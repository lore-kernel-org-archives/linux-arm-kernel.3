Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD19FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQaYivWBj1ySc+nCCyxMCDWtW4eRfB8nvxBhJGO3V6s=; b=Yutimq4aNYprQr2wilGMMM4/a6
	MTOgcgnbKMxNYg3f25VZBOQGEdKBcqKjotviIPaNNCqCCQG1EYjnCDQQ4Uxv6aBalsHN7+i7qJ2Pb
	g870ZSdxkOgvC1krOUlSV7ag2/Qzokms57AD0TmKFrHzN112J0fVk7+Kasl9RleK2KsRpyJbJ9lca
	4Ni6s9g+zgiHNmmTb56qRkJxcp4E//OZlz8R/biy6ZlWZ+6bxo+G0Y7vv9EpPAZNRvJ/ZhXw2ntsd
	tsBuVYmTsdgt/Zdb6ntye1VGqX569rJu66UJ1fLBbsB1EVJDbprYxWXPQwmNJaJFIE2M5T4HEsi2e
	iX+8l6qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeRI-00000004UWs-3YM8;
	Tue, 29 Sep 2026 20:28:36 +0000
Received: from mail-vs2-x2a.google.com ([2a00:1450:4864:3a::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeRG-00000004UW0-1mvH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 20:28:36 +0000
Received: by mail-vs2-x2a.google.com with SMTP id 71dfb90a1353d-5cd63c192b9so1673011e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 13:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790713713; x=1791318513; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VQaYivWBj1ySc+nCCyxMCDWtW4eRfB8nvxBhJGO3V6s=;
        b=kLMb3vUGj+rwO4iUXBKawYLXM2kQn1FlU8TdAsAgYOTqcg0xmq5cZfEkFx/R7kWGw8
         nsW0cEDmsM9taP18RMoF5fWoJeJYc+V68luYYuZgpblzXe7EUNrazrhbqyweaSd9O+/5
         DUwjHG3DQWjrt7Zu+98J4z1BmeQi62v/c/Rqy/IrjnxNBEWvyLWZC7HCj2Xq0taiBpvk
         YgBUghsXg0PVx5K7spQMIuZZ6LJgYwTCs2aVUV7BQqaEPirJDSmbcOv3KNoJ8/ic9nrS
         Ca5YWVBFyo8qN5Nvts0E1V3COXYxzpofp/l1ChhCUgJSlZaVQVx+4MTnjqs5vXaD60hu
         T1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790713713; x=1791318513;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VQaYivWBj1ySc+nCCyxMCDWtW4eRfB8nvxBhJGO3V6s=;
        b=STDD0jQiiZZhyBJTQ+nCDjFFVk+CkivtCR8yg289Qcsk1BosOb89Kljc0IASIGgElP
         qEGfDo1CNIVaw8B4wYoER62XrtGW25H5LL0HF3vPtMu2IWjfrIMeSDauxrrN+TUuxLwm
         DP645W5pYURfP8aRoXWA7p7+PO75IJRBhiJDagmWx5dPjbQV5rEuiEhtvNbTa2GenkYh
         gktkveOzvVVrxRw2K4IPinHnNgCn0wy5k3Sf9foxvfiEK8ZgS3bFBQhnrDRTLhAh00Ru
         eoxUs+wXBafd5N7GCa9opOZS7LXi8YEpzSlZLaqQIWerJpypEu+FSRbFIRWAG+eUv+1O
         8/Dg==
X-Forwarded-Encrypted: i=1; AKwUvBwSznphKLt/Ncp3uhBJAjFwJECDOvsGQiSb312TuzdZPJcWd5g0DRGhZy4F+7fuNAbq7oUfwkk807pHdPmnUJ8S@lists.infradead.org
X-Gm-Message-State: AFq9FYKOq0v4jWcYJHsb1PNlglhyoVMXreAh8+28o2+RY+D+Trx20Ri3
	MARk/HglNKvCXDCehjAG23oScvTXJwrRJpr7Z4b6/pMKS5xBGPG6fb8jn1Ks0OAuKOw=
X-Gm-Gg: AYBFou0bDuoPD64FyPYhpaExxinN9VppEngeanqAtbcQ8NSgb4crq8F+JB+6P9PYZze
	cH6bmdMLOiChKuIrqpIXA00/dSMhrZAnyfD2ITQlNGo6cQdzdJx6FqMMJZTuOShhD7ybSXKuDfF
	9ewyDmo1Y1tFWYqZiHvjU1/qeTUvd3GwHAHbbG6x2zGQksudkmNXn1iSrmpYDnHBl0EyuR/WzSR
	3JdACVikhhiIdQ5b/zpTkjLpD48LLmVwRKZIHu+8bEKDso93cOjCYpzVg33O4+2ScV/Z5Ga9BHZ
	yvtLZ2Dnau1epdrbMOlDVB5f9n1hNMEnp5o74WeRA9e716NKJwi+LHE09iBdEX60vRgkPqsKNMs
	se5jEEag4I0NDugl+fIyImru7ByQfEYPFPyUEUJtEqBi0a9e9QY5KZxe/YERSJw4fzsFfc5smWM
	Tb9rV2AbOou49TLHR+fgCvOno3xM0IH+hYeEY0x9/wVl5gJciO0Zp7M0JRrDJdCkY4RAbdkrKiP
	1z9UJPeQwalGg==
X-Received: by 2002:a05:6122:e1aa:b0:5c9:c60a:e9b3 with SMTP id 71dfb90a1353d-5d51a3753bemr226593e0c.19.1790713712883;
        Tue, 29 Sep 2026 13:28:32 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d4e9a793e6sm1089117e0c.13.2026.09.29.13.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:28:32 -0700 (PDT)
Message-ID: <1fe9b189db3d0704be5b1b37a700311dac2cbfc3.camel@ndufresne.ca>
Subject: Re: [PATCH] media: rkvdec: Remove redundant dev_err()
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Diederik de Haas <diederik@cknow-tech.com>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 16:28:31 -0400
In-Reply-To: <20260919093449.2534901-1-diederik@cknow-tech.com>
References: <20260919093449.2534901-1-diederik@cknow-tech.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-F+3ToYK5qPTGqdEYIxDv"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_132834_494464_A35867BC 
X-CRM114-Status: GOOD (  16.14  )
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


--=-F+3ToYK5qPTGqdEYIxDv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 19 septembre 2026 =C3=A0 11:34 +0200, Diederik de Haas a =C3=A9cr=
it=C2=A0:
> The devm_request_threaded_irq() function already logs detailed error
> messages on failure automatically since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()"=
)
> So remove the now-redundant driver-specific dev_err() calls.
>=20
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/media/platform/rockchip/rkvdec/rkvdec.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 061281f903f3..13d13c041509 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -1824,10 +1824,8 @@ static int rkvdec_probe(struct platform_device *pd=
ev)
>  	ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL,
>  					rkvdec_irq_handler, IRQF_ONESHOT,
>  					dev_name(&pdev->dev), rkvdec);
> -	if (ret) {
> -		dev_err(&pdev->dev, "Could not request vdec IRQ\n");
> +	if (ret)
>  		return ret;
> -	}
> =20
>  	rkvdec->sram_pool =3D of_gen_pool_get(pdev->dev.of_node, "sram", 0);
>  	if (!rkvdec->sram_pool && rkvdec->variant->num_rcb_sizes > 0)

--=-F+3ToYK5qPTGqdEYIxDv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarwfbwAKCRDZQZRRKWBy
9KhKAP4k1cHvpCPn5smix40RZY42YEI2Eo0qvXxN29oEVWOpCgEAnLNOPA0qpepn
oMGr7q8y93fQEe5BvvTo5vSFZBOIxQw=
=Qt2k
-----END PGP SIGNATURE-----

--=-F+3ToYK5qPTGqdEYIxDv--

