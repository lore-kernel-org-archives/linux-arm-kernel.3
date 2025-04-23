Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3CFC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V+elOQHa76tVid8pFiLzcIUp2XwKbOcxmL8nretc43A=; b=JYNG2ynMZbL373UaFVAHqDdf4r
	gIpC0zCiWzRRUSf+3Kis5psT6z1AIyU6tILb0hgedcRX2yTuK5EW9DWzWRKdHwtfJA/QVxGm8heHT
	pyNPEiwUgYNvMz8EU7BjcrEy0Vw8Tak3oZbIC4FbnyhqIxYRvuAs7vdK3ct9i/3yjREasCCdrlZi4
	XaV3LX19q8BWcKppLN0hG3JunO6zklVOuY91O6BKxQzTV9tFo9ipfUAH09q+aOvYvltK5jitfeMNb
	K5BNlMEEpRq0SafS96u3GUyWhwwEuPKVvQEVv7CJfx28Ddd1h3ULMDCTqcCpzq59HYcP8QEJ9RKEO
	OZ3smfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aW8-0000000Afq8-0hkE;
	Wed, 23 Apr 2025 13:52:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WTV-00000009yco-3ufu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:33:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EE562B;
	Wed, 23 Apr 2025 02:32:54 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80F933F66E;
	Wed, 23 Apr 2025 02:32:58 -0700 (PDT)
Date: Wed, 23 Apr 2025 10:32:53 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yabin Cui <yabinc@google.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] coresight: core: Disable helpers for devices that
 fail to enable
Message-ID: <20250423093253.GK28953@e132581.arm.com>
References: <20250415184649.356683-1-yabinc@google.com>
 <20250415184649.356683-3-yabinc@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415184649.356683-3-yabinc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_023302_062220_7F390825 
X-CRM114-Status: GOOD (  26.69  )
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

On Tue, Apr 15, 2025 at 11:46:49AM -0700, Yabin Cui wrote:
> When enabling a SINK or LINK type coresight device fails, the
> associated helpers should be disabled.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-core.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index fb43ef6a3b1f..d9fcea69d221 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>  			 * that need disabling. Disabling the path here
>  			 * would mean we could disrupt an existing session.
>  			 */
> -			if (ret)
> +			if (ret) {
> +				coresight_disable_helpers(csdev, path);

I think we can do better for code consolidation - we can use a central
place for error handling.  I will give details below.

>  				goto out;
> +			}
>  			break;
>  		case CORESIGHT_DEV_TYPE_SOURCE:
>  			/* sources are enabled from either sysFS or Perf */
> @@ -497,15 +499,17 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
>  			child = list_next_entry(nd, link)->csdev;
>  			ret = coresight_enable_link(csdev, parent, child, source);
>  			if (ret)
> -				goto err;
> +				goto err_disable_helpers;
>  			break;
>  		default:
> -			goto err;
> +			goto err_disable_helpers;

I know this is not a problem introduced by your patch - for an error
case, it returns 0.  This will hide unexpected issues.  I would like
to suggest to return -EINVAL for unknown types.

>  		}
>  	}
>  
>  out:
>  	return ret;
> +err_disable_helpers:
> +	coresight_disable_helpers(csdev, path);
>  err:
>  	coresight_disable_path_from(path, nd);
>  	goto out;

I am just wandering if we can handle errors in a unified way and
without using goto.  I would change the code as below.

The point is to use a general flow for error handling, include a
sink error.  For sink error, we still invoke
coresight_disable_path_from() for an empty operation.

Also, I think we need an additional patch for error handling in
coresight_enable_helpers(). If any errors are detected while enabling
a helper, we should disable the helpers that have already been
enabled.

Please let me know if you have any questions.

Thanks,
Leo

---8<---

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fb43ef6a3b1f..cf2a3708a05e 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -465,7 +465,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		/* Enable all helpers adjacent to the path first */
 		ret = coresight_enable_helpers(csdev, mode, path);
 		if (ret)
-			goto err;
+			goto err_disable_path;
 		/*
 		 * ETF devices are tricky... They can be a link or a sink,
 		 * depending on how they are configured.  If an ETF has been
@@ -487,7 +487,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			 * would mean we could disrupt an existing session.
 			 */
 			if (ret)
-				goto out;
+				goto err_disable_helpers;
 			break;
 		case CORESIGHT_DEV_TYPE_SOURCE:
 			/* sources are enabled from either sysFS or Perf */
@@ -497,18 +497,21 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 			child = list_next_entry(nd, link)->csdev;
 			ret = coresight_enable_link(csdev, parent, child, source);
 			if (ret)
-				goto err;
+				goto err_disable_helpers;
 			break;
 		default:
-			goto err;
+			ret = -EINVAL;
+			goto err_disable_helpers;
 		}
 	}
 
-out:
-	return ret;
-err:
+	return 0;
+
+err_disable_helpers:
+	coresight_disable_helpers(csdev, path);
+err_disable_path:
 	coresight_disable_path_from(path, nd);
-	goto out;
+	return ret;
 }
 
> -- 
> 2.49.0.604.gff1f9ca942-goog
> 

