Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FDACA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2RrZM1TMhGBOnIkuqPpORtHgHx6znxYwcPsX3tR03g=; b=2EjC6kqZ63nZybLG4BQlGh0XTI
	bUtwtBY3vmMsDAyP+fUMTdZKl0n0JY848ybfhcqnZHxkhteTscFN8XiMe3hbEx/IpMoKMRPL7LAyf
	Neh/awDBHzWFea9fL08+V7BWPa31A77psyj3hJUTgeU4MElUW7o0SphFy3DjbA1htltMqkR1lEUjb
	UBUwoJXUygzxCPH0PiAyJc7piQ1xby+G3q0ukhpfNkfaA6QZfBJSJdPnSVbNddE63VCxCozida1fj
	fzO0rvTG+ENSu7bCQ8eAJV0IRQlsoOU1nybWRUXfGthiMGEhwRCXpgsPs2NGTmIHGcpuyCor+ZSRS
	8cyokY7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzqu-00000005z5E-1wlf;
	Fri, 29 Aug 2025 14:13:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urwx6-00000005R6S-0dZX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 11:07:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F3721596;
	Fri, 29 Aug 2025 04:07:19 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 942D43F738;
	Fri, 29 Aug 2025 04:07:25 -0700 (PDT)
Date: Fri, 29 Aug 2025 12:07:22 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] firmware: arm_scmi: imx: Support getting syslog
 of MISC protocol
Message-ID: <20250829-realistic-dolphin-of-blizzard-2bb398@sudeepholla>
References: <20250827-sm-misc-api-v1-v3-0-82c982c1815a@nxp.com>
 <20250827-sm-misc-api-v1-v3-5-82c982c1815a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250827-sm-misc-api-v1-v3-5-82c982c1815a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_040728_277652_6A442769 
X-CRM114-Status: GOOD (  21.79  )
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

On Wed, Aug 27, 2025 at 12:59:17PM +0800, Peng Fan wrote:
> MISC protocol supports getting system log regarding system sleep latency
> ,wakeup interrupt and etc. Add the API for user to retrieve the
> information from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 82 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  | 19 +++++
>  2 files changed, 101 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index f934b4fbc6ec9f1e6b24d1c6c8cd07b45ce548e3..2d3423d83aed857329a9a367d0ec0681a1d77d0b 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -27,6 +27,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>  	SCMI_IMX_MISC_CFG_INFO = 0xC,
> +	SCMI_IMX_MISC_SYSLOG = 0xD,

1. Not ordered
2. Inconsistent command name with the document.

>  	SCMI_IMX_MISC_BOARD_INFO = 0xE,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
> @@ -89,6 +90,19 @@ struct scmi_imx_misc_cfg_info_out {
>  	u8 cfgname[MISC_MAX_CFGNAME];
>  };
>  
> +struct scmi_imx_misc_syslog_in {
> +	__le32 flags;
> +	__le32 index;
> +};
> +
> +#define REMAINING(x)	le32_get_bits((x), GENMASK(31, 20))
> +#define RETURNED(x)	le32_get_bits((x), GENMASK(11, 0))
> +
> +struct scmi_imx_misc_syslog_out {
> +	__le32 numlogflags;
> +	__le32 syslog[];
> +};
> +
>  static int scmi_imx_misc_attributes_get(const struct scmi_protocol_handle *ph,
>  					struct scmi_imx_misc_info *mi)
>  {
> @@ -371,10 +385,78 @@ static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph)
>  	return ret;
>  }
>  
> +struct scmi_imx_misc_syslog_ipriv {
> +	u32 *array;
> +	u16 *size;
> +};
> +
> +static void iter_misc_syslog_prepare_message(void *message, u32 desc_index,
> +					     const void *priv)
> +{
> +	struct scmi_imx_misc_syslog_in *msg = message;
> +
> +	msg->flags = cpu_to_le32(0);
> +	msg->index = cpu_to_le32(desc_index);
> +}
> +
> +static int iter_misc_syslog_update_state(struct scmi_iterator_state *st,
> +					 const void *response, void *priv)
> +{
> +	const struct scmi_imx_misc_syslog_out *r = response;
> +	struct scmi_imx_misc_syslog_ipriv *p = priv;
> +
> +	st->num_returned = RETURNED(r->numlogflags);
> +	st->num_remaining = REMAINING(r->numlogflags);
> +	*(p->size) = st->num_returned + st->num_remaining;

I think you can drop () above.

> +
> +	return 0;
> +}
> +
> +static int
> +iter_misc_syslog_process_response(const struct scmi_protocol_handle *ph,
> +				  const void *response,
> +				  struct scmi_iterator_state *st, void *priv)
> +{
> +	const struct scmi_imx_misc_syslog_out *r = response;
> +	struct scmi_imx_misc_syslog_ipriv *p = priv;
> +
> +	p->array[st->desc_index + st->loop_idx] =
> +		le32_to_cpu(r->syslog[st->loop_idx]);
> +
> +	return 0;
> +}
> +
> +static int scmi_imx_misc_syslog(const struct scmi_protocol_handle *ph, u16 *size,
> +				void *array)
> +{
> +	struct scmi_iterator_ops ops = {
> +		.prepare_message = iter_misc_syslog_prepare_message,
> +		.update_state = iter_misc_syslog_update_state,
> +		.process_response = iter_misc_syslog_process_response,
> +	};
> +	struct scmi_imx_misc_syslog_ipriv ipriv = {
> +		.array = array,
> +		.size = size,
> +	};
> +	void *iter;
> +
> +	if (!array || !size || !*size)
> +		return -EINVAL;
> +
> +	iter = ph->hops->iter_response_init(ph, &ops, *size, SCMI_IMX_MISC_SYSLOG,
> +					    sizeof(struct scmi_imx_misc_syslog_in),
> +					    &ipriv);
> +	if (IS_ERR(iter))
> +		return PTR_ERR(iter);
> +

Handle NOT_SUPPORTED if not mandatory, may need update to the document to
add NOT_SUPPORTED as return value. Currently it's only success in which
case you don't need any error handling at all 😉.

> +	return ph->hops->iter_response_run(iter);
> +}
> +
>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
>  	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
>  	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
> +	.misc_syslog = scmi_imx_misc_syslog,
>  };
>  
>  static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
> index 27bd372cbfb142b6acb0b1cf4b82f061529d0d45..6e18920aac56de67d388e985e3305745d3798c3e 100644
> --- a/include/linux/scmi_imx_protocol.h
> +++ b/include/linux/scmi_imx_protocol.h
> @@ -52,6 +52,23 @@ struct scmi_imx_misc_ctrl_notify_report {
>  	unsigned int		flags;
>  };
>  
> +struct scmi_imx_misc_sys_sleep_rec {
> +	u32 sleepentryusec;
> +	u32 sleepexitusec;
> +	u32 sleepcnt;
> +	u32 wakesource;
> +	u32 mixpwrstat;
> +	u32 mempwrstat;
> +	u32 pllpwrstat;
> +	u32 syssleepmode;
> +	u32 syssleepflags;
> +};
> +
> +struct scmi_imx_misc_syslog {
> +	struct scmi_imx_misc_sys_sleep_rec syssleeprecord;
> +	uint32_t deverrlog;

s/uint32_t/u32/ for consistency ? Just look above 3-4 line e.g.

-- 
Regards,
Sudeep

