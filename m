Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EF1CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 13:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90EhnRIoWymXodCstIB4YMfWjEG+hFhyoljqRPGzuwE=; b=oLZ7Y38IKErFs/R9sE2cRFv6H4
	5aX1jbYU0a5LD0CHm1UEJ4nQit7TbjBePzbPo8Iu1BLCXbndA2lzaeSgOOeD2ASxwzgaB1R1n230d
	JMkbVsLalZF4QTdubLLxjl3te6XLfUfgOqpzrNqDNqK7BVK7XRCmgb3eyi4+xnyH7CUckMrkDig22
	VKKQVnAlLH6xjl3EcrSY/jxVsmSrIxU0rGhdXgo/gjrT3v300DCX6lSTLm/47hvnEMKkTt2r1WYts
	IBclwXg4q5yjob0TFJz3TwywACuWUGG/XbRXCcpWfKaFgEN8PhxQQYVW6inCOVVvRBlFov/sl8UVX
	nqXrf2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzaf-00000005wA2-1OOh;
	Fri, 29 Aug 2025 13:56:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwqm-00000005QBx-1Y5k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:00:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5124F19F0;
	Fri, 29 Aug 2025 04:00:47 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD9BC3F738;
	Fri, 29 Aug 2025 04:00:53 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:00:51 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/6] firmware: arm_scmi: imx: Support getting board
 info of MISC protocol
Message-ID: <20250829-nostalgic-skylark-of-fruition-d50d26@sudeepholla>
References: <20250827-sm-misc-api-v1-v3-0-82c982c1815a@nxp.com>
 <20250827-sm-misc-api-v1-v3-4-82c982c1815a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827-sm-misc-api-v1-v3-4-82c982c1815a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_040056_446076_266827DD 
X-CRM114-Status: GOOD (  18.03  )
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

On Wed, Aug 27, 2025 at 12:59:16PM +0800, Peng Fan wrote:
> MISC protocol supports getting board information. Retrieve the information
> from SM.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 220b9369fb537306f9e1a105930ad4d65e6b10aa..f934b4fbc6ec9f1e6b24d1c6c8cd07b45ce548e3 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -27,6 +27,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>  	SCMI_IMX_MISC_CFG_INFO = 0xC,
> +	SCMI_IMX_MISC_BOARD_INFO = 0xE,

Again keep it ordered by command number ?

>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
>  
> @@ -76,6 +77,12 @@ struct scmi_imx_misc_buildinfo_out {
>  	u8 buildtime[MISC_MAX_BUILDTIME];
>  };
>  
> +struct scmi_imx_misc_board_info_out {
> +	__le32 attributes;
> +#define MISC_MAX_BRDNAME	16
> +	u8 brdname[MISC_MAX_BRDNAME];
> +};
> +
>  struct scmi_imx_misc_cfg_info_out {
>  	__le32 msel;
>  #define MISC_MAX_CFGNAME	16
> @@ -316,6 +323,30 @@ static int scmi_imx_misc_discover_build_info(const struct scmi_protocol_handle *
>  	return ret;
>  }
>  
> +static int scmi_imx_misc_board_info(const struct scmi_protocol_handle *ph)
> +{
> +	struct scmi_imx_misc_board_info_out *out;
> +	char name[MISC_MAX_BRDNAME];
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
> +		strscpy(name, out->brdname, MISC_MAX_BRDNAME);
> +		dev_info(ph->dev, "Board\t\t= %s, attr=0x%08x\n",
> +			 name, le32_to_cpu(out->attributes));
> +	}
> +
> +	ph->xops->xfer_put(ph, t);
> +
> +	return ret;
> +}
> +
>  static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph)
>  {
>  	struct scmi_imx_misc_cfg_info_out *out;
> @@ -371,6 +402,10 @@ static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
>  	if (ret)
>  		return ret;
>  
> +	ret = scmi_imx_misc_board_info(ph);
> +	if (ret)
> +		return ret;
> +

Ditto, not mandatory, graceful return on NOT_SUPPORTED please.

-- 
Regards,
Sudeep

