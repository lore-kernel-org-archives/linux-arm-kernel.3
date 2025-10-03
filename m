Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98564CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 15:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcjsGAtJBDRTbKSc6ZGZGbuEJNUcV2kb0nQ6sHCx+Sk=; b=oyccESIZb9Ha3Dz/crMxFgFUQk
	x0HiHDMvpx9hz5zXNhw8i7CR4ydl/dvEyX6rvwzi3L/Cw0YBIrpZ+Va+hIahduZfUwkK+Xch4g10v
	hJUtGg3ciBZYTazm29ortrGcOlC3M02EfgJxy6vdqZ+Z4AzcorCPXRv3UDhRLfTqj2yqFrEZzIbRN
	8wxM5Wyw64YPejYX051JX6Av5UDwDRMe3dDbCSboBggvUDtqmfHX4I/99HEtTGOyAzaoyJOCX9pzB
	chhrMfRrY1EqkHz8F2zrJLl0zHkx2340h+aK9UCGqBJuMvoVW3x0tNd/OwSobpaCt3d6GM2Kei6sI
	J1l6yFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hxl-0000000CfOO-416n;
	Fri, 03 Oct 2025 15:44:53 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4hxj-0000000CfNI-0m0c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 15:44:52 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4e3117ea7a2so34011651cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 08:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1759506289; x=1760111089; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CcjsGAtJBDRTbKSc6ZGZGbuEJNUcV2kb0nQ6sHCx+Sk=;
        b=OHAfCod/Up+9cGZNabfb3pE5neucTzvpXI4AmiCvWwN8mRWSP8EwsvsU1Ji2h2OBB1
         ywIbjNw2BxUOAhMhWDOcmxror/mNvdSBUudeEpnRmPbmGL12Of34PUCvU4/wUDfbAql1
         5PHX1/jDVppE75C8xBu56hnboIASEFBSLIL5hdwHIrraYC/XpPd7phMzL8cEjIXk/phB
         BNImlLo/oY02jxVp31C4srQiDOzqkqGbl0N7+sUInOCz4FX5UmibK4iq7m4WOPRH7cMS
         1IxobUFezNDN/d4lWTT7nE8alhskoc1k6Kk1TrZCtgG+Da028wdk+Q6ehCGVMxzGTyH8
         LYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759506289; x=1760111089;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CcjsGAtJBDRTbKSc6ZGZGbuEJNUcV2kb0nQ6sHCx+Sk=;
        b=U2m9STuus8MasWhwCfQDlWT7bPkv+mHSocdQ4059JkkUUiy6tcWbyQzh4Rni1UE+aT
         rM/iUxDrVYDS8X1pXmlXI7kQj4UY2xOSbf28pmzIUWbkeEPHK+FPCIxVeEgaYfuzadiV
         gm5pdFIwUCB1UlhP7nBOPhinUmz5OZ/AZ5wme5X1YoIAOXPEmtcEyHdTsE6/QSkqVdMc
         KBDAA9/vgLWElhceI04H8vfTVjPM9Pq/lV8zATq7LRGhInzrPMx3dbzlC5++q9yHCy54
         xH+w844NUOyFlsFDAlAug+3GplYPhOKapUZrJex/sKz+Sw5uauhN596lgJED+yDWdPT0
         /91A==
X-Forwarded-Encrypted: i=1; AJvYcCWnYi8OvDMFOrIJaSYJr7gLEzlyVOIaP7r89aC+52ffzfU1aClKs72kvMULin2WEF/t6yT02VBtkElZ/Wc7I1mK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6b3LHC6mv5LIbLcJGNYhLraLdbg/JSSiEL592O8EJ0Jl4nqvn
	nYmb2msqaRXEBBMtrpQNZZaJQbjO9wvcl8Sl0MUT7Hm9tqs2IRXvw7Vnca/it/v4ajE=
X-Gm-Gg: ASbGncu1tvQXM7d0DQ+ptt0ejeajPkhknG+tPXAyFjEKvPveqS84ybO+9Nj0AWqOrXl
	+h5iHAop4HDndYHaIJx/GUZVr+wGrTTBx/75fHVWAtPwo4XZXkhR+G5AwqzS77DKlZbD+11grqZ
	9plikodovBmdLU5/ayZJLAAzbPclBvEQnraROfUjoY+dKU187TM9gt4g93IVsTKYuYJPfXqDH7d
	KHXc8c8JEcvoDOnVV4vzJNEUyeXD4lzHVgYdvuUhar0zKlg54fEbvAX5GSMFnSedLzpDnFgJW2t
	hCGHZFod4mQ5SLFGDkscyk9gqkXqSYBoh7lRjjCGsk28NIR+9oacwmF/U/J1edvepM/v0080DnK
	Ut4UfAO2ADEvI+DC3zodAS5tszdQ1d1ylxifYDiiwRIvvtlEZrq30tb7lw6n1O6E3AE+5X5XWwP
	MitA==
X-Google-Smtp-Source: AGHT+IG3nggyzp6rBeV7O8SFngJ0q7vh9MKYuGI8B+E0xgcql9QjTelcIZpNtFB3s282izeII55ing==
X-Received: by 2002:a05:622a:343:b0:4b5:e9e3:3c90 with SMTP id d75a77b69052e-4e576a5d586mr46819141cf.9.1759506287912;
        Fri, 03 Oct 2025 08:44:47 -0700 (PDT)
Received: from [192.168.42.140] (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e55aa44901sm41212601cf.18.2025.10.03.08.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 08:44:47 -0700 (PDT)
Message-ID: <e22a74d0298d7318c59841f706f6f731c77241db.camel@ndufresne.ca>
Subject: Re: [PATCH v2] media: mtk-mdp: Fix some issues in mtk_mdp_core.c
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Haoxiang Li <haoxiang_li2024@163.com>, minghsiu.tsai@mediatek.com, 
	houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hans.verkuil@cisco.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Date: Fri, 03 Oct 2025 11:44:45 -0400
In-Reply-To: <20250917094045.28789-1-haoxiang_li2024@163.com>
References: <20250917094045.28789-1-haoxiang_li2024@163.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jvh4cueVjwyOExiJXg2C"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_084451_341977_962FD918 
X-CRM114-Status: GOOD (  20.94  )
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


--=-jvh4cueVjwyOExiJXg2C
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,


Le mercredi 17 septembre 2025 =C3=A0 17:40 +0800, Haoxiang Li a =C3=A9crit=
=C2=A0:
> Add check for the return value of vpu_get_plat_device() to prevent null
> pointer dereference. And vpu_get_plat_device() increases the reference
> count of the returned platform device. Add platform_device_put() to
> prevent reference leak. Also add platform_device_put() in mtk_mdp_remove(=
).

I think we should improve the subject a little. What about ?

  media: mtk-mdp: Fix error handling in probe function


Nicolas

>=20
> Add mtk_mdp_unregister_m2m_device() on the error handling path.
>=20
> Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
> Changes in v2:
> - Add check for vpu_get_plat_device()
> - Add platform_device_put() in mtk_mdp_remove()
> - Add mtk_mdp_unregister_m2m_device() on the error handling path.
> - Modify the patch title and description. I think you are right.
> =C2=A0 Thanks, CJ!
> ---
> =C2=A0.../media/platform/mediatek/mdp/mtk_mdp_core.c=C2=A0 | 17 +++++++++=
++++++--
> =C2=A01 file changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> index 80fdc6ff57e0..8432833814f3 100644
> --- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> @@ -194,11 +194,17 @@ static int mtk_mdp_probe(struct platform_device *pd=
ev)
> =C2=A0	}
> =C2=A0
> =C2=A0	mdp->vpu_dev =3D vpu_get_plat_device(pdev);
> +	if (!mdp->vpu_dev) {
> +		dev_err(&pdev->dev, "Failed to get vpu device\n");
> +		ret =3D -ENODEV;
> +		goto err_vpu_get_dev;
> +	}
> +
> =C2=A0	ret =3D vpu_wdt_reg_handler(mdp->vpu_dev, mtk_mdp_reset_handler, m=
dp,
> =C2=A0				=C2=A0 VPU_RST_MDP);
> =C2=A0	if (ret) {
> =C2=A0		dev_err(&pdev->dev, "Failed to register reset handler\n");
> -		goto err_m2m_register;
> +		goto err_reg_handler;
> =C2=A0	}
> =C2=A0
> =C2=A0	platform_set_drvdata(pdev, mdp);
> @@ -206,7 +212,7 @@ static int mtk_mdp_probe(struct platform_device *pdev=
)
> =C2=A0	ret =3D vb2_dma_contig_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(3=
2));
> =C2=A0	if (ret) {
> =C2=A0		dev_err(&pdev->dev, "Failed to set vb2 dma mag seg size\n");
> -		goto err_m2m_register;
> +		goto err_reg_handler;
> =C2=A0	}
> =C2=A0
> =C2=A0	pm_runtime_enable(dev);
> @@ -214,6 +220,12 @@ static int mtk_mdp_probe(struct platform_device *pde=
v)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0
> +err_reg_handler:
> +	platform_device_put(mdp->vpu_dev);
> +
> +err_vpu_get_dev:
> +	mtk_mdp_unregister_m2m_device(mdp);
> +
> =C2=A0err_m2m_register:
> =C2=A0	v4l2_device_unregister(&mdp->v4l2_dev);
> =C2=A0
> @@ -242,6 +254,7 @@ static void mtk_mdp_remove(struct platform_device *pd=
ev)
> =C2=A0
> =C2=A0	pm_runtime_disable(&pdev->dev);
> =C2=A0	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +	platform_device_put(mdp->vpu_dev);
> =C2=A0	mtk_mdp_unregister_m2m_device(mdp);
> =C2=A0	v4l2_device_unregister(&mdp->v4l2_dev);
> =C2=A0

--=-jvh4cueVjwyOExiJXg2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaN/vbQAKCRDZQZRRKWBy
9KWiAP0QJQMSss66nBhuvWdyP3z+yb6Q5jk6MMuOVBfPG9I+XgEAlm/xzfuJ8BPA
DxlLGE1JMwN8N8zLQzYhKhp61WB8XwQ=
=RvA4
-----END PGP SIGNATURE-----

--=-jvh4cueVjwyOExiJXg2C--

