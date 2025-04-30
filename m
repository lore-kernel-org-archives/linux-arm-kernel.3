Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CFBC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 13:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ar68uvTix/lfsdToR0EYdxD0l7SmB05UiJBlAsCxGTQ=; b=N5tHr77n+YdeRxAehdXE+XT4XK
	JCOGkupuufdLp6aTDvof+dimyHbc+Oe6SjTJsHGHugDLAUK6l7s7JMSK85XFQQ230RnPWal/LTCtW
	QYjyC3f1b/0bYyWxBLB5+sFPwfYZ4JExgki5cxdLR+ECqSPyyt0ySnuA5GypIhjtk8pdmVFlLjkA7
	+LNfHJsdzFrk8KCaTse6U8B15XGxoDHzsg9SekW04B4g7OLdUF+EZl6MHzh3NPsI+VZXYEhnThBnH
	2VX5bbxDJ1x3opU42B3q6bAOLoOc82Q8APBlJRHGNhfMDSYR0rXYbq2Uok0BE6AO+HWG1FX68qFqR
	R4HQCo/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA75Y-0000000CvA1-40Jf;
	Wed, 30 Apr 2025 13:03:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA70i-0000000Cu7m-0klb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 12:58:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 001CC106F;
	Wed, 30 Apr 2025 05:57:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADBDD3F5A1;
	Wed, 30 Apr 2025 05:57:58 -0700 (PDT)
Date: Wed, 30 Apr 2025 13:57:56 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] coresight: core: Disable helpers for devices that
 fail to enable
Message-ID: <20250430125756.GK551819@e132581.arm.com>
References: <20250429231301.1952246-1-yabinc@google.com>
 <20250429231301.1952246-3-yabinc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429231301.1952246-3-yabinc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_055800_259979_812E94D3 
X-CRM114-Status: GOOD (  19.11  )
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

On Tue, Apr 29, 2025 at 04:13:00PM -0700, Yabin Cui wrote:
> When enabling a SINK or LINK type coresight device fails, the
> associated helpers should be disabled.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-core.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index dabec7073aed..d3523f0262af 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>  		/* Enable all helpers adjacent to the path first */
>  		ret = coresight_enable_helpers(csdev, mode, path);
>  		if (ret)
> -			goto err;
> +			goto err_disable_path;
>  		/*
>  		 * ETF devices are tricky... They can be a link or a sink,
>  		 * depending on how they are configured.  If an ETF has been
> @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>  			 * that need disabling. Disabling the path here
>  			 * would mean we could disrupt an existing session.
>  			 */
> -			if (ret)
> +			if (ret) {
> +				coresight_disable_helpers(csdev, path);
>  				goto out;
> +			}
>  			break;
>  		case CORESIGHT_DEV_TYPE_SOURCE:
>  			/* sources are enabled from either sysFS or Perf */
> @@ -497,16 +499,19 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>  			child = list_next_entry(nd, link)->csdev;
>  			ret = coresight_enable_link(csdev, parent, child, source);
>  			if (ret)
> -				goto err;
> +				goto err_disable_helpers;
>  			break;
>  		default:
> -			goto err;
> +			ret = -EINVAL;
> +			goto err_disable_helpers;
>  		}
>  	}
>  
>  out:
>  	return ret;
> -err:
> +err_disable_helpers:
> +	coresight_disable_helpers(csdev, path);
> +err_disable_path:
>  	coresight_disable_path_from(path, nd);
>  	goto out;
>  }
> -- 
> 2.49.0.967.g6a0df3ecc3-goog
> 

