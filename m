Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3704DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 02:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6og0QJ2S3h7HJsWue7gf3vzk/hBEoszfL21fFLAEEqk=; b=RsY9CyCJEQM1pehlf0ZlCdccND
	2y1trfptG0j62NgRvbW4x9MEqUTvJ5olCdYzFPwY/bejOY2s+fqY5C5XxTwJqLTXUSUIMFrPVAAy4
	wZi6FoEOrptuSCZxP1lh1wpgkqD9L35ZKBGeercM8Pt4cBWHsHTzmnb3CTR1woZoKtl1W+RobQNhl
	TL4Jehd+MCX2XOg0CkWKuBrn/eccAR+1ls/pWY3qUJ99yj/97kHVN02kG80EbVlADCTUoqK+WlGsT
	RiPI6gCloHE2JAX8ZLeLeltQZoU45bh9r1mJmzwAeMfx7Zm9BkOlKhmA0nKhD78yGHtdcsI2wAq2h
	ztWkjZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLZ0W-0000000Gkz4-3k7T;
	Thu, 12 Dec 2024 02:32:52 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLYzS-0000000Gkoh-1sVK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 02:31:47 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-4aff620b232so20884137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 18:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733970704; x=1734575504; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6og0QJ2S3h7HJsWue7gf3vzk/hBEoszfL21fFLAEEqk=;
        b=mMY6goh4+fl/awvPdvqAo3z9JwRgJE0W7kevVA00t5Z62k0Gebrw6GQGUcU4EjdFuI
         70qhNQtpzNTiL51i45JKwi9nEqyXWGTwiGMx6XxRIPNguu+4phI+YQ40bsJtbxdlJD5A
         NygbBJv9OghJKydsmL1gHe2X6w3mVMtOWLEFEaOQ1c/VNVTQxn3sR0eSMSKU3ORHTzts
         sM/32EPd5+JiLNPp7w9f6lJBBeUTzSp/2iwXG7USalL4baJSVXox2qY7dq6hCJIuSqjg
         UTnjYxEc0eoOrhyIuuuerbtSsIwYyWP93H7BARXunEZQqRGmijFXOIJQgozDWvwnuMJl
         NBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733970704; x=1734575504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6og0QJ2S3h7HJsWue7gf3vzk/hBEoszfL21fFLAEEqk=;
        b=DRAm5b5LW8pR2pjWp7b5LH8+ojbzcVgfNZ1kIiE+UgIU5rGltBlAbrZn19KlXNgysm
         Oz7mTtT4+/RUhjlpfkv2IEPimmqbLSdZbUIPIBqJT72ZDJX/cL1qKg6z1xeDDhbX73IL
         iPFYMWaZ3O29expT0YB+hAWuGONAWIHNGf/V6iIAC+AINC1CSfTlWhKUcOYEgykBMP3H
         pEmhNQwYAHLBzoWAHpLWLoAT6ZG0XLP6a1exXS+wqpxEgCBCYKtI/YwM5xnrwuBs1vhU
         dsE8SDP+WXTunnhjByB/4t5lPL+1bZ4neGoWIc8+91dlK8dpTeXt2ERi/t6m64wI3bzH
         AaMw==
X-Forwarded-Encrypted: i=1; AJvYcCXJjn4ZPM/y+CbhdbwMUCjN7BFOBsX9LD9D4C/zLUI1sa5NHVtz/zD6X2vnqOXG6vJj5is8wUQ629YZcfPYWPTE@lists.infradead.org
X-Gm-Message-State: AOJu0YzGwIiO6IBO2jypRjAGNXGU152hLZpdbnf6Zd6aESbHuMBLKex5
	AWEDGGg3K9qaBJg4a3xXeJyk1MG8zJkEY/H8sd+mek/enp4E/jx6js9o9DD7zGWyk2EGzIS/eBs
	XveYST7fehzZz5Oltd5YdX6vu94s=
X-Gm-Gg: ASbGncuy4xhzb/x+95G10wXpQ7PKwKTCSvMQ2ODkwLPWj4CLCDZsBmcOhl6erNtb/uQ
	WfIXZI9LWCuhfiDhrQJQtilsMsm4V8eE/viav
X-Google-Smtp-Source: AGHT+IGNsNCgBmG79/swXJPi8C8zSBdsU2p2UOH1lPp9B1MI1N0EIazQCQv3y3EW1IUuXeOyXZY2BygT5h26W1N/y5g=
X-Received: by 2002:a05:6102:b11:b0:4b1:130f:9fbb with SMTP id
 ada2fe7eead31-4b2478e161amr2912068137.26.1733970704638; Wed, 11 Dec 2024
 18:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20241206114531.1271123-1-guoqing.jiang@canonical.com>
In-Reply-To: <20241206114531.1271123-1-guoqing.jiang@canonical.com>
From: Inki Dae <daeinki@gmail.com>
Date: Thu, 12 Dec 2024 11:31:08 +0900
Message-ID: <CAAQKjZMuJc1y-6apj6KMVrg6WMVkLbpZ17A=+G6X1OJep+4rPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/exynos: Remove unnecessary checking
To: Guoqing Jiang <guoqing.jiang@canonical.com>
Cc: sw0312.kim@samsung.com, kyungmin.park@samsung.com, airlied@gmail.com, 
	simona@ffwll.ch, krzk@kernel.org, alim.akhtar@samsung.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_183146_504186_1CE5BB7E 
X-CRM114-Status: GOOD (  14.54  )
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

Hi,

2024=EB=85=84 12=EC=9B=94 6=EC=9D=BC (=EA=B8=88) =EC=98=A4=ED=9B=84 8:45, G=
uoqing Jiang <guoqing.jiang@canonical.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> It is not needed since drm_atomic_helper_shutdown checks it.

Correct.

Merged. Thanks,
Inki Dae

>
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_drv.c
> index 2a466d8179f4..461384705cf9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -357,8 +357,7 @@ static void exynos_drm_platform_shutdown(struct platf=
orm_device *pdev)
>  {
>         struct drm_device *drm =3D platform_get_drvdata(pdev);
>
> -       if (drm)
> -               drm_atomic_helper_shutdown(drm);
> +       drm_atomic_helper_shutdown(drm);
>  }
>
>  static struct platform_driver exynos_drm_platform_driver =3D {
> --
> 2.35.3
>
>

