Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591F1C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THLLPN+CgZgHkESs6PW2/8zGP6fVqVWKMmuu7obeKko=; b=h/nMd5aubvd6qjUIL5/oXajBc1
	RnEXNkngek+/5xexcP0g+SPWx8Wm1GTi2PZowdXHoZ2hw0fXKuUznbw8MAoiQyOwCSXLGogS0HxRY
	SGvlJpLzyQHYgIpYkX9fD95PdIHXP4H9mjrWHEwP5qMiDtFD+vy0miCqylVrmefcu9g5sdb9nZI3Y
	GsZzET8xL/ggAD/nWPfJo5CYL7XK1FXKR9ZIOSHb9yFkHyKtN4fiIe0BoAjaETWA0TJxCaKa0H97W
	qLaRskRnbugjgDf2aO+gJbhHqXjXVicu4gEVa88MJB6jOqPmJmcEHtz2xcdRS0aiXNrBlUPGpFVBW
	odgRbfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9Ir-0000000Entl-1IRF;
	Fri, 27 Jun 2025 13:39:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8mw-0000000EjC8-0Xj3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:06:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1442E1A00;
	Fri, 27 Jun 2025 06:06:24 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B1823F66E;
	Fri, 27 Jun 2025 06:06:39 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:06:36 +0100
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
Subject: Re: [PATCH 3/7] firmware: arm_scmi: imx: Support getting cfg info of
 MISC protocol
Message-ID: <aF6XXBuBSvVfvgsP@pluto>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-3-2b99481fe825@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-3-2b99481fe825@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_060642_246255_CD251DBE 
X-CRM114-Status: GOOD (  21.65  )
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

On Fri, Jun 27, 2025 at 02:03:46PM +0800, Peng Fan wrote:
> MISC protocol supports getting the System Manager(SM) mode selection
> and configuration name. Add the API for user to retrieve the information
> from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  |  5 ++++
>  2 files changed, 35 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 1b24d070c6f4856b92f515fcdba5836fd6498ce6..8ce4bf92e6535af2f30d72a34717678613b35049 100644
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
> @@ -73,6 +74,11 @@ struct scmi_imx_misc_buildinfo_out {
>  	u8 buildtime[MISC_MAX_BUILDTIME];
>  };
>  
> +struct scmi_imx_misc_cfg_info_out {
> +	__le32 msel;
> +	u8 cfgname[MISC_MAX_CFGNAME];
> +};
> +
>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_info *mi)
>  {
> @@ -306,7 +312,31 @@ static int scmi_imx_discover_build_info(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph,
> +				  struct scmi_imx_misc_system_info *info)
> +{
> +	struct scmi_imx_misc_cfg_info_out *out;
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
> +		info->msel = le32_to_cpu(out->msel);
> +		strscpy(info->cfgname, out->cfgname, MISC_MAX_CFGNAME);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
> +	.misc_cfg_info = scmi_imx_misc_cfg_info,
>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
>  	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
>  	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
> index 826402dfe6f4d3b9e6d2e93868d6699f989e9bcc..bb0c35b5d6705acddd6c83c31474482a2667b418 100644
> --- a/include/linux/scmi_imx_protocol.h
> +++ b/include/linux/scmi_imx_protocol.h
> @@ -54,15 +54,20 @@ struct scmi_imx_misc_ctrl_notify_report {
>  
>  #define MISC_MAX_BUILDDATE	16
>  #define MISC_MAX_BUILDTIME	16
> +#define MISC_MAX_CFGNAME	16
>  
>  struct scmi_imx_misc_system_info {
>  	u32 buildnum;
>  	u32 buildcommit;
>  	u8 date[MISC_MAX_BUILDDATE];
>  	u8 time[MISC_MAX_BUILDTIME];
> +	u32 msel;
> +	u8 cfgname[MISC_MAX_CFGNAME];
>  };
>

Bit odd that you use the same struct partially as output of one ops
and partially as outout of this ops....but indeed the 2 sets of data
have different lifetimes, with one set not changing at all after the
first call durring the same boot.... so I suppose it will be up to the
caller not to mess up stuff.  

maybe you could embed 2 different structures colelcting those different
data and then pass the pointers to such internal structs to the
caller...

>  struct scmi_imx_misc_proto_ops {
> +	int (*misc_cfg_info)(const struct scmi_protocol_handle *ph,
> +			     struct scmi_imx_misc_system_info *info);
>  	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,
>  			     u32 num, u32 *val);
>  	int (*misc_ctrl_get)(const struct scmi_protocol_handle *ph, u32 id,
> 

Anyway, LGTM.

Reviewd-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

