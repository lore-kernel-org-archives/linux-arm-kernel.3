Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BB2C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 23:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0BbUbAG3eg70hP8/1CroK/Kf34mgOD7Ll45eATb+8I=; b=EqN36UBh+JvzXywY17Cl9C5nET
	hBqHPXoyOgrHz8eZmn/UCtPcK5ldxE3hLbNMh61bATfsRm4Kk/Zf7CzzSzxNshVW5XZwB6KotUHqi
	4oU8wj7Wd+kloWVfehSni1cmj94h3uRJXDhJNr1PmMP0stFRu2gPatBzF31kZvCiueGM7SoZX7GI2
	CdDwMptJIpL5y5NwExBd0LaDG4/kXyWYT93KDCt41VhmYnEg82Z2cSoPzAIRc3/czXoT217j2GH2O
	yK9skhmdIgvL4ydQ/T61rjvLUphniq48XsZ9cA66nN5s/z0OTm+gN51Mgwny2FFBLVGCJsTuRwZRH
	hipljpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEqu-0000000FXu4-2o6v;
	Fri, 14 Mar 2025 23:54:08 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttEoj-0000000FXkV-0Sln
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 23:51:54 +0000
Date: Fri, 14 Mar 2025 19:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741996309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P0BbUbAG3eg70hP8/1CroK/Kf34mgOD7Ll45eATb+8I=;
	b=NFxeQgAk/R//VsAghYt8xhZSxiEQfPlmN19UgK3B030JQ8DgU2qLncAavMBApOJvK5h5lg
	FUI5N99t4GbrKAlZJktXynUCkOGRuTdDJO+6pTR+vnBMnEg2gyTzcvSnu8Z6AeMVQhUdCe
	G/CygyehVX9vYdfN1LvodihTLRmi16FtkLWVdvudJpaumAGt4A6HbhqFCQ0WA8bXBghD0a
	FaY2zdPIg22BU+zEcb1/4T24fLmnLXnoNfEToknIWMRMU6gDUUQOti7EI4zXgs4O/Y7paf
	zr+w5Yo/Fw2B8LmI1cejA0u0Erz9SM016vXwFJNqetok9RyACi6XuJE+f6ly1w==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: marcan@marcan.st, fnkl.kernel@gmail.com,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: apple-dart: fix potential null pointer deref
Message-ID: <Z9TBEAJkOrHIWype@blossom>
References: <20250314230102.11008-1-qasdev00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250314230102.11008-1-qasdev00@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_165153_354773_3221E921 
X-CRM114-Status: GOOD (  14.64  )
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

Le Fri , Mar 14, 2025 at 11:01:02PM +0000, Qasim Ijaz a écrit :
> If kzalloc() fails, accessing cfg->supports_bypass causes a null pointer dereference. 
> 
> Fix by checking for NULL immediately after allocation and returning -ENOMEM.
> 
> Fixes: 3bc0102835f6 ("iommu: apple-dart: Allow mismatched bypass support")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
>  drivers/iommu/apple-dart.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 13ccb801f52a..e13501541fdd 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -797,12 +797,11 @@ static int apple_dart_of_xlate(struct device *dev,
>  
>  	if (!cfg) {
>  		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
> -
> +		if (!cfg)
> +			return -ENOMEM;
>  		/* Will be ANDed with DART capabilities */
>  		cfg->supports_bypass = true;
>  	}
> -	if (!cfg)
> -		return -ENOMEM;
>  	dev_iommu_priv_set(dev, cfg);
>  
>  	cfg_dart = cfg->stream_maps[0].dart;
> -- 
> 2.39.5
> 

