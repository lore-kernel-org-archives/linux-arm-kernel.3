Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F158CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wrhxNTSwi0ClCO0RWziewCysYhWs5EYzSjPknexPbAg=; b=lDIrt5bRcFCdqtgV7PZJl5nogA
	mXVHiZ3JN/gl6eEzsSSGBrYswxa03oRvQVlXRz1Hb7Y7v3K0ClgS4nHoR2EYsEcljgqOb4lqYca0c
	7mtZATlI25kELn2wgNqzjtCmNvjVJiPQA2XdcvKPyfEmJNsp0riwpYg0/RT9hQoggJH54oBdsEiE9
	sQwJA4HzjH1AZByEjTbDqZU8s47BjgiHR/oNAq5xw+04cokCHwJwMKcxD5NIpOQgLLDJpntstaNEw
	+pxW49DhxVR+VS+AoFzSa93LlOEGVUwbzFY2DRt7QgdNqoySQ6pC9+awpX25oy+AhBC03XSgzT6Z1
	Qtup9TsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoR7h-0000000BJ6A-06wQ;
	Tue, 19 Aug 2025 18:31:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOjx-0000000AxHc-02KE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 15:59:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04D1B152B;
	Tue, 19 Aug 2025 08:59:04 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E95F3F63F;
	Tue, 19 Aug 2025 08:59:10 -0700 (PDT)
Date: Tue, 19 Aug 2025 16:59:08 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] firmware: arm_scmi: imx: Support getting cfg info
 of MISC protocol
Message-ID: <aKSfTL4fCaDsoHQX@pluto>
References: <20250710-sm-misc-api-v1-v2-0-c3e953e34be6@nxp.com>
 <20250710-sm-misc-api-v1-v2-3-c3e953e34be6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-sm-misc-api-v1-v2-3-c3e953e34be6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_085913_089285_36505704 
X-CRM114-Status: GOOD (  16.69  )
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

On Thu, Jul 10, 2025 at 04:33:28PM +0800, Peng Fan wrote:
> MISC protocol supports getting the System Manager(SM) mode selection
> and configuration name. Retrieve the information from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index b301f09ab6cc65d286edb8819031d7f4c02e8272..dc6ea67255b8b1ac95dfb552fa88b65044de8d3f 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> +	SCMI_IMX_MISC_CFG_INFO = 0xC,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
>  
> @@ -75,6 +76,12 @@ struct scmi_imx_misc_buildinfo_out {
>  	u8 buildtime[MISC_MAX_BUILDTIME];
>  };
>  
> +struct scmi_imx_misc_cfg_info_out {
> +	__le32 msel;
> +#define MISC_MAX_CFGNAME	16
> +	u8 cfgname[MISC_MAX_CFGNAME];
> +};
> +
>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_info *mi)
>  {
> @@ -310,6 +317,30 @@ static int scmi_imx_misc_discover_build_info(const struct scmi_protocol_handle *
>  	return ret;
>  }
>  
> +static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph)
> +{
> +	struct scmi_imx_misc_cfg_info_out *out;
> +	char name[MISC_MAX_CFGNAME] = {'\0'};

Same considerations here...

> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_CFG_INFO, 0, sizeof(*out), &t);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		strscpy(name, out->cfgname, MISC_MAX_CFGNAME);
> +		dev_info(ph->dev, "SM Config\t= %s, mSel = %u\n",
> +			 name, le32_to_cpu(out->msel));

...other than this...LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

