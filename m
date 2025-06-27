Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E58AC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4H5a5PiEqUGLnBxaqIIuvfEjBFgYOI3eEHfYy3vf8E=; b=aKrXKzOHKzX/XXDIeSTz5j5RXv
	j/yeRIWX/sifnWbqphlL/nno4knYokpV3bF9aA4Nheiv4XunEtlrhwZEdD0/NFh9K5z0/Ho6A73kp
	EilSJDgoT5HBO3Hmg/PnV/82s3hvMeVsA52XJanYSc4RIUM6RRlshYnyDNw8EFLnLZcTKOsFAFn9E
	T0JCmY0OLCPppslbgEplUPcA+KVt5/KRziCbFEvVMZXM9RYIJsbY58gGR0DtXUqwNQPP3LWSi5peM
	+XFdcudCXkpBCjgMVZennOrUegXaMaqjpJck81Y+bQPhmxn0PGp9MhZEpytwRmiVJ8zEZyXwcH9vF
	bb0XOrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9NO-0000000EoKw-3Z2j;
	Fri, 27 Jun 2025 13:44:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8rS-0000000EjsS-1441
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:11:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 717AF1A00;
	Fri, 27 Jun 2025 06:11:04 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81E3F3F66E;
	Fri, 27 Jun 2025 06:11:19 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:11:16 +0100
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
Subject: Re: [PATCH 4/7] firmware: arm_scmi: imx: Support getting silicon
 info of MISC protocol
Message-ID: <aF6YdPc6z21XNhWQ@pluto>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-4-2b99481fe825@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-4-2b99481fe825@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_061122_371235_223ECAA5 
X-CRM114-Status: GOOD (  20.63  )
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

On Fri, Jun 27, 2025 at 02:03:47PM +0800, Peng Fan wrote:
> MISC protocol supports getting the silicon information including revision
> number, part number and etc. Add the API for user to retrieve the
> information from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 34 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  |  8 +++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 8ce4bf92e6535af2f30d72a34717678613b35049..d5b24bc4d4ca6c19f4cddfaea6e9d9b32a4c92f7 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> +	SCMI_IMX_MISC_SI_INFO = 0xB,
>  	SCMI_IMX_MISC_CFG_INFO = 0xC,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
> @@ -79,6 +80,13 @@ struct scmi_imx_misc_cfg_info_out {
>  	u8 cfgname[MISC_MAX_CFGNAME];
>  };
>  
> +struct scmi_imx_misc_si_info_out {
> +	__le32 deviceid;
> +	__le32 sirev;
> +	__le32 partnum;
> +	u8 siname[MISC_MAX_SINAME];
> +};
> +
>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_info *mi)
>  {
> @@ -335,12 +343,38 @@ static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +static int scmi_imx_misc_silicon_info(const struct scmi_protocol_handle *ph,
> +				      struct scmi_imx_misc_system_info *info)
> +{
> +	struct scmi_imx_misc_si_info_out *out;
> +	struct scmi_xfer *t;
> +	int ret;
> +
> +	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_SI_INFO, 0, sizeof(*out), &t);
> +	if (ret)
> +		return ret;
> +
> +	ret = ph->xops->do_xfer(ph, t);
> +	if (!ret) {
> +		out = t->rx.buf;
> +		info->deviceid = le32_to_cpu(out->deviceid);
> +		info->sirev = le32_to_cpu(out->sirev);
> +		info->partnum = le32_to_cpu(out->partnum);
> +		strscpy(info->siname, out->siname, MISC_MAX_SINAME);
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
>  	.misc_cfg_info = scmi_imx_misc_cfg_info,
>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
>  	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
>  	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
>  	.misc_discover_build_info = scmi_imx_discover_build_info,
> +	.misc_silicon_info = scmi_imx_misc_silicon_info,
>  };
>  
>  static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
> index bb0c35b5d6705acddd6c83c31474482a2667b418..0e639dfb5d16e281e2ccf006a63694b316c431f4 100644
> --- a/include/linux/scmi_imx_protocol.h
> +++ b/include/linux/scmi_imx_protocol.h
> @@ -55,6 +55,7 @@ struct scmi_imx_misc_ctrl_notify_report {
>  #define MISC_MAX_BUILDDATE	16
>  #define MISC_MAX_BUILDTIME	16
>  #define MISC_MAX_CFGNAME	16
> +#define MISC_MAX_SINAME		16
>  
>  struct scmi_imx_misc_system_info {
>  	u32 buildnum;
> @@ -63,6 +64,11 @@ struct scmi_imx_misc_system_info {
>  	u8 time[MISC_MAX_BUILDTIME];
>  	u32 msel;
>  	u8 cfgname[MISC_MAX_CFGNAME];
> +	/* silicon */
> +	u32 deviceid;
> +	u32 sirev;
> +	u32 partnum;
> +	u8 siname[MISC_MAX_SINAME];
>  };

Same observation here...maybe embed a struct dedicated to this....BUT in
this case the silicon_info are NOT meant to change during a boot (and
even across a reboot really) so why a distinct command from build_info
since both infos has the same lifetime ? (I understand the quality of
the info returned is drastically different HW vs SW)

>  
>  struct scmi_imx_misc_proto_ops {
> @@ -76,6 +82,8 @@ struct scmi_imx_misc_proto_ops {
>  				    u32 ctrl_id, u32 evt_id, u32 flags);
>  	int (*misc_discover_build_info)(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_system_info *info);
> +	int (*misc_silicon_info)(const struct scmi_protocol_handle *ph,
> +				 struct scmi_imx_misc_system_info *info);
>  };
>  
>  /* See LMM_ATTRIBUTES in imx95.rst */


Other than this, no strong opinion anyway.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

