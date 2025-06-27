Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F51DC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=knmKiJ2Fe6WbF6jTmXZzAzb5J0Bt7YbcTZgiJhis2SM=; b=G/nW+FiNHqbNCsxUWUY4F7gcKK
	ESTgj57rW0Abl/VjS5ATxAU95vw4Sw50J9Mwgch4SqG+J9RBSWfS86a6HIZkfyBuXqnGZV6KmKGpQ
	t5LRHVqRjrjgzxafdTj+g9Vo4j6z1Qp2lcfUAFaoft5IdC7UJvh6tE+cmq4veuDBfZldFiBqKd4eH
	sdwafHo+qXrthg8aIbYExqygwLs8xDt51/y2Kftomemg6SADjaBzIGaI6RPbj+VTnW2sbB/M7YNub
	jyv9fXgDTyN2G2cVAy5vTTaRiP4Zz+E++qvBRHA8DL729JMf1JzWN8sO2eY3dsFkasiPUDynGuAz4
	T4s1D5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVA9U-0000000EvSe-1QqB;
	Fri, 27 Jun 2025 14:34:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9Oq-0000000Eof4-3zjk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:45:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 206801A00;
	Fri, 27 Jun 2025 06:45:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6353A3F66E;
	Fri, 27 Jun 2025 06:45:50 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:45:47 +0100
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
Subject: Re: [PATCH 6/7] firmware: arm_scmi: imx: Support getting board info
 of MISC protocol
Message-ID: <aF6gi9ejloRphvgI@pluto>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-6-2b99481fe825@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-6-2b99481fe825@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_064553_067851_7F7AFF18 
X-CRM114-Status: GOOD (  19.17  )
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

On Fri, Jun 27, 2025 at 02:03:49PM +0800, Peng Fan wrote:
> MISC protocol supports getting board information. Add the API for user
> to retrieve the information from SM
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  |  5 ++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 1a6d75357b76ce6bb7d06461999b368c27f1fa43..35c63e7cb189475807ed1e6723dbcb61ab66800a 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -29,6 +29,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_SI_INFO = 0xB,
>  	SCMI_IMX_MISC_CFG_INFO = 0xC,
>  	SCMI_IMX_MISC_SYSLOG = 0xD,
> +	SCMI_IMX_MISC_BOARD_INFO = 0xE,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
>  
> @@ -76,6 +77,11 @@ struct scmi_imx_misc_buildinfo_out {
>  	u8 buildtime[MISC_MAX_BUILDTIME];
>  };
>  
> +struct scmi_imx_misc_board_info_out {
> +	__le32 attributes;
> +	u8 brdname[MISC_MAX_BRDNAME];
> +};
> +
>  struct scmi_imx_misc_cfg_info_out {
>  	__le32 msel;
>  	u8 cfgname[MISC_MAX_CFGNAME];
> @@ -334,6 +340,29 @@ static int scmi_imx_discover_build_info(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static int scmi_imx_misc_board_info(const struct scmi_protocol_handle *ph,
> +				    struct scmi_imx_misc_system_info *info)
> +{
> +	struct scmi_imx_misc_board_info_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_BOARD_INFO, 0, sizeof(*out), &t);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		info->brd_attributes = le32_to_cpu(out->attributes);
> +		strscpy(info->brdname, out->brdname, MISC_MAX_BRDNAME);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph,
>  				  struct scmi_imx_misc_system_info *info)
>  {
> @@ -446,6 +475,7 @@ static int scmi_imx_misc_syslog(const struct scmi_protocol_handle *ph, u16 size,
>  }
>  
>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
> +	.misc_board_info = scmi_imx_misc_board_info,
>  	.misc_cfg_info = scmi_imx_misc_cfg_info,
>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
>  	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
> index ff34d974046aa982fa9f5d46fc673412e01a532d..4950cd6f50aa7b3038bd519a7287e805f70e1cf5 100644
> --- a/include/linux/scmi_imx_protocol.h
> +++ b/include/linux/scmi_imx_protocol.h
> @@ -56,6 +56,7 @@ struct scmi_imx_misc_ctrl_notify_report {
>  #define MISC_MAX_BUILDTIME	16
>  #define MISC_MAX_CFGNAME	16
>  #define MISC_MAX_SINAME		16
> +#define MISC_MAX_BRDNAME	16
>  
>  struct scmi_imx_misc_system_info {
>  	u32 buildnum;
> @@ -69,6 +70,8 @@ struct scmi_imx_misc_system_info {
>  	u32 sirev;
>  	u32 partnum;
>  	u8 siname[MISC_MAX_SINAME];
> +	u32 brd_attributes;
> +	u8 brdname[MISC_MAX_BRDNAME];
>  };

Same comment here as before...

>  
>  struct scmi_imx_misc_sys_sleep_rec {
> @@ -89,6 +92,8 @@ struct scmi_imx_misc_syslog {
>  };
>  
>  struct scmi_imx_misc_proto_ops {
> +	int (*misc_board_info)(const struct scmi_protocol_handle *ph,
> +			       struct scmi_imx_misc_system_info *info);
>  	int (*misc_cfg_info)(const struct scmi_protocol_handle *ph,
>  			     struct scmi_imx_misc_system_info *info);
>  	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
>

Anyway, LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
 
Thanks,
Cristian

