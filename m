Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B308EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhE+DSypq3SjpYtMHh6sKFtWdmcn5TW3B/Ayo8044zE=; b=QNvc0F8/2go1u12CrJs+pJ/c7O
	iKgecw1kFsxVqxuLwzOdgY/O87nND4+IHOUs56yGeSIcpUznXiLNbdUIOeIYsw/Da4rxNqUg7tame
	e9LmB2Dc7VmSaQBy08QaPSTt65LgTaeugOP9QbWRq4PFInW6lngbr00BclKgWEwJGrxHcnIb9Kpva
	jEeAQbXE6je0cI91nLa/7PctQ54/DhE5ULtHnS9UsJiqfT7GHQgZeGWc+H3UH9ZLs/M18z8YCquIU
	giI5C69of+9tqLzuXsIm+pFIIQCGaRMcSilE1FCsMKW9LrYk5g6CcBPPJB3GLcLNMhoW3mxLIG16L
	4CmfYVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEKb-0000000Afol-0dmu;
	Mon, 16 Dec 2024 16:52:29 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEJS-0000000AfWe-1WzR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 16:51:20 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-725dac69699so3703977b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 08:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734367877; x=1734972677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AhE+DSypq3SjpYtMHh6sKFtWdmcn5TW3B/Ayo8044zE=;
        b=NDM0wE4KCaLZRgMULFdpXelEX/mJKYfXfU/gEPzFMd/XYKRKkNSb+jeXriN5Zog9gk
         hH1nPxWm5aGs3daGg18GGtKmW0DkDvMYgGjxRxktJFUFqf2AH41PW631G4EW9EkJLe6a
         3rbD5TJ7K/Kcn5n3aecN2PVh9gER/cf8xFE6cvSPU1A+vwMRHSczw9LGqjLHZJAU2/5u
         wKYjeQqJmELibxId6AwW6kfusiXo7aql+kSeZtLfH4RwCR7PU4q8KEhke2JSicfPVm8u
         xdpgJhy+GN0T8hkwB2GAXN8HLMBszl00YvP1bwbWqBTHebbqBhI0Q9odo9Ru1NM2mjtq
         RDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734367877; x=1734972677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhE+DSypq3SjpYtMHh6sKFtWdmcn5TW3B/Ayo8044zE=;
        b=WhEC6YWUOHtl6NfhrCSf33YcMdzEUhxbJM8NWxgnnbH68HP9NxpESVav0kMky2ADNM
         IwwS9j6QPKcv4Ab1b2LZQmCgaXqT14vfJcghBvGMwSbVeeQGv0NprYseLvzDR+UhzJlN
         Z3YCgygvrryCvMjU65dcNs1jyRRwMxM0Q3qSgrzlh+fo86aVT6m3wbhQMn+JgTb4BDFH
         3e+L29YWeAO7Q/b9DykZlutc5Oj/LF1mMo+ojvzOhXK2zkcYC9DTSN6cXaO2Rq4hu91w
         YmfjAxKSJ4sSCYHLk5HF1Iq+Gf4W8UfiaqscRAZV6XJSD1CzV5AUaQZd5/gfXdbEE5Hi
         ZBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbWbfhsVYdRnT/IqnzkAen0JeXvwMWMN0YiqVBHCoVG2FkqcGegsqG1kVQcjiqnksF91WsZFHXRV7x4wjv9fDx@lists.infradead.org
X-Gm-Message-State: AOJu0YyH8L6T1+rA+5cyzotNkN/io+PVUQXw3yJjPY30ishXhE1uLUx0
	h7LvI3HFewIZ66Rl1eXd8hCObj70haKRQj/IbkYyITs0f+dr8cWWgoUQ70cfzas=
X-Gm-Gg: ASbGnctM7qqCdy3n9QYFbk5F4QKi7rA2Bgk1zcTjau0hEM2d4jYBi8QubtZdAMrw+ee
	GGIitEL8I9LpGh3qXV6Ockk3vGWs/r07cWwc1AMrN6HhvUx9hFnxGtXJN/Tq7CzbnRWkLd+K7L3
	fy3H5rWqlH1LxTpkfK8nzD4kQ38RwyoYfkv0EsbZM5HxYM4wE2EFZg/Br9kRqTBBZHJAmuphc7f
	jQYsX2ABcR4bXPkjmeWf3w8WTVOdQNecM4QZvJx59XuOCVbMOVfNRe1Uyex
X-Google-Smtp-Source: AGHT+IFdkBr1xidp7KbBA40XTCMNem9kWeuB09hpRbnYxb2m5xLWJETb06A1ncuzZHM9HfB1Sr5h4g==
X-Received: by 2002:a17:90b:2e41:b0:2ee:b6c5:1def with SMTP id 98e67ed59e1d1-2f28fa54f64mr20741065a91.8.1734367876736;
        Mon, 16 Dec 2024 08:51:16 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:13e6:498b:6054:9f90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e500b8sm43931565ad.123.2024.12.16.08.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 08:51:16 -0800 (PST)
Date: Mon, 16 Dec 2024 09:51:13 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Only populate devices for SCP
 cores
Message-ID: <Z2Baga9gSFLlmXll@p14s>
References: <20241211072009.120511-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211072009.120511-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_085118_424734_CBFD89B6 
X-CRM114-Status: GOOD (  22.21  )
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

On Wed, Dec 11, 2024 at 03:20:07PM +0800, Chen-Yu Tsai wrote:
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
> Changes since v1:
> - Fix commit subject: populate devices *for* SCP cores
> ---
>  drivers/remoteproc/mtk_scp.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>

I have applied this patch.

Thanks,
Mathieu

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
>  	mutex_destroy(&scp_cluster->cluster_lock);
>  }
>  
> -- 
> 2.47.0.338.g60cca15819-goog
> 

