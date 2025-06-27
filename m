Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB54C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02U+0UgXCKtwughCdTi0Vy9YK+2ZInKkGl7PJpx0qps=; b=MnYQoENEQYmCVBo6UBKEMlDjrt
	i8JNbp6Fkd5qjm4+8CmwD2gZSaQNwgHGSJX2CIvio2gXnpVZ2J4cjMUr+VwllrJq0+cFuvocW63xN
	z97jRyBMgMwQZgLrN9yqKhmNaRV7VwPRPcLUpFxdBqTeZP/8TmL4IvYqb6bN6b8G7+GG2n2ty0PtT
	3hI5uGB7y0FhKEZRSRJ4EpVb7BwF1JWJI8MmjzeHCC2IXJwZ6b4exA4yaU+AdNoCoN+iKIN9hgYyP
	IPz28wOpnVivNSF5vsW6qBpoAZfY1hVYcSv4q2BFb0QTF5K6x3F3zDJdZ+fn7RnBHP6/uFEMdZfZs
	90/rJj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVA2e-0000000Eueu-3tfz;
	Fri, 27 Jun 2025 14:27:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9N8-0000000EoHU-1Rko
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:44:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71A3F1A00;
	Fri, 27 Jun 2025 06:43:48 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B62A13F66E;
	Fri, 27 Jun 2025 06:44:03 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:44:00 +0100
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
Subject: Re: [PATCH 5/7] firmware: arm_scmi: imx: Support getting syslog of
 MISC protocol
Message-ID: <aF6gIOrY5ODBumkf@pluto>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-5-2b99481fe825@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-5-2b99481fe825@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_064406_463900_66BD565C 
X-CRM114-Status: GOOD (  23.88  )
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

On Fri, Jun 27, 2025 at 02:03:48PM +0800, Peng Fan wrote:
> MISC protocol supports getting system log regarding system sleep latency
> ,wakeup interrupt and etc. Add the API for user to retrieve the
> information from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 78 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  | 19 ++++++
>  2 files changed, 97 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index d5b24bc4d4ca6c19f4cddfaea6e9d9b32a4c92f7..1a6d75357b76ce6bb7d06461999b368c27f1fa43 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -28,6 +28,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
>  	SCMI_IMX_MISC_SI_INFO = 0xB,
>  	SCMI_IMX_MISC_CFG_INFO = 0xC,
> +	SCMI_IMX_MISC_SYSLOG = 0xD,
>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
>  };
>  
> @@ -87,6 +88,19 @@ struct scmi_imx_misc_si_info_out {
>  	u8 siname[MISC_MAX_SINAME];
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
> @@ -368,6 +382,69 @@ static int scmi_imx_misc_silicon_info(const struct scmi_protocol_handle *ph,
>  	return ret;
>  }
>  
> +struct scmi_imx_misc_syslog_ipriv {
> +	u32 *array;
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
> +
> +	st->num_returned = RETURNED(r->numlogflags);
> +	st->num_remaining = REMAINING(r->numlogflags);
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
> +static int scmi_imx_misc_syslog(const struct scmi_protocol_handle *ph, u16 size,
> +				void *array)
> +{

...so this size...

> +	struct scmi_iterator_ops ops = {
> +		.prepare_message = iter_misc_syslog_prepare_message,
> +		.update_state = iter_misc_syslog_update_state,
> +		.process_response = iter_misc_syslog_process_response,
> +	};
> +	struct scmi_imx_misc_syslog_ipriv ipriv = {
> +		.array = array,
> +	};
> +	void *iter;
> +
> +	if (!array || !size)
> +		return -EINVAL;
> +

...which cannot be zero and is passed down to the iterator as max_resources
is meant to repreent also the length of tthe array passed here as an
argument and filled-in by the iterators ?

...and so basically array bounds-checking is enforced by the iterators
core code, because no matter what, it is always enforced that

	(returned + remaining <= max_resources (size)

...I am fine with this, I am just trying to understand and see if I can
find a mishap :D

> +	iter = ph->hops->iter_response_init(ph, &ops, size, SCMI_IMX_MISC_SYSLOG,
> +					    sizeof(struct scmi_imx_misc_syslog_in),
> +					    &ipriv);
> +	if (IS_ERR(iter))
> +		return PTR_ERR(iter);
> +
> +	return ph->hops->iter_response_run(iter);
> +}
> +
>  static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
>  	.misc_cfg_info = scmi_imx_misc_cfg_info,
>  	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
> @@ -375,6 +452,7 @@ static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
>  	.misc_ctrl_req_notify = scmi_imx_misc_ctrl_notify,
>  	.misc_discover_build_info = scmi_imx_discover_build_info,
>  	.misc_silicon_info = scmi_imx_misc_silicon_info,
> +	.misc_syslog = scmi_imx_misc_syslog,
>  };
>  
>  static int scmi_imx_misc_protocol_init(const struct scmi_protocol_handle *ph)
> diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
> index 0e639dfb5d16e281e2ccf006a63694b316c431f4..ff34d974046aa982fa9f5d46fc673412e01a532d 100644
> --- a/include/linux/scmi_imx_protocol.h
> +++ b/include/linux/scmi_imx_protocol.h
> @@ -71,6 +71,23 @@ struct scmi_imx_misc_system_info {
>  	u8 siname[MISC_MAX_SINAME];
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

So where is this used ? later in the series ?
> +
> +struct scmi_imx_misc_syslog {
> +	struct scmi_imx_misc_sys_sleep_rec syssleeprecord;
> +	uint32_t deverrlog;
> +};
> +
>  struct scmi_imx_misc_proto_ops {
>  	int (*misc_cfg_info)(const struct scmi_protocol_handle *ph,
>  			     struct scmi_imx_misc_system_info *info);
> @@ -84,6 +101,8 @@ struct scmi_imx_misc_proto_ops {
>  					struct scmi_imx_misc_system_info *info);
>  	int (*misc_silicon_info)(const struct scmi_protocol_handle *ph,
>  				 struct scmi_imx_misc_system_info *info);
> +	int (*misc_syslog)(const struct scmi_protocol_handle *ph, u16 size,
> +			  void *array);
>  };
> 

Thanks,
Cristian

