Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A96C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFbK6atugzTD7yJD9m3zV6BCGNJwyUhEcjietF557HM=; b=Pxz/pnkBQkA0izaMRM4vaJK6of
	09XIMa4ueyl7jtuD8Zpy4AoiSj1UuvP31U8H/8smspGcZoRgXc2VJQTuRAyPMSMgBJKkiVFKC+K4V
	VXARHPZ6wY7KKFlWd3ZI+amYwrKMSJlk/HCdXvE0tMFgYEjlEeRf7e7m5S5f6sjOrOb6VrReOAU1m
	TlPB33becedcrf4F+yy4h7Osifn3M5ee3qz6A+w5sjLsnDIGQgifYWU6rQPc+RbAWjWVS5SDFLzzH
	LnEfIKoLt5WCZE/NLZ2amB9r/VoDBdQYj7wU14riIC2s24CueBjxYZaIO/6bLmrlRG1EDxktkdi4h
	+DBanmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3Sm-0000000Bk2D-4Bkd;
	Fri, 28 Feb 2025 16:43:49 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to3RC-0000000Bjbx-0yMz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 16:42:12 +0000
Date: Fri, 28 Feb 2025 11:42:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1740760926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mFbK6atugzTD7yJD9m3zV6BCGNJwyUhEcjietF557HM=;
	b=cFIiO50ccNdoysTiPbKL6pEs59H43/JNspVbtHpwph8CQ5GCWccO/7y0yPIisAmHTcotJf
	KLUDDl/niDtXPGMEdKc49Oo4KijPpig9Ybn1NFHRv6sv9f2LxI/4bJTq9qMbGfl5mpZvi1
	ZQRcGPY4vr+cq0YR2r8s/yqOtMs6+pIire8RJVO/VPA+LospNomase0ltI8NVWfojZsp73
	+FeDCA5o2j45RdBg2caiwjdy71LY4IFpXS+42YfaXYtZVJUbEOF/GCCM3gOefGIrQrYWNP
	RDSsn94yDKDPsVIybmcJNd2eIuc+C2ea/BOqwlxtjWIqi8nVW0pD023QdsBMDA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 2/2] iommu: apple-dart: Allow mismatched bypass support
Message-ID: <Z8HnWdgPNMmCoXtX@blossom>
References: <20250228-isp-dart-v2-0-0ead81a90e2d@gmail.com>
 <20250228-isp-dart-v2-2-0ead81a90e2d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228-isp-dart-v2-2-0ead81a90e2d@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_084210_974114_EBC08A39 
X-CRM114-Status: GOOD (  20.61  )
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Fri , Feb 28, 2025 at 05:32:08PM +0100, Sasha Finkelstein via B4 Relay a écrit :
> From: Hector Martin <marcan@marcan.st>
> 
> This is needed by ISP, which has DART0 with bypass and DART1/2 without.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  drivers/iommu/apple-dart.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index edb2fb22333506d7c64ad1b6321df00ebfd07747..13ccb801f52a4d34f6653f78e92787af7dfed1bc 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -277,6 +277,9 @@ struct apple_dart_domain {
>   * @streams: streams for this device
>   */
>  struct apple_dart_master_cfg {
> +	/* Intersection of DART capabilitles */
> +	u32 supports_bypass : 1;
> +
>  	struct apple_dart_stream_map stream_maps[MAX_DARTS_PER_DEVICE];
>  };
>  
> @@ -684,7 +687,7 @@ static int apple_dart_attach_dev_identity(struct iommu_domain *domain,
>  	struct apple_dart_stream_map *stream_map;
>  	int i;
>  
> -	if (!cfg->stream_maps[0].dart->supports_bypass)
> +	if (!cfg->supports_bypass)
>  		return -EINVAL;
>  
>  	for_each_stream_map(i, cfg, stream_map)
> @@ -792,20 +795,24 @@ static int apple_dart_of_xlate(struct device *dev,
>  		return -EINVAL;
>  	sid = args->args[0];
>  
> -	if (!cfg)
> +	if (!cfg) {
>  		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
> +
> +		/* Will be ANDed with DART capabilities */
> +		cfg->supports_bypass = true;
> +	}
>  	if (!cfg)
>  		return -ENOMEM;
>  	dev_iommu_priv_set(dev, cfg);
>  
>  	cfg_dart = cfg->stream_maps[0].dart;
>  	if (cfg_dart) {
> -		if (cfg_dart->supports_bypass != dart->supports_bypass)
> -			return -EINVAL;
>  		if (cfg_dart->pgsize != dart->pgsize)
>  			return -EINVAL;
>  	}
>  
> +	cfg->supports_bypass &= dart->supports_bypass;
> +
>  	for (i = 0; i < MAX_DARTS_PER_DEVICE; ++i) {
>  		if (cfg->stream_maps[i].dart == dart) {
>  			set_bit(sid, cfg->stream_maps[i].sidmap);
> @@ -945,7 +952,7 @@ static int apple_dart_def_domain_type(struct device *dev)
>  
>  	if (cfg->stream_maps[0].dart->pgsize > PAGE_SIZE)
>  		return IOMMU_DOMAIN_IDENTITY;
> -	if (!cfg->stream_maps[0].dart->supports_bypass)
> +	if (!cfg->supports_bypass)
>  		return IOMMU_DOMAIN_DMA;
>  
>  	return 0;
> 
> -- 
> 2.48.1
> 
> 

