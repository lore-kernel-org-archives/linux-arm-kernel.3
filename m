Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EC7CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 15:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOu5uWEEG32depN6lamngfrPC9NH0+eC4cO0/sZPFE0=; b=B2n6N+2Axs4PS0WOoGm1qhLMp5
	WAWkJ4dxkO+RXLjIPvp0VA2HdZms3R5WIqpyF/Ef4+nnVR2iJnqsITq4om1/tRzCpoqy8xc9nLORn
	duitdVT/SmThi1UCQ0n8K7XYC24bE85jN5/cIVtfJzuZXG444tR2SV9UcuIxmwbDiHNgy3g89WNxZ
	C8fXmwqb9aXDbe9Pwb75vR8y1TCY2mrlS8jO6pNysY2veJKUzz02Dc2Xz1IYHyulA/G4HrIaDIPbn
	Sxa3gKJN/eipyzxpcq78NVtv0IYVxAIeJ3QO8hdRoBRJu4Ar3bj6D9j6eGcsqL8K6zoyd/316z120
	uPBSn8Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ90g-0000000EUID-3TK4;
	Mon, 15 Jun 2026 15:13:58 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ90c-0000000EUHS-28Dx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 15:13:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso34096815e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781536432; x=1782141232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOu5uWEEG32depN6lamngfrPC9NH0+eC4cO0/sZPFE0=;
        b=aDBeaMmp2PTgQQF2VHKba8NPhEtjvY6NZqjr0a+105aG6jVyaFBXCNkUqRlp5slnNg
         Uy1b1KHKeG6/rYN9qjCvPUREuEGk3KSLXzUIcVWIIwarS5F/JR/I04jFM2tchJcjPNcn
         E3RUTbaWTty1Ke0eGKXgSzwSp+6a+SjM5J992wP4+HFnn/P3BlVfgWGutkmnqOGQWSEd
         aEQgUThNbv29BlYE+bNwHnQ3ObyIMn+wb1+3TtdDOgP1wyTe7QtBITVIzIDqZ7AX80jz
         GZ99eJDFHTPCe0PyKjLc1nWvGlNX95wXLZy7DJkUF/cqjsKK8iZr8tufp5LSVc9+b0/2
         GLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781536432; x=1782141232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XOu5uWEEG32depN6lamngfrPC9NH0+eC4cO0/sZPFE0=;
        b=bGQha2rSz/Qcuhnm3QITQxACZJAcu6HaRegsphHR0Zl4wCiBEG48vESsaFC7t4VNgp
         JEIOg5r6ICAiE5RBO2xDshVPxOvAx1npZU+Hbwh3hidzELqy/8E4ONT7PHKlaMyHLad+
         narJRAlVVkc7zjAk1X2P9RrInmt8omXxUi+d65RM9FxQSZ26Bvo++4/LBDIw0Cb7BpqG
         s39s4rH0jWPbrPTlZDODmoHI7wpb6CdCYnVI6VsvWT3Vt+qFK8HS+7i6zw6cwfxf4Hpx
         SYIrKY2TpieaXCRpiuzc+CEl7K3j6RPJBkVRT3Ta0ZsMbO3UioIcGMtE8/fxneaFlX7i
         5uYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BrvSF0RZvoUGFUNA/TRsRzP4QrjvJv0i7DjJiVujycg798xJ4AjI9aYujZ14iSV4vFBNIu2Oa73T+8s7/bVhT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9CMLj8GyV6hrgZ7EzRpA2wVFakoVIkOnMV2755aDcx51SpP2F
	tCwa/p5EAuN7wFbSn008neQpQpNsmS/9epFv/oGFH/VkESuAW7p4KLwo
X-Gm-Gg: Acq92OGaXRZpF2LmYjFjPnXoeGLrGY5B0Ko+Kb4hyQRQp6s5QepEJd0jdRR4Ivb52Bd
	UB8Iv4uR4NTcD8EAWt9U06EYMOZkeV+1JHfITdb/a/IZRFidYmyc+cBswIhgkwRZPT3AtIwd4Ba
	FMUAOI3dXjidC7Gz4Y68k13rtwYjfiur9vgKAylUo6xbcSqBJvo05ha7lL2kGqDHSHkmV98BWhB
	+vcqqxEq23/1ZULFHlhFa0xZv4lC1Is42EBRuUuJypgB9FAmSagXUrq1SJLnsSRSh8tNXTcElhJ
	ccjOA4q9Hn8SbZ2W8Jlbgvh88l2hSAUFxQR0dN93AMBR0Hlb7zQLLWynSZOZTYltfOnyh/H1vZp
	JdTOUf8iX3oj3PIi5KmWeGfqcWKEYTFHWPBGJGowN2qDdG6Gy+/amr33bR1mCFHWa7/yZon1hH4
	1cLNvyyDkHIGfpsI88AowfxLxqm0ckLNV5lQYJHhDX6FNmjNGlDWTf1uaDFJfQnOWFEw388sk2h
	Z/LBVIRSUdPDWUCUP2ipG1ktsnUtdm3Ggh02Q==
X-Received: by 2002:a7b:c5cb:0:b0:490:5429:1515 with SMTP id 5b1f17b1804b1-490ea9721c9mr127671085e9.0.1781536431914;
        Mon, 15 Jun 2026 08:13:51 -0700 (PDT)
Received: from jernej-laptop.localnet (92-53-159-70.dynamic.telemach.net. [92.53.159.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm36364453f8f.20.2026.06.15.08.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:13:51 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org,
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de,
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
Subject: Re: [PATCH v2] dmaengine: sun6i-dma: Fix use-after-free in error handling
 paths
Date: Mon, 15 Jun 2026 17:13:49 +0200
Message-ID: <m3OXKiXNQhuGBq_OoFe6nQ@gmail.com>
In-Reply-To: <20260615022400.13454-1-zenghongling@kylinos.cn>
References: <20260615022400.13454-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_081354_563584_AA8D3962 
X-CRM114-Status: GOOD (  19.53  )
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

Dne ponedeljek, 15. junij 2026 ob 04:23:59 Srednjeevropski poletni =C4=8Das=
 je Hongling Zeng napisal(a):
> In error handling paths, the for loop frees v_lli in the loop body,
> then accesses v_lli->v_lli_next and v_lli->p_lli_next in the
> increment expression, which is use-after-free.
>=20
> Fix by saving both the next virtual and physical pointers before
> freeing the current node.
>=20
> Fixes: 555859308723 ("dmaengine: Add driver for Allwinner sun6i DMA")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> Suggested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> ---
> Changes in v2:
>  -Refactored the fix to avoid code duplication by creating a helper funct=
ion
>   sun6i_dma_free_lli_list() that handles LLI list cleanup
>  -Add Suggested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/dma/sun6i-dma.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb..02dd07001d5a 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -406,16 +406,12 @@ static inline void sun6i_dma_dump_lli(struct sun6i_=
vchan *vchan,
>  		v_lli->len, v_lli->para, v_lli->p_lli_next);
>  }
> =20
> -static void sun6i_dma_free_desc(struct virt_dma_desc *vd)
> +static void sun6i_dma_free_lli_list(struct sun6i_dma_dev *sdev,
> +					struct sun6i_desc *txd)
>  {
> -	struct sun6i_desc *txd =3D to_sun6i_desc(&vd->tx);
> -	struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(vd->tx.chan->device);
>  	struct sun6i_dma_lli *v_lli, *v_next;
>  	dma_addr_t p_lli, p_next;
> =20
> -	if (unlikely(!txd))
> -		return;
> -
>  	p_lli =3D txd->p_lli;
>  	v_lli =3D txd->v_lli;
> =20
> @@ -428,7 +424,17 @@ static void sun6i_dma_free_desc(struct virt_dma_desc=
 *vd)
>  		v_lli =3D v_next;
>  		p_lli =3D p_next;
>  	}
> +}
> =20
> +static void sun6i_dma_free_desc(struct virt_dma_desc *vd)
> +{
> +	struct sun6i_desc *txd =3D to_sun6i_desc(&vd->tx);
> +	struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(vd->tx.chan->device);
> +
> +	if (unlikely(!txd))
> +		return;
> +
> +	sun6i_dma_free_lli_list(sdev, txd);
>  	kfree(txd);

Why not also move txd handling? That way even more code can be put in one p=
lace.

Best regards,
Jernej

>  }
> =20
> @@ -788,9 +794,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep=
_slave_sg(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:
> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> -		dma_pool_free(sdev->pool, v_lli, p_lli);
> +	sun6i_dma_free_lli_list(sdev, txd);
>  	kfree(txd);
>  	return NULL;
>  }
> @@ -869,9 +873,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep=
_dma_cyclic(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:
> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> -		dma_pool_free(sdev->pool, v_lli, p_lli);
> +	sun6i_dma_free_lli_list(sdev, txd);
>  	kfree(txd);
>  	return NULL;
>  }
>=20





