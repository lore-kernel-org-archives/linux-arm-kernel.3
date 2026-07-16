Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B88C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:To:From:Subject:Message-ID:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mfs6TPohHB4ptVhWPd7wCfPWGeW/kT+9UO9C9aZwuc=; b=jxanh4tZtE4rjaZltVUhPrVMa8
	7CtgsGH+4akniWut+MEL1y9VbOe3mlmR3njIIbVA2Pw9T6fO024ceWNTJaBmn82UH7bCONjT1L9uH
	m/b5XnnbKy9KgNdkSrxyu/LFh1I5g/2hGvaXha/UKTUEf3Q8ifb0bE4reX1DNivsyR4uEKONH34jv
	oMNMUOhZ3kXRNkYosaQ7XhVRYKc3xYKodWYPottfHWBKCDITbt/QJy9z/iUY/HwrUA+YGnjOzG0bV
	MaDYCDIsOkV6aLilZ+/Rc4XVY8cw/9CkIluY1cQ5h/fp+qfVxGWmRjiODS5Dwv6o5qsiQCtAlhmTl
	SBMrBnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTTv-00000000ayQ-2vXy;
	Thu, 16 Jul 2026 21:18:59 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTTt-00000000ax0-0LZ6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 21:18:58 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-51bfbe05683so60610891cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1784236736; x=1784841536; darn=lists.infradead.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mfs6TPohHB4ptVhWPd7wCfPWGeW/kT+9UO9C9aZwuc=;
        b=z4j7KRD99myzH+WMn+TsvaGKdJUo4RZ7eI/wWXWNiDymIVkpGyEC1KqrjNe+94bxGO
         kMi6mZ/U8gFDHWUNUaMtBZkDyTcUB0GtWNqxMI/4EK/UxHJQTRVy/MNowRcnhzixL0hr
         3O6SHTPKdHBuwQLtQK/xq9952DNVAfEBgN8JQNjSqK3A0t6MyWRC+AORFqJPIEO6X4GV
         bTgS/wHkuhtB5xJ+4iiG14ieaPoaFSohdmtQD/xZTcyh11kOjHqrnm3BcuZfD+FX18fB
         v+QKLRthoHZmW3JQ1m+gSVFs5+bTyVbxQqMQu7E4J4Qdn54ciYHvw/zaZMEaYo2vKR46
         hTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784236736; x=1784841536;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mfs6TPohHB4ptVhWPd7wCfPWGeW/kT+9UO9C9aZwuc=;
        b=pE5aC8tD/ubMgO5BLP+fI28J56SbMosNeHGeGM0dAwO2Wqyomfkpgsi5L8YJ+QEKVr
         y/6Iq45CzayP/QWvuuwHruDjXDCZp9qd/22OgjZkV4syKKNrfepCzoq9mCc2Dn+YPG/f
         JZcvAMtBhndDtlG1NvrnJM6WFd9x2vi0rnzL+pURQiDsjxKQWOlT0eo9Gmx0+iOGXphW
         59WNmSpFfFhxz5C7DHiHTg/OgHsNbjyaPb/B624tBOHu42N8QI3rjj5m1WLXgoK25QP8
         Xx8Qmbd2BhrZ27IiS0Fcllgea2bDIRFLCJPtyd9zTmbGRYFu8MfUVuFvy3beF5/Ef6L4
         Gwqg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9qcGe5H2UxZs2+cKEb4swNTJXGUl8j+mLeSlhFoFfpMpqOr2DnFdV+zK0uCFXYqtArOlk4/02GfKsY81xtDD8@lists.infradead.org
X-Gm-Message-State: AOJu0YwDG/MNRcoypi/7lhzO14ZGXkDf4l+U3hPr5FBNj/qXN7j1ahJq
	Spxu/fIMOdkOZb1jgGfWpK5MrP/+jLYm4bWwG0yqvl/QKjZc/aUlbHvhhTSn10T6Y2A=
X-Gm-Gg: AfdE7cn4SmgQxfDSDIVkcr61yekHhA5Nb05hJhBXMJoRvQsn224CLEG40KaltaER7wz
	q/24SXFTbF+LmNlt5wSWbm2TNz9k7TLQJlxy/99tRNf/6HHd4TIn+C4etVAa+vwjzJOh8PG3u2e
	NloPqe3N8jUlutEv5d/KBFY9VHfEYFPKWO98/H27r/e8fXvyJ2GDmQqAA7UDSsK7t0mFqk4zKGa
	VNP9+dPI7wZDmu4G58GR6rzIluO7SSN/7Moj0pY1FJpmJ5tQtnxW0N2BactCkvAPVwRHxdi4HDt
	N8dTZXT1B8QU2WLb4/YULl+ipmET3tNZTG4IaO3vMEqd/kNjWLfJ33TcBVtOCKN7XxLyCuuQuox
	4600SfsS74B3COHblbbg4jCXosOpNwicRbvyDgGLF4fYvVLMwqKel8s7Il5l41y4bZ043pwYCn/
	pfCKGbIlA=
X-Received: by 2002:ac8:5915:0:b0:51a:8c9c:7f52 with SMTP id d75a77b69052e-51e3c340859mr149029421cf.69.1784236735471;
        Thu, 16 Jul 2026 14:18:55 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf671e2sm162519051cf.25.2026.07.16.14.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 14:18:54 -0700 (PDT)
Message-ID: <723eb4c02c01e2af19394b715413c198baef687e.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mtk-mdp: unregister VPU watchdog handler
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Guangshuo Li <lgs201920130244@gmail.com>, Minghsiu Tsai	
 <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Tiffany Lin	 <tiffany.lin@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil@kernel.org>, Eizan
 Miyamoto <eizan@chromium.org>, Enric Balletbo i Serra	
 <eballetbo@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Date: Thu, 16 Jul 2026 17:18:53 -0400
In-Reply-To: <20260708121910.758166-1-lgs201920130244@gmail.com>
References: <20260708121910.758166-1-lgs201920130244@gmail.com>
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
	protocol="application/pgp-signature"; boundary="=-crHtUZ7+2c5Ajf8qSv7r"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_141857_144341_0D7F0955 
X-CRM114-Status: GOOD (  20.58  )
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


--=-crHtUZ7+2c5Ajf8qSv7r
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 08 juillet 2026 =C3=A0 20:19 +0800, Guangshuo Li a =C3=A9crit=
=C2=A0:
> mtk_mdp_probe() registers the MDP reset handler with the VPU watchdog
> code and passes the MDP device as the private data.
>=20
> The handler is stored in the VPU device and can outlive the MDP probe or
> remove path. If probe fails after the handler has been registered, or if
> the MDP device is removed, the VPU watchdog table can keep a pointer to
> an MDP object that is about to be released. A later VPU watchdog reset ca=
n
> then call mtk_mdp_reset_handler() with a stale pointer and dereference
> freed memory while queuing the MDP watchdog work.
>=20
> Add a VPU watchdog unregister helper and clear the MDP watchdog handler
> from both the probe error path and the remove path before dropping the VP=
U
> device reference.
>=20
> Fixes: ee18fc7b0b95 ("media: mtk-mdp: handle vpu_wdt_reg_handler() errors=
 during probe")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
> =C2=A0.../media/platform/mediatek/mdp/mtk_mdp_core.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 2 ++
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.c=C2=A0=C2=A0=C2=A0=C2=
=A0 | 15 +++++++++++++++
> =C2=A0drivers/media/platform/mediatek/vpu/mtk_vpu.h=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 ++
> =C2=A03 files changed, 19 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c b/drivers=
/media/platform/mediatek/mdp/mtk_mdp_core.c
> index 8432833814f3..5ccb7aa925d9 100644
> --- a/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_core.c
> @@ -221,6 +221,7 @@ static int mtk_mdp_probe(struct platform_device *pdev=
)
> =C2=A0	return 0;
> =C2=A0
> =C2=A0err_reg_handler:
> +	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
> =C2=A0	platform_device_put(mdp->vpu_dev);
> =C2=A0
> =C2=A0err_vpu_get_dev:
> @@ -254,6 +255,7 @@ static void mtk_mdp_remove(struct platform_device *pd=
ev)
> =C2=A0
> =C2=A0	pm_runtime_disable(&pdev->dev);
> =C2=A0	vb2_dma_contig_clear_max_seg_size(&pdev->dev);
> +	vpu_wdt_unreg_handler(mdp->vpu_dev, VPU_RST_MDP);
> =C2=A0	platform_device_put(mdp->vpu_dev);
> =C2=A0	mtk_mdp_unregister_m2m_device(mdp);
> =C2=A0	v4l2_device_unregister(&mdp->v4l2_dev);
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.c
> index 8d8319f0cd22..5dc50a658c2b 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
> @@ -437,6 +437,21 @@ int vpu_wdt_reg_handler(struct platform_device *pdev=
,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(vpu_wdt_reg_handler);
> =C2=A0
> +void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)
> +{
> +	struct mtk_vpu *vpu =3D platform_get_drvdata(pdev);
> +
> +	if (!vpu || id >=3D VPU_RST_MAX)
> +		return;
> +
> +	mutex_lock(&vpu->vpu_mutex);
> +	vpu->wdt.handler[id].reset_func =3D NULL;
> +	vpu->wdt.handler[id].priv =3D NULL;
> +	mutex_unlock(&vpu->vpu_mutex);
> +}
> +EXPORT_SYMBOL_GPL(vpu_wdt_unreg_handler);
> +
> +

This extra blank makes checkpatch sad :-\ Since I see nothing else to comme=
nt
about, I'll simply apply this fix on my end.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

regards,
Nicolas

> =C2=A0unsigned int vpu_get_vdec_hw_capa(struct platform_device *pdev)
> =C2=A0{
> =C2=A0	struct mtk_vpu *vpu =3D platform_get_drvdata(pdev);
> diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/medi=
a/platform/mediatek/vpu/mtk_vpu.h
> index 3951547e9ec5..2ccb481a04cf 100644
> --- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> +++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
> @@ -141,6 +141,8 @@ int vpu_wdt_reg_handler(struct platform_device *pdev,
> =C2=A0			void vpu_wdt_reset_func(void *priv),
> =C2=A0			void *priv, enum rst_id id);
> =C2=A0
> +void vpu_wdt_unreg_handler(struct platform_device *pdev, enum rst_id id)=
;
> +
> =C2=A0/**
> =C2=A0 * vpu_get_vdec_hw_capa - get video decoder hardware capability
> =C2=A0 *

--=-crHtUZ7+2c5Ajf8qSv7r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCallKvQAKCRDZQZRRKWBy
9IGdAQCpnzqE1azFjuacoNMcIeisgg6SaEx51b5TkFJe6O4jWgEA32oGJzf58ofO
+IbTOnKXkPrL4p5Lp8+f60gxG2qdQAY=
=4s28
-----END PGP SIGNATURE-----

--=-crHtUZ7+2c5Ajf8qSv7r--

