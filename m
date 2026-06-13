Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF3DCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 07:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=veSLkLuVXjwdrZzfCCj4w9cK+dyeH9xMaJHceYyp2QA=; b=f6tfE0ebGkUIVK2yaWEEG0KgBN
	T0Rhqi7AP5dghwCdIqSJh9oA2IF9ukI6LX9271a1/fhYDLSXsdoghej4eLwYCAhPLXxak4drty73L
	B7OIaLvOGlDj8cmgZX3ZaSkDqU+vbXRCGKtKEdfpK/nJxDMjcguuy8nCeuNbvBQZU9T8QgHgNkChD
	dB2qnjgi83PsFz7K6Qkv4k4JZjCDOExxvAfgRKeSrosgYIj1Z3EL/M+riHduEvOeCtree4tmiNwnK
	1m8hkpUC8fHeVc+e25bZL7ZiIFbIM7oXdHG6HZKSK0A5IvYc+KVEcQpnon1szUFI/ityg8te/BDpc
	qWp9JYyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJ4X-0000000C3Q2-40BT;
	Sat, 13 Jun 2026 07:46:29 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYJ4U-0000000C3PZ-1ufC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 07:46:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490b613a17bso14467405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781336784; x=1781941584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veSLkLuVXjwdrZzfCCj4w9cK+dyeH9xMaJHceYyp2QA=;
        b=YsWwtI5u+1NTdaOGCHzDXswzvwqpHGxAGVz06RUvF+v1savu1ZS2/UFFQjM+iu7+Cx
         TvkxHrOcHPeSc4oh841+8gbaYpGnZ1SPmSOEbzPpWyhoYNyOZfVvKbQrG8SiqHuhtKv6
         vZCH84Q6jq0qIKR6b5AM018Z2si0AYPHNxEmCgJxwLR+oQFEKC7qBvXElMOt2AZFag7m
         veoP4BoD9oR21BEJEbmS3R6kCpe4grsAVxoQsZUcFpNyV0o/aSiT3o41X+28/1dEaWqm
         CCO+4Y2EHjMFLMntjha0tyLuRImUc3d5agr54lN8no3Dos1C00Ox57BD2OHwPGYWyEnk
         a2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781336784; x=1781941584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=veSLkLuVXjwdrZzfCCj4w9cK+dyeH9xMaJHceYyp2QA=;
        b=AV0VIZMxVwnqPxAWbnx+FA6EKeuWje+GMjTj65NN66KCksdCPzSTy6mmny6FrsR05r
         uKWc5WvZCTzISXlIkik1kzSiGZT/Ly01WfCK/UBvAWKGx4qJdAjO4QNhMufSS3N+Mlxf
         mS3t5GYIqGoleEGJmUd/b4SXqwyh62SsjQjTD9CgGX/4h2DBsHCJdxPAEh5OORfM4cBr
         YEv2Jo/hDa1w8+TILC5Ru06fO/RiqLl3Y8xpvBlEgrHzOwlbS9E4bLEaxUT5kmCBH7+U
         OMzut+P4MLiaygsSGCuQO753OtHT0rKIMdYu1TESdeAnr7KxRO3+3ur3xfPn3Tp/DVfS
         mbqg==
X-Forwarded-Encrypted: i=1; AFNElJ/WY/FcdKb9bM3iTTh6G8XA3oHlIalYiuMEMYr3PEuS+3JH00Py5ETptwtR8Q5Di2n171Zz07bNmQsynv7+YwWp@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+zjSy/aDyKqJHQg3VJklIM6KHbnzojaA/lJunW2QJp/5TB+c2
	Yk+T9AodwGCAqKlZrsHheaiudxDX6K5fra3r/YGm4IJrfl208ztdN0Tf
X-Gm-Gg: Acq92OFBfBOdpc8f8adSvXQLvVM7sBJPKh6dUFef3DA1J8e9sjKOhXbC5nhaJ6TSuR5
	inSkb0UxT2wudusZf8q17ExBmxkdsuYZtsB9WHW/xh9KmTUFMP697TjOi3M4MBxnWapaR4QTZpw
	pB74H8g3tV9YLqCPoSLe1Wlis6sdO63D6Ed2G+ZYS7CmTjsEiYvocsUzjgwxffm/yX/RfrdyUMp
	VJh/x1uV9FZmEpnoYXbrH6UM1KiPC3B6PF5JYko2ZSU9qG2zYiOcbcG/dgu/Gz9SpzF93I62vqQ
	fU/X9okXolYuWIoP4NUmoctWSLURPeHp6nU4pPobR2XWa9JUWCajjvNUzSEj2lL+E9dNP8l0yy0
	53AQ0xC+iDb4T1ZrfFYhf6mcGGy9tI8B4O2ashhwCWSRuqMhALGRUbcbvMOPZr/5k8+GG7bFJis
	wJ5zMOhn8Pcdzh7UNs1eW1e68BTd4CxbfQHKvmh8P7cHRA
X-Received: by 2002:a05:600c:3548:b0:490:e196:e8e3 with SMTP id 5b1f17b1804b1-490ec501a29mr82066385e9.18.1781336783742;
        Sat, 13 Jun 2026 00:46:23 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f309sm13078689f8f.14.2026.06.13.00.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 00:46:23 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, Frank.Li@kernel.org, wens@kernel.org,
 samuel@sholland.org, mripard@kernel.org, arnd@arndb.de,
 Hongling Zeng <zenghongling@kylinos.cn>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhongling0719@126.com, Hongling Zeng <zenghongling@kylinos.cn>
Subject: Re: [PATCH] dmaengine: sun6i-dma: Fix use-after-free in error handling paths
Date: Sat, 13 Jun 2026 09:46:19 +0200
Message-ID: <CyWPMXMZRBuYyL_Lpl2t_Q@gmail.com>
In-Reply-To: <20260611063631.96566-1-zenghongling@kylinos.cn>
References: <20260611063631.96566-1-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_004626_547136_11839C6C 
X-CRM114-Status: GOOD (  15.53  )
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

Dne =C4=8Detrtek, 11. junij 2026 ob 08:36:31 Srednjeevropski poletni =C4=8D=
as je Hongling Zeng napisal(a):
> In error handling paths, the for loop frees v_lli in the loop body,
> then accesses v_lli->v_lli_next and v_lli->p_lli_next in the
> increment expression, which is use-after-free.
>=20
> Fix by saving both the next virtual and physical pointers before
> freeing the current node.
>=20
> Fixes: 555859308723 ("dmaengine: Add driver for Allwinner sun6i DMA")
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
>  drivers/dma/sun6i-dma.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index a9a254dbf8cb..eb9c4ae87ac8 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -788,9 +788,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_pre=
p_slave_sg(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:
> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> +	p_lli =3D txd->p_lli;
> +	v_lli =3D txd->v_lli;
> +	while (v_lli) {
> +		struct sun6i_dma_lli *next_v_lli =3D v_lli->v_lli_next;
> +		dma_addr_t next_p_lli =3D v_lli->p_lli_next;
>  		dma_pool_free(sdev->pool, v_lli, p_lli);
> +		v_lli =3D next_v_lli;
> +		p_lli =3D next_p_lli;
> +	}
>  	kfree(txd);
>  	return NULL;
>  }
> @@ -869,9 +875,15 @@ static struct dma_async_tx_descriptor *sun6i_dma_pre=
p_dma_cyclic(
>  	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
> =20
>  err_lli_free:
> -	for (p_lli =3D txd->p_lli, v_lli =3D txd->v_lli; v_lli;
> -	     p_lli =3D v_lli->p_lli_next, v_lli =3D v_lli->v_lli_next)
> +	p_lli =3D txd->p_lli;
> +	v_lli =3D txd->v_lli;
> +	while (v_lli) {
> +		struct sun6i_dma_lli *next_v_lli =3D v_lli->v_lli_next;
> +		dma_addr_t next_p_lli =3D v_lli->p_lli_next;
>  		dma_pool_free(sdev->pool, v_lli, p_lli);
> +		v_lli =3D next_v_lli;
> +		p_lli =3D next_p_lli;
> +	}
>  	kfree(txd);
>  	return NULL;
>  }
>=20

This is certainly a valid fix, but it's replicating what sun6i_dma_free_des=
c()
is already doing. It would be better to split code to accept struct sun6i_d=
esc
*txd parameter and call that instead from all places.

Best regards,
Jernej



