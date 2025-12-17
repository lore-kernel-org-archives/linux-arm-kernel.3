Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1729D66BBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 23:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnvJD5vnTj/iz4qjBfnZiFYyD/tC1WL5vWTNfDJr3Pg=; b=lfnsXA2JEuoKTzzlNAOG8rqw8X
	b3iuxKizcU2E34p3qvr2NOk1nFU27HiGDlFsdJcPHAnCpRFhDWYuMrLZV3B1uUfYCKLyo5mremO8t
	9Xeyq1AYb3DT9OlxA5XlgIgs25763FR8bQ1S8QgEGux+6w18XzL3ycLwYb4mK1DHWyZXRXE6KtK7C
	61/MpvdMyWDhpvr5HEL4xv8JV6JkiieOyYacMYyYM5tSIgnTHli1iw0AP9nByrD6NpS/pXOYosa7f
	5YHRNe4/TFI9Ypgz5dyGHbOwQecjDqpYKQNfBJ9vmHTz9WhM2znUuLNoRCiNNaOMWiE/AMcC7kDmf
	JaAv5pzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0nX-00000007WUp-2gxE;
	Wed, 17 Dec 2025 23:19:11 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW0nU-00000007WUS-3iZ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 23:19:10 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a0b4320665so362365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 15:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766013547; x=1766618347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fnvJD5vnTj/iz4qjBfnZiFYyD/tC1WL5vWTNfDJr3Pg=;
        b=olv6m5KsNDcM5skM7XFShhXvSDvexX3AEIYqCIObceJ7ZnlWL4MTfdK0SHimNahorF
         AYwGz/BJoqt+cdD2Y4mQi/VfkyvdD5VKKL5b6F6fyj4ITTqrTy7ogbP4mm4sxAh7Nf3a
         QVw0Gb+oSHKqLNTcpIM1CViK2fejQNdnUl1Snc9tksJ5x+TwV9CNyaVORpRZR6PE0pfg
         FuFyKv9dQMOy3cuANyCq9pSpprAzR9xZhCzLcQPzoE6DDKXjeT2gArR9I0rymBBCxl2j
         GB2CY2Vj/puwW5akqylKmNigZQbq0ZFG/FA15dS1wxgSJf9GJgAFBy1ENSRoNQdRUFQw
         hiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766013547; x=1766618347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnvJD5vnTj/iz4qjBfnZiFYyD/tC1WL5vWTNfDJr3Pg=;
        b=U8Pl2NVfyh+yuniajW4K5n9PLHSctcjc+GtUbe9ck7FEEkvPQzTu7iN7paHigbb7qh
         9+jzyGCuTkpEH6Q3omTcDf6/L3Pzaq0xlN5Vmw8XQXbH2KWI9GLy5NUoIXwq4LmR09qW
         lMvyxlh8aZnM2XOJ5r4UsVQPTleOuTw6xnFsZS8owu94h1VwHNgylFPsFoLbwKb+zK59
         tTg1qn/MSW0MG0ZrnINrXH6OxG3OBHaDajfZFoZg1T2MfllLJuqlyGI7mKWGcvOAP0kH
         vNgd8dRVR88wcRy+QnzlZkoTnj50/Ixg1FULfIYADJ42t+z/pnZPYQSznGtkRN9A29Ua
         ddlA==
X-Forwarded-Encrypted: i=1; AJvYcCWqV9q7kok2DVk+waDVuEfLCKPN3Pz31eDOkNrawI/L1yquABG+1iIqTK5doh7HLBgnZ2eYq8dNBTjbXmB5//0s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8+pDv16Nms8DNlKtc6uR2HyCTLlLS24O5E05qKvB4wi4FzQxl
	i0OxztvHtY/rbOkVts6nG8M024EInwgDQF8nL3OkFRvVezkVbrqtd6GItaq7lz2eyi4=
X-Gm-Gg: AY/fxX71opTl3K3Pc4rZZIG8dJQ1zO5npxyO4rv9nnD4YtpLJL1QckuAUK8885cMWoL
	xvJRXjpe7S6IRf82xwKjby4XqVfFgd3tjyUAlePlrECkay743Whdnhquyp6Df2aTlXWQbiP0E/n
	HxChguVzFHIrtJ6cSdXlv06w5rQkjTfxpQpKGBUVeE7w62bcTP28R6Vfmy5FDD4TVuiATch3MkT
	Bp8eFLgOjfgx+LpHiusfnym0j50OYjXKI1hTbtQWyFSSqaH1B67PpRoV3b7GsA5G6NOv0v4jdvR
	ib+JACF5QHY7PhbmKh2XxI995BVyYV02iuUc+iKn6FLTnYGPABcbStfE1h/nBD4IMDqK6bX33iA
	KwWtuY5cTd1VEgFcXVcF7zoRkVUWJhFKFxi6jyOpRg6jdANmF9MO1CAdJ+biaq30dy+nwBC1IL0
	l82+FzFa3Y1BITaf5f28DX8bg=
X-Google-Smtp-Source: AGHT+IFGDqxMNPRy4HzlHPhca7EFo7g467xFIgnEfyyXQR5wehGNGfMsyhEWYaEwCFxwgFNc1WWorA==
X-Received: by 2002:a17:902:d4c8:b0:2a0:b4f6:5595 with SMTP id d9443c01a7336-2a0b4f65742mr126278535ad.50.1766013547181;
        Wed, 17 Dec 2025 15:19:07 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cfb9:c35:9f28:8222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2cef1bf32sm4528385ad.0.2025.12.17.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 15:19:06 -0800 (PST)
Date: Wed, 17 Dec 2025 16:19:04 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 4/5] remoteproc: imx_rproc: Add support for System
 Manager API
Message-ID: <aUM6aGbSH9ICOL5f@p14s>
References: <20251216-imx95-rproc-2025-12-15-v4-0-bf1064ea8daf@nxp.com>
 <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216-imx95-rproc-2025-12-15-v4-4-bf1064ea8daf@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_151908_955111_540A2128 
X-CRM114-Status: GOOD (  44.22  )
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

On Tue, Dec 16, 2025 at 09:51:02AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 features a Cortex-M33 core, six Cortex-A55 cores, and
> one Cortex-M7 core. The System Control Management Interface(SCMI)
> firmware runs on the M33 core. The i.MX95 SCMI firmware named System
> Manager(SM) includes vendor extension protocols, Logical Machine
> Management(LMM) protocol and CPU protocol and etc.
> 
> Depending on SM configuration, M7 can be used as follows:
>  (1) M7 in a separate Logical Machine (LM) from A55 cores, that Linux
>      can't control
>  (2) M7 in a separate LM from A55 cores that Linux can control using LMM
>      protocol.
>  (3) M7 runs in same Logical Machine as A55 cores, so Linux can control it
>      using CPU protocol
> 
> So extend the driver to using LMM and CPU protocol to manage the M7 core.
>  - Compare linux LM ID(got using scmi_imx_lmm_info) and M7 LM ID(the ID
>    is fixed as 1 in SM firmware if M7 is in a separate LM),
>    if Linux LM ID equals M7 LM ID(linux and M7 in same LM), use CPU
>    protocol to start/stop. Otherwise, use LMM protocol to start/stop.
>    Whether using CPU or LMM protocol to start/stop, the M7 status
>    detection could use CPU protocol to detect started or not. So
>    in imx_rproc_detect_mode, use scmi_imx_cpu_started to check the
>    status of M7.
>  - For above case (1) and (2), Use SCMI_IMX_LMM_POWER_ON to detect whether
>    the M7 LM is under control of A55 LM.
>  - For above case , after using SCMI_IMX_LMM_POWER_ON to check
>    permission, SCMI_IMX_LMM_SHUTDOWN API should be called to shutdown
>    the M7 LM to save power only when M7 LM is going to be started by
>    remoteproc framework. Otherwise bypass SCMI_IMX_LMM_SHUTDOWN API if
>    M7 LM is started before booting Linux.
> 
> Current setup relies on pre-Linux software(U-Boot) to do M7 TCM ECC
> initialization. In future, we could add the support in Linux to decouple
> U-Boot and Linux.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/Kconfig     |   2 +
>  drivers/remoteproc/imx_rproc.c | 193 +++++++++++++++++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.h |   3 +
>  3 files changed, 198 insertions(+)
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
> index 35585235c683e6327c3e6db65d5d33253ffba327..55e555f2b5dd63e7d82996437e792a8152c91521 100644
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
> @@ -92,8 +94,12 @@ struct imx_rproc_mem {
>  #define ATT_CORE_MASK   0xffff
>  #define ATT_CORE(I)     BIT((I))
>  
> +/* Linux has permission to handle the Logical Machine of remote cores */
> +#define IMX_RPROC_FLAGS_SM_LMM_AVAIL	BIT(0)
> +
>  static int imx_rproc_xtr_mbox_init(struct rproc *rproc, bool tx_block);
>  static void imx_rproc_free_mbox(void *data);
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc);
>  
>  struct imx_rproc {
>  	struct device			*dev;
> @@ -117,6 +123,11 @@ struct imx_rproc {
>  	u32				core_index;
>  	struct dev_pm_domain_list	*pd_list;
>  	const struct imx_rproc_plat_ops	*ops;
> +	/*
> +	 * For i.MX System Manager based systems
> +	 * BIT 0: IMX_RPROC_FLAGS_SM_LMM_AVAIL(RPROC LM is under Linux control )
> +	 */
> +	u32				flags;
>  };
>  
>  static const struct imx_rproc_att imx_rproc_att_imx93[] = {
> @@ -313,6 +324,44 @@ static int imx_rproc_scu_api_start(struct rproc *rproc)
>  	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, true, priv->entry);
>  }
>  
> +static int imx_rproc_sm_cpu_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_reset_vector_set(dcfg->cpuid, 0, true, false, false);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to set reset vector cpuid(%u): %d\n", dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	return scmi_imx_cpu_start(dcfg->cpuid, true);
> +}
> +
> +static int imx_rproc_sm_lmm_start(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	ret = scmi_imx_lmm_reset_vector_set(dcfg->lmid, dcfg->cpuid, 0, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to set reset vector lmid(%u), cpuid(%u): %d\n",
> +			dcfg->lmid, dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_BOOT, 0);
> +	if (ret) {
> +		dev_err(dev, "Failed to boot lmm(%d): %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_start(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -369,6 +418,25 @@ static int imx_rproc_scu_api_stop(struct rproc *rproc)
>  	return imx_sc_pm_cpu_start(priv->ipc_handle, priv->rsrc_id, false, priv->entry);
>  }
>  
> +static int imx_rproc_sm_cpu_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	return scmi_imx_cpu_start(dcfg->cpuid, false);
> +}
> +
> +static int imx_rproc_sm_lmm_stop(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +		return -EACCES;
> +
> +	return scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +}
> +
>  static int imx_rproc_stop(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -485,6 +553,33 @@ static int imx_rproc_mem_release(struct rproc *rproc,
>  	return 0;
>  }
>  
> +static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	int ret;
> +
> +	/*
> +	 * IMX_RPROC_FLAGS_SM_LMM_AVAIL not set indicates Linux is not able
> +	 * to start/stop rproc LM, then if rproc is not in detached state,
> +	 * prepare should fail. If in detached state, this is in rproc_attach()
> +	 * path.
> +	 */
> +	if (!(priv->flags & IMX_RPROC_FLAGS_SM_LMM_AVAIL))
> +		return rproc->state == RPROC_DETACHED ? 0 : -EACCES;
> +
> +	/* Power on the Logical Machine to make sure TCM is available. */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to power on lmm(%d): %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	dev_info(priv->dev, "lmm(%d) powered on by Linux\n", dcfg->lmid);
> +
> +	return 0;
> +}
> +
>  static int imx_rproc_prepare(struct rproc *rproc)
>  {
>  	struct imx_rproc *priv = rproc->priv;
> @@ -980,6 +1075,104 @@ static int imx_rproc_scu_api_detect_mode(struct rproc *rproc)
>  	return 0;
>  }
>  
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_lmm = {
> +	.detect_mode	= imx_rproc_sm_detect_mode,
> +	.prepare	= imx_rproc_sm_lmm_prepare,
> +	.start		= imx_rproc_sm_lmm_start,
> +	.stop		= imx_rproc_sm_lmm_stop,
> +};
> +
> +static const struct imx_rproc_plat_ops imx_rproc_ops_sm_cpu = {
> +	.detect_mode	= imx_rproc_sm_detect_mode,
> +	.start		= imx_rproc_sm_cpu_start,
> +	.stop		= imx_rproc_sm_cpu_stop,
> +};

Why are these not at the bottom of the file with the rest of the
imx_rproc_plat_ops?  That way you wouldn't have to declare
imx_rproc_sm_detect_mode() at the top of the file...

> +
> +static int imx_rproc_sm_lmm_check(struct rproc *rproc, bool started)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	int ret;
> +
> +	/*
> +	 * Use power on to do permission check. If rproc is in different LM,
> +	 * and linux has permission to handle the LM, set IMX_RPROC_FLAGS_SM_LMM_AVAIL.
> +	 */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_POWER_ON, 0);
> +	if (ret) {
> +		if (ret == -EACCES) {
> +			/*
> +			 * rproc LM is booted before Linux and not under Linux Control, so only
> +			 * do IPC between RPROC and Linux, not return failure
> +			 */
> +			dev_info(dev, "lmm(%d) not under Linux Control\n", dcfg->lmid);
> +			return 0;
> +		}
> +
> +		dev_err(dev, "power on lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}
> +
> +	priv->flags |= IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +
> +	/* rproc was started before boot Linux and under control of Linux, directly return */
> +	if (started)
> +		return 0;
> +
> +	/* else shutdown the LM to save power */
> +	ret = scmi_imx_lmm_operation(dcfg->lmid, SCMI_IMX_LMM_SHUTDOWN, 0);
> +	if (ret) {
> +		priv->flags &= ~IMX_RPROC_FLAGS_SM_LMM_AVAIL;
> +		dev_err(dev, "shutdown lmm(%d) failed: %d\n", dcfg->lmid, ret);
> +		return ret;
> +	}

If you move this call to scmi_imx_lmm_operation() (and the error check) before
setting priv->flags, you won't have to reset it in the error path.

Let's see how the next revision goes...

Thanks,
Mathieu

> +
> +	return 0;
> +}
> +
> +static int imx_rproc_sm_detect_mode(struct rproc *rproc)
> +{
> +	struct imx_rproc *priv = rproc->priv;
> +	const struct imx_rproc_dcfg *dcfg = priv->dcfg;
> +	struct device *dev = priv->dev;
> +	struct scmi_imx_lmm_info info;
> +	bool started = false;
> +	int ret;
> +
> +	ret = scmi_imx_cpu_started(dcfg->cpuid, &started);
> +	if (ret) {
> +		dev_err(dev, "Failed to detect cpu(%d) status: %d\n", dcfg->cpuid, ret);
> +		return ret;
> +	}
> +
> +	if (started)
> +		priv->rproc->state = RPROC_DETACHED;
> +
> +	/* Get current Linux Logical Machine ID */
> +	ret = scmi_imx_lmm_info(LMM_ID_DISCOVER, &info);
> +	if (ret) {
> +		dev_err(dev, "Failed to get current LMM ID err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Check whether rproc is in the same LM as host core(running Linux)
> +	 * If yes, use CPU protocol API to manage rproc.
> +	 * If no, use Logical Machine API to manage rproc.
> +	 */
> +	if (dcfg->lmid == info.lmid) {
> +		priv->ops = &imx_rproc_ops_sm_cpu;
> +		dev_info(dev, "Using CPU Protocol OPS\n");
> +		return 0;
> +	}
> +
> +	priv->ops = &imx_rproc_ops_sm_lmm;
> +	dev_info(dev, "Using LMM Protocol OPS\n");
> +
> +	return imx_rproc_sm_lmm_check(rproc, started);
> +}
> +
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
>  {
>  	/*
> diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
> index 37417568a0ade2ae4d6a4e3d0f139ea52b185254..d37e6f90548cec727b4aeb874680b42af85bdbb4 100644
> --- a/drivers/remoteproc/imx_rproc.h
> +++ b/drivers/remoteproc/imx_rproc.h
> @@ -38,6 +38,9 @@ struct imx_rproc_dcfg {
>  	size_t				att_size;
>  	u32				flags;
>  	const struct imx_rproc_plat_ops	*ops;
> +	/* For System Manager(SM) based SoCs */
> +	u32				cpuid; /* ID of the remote core */
> +	u32				lmid;  /* ID of the Logcial Machine */
>  };
>  
>  #endif /* _IMX_RPROC_H */
> 
> -- 
> 2.37.1
> 

