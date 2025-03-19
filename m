Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1687DC36000
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 08:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIebZrODv34fNnNuK4g9DQqUhb9zj6pkK0/4NOBts6E=; b=j3UORXWfgHaIEu2tnyP37q9mmO
	5XoMkW47INQ2ildisf+4H6TG++MN0yNzgbNYbiYqog0hrx8pRZfMscfWVVJE8ZscoAlvAYsbZTsj/
	XteqU3TYz+b7G/jCnKf7+IwhH84KEncMia3I4AtGOY+iD5KHSUKQMHFEd/13GrAbaQ55mShso8mbw
	NdyC+cLGU/5a+lwUkPuainWbV0qMQeBRg3ccPS+V60YRhuryxmkC3ADqQ2sJmPP3stujTc67lxCKM
	EQE9jZkoZ2TsFEsZQIkDHw89UZwSBacr6Wh5bSGm8vWcxPDy1fxsr3jM4HA7r1OZhoSVD7zpG/Y1n
	jWUJ0X3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuopC-00000008Lrs-1FFN;
	Wed, 19 Mar 2025 08:30:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuolh-00000008LUI-3bYV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 08:27:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7635312FC;
	Wed, 19 Mar 2025 01:27:25 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFABE3F694;
	Wed, 19 Mar 2025 01:27:16 -0700 (PDT)
Date: Wed, 19 Mar 2025 08:27:15 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 4/8] coresight: Add claim tag warnings and debug
 messages
Message-ID: <20250319082715.GD2860028@e132581.arm.com>
References: <20250318-james-coresight-claim-tags-v2-0-e9c8a9cde84e@linaro.org>
 <20250318-james-coresight-claim-tags-v2-4-e9c8a9cde84e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-james-coresight-claim-tags-v2-4-e9c8a9cde84e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_012718_000354_3A26FD18 
X-CRM114-Status: GOOD (  25.24  )
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

On Tue, Mar 18, 2025 at 04:21:58PM +0000, James Clark wrote:
> Add a dev_dbg() message so that external debugger conflicts are more
> visible. There are multiple reasons for -EBUSY so a message for this
> particular one could be helpful. Add errors for and enumerate all the
> other cases that are impossible.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  drivers/hwtracing/coresight/coresight-core.c | 51 +++++++++++++++++-----------
>  drivers/hwtracing/coresight/coresight-priv.h |  5 ++-
>  2 files changed, 36 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> index e39043a9551f..5f08845faf0d 100644
> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -135,16 +135,6 @@ static inline u32 coresight_read_claim_tags(struct coresight_device *csdev)
>  			 csdev_access_relaxed_read32(&csdev->access, CORESIGHT_CLAIMCLR));
>  }
>  
> -static inline bool coresight_is_claimed_self_hosted(struct coresight_device *csdev)
> -{
> -	return coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED;
> -}
> -
> -static inline bool coresight_is_claimed_any(struct coresight_device *csdev)
> -{
> -	return coresight_read_claim_tags(csdev) != 0;
> -}
> -
>  static inline void coresight_set_self_claim_tag(struct coresight_device *csdev)
>  {
>  	csdev_access_relaxed_write32(&csdev->access, CORESIGHT_CLAIM_SELF_HOSTED,
> @@ -180,18 +170,41 @@ EXPORT_SYMBOL_GPL(coresight_clear_self_claim_tag_unlocked);
>   */
>  int coresight_claim_device_unlocked(struct coresight_device *csdev)
>  {
> +	int tag;
> +	struct csdev_access *csa;
> +
>  	if (WARN_ON(!csdev))
>  		return -EINVAL;
>  
> -	if (coresight_is_claimed_any(csdev))
> +	csa = &csdev->access;
> +	tag = coresight_read_claim_tags(csdev);
> +
> +	switch (tag) {
> +	case CORESIGHT_CLAIM_FREE:
> +		coresight_set_self_claim_tag(csdev);
> +		if (coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
> +			return 0;
> +
> +		/* There was a race setting the tag, clean up and fail */
> +		coresight_clear_self_claim_tag_unlocked(csa);
> +		dev_dbg(&csdev->dev, "Busy: Couldn't set self claim tag");
>  		return -EBUSY;
>  
> -	coresight_set_self_claim_tag(csdev);
> -	if (coresight_is_claimed_self_hosted(csdev))
> -		return 0;
> -	/* There was a race setting the tag, clean up and fail */
> -	coresight_clear_self_claim_tag_unlocked(&csdev->access);
> -	return -EBUSY;
> +	case CORESIGHT_CLAIM_EXTERNAL:
> +		/* External debug is an expected state, so log and report BUSY */
> +		dev_dbg(&csdev->dev, "Busy: Claimed by external debugger");
> +		return -EBUSY;
> +
> +	default:
> +	case CORESIGHT_CLAIM_SELF_HOSTED:
> +	case CORESIGHT_CLAIM_INVALID:
> +		/*
> +		 * Warn here because we clear a lingering self hosted tag
> +		 * on probe, so other tag combinations are impossible.
> +		 */
> +		dev_err_once(&csdev->dev, "Invalid claim tag state: %x", tag);
> +		return -EBUSY;
> +	}
>  }
>  EXPORT_SYMBOL_GPL(coresight_claim_device_unlocked);
>  
> @@ -220,7 +233,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
>  	if (WARN_ON(!csdev))
>  		return;
>  
> -	if (coresight_is_claimed_self_hosted(csdev))
> +	if (coresight_read_claim_tags(csdev) == CORESIGHT_CLAIM_SELF_HOSTED)
>  		coresight_clear_self_claim_tag_unlocked(&csdev->access);
>  	else
>  		/*
> @@ -228,7 +241,7 @@ void coresight_disclaim_device_unlocked(struct coresight_device *csdev)
>  		 * and has manipulated it. Or something else has seriously
>  		 * gone wrong in our driver.
>  		 */
> -		WARN_ON_ONCE(1);
> +		dev_WARN_ONCE(&csdev->dev, 1, "External agent took claim tag");
>  }
>  EXPORT_SYMBOL_GPL(coresight_disclaim_device_unlocked);
>  
> diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
> index 38bb4e8b50ef..6e8cf55aee0a 100644
> --- a/drivers/hwtracing/coresight/coresight-priv.h
> +++ b/drivers/hwtracing/coresight/coresight-priv.h
> @@ -36,7 +36,10 @@ extern const struct device_type coresight_dev_type[];
>   * See PSCI - ARM DEN 0022D, Section: 6.8.1 Debug and Trace save and restore.
>   */
>  #define CORESIGHT_CLAIM_MASK		GENMASK(1, 0)
> -#define CORESIGHT_CLAIM_SELF_HOSTED	BIT(1)
> +#define CORESIGHT_CLAIM_FREE		0
> +#define CORESIGHT_CLAIM_EXTERNAL	1
> +#define CORESIGHT_CLAIM_SELF_HOSTED	2
> +#define CORESIGHT_CLAIM_INVALID		3
>  
>  #define TIMEOUT_US		100
>  #define BMVAL(val, lsb, msb)	((val & GENMASK(msb, lsb)) >> lsb)
> 
> -- 
> 2.34.1
> 

