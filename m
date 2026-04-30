Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46935CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 21:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QAcFENGAWMvRKtX38HM/K9V9AEirES0LrBY8xwrc44=; b=u+EL1wFvhEfwHyRwbWqXMlVTUM
	0iSP+aizvKw5cIGXndmI+zPiRzAz2mO3cKPbt0W6YzUKYYMvr+Q0DjlfpSrD93MkHgpLWdoyldN+f
	C70XANVe38B0meLBmjHafcS+UM1JzYxa7koSelTNFD9g4kKAs5E4kMm3u2yBTIa3zld0AR+S0U4dy
	kclvudSd5NxBXFqIdxi+coYFUkt8k9+Sqg8j+MV7xIzfHRY/M8KHo5fVmJTgo16mPyGfBYPJ4yAYz
	vUqPAtxOtoF1MghWQxy95yELQZNJ2AxvL49Ngpd/lMwxPwVq5pgxNM4ImfHAqYbboCMbd0/vX6cHR
	2qct60fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYpf-00000005yZX-2KJl;
	Thu, 30 Apr 2026 21:22:03 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYpc-00000005yZ0-3qlF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 21:22:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82f8892d4d6so674586b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 14:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777584119; x=1778188919; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7QAcFENGAWMvRKtX38HM/K9V9AEirES0LrBY8xwrc44=;
        b=N4mkvxHrHCtkfTsnnihodz3iajGtNRM0fhUxS/MY/PXaBkFswtbNXP6L6yaFJB83wZ
         RHMQpyvVn3iGlVBPXH1Kl7peB6uJDysSmyLJBXoYl715svFx/8tm67cQ5CRHcgBa+oTa
         S7W5EVn1TtYZkKZ2zngEoCRR616eS4wHZSudnTF1d+AjLCpHJ3J6SZM+8a3Q4YA34QbO
         JvTxshPYvXDZ/oiR0jQgZuxgqH4Mt8pe4d0ZiCG5k3Womd9ScCUGYs3OiH6J64tTM9Cd
         8ZcxV+9/Z05VEiUYSwv0B91Eun1m4psTxpWwsYylcYIyPCT9Jb8pdQpZlV0ukjhWDXdr
         hqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584119; x=1778188919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QAcFENGAWMvRKtX38HM/K9V9AEirES0LrBY8xwrc44=;
        b=sV9rJzNp2YkOoJI9r1/L0s4ZO4IyGWHY9P/Ms1/i7Ikrl+3OHGZwLIY/RosQVEvnsl
         giB/C7XWqYR5/isJBIFlYIvRCMeh2sWgqHsTlyaOQLtpiWEYt+dvyCPkbuyTxbc4lq6K
         QsT5y5sW/xkcTnl3fVkfaZ6xS+Dpv3+eAlD2A2GLo9DM8L0ct7RgpxjL06ePD6g0Rdmm
         xeddBJgU1IArdMikWtjaBcDJZDdmMAKkG/xWDddPpqUAgf5EskGgFvW/oblWIy0gw6I5
         DJ8DQewea8B3zWWCpNGeHPLS+NzLt2S4mDaocDW+DZA2Bk8IuezlGmAonO0LfzNjg40d
         RqGA==
X-Forwarded-Encrypted: i=1; AFNElJ//OgFsiw1RjGXWMV28yUgTdYcvtybD23SmynK5HodnmoEheYl3R+CWAXNyV6hl14f9nUDRj0i9G2bTZlCdzD1z@lists.infradead.org
X-Gm-Message-State: AOJu0YxTRNxiXUhJRKC+cP277HWmUALAbWBia0eSc6lE1ZeWeBuqn9Da
	bbvUjkCmJHTMkNVI/OZrRnCuR+ITPMcOnfSpfBFWEHH3cAbapJgE5OQnRapBVRGW8vU=
X-Gm-Gg: AeBDievgvxDCLPSANaJxPIkZdHoHIIb0MgZ35h2iSpzYGEjqqlfeyhJGq1NEGjx7EVp
	0GQzo3C60yt/yFN6KcFQJ63eVMk8+BNOBtmAPbhKAC7qhSUzq6gsPcu9ZO7ra2cAJdQENkaR90m
	Q7rw6rbWjEYqIRsYY/n9n58fOORMG+uvqbU6ra5nOmSMcLPHdWsoxKrOMipxiUuCzGgSm51/JUI
	7KqUpxn1VyVhZ9Hwe9pRXbuFxWQGqxaEuy27WkG12on1jzsK4l5hFGzxy4LXkW0u40sYr+NOZYo
	nWcm3rpjt5iRUScsHy85YfhHMVkRj6W7ZPv1e59YwpJfKt5BmXOTbs7EW/7MxJMAdeus0rXfc86
	hv+Z3KY8d1noVBTDQBWxjQd4VEAfmk3KkpQMrwqrPS3mY5Q2xZ4revKgi1QpfOewwxfUCIuURec
	93DaYaAkxCI19tLC6HP2chmfh541z1aHQLzp7/
X-Received: by 2002:a05:6a00:4298:b0:82c:212a:a9b5 with SMTP id d2e1a72fcca58-834fdc6b1a1mr5314878b3a.36.1777584119286;
        Thu, 30 Apr 2026 14:21:59 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8054:625e:b15:dac0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b1d554sm533175b3a.46.2026.04.30.14.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:21:58 -0700 (PDT)
Date: Thu, 30 Apr 2026 15:21:56 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: michal.simek@amd.com, andersson@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3] remoteproc: xlnx: check remote core state
Message-ID: <afPH9BRwmpCZnvhX@p14s>
References: <20260428221855.313752-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428221855.313752-1-tanmay.shah@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_142200_976551_BB62051A 
X-CRM114-Status: GOOD (  40.14  )
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

On Tue, Apr 28, 2026 at 03:18:56PM -0700, Tanmay Shah wrote:
> The remote state is set to RPROC_DETACHED if the resource table is found
> in the memory. However, this can be wrong if the remote is not started,
> but firmware is still loaded in the memory. Use PM_GET_NODE_STATUS call
> to the firmware to request the state of the RPU node. If the RPU is
> actually out of reset and running, only then move the remote state to
> RPROC_DETACHED, otherwise keep the remote state to RPROC_OFFLINE.
> 
> Fixes: bca4b02ef92e ("remoteproc: xlnx: Add attach detach support")
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Changes in v3:
>   - add fixes tag
> 
> Changes in v2:
>   - fix subject line: %s/node/core/
>   - add comment explaining optional resource table availability in the
> 
>  drivers/firmware/xilinx/zynqmp.c        | 28 +++++++++++++++
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 46 +++++++++++++++++++------
>  include/linux/firmware/xlnx-zynqmp.h    | 21 +++++++++++
>  3 files changed, 85 insertions(+), 10 deletions(-)
>

Applied.

Thanks,
Mathieu
 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index fbe8510f4927..af838b2dc327 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -1450,6 +1450,34 @@ int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>  }
>  EXPORT_SYMBOL_GPL(zynqmp_pm_get_node_status);
>  
> +/**
> + * zynqmp_pm_get_rpu_node_status - PM call to request a RPU node's current power state
> + * @node:		ID of the RPU component or sub-system in question
> + * @status:		Current operating state of the requested RPU node.
> + * @requirements:	Current requirements asserted on the RPU node.
> + * @usage:		Usage information, used for RPU slave nodes only:
> + *			PM_USAGE_NO_MASTER	- No master is currently using
> + *						  the node
> + *			PM_USAGE_CURRENT_MASTER	- Only requesting master is
> + *						  currently using the node
> + *			PM_USAGE_OTHER_MASTER	- Only other masters are
> + *						  currently using the node
> + *			PM_USAGE_BOTH_MASTERS	- Both the current and at least
> + *						  one other master is currently
> + *						  using the node
> + *
> + * Return:		Returns status, either success or error+reason
> + */
> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +				  u32 *const requirements, u32 *const usage)
> +{
> +	if (zynqmp_pm_feature(PM_GET_NODE_STATUS) < PM_API_VERSION_2)
> +		return -EOPNOTSUPP;
> +
> +	return zynqmp_pm_get_node_status(node, status, requirements, usage);
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_get_rpu_node_status);
> +
>  /**
>   * zynqmp_pm_force_pwrdwn - PM call to request for another PU or subsystem to
>   *             be powered down forcefully
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 50a9974f3202..45a62cb98072 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -948,16 +948,6 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>  		goto free_rproc;
>  	}
>  
> -	/*
> -	 * If firmware is already available in the memory then move rproc state
> -	 * to DETACHED. Firmware can be preloaded via debugger or by any other
> -	 * agent (processors) in the system.
> -	 * If firmware isn't available in the memory and resource table isn't
> -	 * found, then rproc state remains OFFLINE.
> -	 */
> -	if (!zynqmp_r5_get_rsc_table_va(r5_core))
> -		r5_rproc->state = RPROC_DETACHED;
> -
>  	r5_core->rproc = r5_rproc;
>  	return r5_core;
>  
> @@ -1210,6 +1200,7 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  {
>  	struct device *dev = cluster->dev;
>  	struct zynqmp_r5_core *r5_core;
> +	u32 req, usage, status;
>  	int ret = -EINVAL, i;
>  
>  	r5_core = cluster->r5_cores[0];
> @@ -1255,6 +1246,41 @@ static int zynqmp_r5_core_init(struct zynqmp_r5_cluster *cluster,
>  		ret = zynqmp_r5_get_sram_banks(r5_core);
>  		if (ret)
>  			return ret;
> +
> +		/*
> +		 * It is possible that firmware is loaded into the memory, but
> +		 * RPU (remote) is not running. In such case, RPU state will be
> +		 * moved to RPROC_DETACHED wrongfully. To avoid it first make
> +		 * sure RPU is power-on and out of reset before parsing for the
> +		 * resource table.
> +		 */
> +		ret = zynqmp_pm_get_rpu_node_status(r5_core->pm_domain_id,
> +						    &status, &req, &usage);
> +		if (ret) {
> +			dev_warn(r5_core->dev,
> +				 "failed to get rpu node status, err %d\n", ret);
> +			continue;
> +		}
> +
> +		/*
> +		 * If RPU state is power on and out of reset i.e. running, then
> +		 * assign RPROC_DETACHED state. If the RPU is not out of reset
> +		 * then do not attempt to attach to the remote processor.
> +		 */
> +		if (status == PM_NODE_RUNNING) {
> +			/*
> +			 * Not all the firmware that is running on the remote
> +			 * core is expected to have the resource table. The
> +			 * firmware might not use RPMsg at all, and in that case
> +			 * resource table becomes irrelevant. However, we still
> +			 * need to make sure that running core is not reported
> +			 * as offline. so do not decide remote core state based
> +			 * on the resource table availability
> +			 */
> +			if (zynqmp_r5_get_rsc_table_va(r5_core))
> +				dev_dbg(r5_core->dev, "rsc tbl not found\n");
> +			r5_core->rproc->state = RPROC_DETACHED;
> +		}
>  	}
>  
>  	return 0;
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index d70dcd462b44..7e27b0f7bf7e 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -542,6 +542,18 @@ enum pm_gem_config_type {
>  	GEM_CONFIG_FIXED = 2,
>  };
>  
> +/**
> + * enum pm_node_status - Device node status provided by xilpm fw
> + * @PM_NODE_UNUSED: Device is not used
> + * @PM_NODE_RUNNING: Device is power-on and out of reset
> + * @PM_NODE_HALT: Device is power-on but in the reset state
> + */
> +enum pm_node_status {
> +	PM_NODE_UNUSED = 0,
> +	PM_NODE_RUNNING = 1,
> +	PM_NODE_HALT = 12,
> +};
> +
>  /**
>   * struct zynqmp_pm_query_data - PM query data
>   * @qid:	query ID
> @@ -630,6 +642,8 @@ int zynqmp_pm_set_rpu_mode(u32 node_id, enum rpu_oper_mode rpu_mode);
>  int zynqmp_pm_set_tcm_config(u32 node_id, enum rpu_tcm_comb tcm_mode);
>  int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>  			      u32 *const requirements, u32 *const usage);
> +int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +				  u32 *const requirements, u32 *const usage);
>  int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
>  int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
>  			     u32 value);
> @@ -939,6 +953,13 @@ static inline int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>  	return -ENODEV;
>  }
>  
> +static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
> +						u32 *const requirements,
> +						u32 *const usage)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline int zynqmp_pm_set_sd_config(u32 node,
>  					  enum pm_sd_config_type config,
>  					  u32 value)
> 
> base-commit: fcdf2df56d34a3f04cab0725c5bc3abdaa73c2be
> -- 
> 2.34.1
> 

