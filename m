Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92B6C83F04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THojTOAmTm7LglOHC7/dkpRSpouSJmf2z1+Stk3KqZ4=; b=qPAwsfUN8Plf3a3Ov0ezH4/rgq
	uXj2dNc4xt7OM3eEAodRcv0hgueOHQxf0ebOoxgLpFywS6LGkBtNrLiQr/YmSE1xYSiKQsQ2O4wOJ
	CRnQzRstXvPGoyjhlHuGPI6ee4Qo9maBaN6Wy9j1snOZxQWMZ7qF7TrZ7w/jcHGnetQo9JqHJ4a9R
	rsLxxCaqpGQcYbETXgaz4SosmTnzZ5Qd7oT60t8ZNUm7QdF3WaXTNBHIkgYXLkr2oo3KtIV449as4
	r9HmnoSdeIbizBAxsYkYX1GNT5Qp6aauVUcW4JivmkYCzur1K5f6/FQvUm/RshgIwLRS7SrYetD4K
	90XjzBhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzgF-00000008qVx-2F0O;
	Wed, 02 Jul 2025 15:47:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyqf-00000008hdA-1pGq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 14:54:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DA2522C7;
	Wed,  2 Jul 2025 07:53:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB2C73F6A8;
	Wed,  2 Jul 2025 07:54:06 -0700 (PDT)
Date: Wed, 2 Jul 2025 15:54:04 +0100
From: Leo Yan <leo.yan@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf/arm: Add missing .suppress_bind_attrs
Message-ID: <20250702145404.GZ794930@e132581.arm.com>
References: <acd48c341b33b96804a3969ee00b355d40c546e2.1751465293.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acd48c341b33b96804a3969ee00b355d40c546e2.1751465293.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_075409_512791_37C06CED 
X-CRM114-Status: GOOD (  17.85  )
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

On Wed, Jul 02, 2025 at 03:08:13PM +0100, Robin Murphy wrote:
> PMU drivers should set .suppress_bind_attrs so that userspace is denied
> the opportunity to pull the driver out from underneath an in-use PMU
> (with predictably unpleasant consequences). Somehow both the CMN and NI
> drivers have managed to miss this; put that right.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/perf/arm-cmn.c | 1 +
>  drivers/perf/arm-ni.c  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
> index 031d45d0fe3d..d1df2f3adbc5 100644
> --- a/drivers/perf/arm-cmn.c
> +++ b/drivers/perf/arm-cmn.c
> @@ -2655,6 +2655,7 @@ static struct platform_driver arm_cmn_driver = {
>  		.name = "arm-cmn",
>  		.of_match_table = of_match_ptr(arm_cmn_of_match),
>  		.acpi_match_table = ACPI_PTR(arm_cmn_acpi_match),
> +		.suppress_bind_attrs = true,
>  	},
>  	.probe = arm_cmn_probe,
>  	.remove = arm_cmn_remove,
> diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
> index de7b6cce4d68..5f20baf59024 100644
> --- a/drivers/perf/arm-ni.c
> +++ b/drivers/perf/arm-ni.c
> @@ -707,6 +707,7 @@ static struct platform_driver arm_ni_driver = {
>  		.name = "arm-ni",
>  		.of_match_table = of_match_ptr(arm_ni_of_match),
>  		.acpi_match_table = ACPI_PTR(arm_ni_acpi_match),
> +		.suppress_bind_attrs = true,
>  	},
>  	.probe = arm_ni_probe,
>  	.remove = arm_ni_remove,
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 
> 

