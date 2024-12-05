Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60844E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGowWo0E2U0Rf9eK43iU5kiPqwDu4Y2pVeYyplVhdDQ=; b=YHGSVTkX/B4/Zh6pT1Wxi1mZNP
	uVFgi+Pah70ossXIGQDOYnf+7/eZhdrMznxQGxqgRxXHSRirOmyaFgObTGrreU2CUIHo9ftWxqFji
	rlzI74ge9a2/0skuiwZQaHEJXX3rtBZX38x1bK2APyEnjdnJX8/obb+qYOoPeAbf1Q3t/Hof1aear
	hs09Vw2pVO/SOtihxmuRmXJ0lRmU+LntZ8S0eoyqTuPx1u+i0yz8RXiQ4t/m93LN8sv1ZxLnGl7cL
	ccSRearxq5HpDnQB4CFa0iJztsgCKyet1x4QeH/174VIlEs2cWOGt7IK9cHw1hHBbwpDZ48rb6nzs
	bexjb7UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFFp-0000000GrrS-0QSm;
	Thu, 05 Dec 2024 17:03:05 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJF11-0000000GoQ6-0Z0M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 16:47:48 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so1012507a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 08:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733417266; x=1734022066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGowWo0E2U0Rf9eK43iU5kiPqwDu4Y2pVeYyplVhdDQ=;
        b=kDqgJ9AZMSeyhSM6jhfFLOsFqa4uREOuB0xDa5S28dKWHsA7b14p+99ejUjHQpSWMH
         8s9EIYuFLSCi/l316BNMKBRDg6RQYFvxVXuD/Z7Uj/vq/sbZr1QtOlo66C2QJ2BaI5KG
         bpgpE2WJTZDBO0WWqqXqN5RsoaLwhDTz2F44uGfwBWBFgw2mniLJR3tS3YHRGYCpe4kh
         RTzXlJinTbopKEJBNKlNB0dbisna1C2pRnpudPdtB9PpXo2mVpWtYwmZulrnc2ZmVwq1
         IKIMyjZL4JN1QkUZcB3neR7f89jYWi5qlPEZBnM/qRJJy5VQtpkuJKIB0qhiZIgKn3Ml
         p7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417266; x=1734022066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGowWo0E2U0Rf9eK43iU5kiPqwDu4Y2pVeYyplVhdDQ=;
        b=o7Te7FOhYdVtHkbJ+tE+gAj8klgqd8WimdplkCFCOWMeRZG0llBICXyvnYYxPtM4D7
         ucFwyU0WWN6KODJhbwRr+1rU0EFozaHBriMJHRV5E+37uEgZde+GTw5CboqS+x3hOsZE
         Ul8ciSmxRa07qXF85ej1E2ungfQ4C/evfosDYxy7GCZhe0DbpH6c7Rnc7BtO/AnY5T0F
         odmIOTZlaevPW/Wkbj02y1/+2oasFs1D2T9hPMlTjxpFNIZUVcrV1PmstmblBRG2XYNi
         ushyZYtoakjTf/vVGBLAoLV0eIiciRhfvNa0RhPYPu0ZcEO8t7kQstDPeylQwuU1e7Sw
         WEFg==
X-Forwarded-Encrypted: i=1; AJvYcCUANpewB3z2h1lOicjHdBdzEqaQJISXSw0qrIJrNlhcBp6hPVpNJSiSYtIJJE4WX/aZef6jpzPYf7Qed7yEWaDk@lists.infradead.org
X-Gm-Message-State: AOJu0YwGzF6CvSiopgzK35ePoqVvZsnrthl3k2upAK8dC5HVecfIq4uj
	7/bUJuk4IwoWyltCFlTNL6FWHaGsGtbmc/u7fMz7cdN8zouPuC/r0kmN5GjonC0=
X-Gm-Gg: ASbGncusr8J/ca6J87QZoWYE8ijCbOu1SoeOsjf+h7T2ELsY4Vu1R2Lj0FRAddv3K0u
	9VZpfINlmy+KLsLcpOXAfIbFlTC4BzCT8f95v5syODtnd4RwrspxgMgLCrjFEeWmySxWP8z51Fg
	eCz0OY9ztwhkpxUEZd87bhYx+6X8HigKLzKZBrsNKltAF1Z/0t63bFyHh1BqdYZmRrZyuUjLFug
	IHfFA+ZNyWqPCUbPHcHsBnrxZP54n3baqnRlpAvXfwDSVek89ZOvi8VNg==
X-Google-Smtp-Source: AGHT+IHfdbN7q7iMS+18SQtbAa3CGAk6K7rAAw0BzwESRhSc460Et6yhn4diWwlO/9cKamVNlnvLvw==
X-Received: by 2002:a17:90b:1d03:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-2ef011fbabcmr14575579a91.11.1733417265830;
        Thu, 05 Dec 2024 08:47:45 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cdba:9225:289d:fd74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff780bsm1605849a91.42.2024.12.05.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:47:45 -0800 (PST)
Date: Thu, 5 Dec 2024 09:47:42 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] remoteproc: mtk_scp: Only populate devices SCP cores
Message-ID: <Z1HZLq4iJQGmKDgM@p14s>
References: <20241202062826.66619-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202062826.66619-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_084747_175325_4FA40A08 
X-CRM114-Status: GOOD (  23.05  )
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

Good day,

On Mon, Dec 02, 2024 at 02:28:25PM +0800, Chen-Yu Tsai wrote:
> When multi-core SCP support was added, the driver was made to populate
> platform devices for all the sub-nodes. This ended up adding platform
> devices for the rpmsg sub-nodes as well, which never actually get used,
> since rpmsg devices are registered through the rpmsg interface.
> 
> Limit of_platform_populate() to just populating the SCP cores with a
> compatible string match list.
> 
> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
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
> @@ -1326,6 +1326,11 @@ static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_clus
>  	return ret;
>  }
>  
> +static const struct of_device_id scp_core_match[] = {
> +	{ .compatible = "mediatek,scp-core" },
> +	{}
> +};
> +
>  static int scp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1357,13 +1362,15 @@ static int scp_probe(struct platform_device *pdev)
>  	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
>  	mutex_init(&scp_cluster->cluster_lock);
>  
> -	ret = devm_of_platform_populate(dev);
> +	ret = of_platform_populate(dev_of_node(dev), scp_core_match, NULL, dev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
>  
>  	ret = scp_cluster_init(pdev, scp_cluster);
> -	if (ret)
> +	if (ret) {
> +		of_platform_depopulate(dev);
>  		return ret;
> +	}
>  
>  	return 0;
>  }
> @@ -1379,6 +1386,7 @@ static void scp_remove(struct platform_device *pdev)
>  		rproc_del(scp->rproc);
>  		scp_free(scp);
>  	}
> +	of_platform_depopulate(&pdev->dev);

This looks like a sensible addition to me but I'll give Angelo some time to
chime in.

Regards,
Mathieu

>  	mutex_destroy(&scp_cluster->cluster_lock);
>  }
>  
> -- 
> 2.47.0.338.g60cca15819-goog
> 

