Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674BCD4979F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 06:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0nWzD+Lx38ifdjx/0KeRfxG6lCIDsNbyc9nq09sPzg=; b=0iXRiGp0b6wRKub3co+kNsGjNz
	xSiuCkrG7uqHilU+OH4VirW7D2ybDWROAlXb3r7D6ociUs740wNrdDY9lNxoxYo8MGx2x/5Wq7POq
	uOiSg7vRf4/w7mtzbZdqbxFK00HrOGHXAPS2jJOH4y0LaVez8NmZxicf9sEKRNP6alNLs0tqhA70p
	pRuid+nDPYHBP+fzzUkny2UGcH3LxcyOBvuClu6buPMXRY9H5RcYCb3ZCEe5aC0OPyLA8eNUtaVDJ
	Gt6uCOalt7xvCcPeNcTfqTcwrn7gS9ErP1+MVCaV/5GHwnap8p8djR0aOl+qzkvu58qyR/GHCk0Fq
	eG1crSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0M5-00000005EQz-1vWn;
	Mon, 02 Dec 2024 06:56:25 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI0L6-00000005ELk-2u8P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 06:55:25 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53de84e4005so4172708e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 22:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733122523; x=1733727323; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0nWzD+Lx38ifdjx/0KeRfxG6lCIDsNbyc9nq09sPzg=;
        b=jchuIsH20jW7iBjohOdGj05iBdYGE1K/+2u3oP5mIa+R2l0p91eKfWsKn8RgnhaBqX
         T49IMiDrnJiNXI8Rf95RyALNBnFh3b53f/wTyiEU+61Qey4Y3jjFgBVXtIJKlN/FQtLw
         iXQ3i1Imion/Lktr1zuKtYWGA3BcD5dPzMce4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733122523; x=1733727323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0nWzD+Lx38ifdjx/0KeRfxG6lCIDsNbyc9nq09sPzg=;
        b=nFVWSyBBIdmJnAGrborcl49ZPOK/jQFonRM7/HZyN41O6fV7WB+QW8KPE9ORqDwvh+
         YiDvBJ/Iw/nxSpsGG1Bti4KFNE3A95xhOH0Fd0njjsYxEWbWDp36qUIyf4m91T6fMj4U
         bIP7KOewvG/zso92+nl0w4JH2t56npx9SBZjkdBuCGBPDNau8x6I/mMmb7oj7nvxqihu
         ZYG2sRSwGeadV6n79dJjl0QgkyvcUtVhHmlkTRBmL9JQphKyKnznidUEjxs0YCOZa7zF
         LQMTsS8boJZS9if0kciQSGyXjUAkARYeqE8e22/8wC8NzQb6kvxUoaX9rjUEGvS77Dec
         2wow==
X-Forwarded-Encrypted: i=1; AJvYcCVVdE2LMy9T+gYah1xSTdvnogx1u789QkXspvq0SVocXj/vpjTBHjb5z5Ny9fJGo1b3yGrEyAC3xXRla/Lh3KTO@lists.infradead.org
X-Gm-Message-State: AOJu0YzWfIWSHVTkDnBnMBApkQxmaEw2hjNLeiIwg7xHWxDYZvekT5tu
	h93LEKmXqvBb6B2bjBKm+Lhf5XeGz9KDktIzgvUoeITuhsYpiv6MBz5t56lBKY/yrI/HaRl1CbD
	z7jyyVWemzXq4vvEZOwrVA62VQEW43L3a+y0Q
X-Gm-Gg: ASbGnctACNPi9MI77D9gJ015BMwhhjPL1rZ7uMIDgjAARrAGEhX6BhlFgEX+uYx0mEg
	kUP804SWhpvhbSFdQVKGeiOk/VF34/OWmXhfcPdiye4Q3t812eh7rX61pq3E=
X-Google-Smtp-Source: AGHT+IEhDuPhpyGV4L/ou+jUfLRVYtfsYdtVwBNOmHBMpBMrZhusEFwHylPLoeDz7/iqzLHY2ZH7xlMhRw1T/BJzw6s=
X-Received: by 2002:a05:6512:3ba2:b0:53d:a132:c68f with SMTP id
 2adb3069b0e04-53df0112a63mr10446660e87.47.1733122522682; Sun, 01 Dec 2024
 22:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20241202062826.66619-1-wenst@chromium.org>
In-Reply-To: <20241202062826.66619-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 2 Dec 2024 14:55:11 +0800
Message-ID: <CAGXv+5EYkG=Y1vWDO6DWnUhd0WRuctYn_3w2YkvJoR_7JhsCpQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: mtk_scp: Only populate devices SCP cores
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_225524_752138_AD318E02 
X-CRM114-Status: GOOD (  22.26  )
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

On Mon, Dec 2, 2024 at 2:28=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> wr=
ote:
>

Oops. The subject should read "Only populate devices for SCP cores".

I'll let this one sit for a couple days before sending a new version.

ChenYu

> When multi-core SCP support was added, the driver was made to populate
> platform devices for all the sub-nodes. This ended up adding platform
> devices for the rpmsg sub-nodes as well, which never actually get used,
> since rpmsg devices are registered through the rpmsg interface.
>
> Limit of_platform_populate() to just populating the SCP cores with a
> compatible string match list.
>
> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-co=
re SCP")
> Cc: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/remoteproc/mtk_scp.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 0f4a7065d0bd..8206a1766481 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1326,6 +1326,11 @@ static int scp_cluster_init(struct platform_device=
 *pdev, struct mtk_scp_of_clus
>         return ret;
>  }
>
> +static const struct of_device_id scp_core_match[] =3D {
> +       { .compatible =3D "mediatek,scp-core" },
> +       {}
> +};
> +
>  static int scp_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -1357,13 +1362,15 @@ static int scp_probe(struct platform_device *pdev=
)
>         INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
>         mutex_init(&scp_cluster->cluster_lock);
>
> -       ret =3D devm_of_platform_populate(dev);
> +       ret =3D of_platform_populate(dev_of_node(dev), scp_core_match, NU=
LL, dev);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to populate platfo=
rm devices\n");
>
>         ret =3D scp_cluster_init(pdev, scp_cluster);
> -       if (ret)
> +       if (ret) {
> +               of_platform_depopulate(dev);
>                 return ret;
> +       }
>
>         return 0;
>  }
> @@ -1379,6 +1386,7 @@ static void scp_remove(struct platform_device *pdev=
)
>                 rproc_del(scp->rproc);
>                 scp_free(scp);
>         }
> +       of_platform_depopulate(&pdev->dev);
>         mutex_destroy(&scp_cluster->cluster_lock);
>  }
>
> --
> 2.47.0.338.g60cca15819-goog
>

