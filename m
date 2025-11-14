Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8772CE8D52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WNmWm6ORLGFmR96KdkKI4CDl0UtQn+ZGO7aiBH/wMc=; b=ZlMOQdOyoYgrK9YTdG4Zg7seTY
	43w0qDc/7zV18Z6sX884S2ZYlVO95iCErFgaS01UwUa2XVB3eOsMKbLMT1e7GRwtX+pcx+pdCKpTh
	Q/g9l9uyp6Qds6h72P6E63vIAXQL36cwTUc8sUqluq6gzl3Sizv7PtAfOBBDQmraJA5iyv2AI9ltQ
	dyeAci/60/S8j8NuYAMitVn/Cf0+HUTBYbE15IqdGfxddZGgJ0iu+MEQoMGNG1iw5wyVTmPnckWlr
	J+0Ed572ls/XNKSpN6ZRBNj5NBjJUFuhWMNcfmdtCwoPlE3P4E++GtplTXU/Vkf3AnqkbgnY1pBJ7
	G/6mi1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwaY-0000000CjfW-2IEI;
	Fri, 14 Nov 2025 16:23:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwaV-0000000Cjei-2V4A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:23:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1C68C1063;
	Fri, 14 Nov 2025 08:23:43 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 556043F5A1;
	Fri, 14 Nov 2025 08:23:50 -0800 (PST)
Date: Fri, 14 Nov 2025 16:23:48 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 10/13] coresight: Remove misleading definitions
Message-ID: <20251114162348.GK3568724@e132581.arm.com>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
 <20251112-james-cs-syncfreq-v4-10-165ba21401dc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-james-cs-syncfreq-v4-10-165ba21401dc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_082351_679224_C3C15FC1 
X-CRM114-Status: GOOD (  24.76  )
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

On Wed, Nov 12, 2025 at 03:22:16PM +0000, James Clark wrote:
> ETM_OPT_* definitions duplicate the PMU format attributes that have
> always been published in sysfs. Hardcoding them here makes it misleading
> as to what the 'real' PMU API is and prevents attributes from being
> rearranged in the future.
> 
> ETM4_CFG_BIT_* definitions just define what the Arm Architecture is
> which is not the responsibility of the kernel to do and doesn't scale to
> other registers or versions of ETM. It's not an actual software ABI/API
> and these definitions here mislead that it is.
> 
> Any tools using the first ones would be broken anyway as they won't work
> when attributes are moved, so removing them is the right thing to do and
> will prompt a fix. Tools using the second ones can trivially redefine
> them locally.
> 
> Perf also has its own copy of the headers so both of these things can be
> fixed up at a later date.
> 
> Signed-off-by: James Clark <james.clark@linaro.org>

Good cleanup for me!

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  include/linux/coresight-pmu.h | 24 ------------------------
>  1 file changed, 24 deletions(-)
> 
> diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
> index 89b0ac0014b0..2e179abe472a 100644
> --- a/include/linux/coresight-pmu.h
> +++ b/include/linux/coresight-pmu.h
> @@ -21,30 +21,6 @@
>   */
>  #define CORESIGHT_LEGACY_CPU_TRACE_ID(cpu)  (0x10 + (cpu * 2))
>  
> -/*
> - * Below are the definition of bit offsets for perf option, and works as
> - * arbitrary values for all ETM versions.
> - *
> - * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
> - * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
> - * directly use below macros as config bits.
> - */
> -#define ETM_OPT_BRANCH_BROADCAST 8
> -#define ETM_OPT_CYCACC		12
> -#define ETM_OPT_CTXTID		14
> -#define ETM_OPT_CTXTID2		15
> -#define ETM_OPT_TS		28
> -#define ETM_OPT_RETSTK		29
> -
> -/* ETMv4 CONFIGR programming bits for the ETM OPTs */
> -#define ETM4_CFG_BIT_BB         3
> -#define ETM4_CFG_BIT_CYCACC	4
> -#define ETM4_CFG_BIT_CTXTID	6
> -#define ETM4_CFG_BIT_VMID	7
> -#define ETM4_CFG_BIT_TS		11
> -#define ETM4_CFG_BIT_RETSTK	12
> -#define ETM4_CFG_BIT_VMID_OPT	15
> -
>  /*
>   * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
>   * Used to associate a CPU with the CoreSight Trace ID.
> 
> -- 
> 2.34.1
> 

