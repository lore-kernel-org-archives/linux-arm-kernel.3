Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA3AC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wgi4l9pB+k6eYqsObcJMKbBiV/az9m6d/4vGJ5hPSY=; b=jiH4TWYgvDnFzgid1YHg/FHGtp
	pt+ta5BwVA2qJUM0/Ejm5b9cxwchdmIbdpuw8P4aCkgJ06JbmMEw3U1ARqRFJDgNG3I2Qbd5tR4L1
	NsJU48VePYtnEJV/XqGUJZSsS4qyPzhX0leowIsua3i9qw4kcL8ZsuXO2BVcaJHpjAXUV1eNUed2N
	DPx90Eip86xt2vKMfqeNH7R2kPzTCsLCuakLRepg54AyCCjtXaSD8GO4SehqnX75PgdidoUSwGzYW
	E4ABKWyxiIbwravc4pw6JZNLUBfmuHZO1Kbi2tdrzdpvke5fc7Ui6y3KCqrgrIR0Fixde67vG2GRN
	tAsVmrUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeoh-00000004aI5-1SG2;
	Mon, 09 Jun 2025 15:53:43 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOeFg-00000004UoT-3Omc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:17:34 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso3851208b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 08:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749482251; x=1750087051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0wgi4l9pB+k6eYqsObcJMKbBiV/az9m6d/4vGJ5hPSY=;
        b=Ez9LLUDgBuOSh3OXmqrAUz2HzuINB4MVBXAy87GxWX8rcom0pijfE1iR8AmcviXK51
         1+g0+AJDmKFzHOUqunn0iAeNkRwkdwhsibYNSSneY+Rnws6a3nLEuXjFO6ZpU6tcuOqb
         VQ+S1vXA4xoU3Ana6tPCNwxvgf2eSwbaFaJXXWAAtEdtwG1Az2H4Z+vjuS3ZBc+f/i9S
         XdCOwThw96w4fMO5CfMeYI5GJvKaY9hbUnu99qImECTo3i02K6eEgsFlXo9yQNS4fDzr
         zsdf0Wjxdua5XKp0uh+jAMo3hbcN/Jp2e4ZwW1PCadoimcGSuxL2r/qwl8f1N33+kFIu
         3gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749482251; x=1750087051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wgi4l9pB+k6eYqsObcJMKbBiV/az9m6d/4vGJ5hPSY=;
        b=CeaHMriyhRtE3Cd2I8bLBPB/N+pVv7dgME9I8lj/XKY8XkrwaE8K5G1lpREzKIPFzT
         OBE1vr9xifZ5ssLQ/1qP4VXGTIfSiGsaAr5o22Z+k1oBFy+8zvrTWgjVTFMi1oCVYksS
         ZjnRaNh8C+hW4v3/xioXOmr8Ye3jHRx8nZcqZSkimoLbvwW/9z17YgRbM47f29viK1NN
         hDzUeytXrIvLRjt2mm0WpVIS/Nm16oM91v4AQEjSvKCau04gvFrdXGO4zwxJ5h0AOAT7
         u9dH2+wmRj7fcDxgqKntaKefTyGbA2gzYiUN4tuiQ1ZVhm1g+U+u3TU/YX0C9CuXtJIs
         js1g==
X-Forwarded-Encrypted: i=1; AJvYcCXQoziqW4U4d/r0Ei82ClYzT3Vlixko10q9pktB1Vs8Nw0QuLULvCYuj3q7AjNID05F+iR/5avIGUtZiDTrVBV+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg02sQZ3qpj4XAsq503dxjeM9qEvGi9KeyVhJovwhF23OWXO4S
	zdFqXZBMDHRl2FnMNkXMC3FXy7Fw7FrmyhmGEGo12DS99eudh2Cf2o07YuqYvOxBxqY=
X-Gm-Gg: ASbGncs9rCtqb3mQuP46GYZ686f3K7nVus9GX7Ars5NYoF4/3opYj3SmAoJNqsevpiy
	Pj6SlC7lAnZrw8tk5YFBQLrk/LArYyBQT7e2Yru61Rk53hV+359aaaa0kZcxXs3lCQdTqDV+W0p
	DD7IBc4+u32tZeKQype2u7mqcGliDOy3vzeYCr3Gv4P4TylQ6mRLc42BAj0M/gpyde2MXooqqah
	zQPSAlCf34CS0PXMAA0P6h4huBO/2pb/dxkCqYp1ZK4X0LG4AT+ssAbRzbVKTCR0sImPVRaN6ge
	UEtIsZycjGkDF7HOjYTFEB10I3Q8P3ZxfrtM3LiTSc9XcoS0JUsZ8V8=
X-Google-Smtp-Source: AGHT+IG+8DMWeioystMlYoPtUrhRgiquzNvnRe0fXwZg1slBlCk+KnQoms7/UocPVMMtvBlqNfImuw==
X-Received: by 2002:a05:6a21:8cca:b0:21f:52ed:23cc with SMTP id adf61e73a8af0-21f75c8fb52mr289826637.15.1749482251479;
        Mon, 09 Jun 2025 08:17:31 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1329:68ff:ffeb:cd9c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482af38378sm6095758b3a.16.2025.06.09.08.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:17:30 -0700 (PDT)
Date: Mon, 9 Jun 2025 09:17:28 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aEb7CCkr0unZppvn@p14s>
References: <20250606-imx95-rproc-1-v2-0-a2bd64438be9@nxp.com>
 <20250606-imx95-rproc-1-v2-2-a2bd64438be9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606-imx95-rproc-1-v2-2-a2bd64438be9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_081732_882894_D82432A3 
X-CRM114-Status: GOOD (  43.01  )
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

Good day,

On Fri, Jun 06, 2025 at 09:55:13AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
> 
> There are three cases for M7:
>  (1) M7 in a separate Logical Machine(LM) that Linux can't control it.
>  (2) M7 in a separate Logical Machine that Linux can control it using
>      LMM protocol
>  (3) M7 runs in same Logical Machine as A55, so Linux can control it
>      using CPU protocol
> 
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Add IMX_RPROC_SM to indicate the remote core runs on a SoC that
>    has System Manager.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(got
>    from DTB), if same, use CPU protocol to start/stop. Otherwise, use
>    LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
> 
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 127 ++++++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h |   2 +
>  2 files changed, 127 insertions(+), 2 deletions(-)
> 

I will look at this patch when either Daniel or Iuliana have given their R-B.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f10a0db794de494c52304b2323b89f..8fe3c76c9b30ed9e66d4e8c8e2e178a21f3b5bd2 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/firmware/imx/sci.h>
> +#include <linux/firmware/imx/sm.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
> @@ -21,6 +22,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>  #include <linux/workqueue.h>
>  
>  #include "imx_rproc.h"
> @@ -91,6 +93,11 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>  
> +/* Logical Machine Operation */
> +#define IMX_RPROC_FLAGS_SM_LMM_OP	BIT(0)
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(1)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(struct rproc *rproc);
>  
> @@ -115,6 +122,10 @@ struct imx_rproc {
>  	u32				entry;		/* cpu start address */
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
> +	/* For i.MX System Manager based systems */
> +	u32				cpuid;
> +	u32				lmid;
> +	u32				flags;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -393,6 +404,30 @@ static int imx_rproc_start(struct rproc *rproc)
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>  		break;
> +	case IMX_RPROC_SM:
> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> +			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +				return -EACCES;
> +
> +			ret = scmi_imx_lmm_reset_vector_set(priv->lmid, priv->cpuid, 0, 0);
> +			if (ret) {
> +				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> +					priv->lmid, priv->cpuid, ret);
> +			}
> +
> +			ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_BOOT, 0);
> +			if (ret)
> +				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, priv->lmid);
> +		} else {
> +			ret = scmi_imx_cpu_reset_vector_set(priv->cpuid, 0, true, false, false);
> +			if (ret) {
> +				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
> +					priv->cpuid, ret);
> +			}
> +
> +			ret = scmi_imx_cpu_start(priv->cpuid, true);
> +		}
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -435,6 +470,16 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>  		break;
> +	case IMX_RPROC_SM:
> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> +			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
> +				ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +			else
> +				ret = -EACCES;
> +		} else {
> +			ret = scmi_imx_cpu_start(priv->cpuid, false);
> +		}
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -549,9 +594,11 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  	struct device_node *np = priv->dev->of_node;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct of_phandle_iterator it;
>  	struct rproc_mem_entry *mem;
>  	struct reserved_mem *rmem;
> +	int ret;
>  	u32 da;
>  
>  	/* Register associated reserved memory regions */
> @@ -592,6 +639,38 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		rproc_add_carveout(rproc, mem);
>  	}
>  
> +	switch (dcfg->method) {
> +	case IMX_RPROC_SM:
> +		if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
> +			break;
> +		/*
> +		 * Power on the Logical Machine to make sure TCM is available.
> +		 * Also serve as permission check. If in different Logical
> +		 * Machine, and linux has permission to handle the Logical
> +		 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> +		 */
> +		ret = scmi_imx_lmm_operation(priv->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +		if (ret == 0) {
> +			dev_info(priv->dev, "lmm(%d) powered on\n", priv->lmid);
> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +		} else if (ret == -EACCES) {
> +			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", priv->lmid);
> +			/*
> +			 * If remote cores boots up, continue the rpmsg channel setup,
> +			 * else linux have no permission, so return -EACCES.
> +			 */
> +			if (priv->rproc->state != RPROC_DETACHED)
> +				return -EACCES;
> +		} else if (ret) {
> +			dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, priv->lmid);
> +			return ret;
> +		}
> +
> +		break;
> +	default:
> +		break;
> +	};
> +
>  	return  0;
>  }
>  
> @@ -911,13 +990,53 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  	struct regmap_config config = { .name = "imx-rproc" };
>  	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct device *dev = priv->dev;
> +	struct scmi_imx_lmm_info info;
>  	struct regmap *regmap;
>  	struct arm_smccc_res res;
> +	bool started = false;
>  	int ret;
>  	u32 val;
>  	u8 pt;
>  
>  	switch (dcfg->method) {
> +	case IMX_RPROC_SM:
> +		/* Get current Linux Logical Machine ID */
> +		ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> +		if (ret) {
> +			dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> +			return ret;
> +		}
> +
> +		ret = of_property_read_u32(dev->of_node, "fsl,cpu-id", &priv->cpuid);
> +		if (ret) {
> +			dev_err(dev, "No fsl,cpu-id property\n");
> +			return ret;
> +		}
> +
> +		ret = of_property_read_u32(dev->of_node, "fsl,lmm-id", &priv->lmid);
> +		if (ret) {
> +			dev_info(dev, "No fsl,lmm-id property\n");
> +			return ret;
> +		}
> +
> +		/*
> +		 * Check whether remote processor is in same Logical Machine as Linux.
> +		 * If no, need use Logical Machine API to manage remote processor, and
> +		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
> +		 * If yes, use CPU protocol API to manage remote processor.
> +		 */
> +		if (priv->lmid != info.lmid) {
> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
> +			dev_info(dev, "Using LMM Protocol OPS\n");
> +		} else {
> +			dev_info(dev, "Using CPU Protocol OPS\n");
> +		}
> +
> +		scmi_imx_cpu_started(priv->cpuid, &started);
> +		if (started)
> +			priv->rproc->state = RPROC_DETACHED;
> +
> +		return 0;
>  	case IMX_RPROC_NONE:
>  		priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> @@ -1029,8 +1148,12 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> -	/* Remote core is not under control of Linux */
> -	if (dcfg->method == IMX_RPROC_NONE)
> +	/*
> +	 * IMX_RPROC_NONE indicates not under control of Linux.
> +	 * System Manager(SM) firmware automatically configures clock,
> +	 * so bypass the clk settings for IMX_RPROC_SM.
> +	 */
> +	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SM)
>  		return 0;
>  
>  	priv->clk = devm_clk_get(dev, NULL);
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..e3e851d88fb069a589531ea21a3790fd62fde57d 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -26,6 +26,8 @@ enum imx_rproc_method {
>  	IMX_RPROC_SCU_API,
>  	/* Through Reset Controller API */
>  	IMX_RPROC_RESET_CONTROLLER,
> +	/* Through System Manager */
> +	IMX_RPROC_SM,
>  };
>  
>  /* dcfg flags */
> 
> -- 
> 2.37.1
> 

