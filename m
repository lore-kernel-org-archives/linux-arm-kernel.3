Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63631E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt0liYg2gG+UXgzLOO4o5mtw9/dm8j9F1XINIhzzTbU=; b=OnfIVgdPETss8u/P0uA3GIAbCl
	x/s7IxgiqGCTi0vuQeSzIj0amXKnuwagbpmy69vJlEnKiZF8wz8si90EtmQX+ZZxWGbmBdyIkVPoC
	5o5dyR5OvF4QU7w6WbdczfLGrEg4B4CfI0YizMrLJ9YQt4A8BB3cnklF5thZqDJk0cQOfF2T1WfxA
	H9PsLaWoOXfuIV2dtmRskGrqUYcCwf5onIwN68msC1VtX5/TUbJDHmQhZGBb+rt879SoxVxyLZqPk
	4AlMWf4RO5xbjd6Z0MEGGjKxmmG+WEnFPEMH4yuPfgsQh36pPfT1tzUS+baz2VSPIpoUiqrqE6xzb
	Qrsa1j/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7yk-0000000FKRC-3cp3;
	Thu, 05 Dec 2024 09:16:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7xk-0000000FKIH-01Qr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:15:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7D5435C721F;
	Thu,  5 Dec 2024 09:15:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFF6C4CEDE;
	Thu,  5 Dec 2024 09:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733390155;
	bh=QxsS1zt4cKu7VPdlxLyUmcsdHRV9xaGmHvKPAtuRewE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcG1+ZfMM2JuVSoAttk82yF39pLUmtI9CaYcpQTWxHQ2B2HWn3gRgqyO4Jt90j9lW
	 5QAmvD57cTKI8UkZOW/AzPfN99Cp//+jwyeedvZt9c4+2Z/JZ1FWVw9In5KQHqvzvF
	 LNink6QIpfLwPlXngozSNm1p0PR+F1tc4EvAkTVTHMCE1yrbalksb0iJeU/9Rx5Lxv
	 fHgxvay9nfWig2wQUZCT5qVZP9nloU85K1toMzTi+fs7bCx4xUJXBLtkN/v3Pwrty4
	 nkdWbJktWh41loqOgqRjp/Kmo0KFAGrQRTi41kUNorvrSOnvpfE5LZAMuCcty6hDxu
	 LMYlPB/Sqe4nQ==
Date: Thu, 5 Dec 2024 10:15:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vabhav Sharma <vabhav.sharma@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, frank.li@nxp.com, 
	pankaj.gupta@nxp.com, daniel.baluta@nxp.com, silvano.dininno@nxp.com, V.Sethi@nxp.com, 
	meenakshi.aggarwal@nxp.com, Franck LENORMAND <franck.lenormand@nxp.com>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Horia Geanta <horia.geanta@nxp.com>
Subject: Re: [PATCH v4 3/4] firmware: imx: Add SC APIs required for secvio
 module
Message-ID: <bdwn6slol2pnpf25xmcyx6rro5jaiadpob5fvl45ngtru3bea3@pucfhsmsxrct>
References: <20241205-secvio-v4-0-5c37cdc39573@nxp.com>
 <20241205-secvio-v4-3-5c37cdc39573@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-secvio-v4-3-5c37cdc39573@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_011556_130834_94483B0C 
X-CRM114-Status: GOOD (  22.65  )
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

On Thu, Dec 05, 2024 at 05:56:34AM +0100, Vabhav Sharma wrote:
> The Security Violation module requires below System Controller
> Security controller API to interact with SNVS block via SCFW
>     - imx_sc_seco_build_info
>     - imx_sc_seco_secvio_enable
>     - imx_sc_seco_secvio_config
>     - imx_sc_seco_secvio_dgo_config
> 
> Signed-off-by: Franck LENORMAND <franck.lenormand@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> Reviewed-by: Horia Geanta<horia.geanta@nxp.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Vabhav Sharma <vabhav.sharma@nxp.com>
> ---
>  drivers/firmware/imx/Makefile         |   2 +-
>  drivers/firmware/imx/imx-scu.c        |   4 +-
>  drivers/firmware/imx/seco.c           | 216 ++++++++++++++++++++++++++++++++++
>  include/linux/firmware/imx/ipc.h      |   1 +
>  include/linux/firmware/imx/sci.h      |   4 +
>  include/linux/firmware/imx/svc/seco.h |  69 +++++++++++
>  6 files changed, 294 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
> index 8d046c341be8..7aaecf570c56 100644
> --- a/drivers/firmware/imx/Makefile
> +++ b/drivers/firmware/imx/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_IMX_DSP)		+= imx-dsp.o
> -obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
> +obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o seco.o
>  obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
> diff --git a/drivers/firmware/imx/imx-scu.c b/drivers/firmware/imx/imx-scu.c
> index 1dd4362ef9a3..c96dc73689a8 100644
> --- a/drivers/firmware/imx/imx-scu.c
> +++ b/drivers/firmware/imx/imx-scu.c
> @@ -242,9 +242,11 @@ int imx_scu_call_rpc(struct imx_sc_ipc *sc_ipc, void *msg, bool have_resp)
>  		 * APIs are defined as void function in SCU firmware, so they
>  		 * should be treated as return success always.
>  		 */
> -		if ((saved_svc == IMX_SC_RPC_SVC_MISC) &&
> +		if (((saved_svc == IMX_SC_RPC_SVC_MISC) &&
>  			(saved_func == IMX_SC_MISC_FUNC_UNIQUE_ID ||
>  			 saved_func == IMX_SC_MISC_FUNC_GET_BUTTON_STATUS))
> +			 || (saved_svc == IMX_SC_RPC_SVC_SECO &&
> +			 saved_func == IMX_SC_SECO_FUNC_BUILD_INFO))
>  			ret = 0;
>  	}
>  
> diff --git a/drivers/firmware/imx/seco.c b/drivers/firmware/imx/seco.c
> new file mode 100644
> index 000000000000..2d6bf301ac87
> --- /dev/null
> +++ b/drivers/firmware/imx/seco.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2020, 2024 NXP
> + *
> + * File containing client-side RPC functions for the SECO service. These
> + * function are ported to clients that communicate to the SC.
> + */
> +
> +#include <linux/firmware/imx/sci.h>
> +
> +struct imx_sc_msg_seco_get_build_id {
> +	struct imx_sc_rpc_msg hdr;
> +	u32 version;
> +	u32 commit;
> +} __packed __aligned(4);
> +
> +int imx_sc_seco_build_info(struct imx_sc_ipc *ipc, uint32_t *version,
> +			   uint32_t *commit)
> +{
> +	struct imx_sc_msg_seco_get_build_id msg;
> +	struct imx_sc_rpc_msg *hdr = &msg.hdr;
> +	int ret;
> +
> +	hdr->ver = IMX_SC_RPC_VERSION;
> +	hdr->svc = IMX_SC_RPC_SVC_SECO;
> +	hdr->func = IMX_SC_SECO_FUNC_BUILD_INFO;
> +	hdr->size = 1;
> +
> +	ret = imx_scu_call_rpc(ipc, &msg, true);
> +	if (ret)
> +		return ret;
> +
> +	if (version)
> +		*version = msg.version;
> +	if (commit)
> +		*commit = msg.commit;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(imx_sc_seco_build_info);


NAK for all your exports: no users. Stop adding exports for your
downstream drivers.

Best regards,
Krzysztof


