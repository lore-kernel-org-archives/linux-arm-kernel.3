Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00F8CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 17:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOHqWIE7DXXEQCPB3d/HpjT74nQL9GCMig6xnM0nZ/U=; b=2UW3dSwbWAGUPe839uKF6FoWzf
	HWYZvfwnoZTH/N/QX1s23rUHANE+ncp4hsYKOlq41Bi7/yPyW8rFpUeKR7gqkkSX2+ojo7wHb3Mh1
	xvi4uzMM3qXsw/5pHhkWqKdOo4qvxfdRS1gFj3qaxJeVX9aGM1CMX6ZTOraLk2iM0yNMcN/ZjwuWL
	bN6coUij8yiqlPx1NjZMCBuMdLg77SQ5BKr1feed/9TYt0G1oL7X76f8dkhnKLF18EdHTvPPu+LgR
	ElZvTL0r8uhGeC4niIMoGtOaWYm6Qq1ZrPlb+4RTk4irSN/eezy/MdexaUAP9nCr+DpYNzSadK1JY
	3g/J0hoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4oQ-00000006h5V-1nCq;
	Tue, 23 Jun 2026 17:21:26 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc4oO-00000006h4n-0NdT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 17:21:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2c6afcc99a5so717225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 10:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782235282; x=1782840082; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOHqWIE7DXXEQCPB3d/HpjT74nQL9GCMig6xnM0nZ/U=;
        b=EZdYIy9aonGitlpN58+teG62qW6ehVFVytGOKOj6kF5pC8VFR4BHtDqBZ2DXR5FTpe
         cIKhWkBKZD0LfLrSzPgdVJBk0XtDJom/Ci/3Jl+NaNpz6vakV3fI/85mjR0JNK/2/zjm
         o9blGBnf8U/D7RiQNfeOQWqsqvFZ1brAAmJyA9HBvM/5ZNV3gUGRToZZ6LVVDLuKMu8i
         CCL1BhDHp1fUZpYJQpv2Xpgpd+Gt9AfgRJ2oYtCQHOC4EWbjNEro29O9wv2h/1ZQukIo
         nCw2gFraTpMBBHiKwe9Q1pUApmORFU9flm+rn3V6MlymrYiJTpw+H1syin+ybrYb+Row
         JQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782235282; x=1782840082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOHqWIE7DXXEQCPB3d/HpjT74nQL9GCMig6xnM0nZ/U=;
        b=DvZaeF2lEroCYgOpiUerTcRrttW3qRK7ZPXWxNYhW7VR08CjYUPW6mgWRYMspVZYrx
         TMN+d0x8wIToAXT0WWwdWJ7JQnpvP/cRzw/KIXbuqV1e82YQl88ACna9hDx84EISOkCw
         gjJ1WFIVsI3CtPLi7oLFXkr6wRxN2Z/YPOLc85kcOviRuyhCKefeeMcbl/5i7nBJi/8c
         qLvUCf9WYaeFBXRTlg81MPAqkKejSGn+nh3C53fFMypcMqs2z5NTtDPfBZIl09OXEPM+
         QkMp989dDt3m52hcPxHh4fzs3PqHJrwdcvHc3IydciKE9aSOpfHRBZCUuZoMtguik/4a
         rGmQ==
X-Forwarded-Encrypted: i=1; AHgh+RonY+0aha/h61STHlMgzjV/ZmBTZKJKlqI6/2gookI6YJGpppxmKjaapxgqND3ceEM0Eiy9GXYgD32RnGM34PxB@lists.infradead.org
X-Gm-Message-State: AOJu0YxkA6jFiUmI7yif44RoR7/i4VHIk7KPgktXfgpOaSaXBOqqGWgs
	TX1nTm8myIISX+m9VvA8YUW0H+TFhHjgzCClEu9Je1N/vCJt3+koO7R+G0HlSGrQVOg=
X-Gm-Gg: AfdE7clD1wKR7/WAsHe8NIjAYOpp0BCCwBFWPfxmqcvv7nBexy2wAcaj+DHXdQVF+6b
	gpOv7k3aEg3rykY7pJoe0d00i7uHl6P/RvMMGbZ0DrQi5K+UUuAhVFU6BeG1kocrZFiX2YaqFtg
	doPLcACGDZaHSHYzoYkrXqxNQJggy5fAJI5pIwpZiZZDzC3tu15buzS2PiYt0Hr+ICi0lC294BW
	VjhxuYRoGzqR1z4YQ/m5afb6pHhRwVS+m67oLhBPMTblAWHzF6atvu1cJNeeaVZ1Myax8jRWI6q
	UmCylGxpqWwPcBOrx9RPYJ8F9bHkqrwhBQlG5sd/SBRUCgII0tRmrcoZUFHkdIiAYn1IrXHOTHp
	tvg8eqbwwtkNR7vwUoMP4H+wlueQKQpg2zCVHT9dOFbaA0u6oww7OqOD25SppRJZX3gb5YC1m3P
	js2Wrk3Un5qmRcvjHw
X-Received: by 2002:a17:902:d549:b0:2c7:c63a:2d69 with SMTP id d9443c01a7336-2c7c63a2ed4mr33756515ad.15.1782235282346;
        Tue, 23 Jun 2026 10:21:22 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:864a:82f7:7789:bd1a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436f90d4sm107525595ad.34.2026.06.23.10.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:21:21 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:21:19 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: michal.simek@amd.com, andersson@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: refactor start & stop ops
Message-ID: <ajrAj2qfjvogDDrP@p14s>
References: <20260619163854.410392-1-tanmay.shah@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619163854.410392-1-tanmay.shah@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_102124_154289_DC6CCD9E 
X-CRM114-Status: GOOD (  33.37  )
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

On Fri, Jun 19, 2026 at 09:38:54AM -0700, Tanmay Shah wrote:
> Current _start and _stop ops are implemented using various APIs from the
> platform management firmware driver. Instead provide respective RPU
> start and stop API in the firmware driver and move the logic to interact
> with the PM firmware in the firmware driver. The remoteproc driver doesn't
> need to know actual logic, but only the final result i.e. RPU start/stop
> was success or not. This refactor keeps the remoteproc driver simple and
> moves firmware interaction logic to the firmware driver.
> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/firmware/xilinx/zynqmp.c        | 93 +++++++++++++++++++++++++
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 68 ++----------------

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

>  include/linux/firmware/xlnx-zynqmp.h    | 12 ++++
>  3 files changed, 110 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index af838b2dc327..f9a3a95b0638 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -1513,6 +1513,99 @@ int zynqmp_pm_request_wake(const u32 node,
>  }
>  EXPORT_SYMBOL_GPL(zynqmp_pm_request_wake);
>  
> +/**
> + * zynqmp_pm_start_rpu - Boot Real-time Processing Unit (Cortex-R) on SoC
> + *
> + * @node: power-domains id of the core
> + * @bootaddr: Boot address of elf
> + *
> + * Return: status, either success or error+reason
> + */
> +int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
> +{
> +	enum rpu_boot_mem bootmem;
> +	int ret;
> +
> +	/*
> +	 * The exception vector pointers (EVP) refer to the base-address of
> +	 * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
> +	 * starts at the base-address and subsequent vectors are on 4-byte
> +	 * boundaries.
> +	 *
> +	 * Exception vectors can start either from 0x0000_0000 (LOVEC) or
> +	 * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip Memory)
> +	 *
> +	 * Usually firmware will put Exception vectors at LOVEC.
> +	 *
> +	 * It is not recommend that you change the exception vector.
> +	 * Changing the EVP to HIVEC will result in increased interrupt latency
> +	 * and jitter. Also, if the OCM is secured and the Cortex-R5F processor
> +	 * is non-secured, then the Cortex-R5F processor cannot access the
> +	 * HIVEC exception vectors in the OCM.
> +	 */
> +	bootmem = (bootaddr >= 0xFFFC0000) ?
> +		   PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> +
> +	pr_debug("RPU boot addr 0x%llx from %s.", bootaddr,
> +		 bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> +
> +	/* Request node before starting RPU core if new version of API is supported */
> +	if (zynqmp_pm_feature(PM_REQUEST_NODE) > PM_API_VERSION_1) {
> +		ret = zynqmp_pm_request_node(node,
> +					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> +					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +		if (ret < 0) {
> +			pr_err("failed to request 0x%x", node);
> +			return ret;
> +		}
> +	}
> +
> +	ret = zynqmp_pm_request_wake(node, true,
> +				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
> +	if (ret)
> +		pr_err("failed to start RPU = 0x%x\n", node);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_start_rpu);
> +
> +/**
> + * zynqmp_pm_stop_rpu - Stop Real-time Processing Unit (Cortex-R) on SoC
> + *
> + * @node: power-domains id of the core
> + *
> + * Return: status, either success or error+reason
> + */
> +int zynqmp_pm_stop_rpu(const u32 node)
> +{
> +	int ret;
> +
> +	/* Use release node API to stop core if new version of API is supported */
> +	if (zynqmp_pm_feature(PM_RELEASE_NODE) > PM_API_VERSION_1) {
> +		ret = zynqmp_pm_release_node(node);
> +		if (ret)
> +			pr_err("failed to stop remoteproc RPU %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Check expected version of EEMI call before calling it. This avoids
> +	 * any error or warning prints from firmware as it is expected that fw
> +	 * doesn't support it.
> +	 */
> +	if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != PM_API_VERSION_1) {
> +		pr_debug("EEMI interface %d ver 1 not supported\n",
> +			 PM_FORCE_POWERDOWN);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	/* maintain force pwr down for backward compatibility */
> +	ret = zynqmp_pm_force_pwrdwn(node, ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +	if (ret)
> +		pr_err("core force power down failed\n");
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(zynqmp_pm_stop_rpu);
> +
>  /**
>   * zynqmp_pm_set_requirement() - PM call to set requirement for PM slaves
>   * @node:		Node ID of the slave
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 3349d1877751..dcd8a93f031c 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -364,49 +364,12 @@ static void zynqmp_r5_rproc_kick(struct rproc *rproc, int vqid)
>  static int zynqmp_r5_rproc_start(struct rproc *rproc)
>  {
>  	struct zynqmp_r5_core *r5_core = rproc->priv;
> -	enum rpu_boot_mem bootmem;
>  	int ret;
>  
> -	/*
> -	 * The exception vector pointers (EVP) refer to the base-address of
> -	 * exception vectors (for reset, IRQ, FIQ, etc). The reset-vector
> -	 * starts at the base-address and subsequent vectors are on 4-byte
> -	 * boundaries.
> -	 *
> -	 * Exception vectors can start either from 0x0000_0000 (LOVEC) or
> -	 * from 0xFFFF_0000 (HIVEC) which is mapped in the OCM (On-Chip Memory)
> -	 *
> -	 * Usually firmware will put Exception vectors at LOVEC.
> -	 *
> -	 * It is not recommend that you change the exception vector.
> -	 * Changing the EVP to HIVEC will result in increased interrupt latency
> -	 * and jitter. Also, if the OCM is secured and the Cortex-R5F processor
> -	 * is non-secured, then the Cortex-R5F processor cannot access the
> -	 * HIVEC exception vectors in the OCM.
> -	 */
> -	bootmem = (rproc->bootaddr >= 0xFFFC0000) ?
> -		   PM_RPU_BOOTMEM_HIVEC : PM_RPU_BOOTMEM_LOVEC;
> -
> -	dev_dbg(r5_core->dev, "RPU boot addr 0x%llx from %s.", rproc->bootaddr,
> -		bootmem == PM_RPU_BOOTMEM_HIVEC ? "OCM" : "TCM");
> -
> -	/* Request node before starting RPU core if new version of API is supported */
> -	if (zynqmp_pm_feature(PM_REQUEST_NODE) > 1) {
> -		ret = zynqmp_pm_request_node(r5_core->pm_domain_id,
> -					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
> -					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> -		if (ret < 0) {
> -			dev_err(r5_core->dev, "failed to request 0x%x",
> -				r5_core->pm_domain_id);
> -			return ret;
> -		}
> -	}
> -
> -	ret = zynqmp_pm_request_wake(r5_core->pm_domain_id, 1,
> -				     bootmem, ZYNQMP_PM_REQUEST_ACK_NO);
> +	ret = zynqmp_pm_start_rpu(r5_core->pm_domain_id, rproc->bootaddr);
>  	if (ret)
> -		dev_err(r5_core->dev,
> -			"failed to start RPU = 0x%x\n", r5_core->pm_domain_id);
> +		dev_err(&rproc->dev, "failed to start RPU\n");
> +
>  	return ret;
>  }
>  
> @@ -423,30 +386,9 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
>  	struct zynqmp_r5_core *r5_core = rproc->priv;
>  	int ret;
>  
> -	/* Use release node API to stop core if new version of API is supported */
> -	if (zynqmp_pm_feature(PM_RELEASE_NODE) > 1) {
> -		ret = zynqmp_pm_release_node(r5_core->pm_domain_id);
> -		if (ret)
> -			dev_err(r5_core->dev, "failed to stop remoteproc RPU %d\n", ret);
> -		return ret;
> -	}
> -
> -	/*
> -	 * Check expected version of EEMI call before calling it. This avoids
> -	 * any error or warning prints from firmware as it is expected that fw
> -	 * doesn't support it.
> -	 */
> -	if (zynqmp_pm_feature(PM_FORCE_POWERDOWN) != 1) {
> -		dev_dbg(r5_core->dev, "EEMI interface %d ver 1 not supported\n",
> -			PM_FORCE_POWERDOWN);
> -		return -EOPNOTSUPP;
> -	}
> -
> -	/* maintain force pwr down for backward compatibility */
> -	ret = zynqmp_pm_force_pwrdwn(r5_core->pm_domain_id,
> -				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
> +	ret = zynqmp_pm_stop_rpu(r5_core->pm_domain_id);
>  	if (ret)
> -		dev_err(r5_core->dev, "core force power down failed\n");
> +		dev_err(&rproc->dev, "failed to stop RPU\n");
>  
>  	return ret;
>  }
> diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
> index 7e27b0f7bf7e..347df66ee176 100644
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@ -644,6 +644,8 @@ int zynqmp_pm_get_node_status(const u32 node, u32 *const status,
>  			      u32 *const requirements, u32 *const usage);
>  int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const status,
>  				  u32 *const requirements, u32 *const usage);
> +int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr);
> +int zynqmp_pm_stop_rpu(const u32 node);
>  int zynqmp_pm_set_sd_config(u32 node, enum pm_sd_config_type config, u32 value);
>  int zynqmp_pm_set_gem_config(u32 node, enum pm_gem_config_type config,
>  			     u32 value);
> @@ -960,6 +962,16 @@ static inline int zynqmp_pm_get_rpu_node_status(const u32 node, u32 *const statu
>  	return -ENODEV;
>  }
>  
> +static inline int zynqmp_pm_start_rpu(const u32 node, const u64 bootaddr)
> +{
> +	return -ENODEV;
> +}
> +
> +static inline int zynqmp_pm_stop_rpu(const u32 node)
> +{
> +	return -ENODEV;
> +}
> +
>  static inline int zynqmp_pm_set_sd_config(u32 node,
>  					  enum pm_sd_config_type config,
>  					  u32 value)
> 
> base-commit: 721396afea31eac476d88f5db10ba111ba4b8382
> -- 
> 2.34.1
> 

