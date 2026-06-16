Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43F7CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 16:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=exFxm0hh9AfcFczlY3WuFGnTo6SOwxmm6hFx+zY5Z3Q=; b=h0rSENTAL5/6SfK4RCZmM3R+oq
	wipPZIitGD2GbQZtxdZPP6uetmz10sx335upN26yf0CQIBOIcvpWkH36inXejdBejLjCNgcg2zBwz
	jrxTscpraqsz9KFpdE4ZaUQPC6W9MeiRc15L9SibEmaBBytyfzk4wwRFa3ILM8u5EBP/VooLYsAhR
	iBbDF5VENnAKTWPUzgGApWRgt9N9OgduXgOdVYXyn+id67k2TkYYX/Qsvn4lAwe6oFdby26mqfkzF
	qqw4tbOqiq35353+jaHdIecUTS1dExrxJfhY9Cz04THjeYPRFhD4Sk0UfFRiIW5Ti/4FiW7T12a1U
	ENkcEOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX3j-0000000G7xL-0jYr;
	Tue, 16 Jun 2026 16:54:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZX3h-0000000G7wr-07EB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 16:54:42 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-490bb83a3f6so37857625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781628878; x=1782233678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exFxm0hh9AfcFczlY3WuFGnTo6SOwxmm6hFx+zY5Z3Q=;
        b=EJV5F42BxTDOVTKfTRBcOvupyLkl1AD8iBrb2dboj54Gl/WdVbWXAIXmu8QJ2JXRUH
         IfamYOljfxpaxgRXx2PbTcSml5hlN67hZZy18VGd58Jsqp+8+P/3dcRWMFMROrg+q6KI
         D/BMXbItzGiWmao3AfYf+XJ5GYTbRxai8OcrtyqXVYuSm0AYma/QQNWe1UKdA1z5u7Sh
         7xkYxGbMu+ekfSDP8H5Y6eWXUu1Lt5aTzmZhBeyTDVHNhFeBZOsLxVS8N+E9e8m4l2Y6
         76qK3iC4EF8QKmfUC5bzc2sMQn9P6z5Y5AzzEahSBXcOduLLR0TbVG2SUMRzBwT69nVc
         1rpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781628878; x=1782233678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=exFxm0hh9AfcFczlY3WuFGnTo6SOwxmm6hFx+zY5Z3Q=;
        b=j52fuuwRDBnjDAjNIlyHd5r2fj/F5+nn9sIv3F2suS50aOWFeGo0WPjumB/AaX1DRr
         id/H0fjQ5ilQU7YCVpopVOHFO5ehphm3LEu5UPugBTjHGM/7XdmjqxUiY9U2VjZCGqRs
         MX+/LQeH4lmGTK5O/BkLtPcM8TpUK0X1DjHfN2AoAvwKNnMVZpZXGSFsrz84UmGgbXDL
         Zk2wdis7XxxaeRitR5U4EcKGlXZY+4amv1tmLFz35x80HsWoPmuRgukPMmSnh5VTCQWC
         6eaBTDcFZQMSHz3NM+HGtCc9OoNlroUj6ABFLusfh2CDSjCoHG7B+5N67FnVaoZUQcr8
         /bkQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PStrpUoBWp2Hkw3U97A7Ugd0dGVd0qCRaiiTY3xtUddaxbGER9jj6rZqOh6QFz9lVaAQOJIU3mOlpDyVhAhjT@lists.infradead.org
X-Gm-Message-State: AOJu0YwgBVDRBmrz+0WJXInput+azK+dJwUTiUuhmXNyoB4mrK7LYT6M
	bw87aRec6hUBfnTVjzNOWY+8mwZlQ0wtL7AAxMYyz8bEFeijM8Ti/pdz
X-Gm-Gg: Acq92OFucyX8UPzC/n+T4ndzAFDKruAVOjxGwUGyTwZoYUDoEcOpodhkF0sBvc4fPhu
	zHoWFsFbuWK6mUT5W8v7sPZSLYZZXP3poR9mg8r7rrAE3uMtufIh5W4NNKKlBC2SUlymozT52j4
	gFSVujeqTlNQeqG2KT3LN520bSYwQkjlvFAtk0a6rP33ktYLj5+40/GKlwhXr91fI99gVEWz6G2
	l9PQQE/hA5WcH144R+6JPyHOAPKIhFdCLYPd79Zqv35E9yeZ1P+GqTR39M8fLYve4Ni3UZEXcCe
	EweIyoPpoeezp/PCpTxeTMtyCwDmsdohS6xVCjuHqlx/xs6ktKfmwCkZACuXpfvvnF1o3Dt9qcp
	tNHkHvFIRhtYEZZLSYUq6pMulyuyB81EcCaDXyDjKWVgwpDzRAXReyCSeUpBThCfVjqyzwp8YDh
	KiRoPAjeZbEtdlmoHA1wIb867OH3LknDJ5f9dCerrtJsOQaHOccHqzlGdAzewxM1WnQv9r1dK2S
	GFnQYbY0XXvF51rf0FgsJGwiGbfKcimgiF38qVJWTS6els=
X-Received: by 2002:a05:600c:a111:b0:492:301e:3270 with SMTP id 5b1f17b1804b1-492333af267mr5549255e9.13.1781628878052;
        Tue, 16 Jun 2026 09:54:38 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-99-120-gprs.simobil.net. [46.122.99.120])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4620b1083e3sm1842555f8f.20.2026.06.16.09.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:54:37 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org,
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de,
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
Subject: Re: [PATCH v3] dmaengine: sun6i-dma: Fix use-after-free in error handling
 paths
Date: Tue, 16 Jun 2026 18:54:35 +0200
Message-ID: <phINRqN0SQqjDvxjLw8DWg@gmail.com>
In-Reply-To: <20260616023138.15904-1-zenghongling@kylinos.cn>
References: <20260616023138.15904-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_095441_139052_06FBCC29 
X-CRM114-Status: GOOD (  20.80  )
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

Dne torek, 16. junij 2026 ob 04:31:38 Srednjeevropski poletni =C4=8Das je H=
ongling Zeng napisal(a):
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

This looks great! Thank you for your patience.

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> Changes in v2:
>  -Refactored the fix to avoid code duplication by creating a helper funct=
ion
>   sun6i_dma_free_lli_list() that handles LLI list cleanup
>  -Add Suggested-by: Jernej Skrabec <jernej.skrabec@gmail.com>
>=20
> ---
> Change in v3:
>  -Further refactoring to move txd handling into the helper function
>   as suggested by Jernej
> ---
>  drivers/dma/sun6i-dma.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb..7a79f346250a 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -406,16 +406,12 @@ static inline void sun6i_dma_dump_lli(struct sun6i_=
vchan *vchan,
>  		v_lli->len, v_lli->para, v_lli->p_lli_next);
>  }
> =20
> -static void sun6i_dma_free_desc(struct virt_dma_desc *vd)
> +static void sun6i_dma_free_desc(struct sun6i_dma_dev *sdev,
> +				struct sun6i_desc *txd)
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
> @@ -432,6 +428,17 @@ static void sun6i_dma_free_desc(struct virt_dma_desc=
 *vd)
>  	kfree(txd);
>  }
> =20
> +static void sun6i_dma_free_desc_virt(struct virt_dma_desc *vd)
> +{
> +	struct sun6i_desc *txd =3D to_sun6i_desc(&vd->tx);
> +	struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(vd->tx.chan->device);
> +
> +	if (unlikely(!txd))
> +		return;
> +
> +	sun6i_dma_free_desc(sdev, txd);
> +}
> +
>  static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
>  {
>  	struct sun6i_dma_dev *sdev =3D to_sun6i_dma_dev(vchan->vc.chan.device);
> @@ -788,10 +795,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pre=
p_slave_sg(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:
> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> -		dma_pool_free(sdev->pool, v_lli, p_lli);
> -	kfree(txd);
> +	sun6i_dma_free_desc(sdev, txd);
>  	return NULL;
>  }
> =20
> @@ -869,10 +873,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pre=
p_dma_cyclic(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:
> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> -		dma_pool_free(sdev->pool, v_lli, p_lli);
> -	kfree(txd);
> +	sun6i_dma_free_desc(sdev, txd);
>  	return NULL;
>  }
> =20
> @@ -1431,7 +1432,7 @@ static int sun6i_dma_probe(struct platform_device *=
pdev)
>  		struct sun6i_vchan *vchan =3D &sdc->vchans[i];
> =20
>  		INIT_LIST_HEAD(&vchan->node);
> -		vchan->vc.desc_free =3D sun6i_dma_free_desc;
> +		vchan->vc.desc_free =3D sun6i_dma_free_desc_virt;
>  		vchan_init(&vchan->vc, &sdc->slave);
>  	}
> =20
>=20





