Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0908CE7B1F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yaOnWsallY2h02dbHE2TfeYyzinx89DAlIovAUP6XT0=; b=fsJEaQIIvMPONtfMAFeH8yTvjl
	el3+gW8vuGWgKILeSEvYw5Ry4zopbVPqSwi79PWBA2EV2gOcmDkXmo1Nb1ggXnp2CPvhWoOno4kwx
	WorOKODtf/Eo4Rd6cftoU2P0eK2bsGrAqAvsD26mlvwBxD18Akh2cL/T6TNCRSuPkZtVDDLPKmkTC
	tPnChZ57bgRJYsBRcFbEgRqLGvfvDbLvaUwakgKpnL1GnDnsr6MpiJx8/UDcnAFJK/d/B64ZdycBN
	uHyRgOH57D/oL6ZCFCqsFfiZfY6AnGhr6GHfrG+PH7MzCYAhQf0xY0XnsEPEA+OW1SPGiVHGP909V
	aLA86H0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvZ2-0000000CVrW-2vBn;
	Fri, 14 Nov 2025 15:18:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvYz-0000000CVq0-3FZU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:18:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64BF51063;
	Fri, 14 Nov 2025 07:18:05 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D1353F66E;
	Fri, 14 Nov 2025 07:18:12 -0800 (PST)
Date: Fri, 14 Nov 2025 15:18:10 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 07/13] coresight: Don't reject unrecognized ETMv3
 format attributes
Message-ID: <20251114151810.GG3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-7-165ba21401dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-7-165ba21401dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_071813_853534_60CC65F7 
X-CRM114-Status: GOOD (  19.88  )
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

On Wed, Nov 12, 2025 at 03:22:13PM +0000, James Clark wrote:
> config isn't the only field, there are also config1, config2, etc.
> Rejecting unrecognized attributes is therefore inconsistent as it wasn't
> done for all fields. It was only necessary when we were directly
> programming attr->config into ETMCR and didn't hide the unsupported
> fields, but now it's not needed so remove it.

It is fine for not validating all configs (please ignore my comment for
checking all configs in my reply for patch 04).

I am wandering if need to remove ETM3X_SUPPORTED_OPTIONS totally. I
saw etm_enable_hw() uses it to clear config bits, so it makes sense to
keep it.

Reviewed-by: Leo Yan <leo.yan@arm.com>

> 
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  drivers/hwtracing/coresight/coresight-etm3x-core.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> index 4511fc2f8d72..584d653eda81 100644
> --- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
> @@ -333,13 +333,6 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
>  	if (config->mode)
>  		etm_config_trace_mode(config);
>  
> -	/*
> -	 * At this time only cycle accurate, return stack  and timestamp
> -	 * options are available.
> -	 */
> -	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
> -		return -EINVAL;
> -
>  	config->ctrl = 0;
>  
>  	if (ATTR_CFG_GET_FLD(attr, cycacc))
> 
> -- 
> 2.34.1
> 

