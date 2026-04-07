Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC8BEDB7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSD42sRw8m4KqOMn6RKtEBsK4oxrupRNhEOtKscgMfE=; b=ukfyUe26nsiat2VYARx5lDgi9S
	ZYABe85lDzm3zqB5pauIlqFn5pq2UHKobI9pSIARYWMIzIhqDkDHvh81cavBXc6jwJ0IcMAdXqCd0
	fxEAImNLWO9gYLObVdTQhP67ReRAg79Zaq+IKrMwmEbUvHSvAblIfocXWrt7+RcRa3CIW+mu30pTk
	KnREa9dcL6/cnZi+Qx+mPpuLVsC1I+kc6qzPz4mFfE7kZIWJ5U2IiKPa/Y7fxnowvp9T1415r9xFx
	RPKjXyJM4RwTFl9KKZq2EATKpVq5R7Y4Ljl6TmaH8Hrxy49FbF+av3DHmOj2II2nJb8Oki6p+ET9Z
	lpayhOiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1WT-000000067Ns-21NT;
	Tue, 07 Apr 2026 08:10:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1WQ-000000067Mm-3tIG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 08:10:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45B721688;
	Tue,  7 Apr 2026 01:10:45 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9ED873F641;
	Tue,  7 Apr 2026 01:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775549451; bh=wa8Bk5qYAqzC1U23ghWAMt0N32UINcdTL+QzfUMPJsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p641DY+Fy2ySv9iOJpBsOkQrsZ7E5jraZoQXlTN6knbfYzQbv7HA1edZla1KTwT3D
	 MlCbWCbYi4PQG6BoOtCsHAyIYM8ASN33yOBOyqSinFKfg+W00nU6FE7sxGTHNydcn3
	 /ehvutRm1GFISv+0iOeHISJHl9xp3rHfsB/Q2qB0=
Date: Tue, 7 Apr 2026 09:10:48 +0100
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: tpdm: fix invalid MMIO access issue
Message-ID: <20260407081048.GJ356832@e132581.arm.com>
References: <20260407-fix-potential-issue-in-tpdm-v1-1-42090d27c0a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-fix-potential-issue-in-tpdm-v1-1-42090d27c0a8@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_011055_111063_624E3FCF 
X-CRM114-Status: GOOD (  18.55  )
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

On Tue, Apr 07, 2026 at 12:47:11PM +0800, Jie Gan wrote:
> Create the csdev_access struct only when a valid MMIO resource is
> available. In tpdm_probe(), base is uninitialized for static TPDM
> instances that lack an MMIO resource, causing csdev_access to be
> created with a garbage address and potentially leading to
> unexpected issues.

This patch itself is fine for me.  However, I am wandering if this
is sufficient.

As mentioned "potentially leading to unexpected issues", can I
understand some code pieces access register with uninitialized base?
If so, you would also explictly add coresight_is_static_tpdm() to
prevent register access.

Thanks,
Leo

> Fixes: 14ae052f7947 ("coresight: tpdm: add static tpdm support")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-tpdm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index 9b16f368a58b..eaf7210af648 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1430,6 +1430,7 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>  		if (ret)
>  			return ret;
>  
> +		desc.access = CSDEV_ACCESS_IOMEM(base);
>  		if (tpdm_has_dsb_dataset(drvdata))
>  			of_property_read_u32(drvdata->dev->of_node,
>  					     "qcom,dsb-msrs-num", &drvdata->dsb_msr_num);
> @@ -1452,7 +1453,6 @@ static int tpdm_probe(struct device *dev, struct resource *res)
>  	desc.ops = &tpdm_cs_ops;
>  	desc.pdata = dev->platform_data;
>  	desc.dev = dev;
> -	desc.access = CSDEV_ACCESS_IOMEM(base);
>  	if (res)
>  		desc.groups = tpdm_attr_grps;
>  	else
> 
> ---
> base-commit: 816f193dd0d95246f208590924dd962b192def78
> change-id: 20260407-fix-potential-issue-in-tpdm-b07b44416051
> 
> Best regards,
> -- 
> Jie Gan <jie.gan@oss.qualcomm.com>
> 

