Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 676D9CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnUguYsPU/clLRFYfyLCtFaxL7BUTnwrUbOEBmMllkw=; b=yjmXeRkOOjqN4D5H7R0BGMpZ6z
	qjG45wmotufOpmchNDiBpLCaMvP4eaBqH2jYzIj9p5rYqiMiYSy+Hi4kXBgMGeS9eSjGO8syQ5uqp
	jW4bIPrC5Ti8eLBQZvp0B2p2ZwjVUiH85Y+FUHV95Z/LtwtG7gAmXWP8GfUFzT8oowhSdF2A3D6DQ
	xJ1mAJlunR/yQjX/xC6HMN4/FCAZPnuv5DDQd1SQ566D0K3/E8xSSWYu3Sm0W/kN2YrwSuXsMtZUh
	wfjoMf0ACvs1Vqk6ddqD+eVkel3VM3EP+b00hfpbGJyXOF2HUhJtNCe3qc6JyoQp0jw3gWKN/3CCU
	s9b/9v4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9jy-000000078kT-1Lkj;
	Sat, 30 Aug 2025 00:46:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1WQ-00000006KZR-3FZR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 16:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JnUguYsPU/clLRFYfyLCtFaxL7BUTnwrUbOEBmMllkw=; b=g3X1A+jVni7qMFH986TG3shItk
	WDxhdJVceasb1iwGrkjgH0MyMSz8M+n0FIlXM06qORyNYLkgMNXmbGeGiBixDwSVfd381UpMG2P8N
	q5wNlyeUvQsOM3X+SGI/KCFWtJMmReHQyIb11Hgl+Hn69iLQfedJ6GgRz+Q2KKZjWeDI0FYb+2DB7
	VNUzci1FVQNbdbmMETi9cDHPEQNr1k583/ECrcIu0q7IKpzg7YBzskvw98BcCjFQcNi7Ww6GawnXo
	9ic9lk7ubUz7fTUENc4Pf3mMbHUpwyEib726vhvMaCBS1KV0I/LYbaTfzzLH4rESduSJUoy0k9vnY
	PVv7rXWg==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us1WN-00000003Cwj-2d4l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 16:00:13 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7720b23a49fso2516510b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 09:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756483209; x=1757088009; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JnUguYsPU/clLRFYfyLCtFaxL7BUTnwrUbOEBmMllkw=;
        b=Rxj+SGxSH74F9exF1jJCag+DxuwEkrugqAU7/5bkhTnUrge8LFLt6hmFxU20yJd94y
         I7UexL25aMG1AT2ZN491HV4J+amSsbIdLHSVtBYEQ4tsROnh6VkJkGzK+sdktxsX/12T
         Ma8wAAv8r5ScljGt7T/SF98rPVaIc/V8DZKra38CitJ6Zd+OQBvBX1P+ImJLJhYfUDyt
         n6+W/2lvfkgYze7CZhnK4fL3QJqyTsYYqWUau1qG0G9bsJtyX5rNnZj2AIIf3sA/g98l
         4WpYufkcrtDRTXlgHbJfbQyzWbhQvu8SYlmMCZHekuCf2hAzgX1NDU0zZrupcgEF+ScY
         3x+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756483209; x=1757088009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnUguYsPU/clLRFYfyLCtFaxL7BUTnwrUbOEBmMllkw=;
        b=AyrsHjBELJO/1B0Jrin/YjQX4/+SJf7CtpUwndp2rRtf6HgZPigAJDEWMlq9d5+M19
         wt+UV7Fns9O1vPj/+7oiZr90L5Xmv34CE+GMvH5CTtzBuJkeXkPMqtQkTAMT8T30ToBR
         nqsHd0809dovGivSRAiP1waO88h0fg3aQVJp9SdcGDoD37ivNxzog7OK0XuFaCyLlpLU
         wNNU4idHFchPsLgarzzNKfgjV1dFaeKSZwc2UbJU9XZQjpJVU1U4+Ba7igLVsHHMGYuT
         24sTe56mttQfAMr5Ucpa9FeWprZSmBAPPpB8us3FS2mVRLvieoKgY/FCrgK62pA3RYqf
         5E/w==
X-Forwarded-Encrypted: i=1; AJvYcCU3USn2ul2D2szgrvLClsNpUNHImVNDWgR6OphaReUnMgNl7YSSlJpu/uSgHcMtZtGMME5hrthAk1rLB/mHlxD3@lists.infradead.org
X-Gm-Message-State: AOJu0Ywns/Bd3OnYYm0w83gVf1yo4JafY4qMwGow1gnCre/1tYcknitW
	UfrNfaiFaXxUNFkWGaGNSLHjjMuwbtE7rzEBTA7T3G/jGATvrf5/BADqOAh+X9pkm2U=
X-Gm-Gg: ASbGnct2mGizBDcj66n6hn5BoTMncOsyrabE1tH6aYfoNxkyQX/ywiZqwMHKRq+cqU8
	1utqtTJ6ERUotDbIqOqbshs6TaQqW2ZMlYdNE7Jh5Fsz+hFBRKC7ioqUrr3CSanxlZnbPdjhZSK
	NN5ZQJXxGpogGSD+vwxJEd7TwdP/Z+R9OGwJSqCuWpA3RcolWj8XAQo/Veincez8p/6k/mvLPwp
	mc83C02MV+3FaGEhJJ3kvQP7rGoOBcD/Q1IAdw8/JDU5UmmYs2FqFGjatJkDMs87tpIeZVi9Zyc
	PSnmBE0RxTD1pKqndWJioQfkpp/abkfwj4av63nPrIcX+V1UbcwGdynoPLaGreOBdTyEhOVKn+f
	ghf5p7XLSfYAxO/8TEZeNfTIreGxlvkfMHdLXw+xwDFsDKhx6iEv8/MXSNjTfdCbcHxB6J6FZfZ
	HbpLDieiASjgU/mOFoBHd7Y/bLNDZls1W2qz4=
X-Google-Smtp-Source: AGHT+IE0deW5N/05Y6sYjCUfSFpadBfKmTscVPlxU1ZCjmH/10rKotp0bgLMBq4xrzm3mC+bu2wkmg==
X-Received: by 2002:a05:6a00:2286:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-7702faaf0abmr34492786b3a.21.1756483208758;
        Fri, 29 Aug 2025 09:00:08 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c8f8:92f5:116b:3068])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77232248100sm1713276b3a.98.2025.08.29.09.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 09:00:08 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:00:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aLHOhKpAQbVCC76-@p14s>
References: <20250821-imx95-rproc-1-v5-0-e93191dfac51@nxp.com>
 <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-imx95-rproc-1-v5-2-e93191dfac51@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_170011_793243_57178FAF 
X-CRM114-Status: GOOD (  51.34  )
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

On Thu, Aug 21, 2025 at 05:05:05PM +0800, Peng Fan wrote:
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
> Current setup relies on pre-Linux software(U-Boot) to do
> M7 TCM ECC initialization. In future, we could add the support in Linux
> to decouple U-Boot and Linux.
> 
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/Kconfig     |   2 +
>  drivers/remoteproc/imx_rproc.c | 123 ++++++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/imx_rproc.h |   5 ++
>  3 files changed, 127 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..ee54436fea5ad08a9c198ce74d44ce7a9aa206de 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -27,6 +27,8 @@ config IMX_REMOTEPROC
>  	tristate "i.MX remoteproc support"
>  	depends on ARCH_MXC
>  	depends on HAVE_ARM_SMCCC
> +	depends on IMX_SCMI_CPU_DRV || !IMX_SCMI_CPU_DRV
> +	depends on IMX_SCMI_LMM_DRV || !IMX_SCMI_LMM_DRV
>  	select MAILBOX
>  	help
>  	  Say y here to support iMX's remote processors via the remote
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index a6eef0080ca9e46efe60dcb3878b9efdbdc0f08e..151b9ca34bac2dac9df0ed873f493791f2d1466e 100644
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
> @@ -22,6 +23,7 @@
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> +#include <linux/scmi_imx_protocol.h>
>  #include <linux/workqueue.h>
>  
>  #include "imx_rproc.h"
> @@ -92,6 +94,11 @@ struct imx_rproc_mem {
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
> @@ -116,6 +123,8 @@ struct imx_rproc {
>  	u32				entry;		/* cpu start address */
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
> +	/* For i.MX System Manager based systems */
> +	u32				flags;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -394,6 +403,30 @@ static int imx_rproc_start(struct rproc *rproc)
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
> @@ -436,6 +469,16 @@ static int imx_rproc_stop(struct rproc *rproc)
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
> @@ -546,10 +589,48 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>  	return 0;
>  }
>  
> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_OP))
> +		return 0;
> +
> +	/*
> +	 * Power on the Logical Machine to make sure TCM is available.
> +	 * Also serve as permission check. If in different Logical
> +	 * Machine, and linux has permission to handle the Logical
> +	 * Machine, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> +	 */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret == 0) {
> +		dev_info(priv->dev, "lmm(%d) powered on\n", dcfg->lmid);
> +		priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;

Why is setting this flag needed?  The check that is done on it in
imx_rproc_{start|stop} should be done here.  If there is an error then we don't
move forward.

> +	} else if (ret == -EACCES) {
> +		dev_info(priv->dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> +		/*
> +		 * If remote cores boots up in detached mode, continue;
> +		 * else linux has no permission, return -EACCES.
> +		 */
> +		if (priv->rproc->state != RPROC_DETACHED)
> +			return -EACCES;

The comment above scmi_imx_lmm_operation() mentions that calling
scmi_imx_lmm_operation() is done to make sure TCMs are available.  Is there a
point in calling scmi_imx_lmm_operation() if ->state == RPROC_DETACHED?  If not,
can't that check be move to the beginning of imx_rproc_sm_lmm_prepare()?  

> +
> +		/* work in state RPROC_DETACHED */
> +		ret = 0;
> +	} else if (ret) {
> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", ret, dcfg->lmid);
> +	}
> +
> +	return ret;
> +}
> +
>  static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
>  	struct device_node *np = priv->dev->of_node;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
>  	struct of_phandle_iterator it;
>  	struct rproc_mem_entry *mem;
>  	struct reserved_mem *rmem;
> @@ -593,7 +674,10 @@ static int imx_rproc_prepare(struct rproc *rproc)
>  		rproc_add_carveout(rproc, mem);
>  	}
>  
> -	return  0;
> +	if (dcfg->method == IMX_RPROC_SM)
> +		return imx_rproc_sm_lmm_prepare(rproc);
> +
> +	return 0;
>  }
>  
>  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
> @@ -927,13 +1011,41 @@ static int imx_rproc_detect_mode(struct imx_rproc *priv)
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
> +		ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
> +		if (ret || started)
> +			priv->rproc->state = RPROC_DETACHED;

An error should be reported and the initialization process aborted if an error
occurs rather than defaulting to the default mode.  This will lead to additional
error conditions that will have to be handled elsewhere.

Thanks,
Mathieu

> +
> +		return 0;
>  	case IMX_RPROC_NONE:
>  		priv->rproc->state = RPROC_DETACHED;
>  		return 0;
> @@ -1045,8 +1157,13 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
>  	struct device *dev = priv->dev;
>  	int ret;
>  
> -	/* Remote core is not under control of Linux or it is managed by SCU API */
> -	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API)
> +	/*
> +	 * Remote core is not under control of Linux or it is managed by SCU API.
> +	 * System Manager(SM) firmware automatically configures clock, so also
> +	 * bypass the clk settings for IMX_RPROC_SM.
> +	 */
> +	if (dcfg->method == IMX_RPROC_NONE || dcfg->method == IMX_RPROC_SCU_API ||
> +	    dcfg->method == IMX_RPROC_SM)
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

