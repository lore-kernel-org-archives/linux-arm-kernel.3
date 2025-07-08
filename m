Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56459C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6KkAnrKypw5hoAxJZFriVdg9SAqRfE36aEuojSYIT0=; b=EsEBfJdr9V46cNRMz5SIHCXB3n
	PsvGlogth0c5h9aX0V7CXFtOmpm8/WdyafMkIDP3B85BAYzoDRXygdmJbwz6KYou6jHG63Nuxm8tJ
	1fF1sJsJ5H7SXtX8+Ge5+IfiMLmyiY9BEhg2j2QMB9V8mwkIJ/0QKzA8fpg3apsKgdNxQ9nzpSyCP
	rmPwjYHoSflXlx5fXvs8WZ0RwdmRR9F8DsAnvBiBIh+S9fcBxzneTDyX5CVFeQ9tRaz4jpgKSpquz
	CWnck0mI+WZe2v5szibd4+7AxG69oYuTunSxEmk/D2/qeiqyU31u9H1JwxAmR0r7FpZ0LXo0+svrQ
	c1jT+hUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBfn-000000062WI-2oeU;
	Tue, 08 Jul 2025 17:00:03 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBFG-00000005yls-3pGX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 16:32:40 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-7494999de5cso2847504b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 09:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751992357; x=1752597157; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t6KkAnrKypw5hoAxJZFriVdg9SAqRfE36aEuojSYIT0=;
        b=k2F/cyZAz+NAEy5fRZuNu7D27WNAOpdDKep4rMIo8lJbsKxBwo217/kYNSNr9Wiwzp
         ep+RjZqRRqebQF0zPghteCs3/6RiMWE0sf7argzAlIvawYB1YFV0z3XrvAi69TaBd78K
         qNHUyijQSY1ru/2iXT5fWZmLSc8fbyDLtAC9xBlwTUuOThDBLNyhC1YRZ5slxQznqmoW
         HO33CO/7otx392pry02KQcWKRRdRc3q+SmSbSZLV9CBu2/iqg8PpyNkjEL3EyJhPZUwt
         HcoMNLEuKp4SzcGEAQdWl9BzFC+OVltrUh6UsmgK9+UGZ7zLxYe2lPSvXUUoRTcuJtzy
         lhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992357; x=1752597157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6KkAnrKypw5hoAxJZFriVdg9SAqRfE36aEuojSYIT0=;
        b=oO0Uq0oMu4230i8isr+5wJDGHe4mCTPprE/2SZMDYFcM1d6lvKqzT4lDhssu1np9xs
         uCOB0WghygNhGqVxkWPXJRiChPxsFKTUOS6Dg044fqwVPa6uWzTGqgZIh15FE69c2xXd
         ql9YXTWS2EIfClYmZh6JumGOPGlRpJQpQOS8BKqaPMg0kYYWuyqlhMIw87rzj8iSeDc5
         jgG0SijA+5tSZCkwP/yzcEeV7ZzAF/k33dDWslsAWqXk7WwfaNF+9NnkGCwAQVfUlKyG
         ahKJUMet1O4bG8/QraVGu/JvyY1gp1NcykPogkDYv+wjCRMQywccK9uOJKLexrugO93q
         t/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVbzCVduV6g06VyDg8rzxwRTMhzZPwwUoX3Ln4Il0JeIKbUePMMVebNo43pcti4cYo+97MGKZAJLiZZ2lIOThtC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/B7ffndWy/wsk37NE+y2Yr/ZzhknJX23VQoIBhWaUzYIwE1T5
	judnBPpiB+eN61Q12A0NgKEDQGoK7RRoy0RS5pZtYqpX31UMsfeh5rimKwFzh9qQ1IA=
X-Gm-Gg: ASbGncss38WoIFnAxUNx389TwEwYFmwEv7QkZTuP55EifjQMYlUPkBODpWcKKjFLBO5
	DUTGXcINUsEHHQ46c/ABS5q9cTC7JBzelf4zjyhoiEUaqdNAiQwXqOSbfmOsv+AcxAP8gcsxM6u
	aw3cdhdri5UMdtdP4xcGLduii29di/KyViibPI7ZPc2+OlosLRvSh+oKc/c84ggFuFiF2tDGOd6
	1hZUMGPeP6VdB4z55SJzdcy1EFsKBrPYjFUmc5tRxbPZRzmOs41FZx6JsUHiclX9Ulxtlx3RxPa
	3ZJtZ6PwoCImGzhCyOjDmkllg7u2TzRhItxEQmJnijQYELD2SpmeAWfnOUxwK7sINw==
X-Google-Smtp-Source: AGHT+IHMpvanChrXFUM/s7IduMsHOQVHfmC468INl9tzFvFAT0Xze9+3AEYdC5EP2sv3V2bmamfBhA==
X-Received: by 2002:a05:6a00:2ea7:b0:736:4e67:d631 with SMTP id d2e1a72fcca58-74e4abc41e9mr95206b3a.23.1751992357404;
        Tue, 08 Jul 2025 09:32:37 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c5cf:9364:ea5e:99f1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce359f53fsm12188694b3a.20.2025.07.08.09.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:32:36 -0700 (PDT)
Date: Tue, 8 Jul 2025 10:32:34 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 2/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aG1IIk42q8OmGsQH@p14s>
References: <20250625-imx95-rproc-1-v3-0-699031f5926d@nxp.com>
 <20250625-imx95-rproc-1-v3-2-699031f5926d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-imx95-rproc-1-v3-2-699031f5926d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_093238_968455_CA6732D5 
X-CRM114-Status: GOOD (  49.44  )
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

On Wed, Jun 25, 2025 at 10:23:28AM +0800, Peng Fan (OSS) wrote:
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
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a seprate LM),
>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case 1 and 2, Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
>

Thanks for the context, it really helps.

 
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 113 ++++++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h |   5 ++
>  2 files changed, 116 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 74299af1d7f10a0db794de494c52304b2323b89f..b1a117ca5e5795554b67eb7092db2a25fc7de13b 100644
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
> @@ -115,6 +122,8 @@ struct imx_rproc {
>  	u32				entry;		/* cpu start address */
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
> +	/* For i.MX System Manager based systems */
> +	u32				flags;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -393,6 +402,30 @@ static int imx_rproc_start(struct rproc *rproc)
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>  		break;
> +	case IMX_RPROC_SM:
> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> +			if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +				return -EACCES;
> +
> +			ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> +			if (ret) {
> +				dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> +					dcfg->lmid, dcfg->cpuid, ret);
> +			}
> +
> +			ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
> +			if (ret)
> +				dev_err(dev, "Failed to boot lmm(%d): %d\n", ret, dcfg->lmid);
> +		} else {
> +			ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
> +			if (ret) {
> +				dev_err(dev, "Failed to set reset vector cpuid(%u): %d\n",
> +					dcfg->cpuid, ret);
> +			}
> +
> +			ret = scmi_imx_cpu_start(dcfg->cpuid, true);
> +		}
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -435,6 +468,16 @@ static int imx_rproc_stop(struct rproc *rproc)
>  	case IMX_RPROC_SCU_API:
>  		ret = imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>  		break;
> +	case IMX_RPROC_SM:
> +		if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP) {
> +			if (priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL)
> +				ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +			else
> +				ret = -EACCES;
> +		} else {
> +			ret = scmi_imx_cpu_start(dcfg->cpuid, false);
> +		}
> +		break;
>  	default:
>  		return -EOPNOTSUPP;
>  	}
> @@ -549,9 +592,11 @@ static int imx_rproc_prepare(struct rproc *rproc)
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
> @@ -592,6 +637,38 @@ static int imx_rproc_prepare(struct rproc *rproc)
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
> +		ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +		if (ret == 0) {
> +			dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;

This is set all the time imx_rproc_prepare() is called - isn't there a way to
set it once at initialisation time?

> +		} else if (ret == -EACCES) {
> +			dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> +			/*
> +			 * If remote cores boots up in detached mode, continue;
> +			 * else linux has no permission, return -EACCES.
> +			 */
> +			if (priv->rproc->state != RPROC_DETACHED)
> +				return -EACCES;
> +		} else if (ret) {
> +			dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
> +			return ret;
> +		}
> +
> +		break;
> +	default:
> +		break;
> +	};
> +

Please put this in a function and get rid of the switch{}.

>  	return  0;
>  }
>  
> @@ -911,13 +988,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
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
> +		/*
> +		 * Check whether remote processor is in same Logical Machine as Linux.
> +		 * If no, need use Logical Machine API to manage remote processor, and
> +		 * set IMX_RPROC_FLAGS_SM_LMM_OP.
> +		 * If yes, use CPU protocol API to manage remote processor.
> +		 */
> +		if (dcfg->lmid != info.lmid) {
> +			priv->flags |= IMX_RPROC_FLAGS_SM_LMM_OP;
> +			dev_info(dev, "Using LMM Protocol OPS\n");
> +		} else {
> +			dev_info(dev, "Using CPU Protocol OPS\n");
> +		}
> +
> +		scmi_imx_cpu_started(dcfg->cpuid, &started);

Function scmi_imx_cpu_started() returns a value that is not taken into account.

> +		if (started)
> +			priv->rproc->state = RPROC_DETACHED;
> +
> +		return 0;
>  	case IMX_RPROC_NONE:
>  		priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> @@ -1029,8 +1134,12 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
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
> index cfd38d37e1467d1d9e6f89be146c0b53262b92a0..6fe8d975ed302967f27b7a4319a899e6f0822976 100644
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
> @@ -42,6 +44,9 @@ struct imx_rproc_dcfg {
>  	size_t				att_size;
>  	enum imx_rproc_method		method;
>  	u32				flags;
> +	/* For System Manager(SM) based SoCs, the IDs are from SM firmware */
> +	u32				cpuid;
> +	u32				lmid;
>  };
>  
>  #endif /* _IMX_RPROC_H */
> 
> -- 
> 2.37.1
> 

