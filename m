Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA691093188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 08:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikNXcvtCwblGOBicDelwofCvhlrjAAXFQSOfmGXq3Fk=; b=qKoeDJBlkaE7ks0fhXh+Yl7Ygp
	dVS2PxHOm2EDcoUjJYIRNqoSx1Iy9HN9xhnf48gkJtRBj0MWc6vH7nDB2+LMHT69E5PjgKJtVM6Ow
	4HXzdW2NsPfn5fcg4ULDVa6Cq4zgRKOTBCsj8xrHu5l8fo34vo+88RG87MEFQEBGrdhR3iR7rzdjj
	5Qq0b9C4kNOw+jxRZ+8Bd28D6vBIVgv3G80/ktCtZnFFzNqccYQdEV1qmUkiJhVnAQY1h1E3y2oWW
	gYsqDKQcIl4jQkybN/pLtmorm0oUnafb3GFuQOYkE1+A1lV4bUmS3X3PRgmXLiWVN7XWxDtecc7fB
	ddT3MZ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VB8-0000000CLCO-3Dc7;
	Fri, 20 Mar 2026 08:25:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VB6-0000000CLAq-11qv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 08:25:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EAD3A1570;
	Fri, 20 Mar 2026 01:25:45 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2F383F73B;
	Fri, 20 Mar 2026 01:25:51 -0700 (PDT)
Date: Fri, 20 Mar 2026 08:25:49 +0000
From: Leo Yan <leo.yan@arm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] coresight: platform: check the availability of the
 endpoint before parse
Message-ID: <20260320082549.GO8048@e132581.arm.com>
References: <20260320-add-availability-check-v1-1-b2e39cdeb6e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-add-availability-check-v1-1-b2e39cdeb6e0@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_012556_327984_8C391F40 
X-CRM114-Status: GOOD (  18.97  )
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

On Fri, Mar 20, 2026 at 03:31:12PM +0800, Jie Gan wrote:
> Check endpoint availability before parsing it. If parsing a connected
> endpoint fails, the probe is deferred until the endpoint becomes
> available, or eventually fails.

I want to clarify a bit the failure flow.

Does this mean coresight_find_device_by_fwnode() returns NULL when the
remote device is not found, resulting in -EPROBE_DEFER, but the probe
never waits for the remote device to become available?

> In some legacy cases, a replicator
> has two output ports where one is disabled and the other is available.
> The replicator probe always fails because the disabled endpoint never
> becomes available for parsing. In addition, there is no need to defer
> probing a device that is connected to a disabled device, which improves
> probe performance.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  drivers/hwtracing/coresight/coresight-platform.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 0ca3bd762454..e337b6e2bf32 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -220,6 +220,8 @@ static int of_coresight_parse_endpoint(struct device *dev,
>  		rparent = of_coresight_get_port_parent(rep);
>  		if (!rparent)
>  			break;
> +		if (!of_device_is_available(rparent))
> +			break;
>  		if (of_graph_parse_endpoint(rep, &rendpoint))
>  			break;
>  
> 
> ---
> base-commit: b5d083a3ed1e2798396d5e491432e887da8d4a06
> change-id: 20260320-add-availability-check-4cb2ee6e520b
> 
> Best regards,
> -- 
> Jie Gan <jie.gan@oss.qualcomm.com>
> 

