Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05D8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ey7QaNEk;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jj4Da+y3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7M/wxxdndP3E2ZjYh6p7rGr91d6BR8M0XyDE1EyLxu4=; b=Ey7QaNEkC7ABmTL5Uj3pSVvsfd
	SdTaKbFhNe/684c2DaHl4o7RRDdP7JCLaSNUh8JSg7m5m8A0IzmLEWtbN/7CHAJxt17LB20ZRzR7x
	A4gdAQzDCPRrEobYarZQVt6lNdnq80plPqzj8TJG5tvvpOlpEIfgFEchSuDCkwX+9UWKZZSbeIn74
	cZcT15CHRUv59kRWfRhE8ahUwbELhKdvEHsqUYFfrGJBIKFubLxurddPkxZpEsbD+6a7JK0DEVUDQ
	8ZicfEuG/IR7zBdl3/blXX7Q89ub+xsWQtT6TDUAiQ/WTmuYwiXSjeOHto3SydsD9WFl8P1fz2jJO
	AYMg+SbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYFp-0000000ASbf-3UgX;
	Thu, 29 Oct 2026 22:05:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMYFm-0000000ASae-1Gwp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 22:05:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F46215A1;
	Thu, 29 Oct 2026 15:05:39 -0700 (PDT)
Received: from e121740.arm.com (e121740.arm.com [10.33.8.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CE633F673;
	Thu, 29 Oct 2026 15:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793311542; bh=XL7lVmGkH9v0/AlI6TLawa7TNgDaqN/Y1Le1BKA4gl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jj4Da+y3lg20pAKDtXJgsekBy9S+JVIFGSkTQqDm1yPiLKR2RHE7ntUg0CNWxLsic
	 LZLIWeG8W4Y2hhPislXQSAgALDdIgwloGgWvu42h8uMNusKjYvxaEHj8s1vLzoy3Zk
	 c4lbJU/PpFGIaGf+IOIbkPnFOUTgj5LhbglkebXk=
Date: Thu, 29 Oct 2026 22:05:31 +0000
From: Philip Radford <philip.radford@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 2/3] firmware: arm_scmi: imx: Validate MISC control
 response size
Message-ID: <auPDK9bG/H8GTOK5@e121740.arm.com>
References: <20261028130502.2999676-1-sudeep.holla@kernel.org>
 <20261028130502.2999676-2-sudeep.holla@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028130502.2999676-2-sudeep.holla@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_150546_417851_8B62E31F 
X-CRM114-Status: GOOD (  18.97  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 01:05:01PM +0000, Sudeep Holla wrote:
> scmi_imx_misc_ctrl_get() uses @num to report the number of
> values returned by firmware, but it did not retain the caller's value
> as the capacity of @val.
> 

Hi,

> A response with more values than the caller allocated was copied into
> @val unchecked. For example, the MQS regmap callback supplies storage
> for one value. Retain the input capacity and reject responses exceeding
> it before copying, then update @num only after a successful copy.
> 
> Document the in/out @num contract of the exported helper.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-6897b44a-57fb-4964-95f8-447d0ce526e4
> Fixes: 61c9f03e22fc ("firmware: arm_scmi: Add initial support for i.MX MISC protocol")
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c  | 16 ++++++++++++----
>  include/linux/firmware/imx/sm.h                  |  6 ++++++
>  2 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 0c708b2dd496..f00f7acba845 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -273,10 +273,16 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
>  {
>  	struct scmi_imx_misc_ctrl_get_out *out;
>  	struct scmi_xfer *t;
> +	u32 num_values, max_values;
>  	int ret, i;
>  	int max_msg_size = ph->hops->get_max_msg_size(ph);
>  	int max_num = (max_msg_size - sizeof(*out)) / sizeof(__le32);
>  
> +	if (!num || !val || !*num)
> +		return -EINVAL;
> +
> +	max_values = *num;
> +
>  	ret = scmi_imx_misc_ctrl_validate_id(ph, ctrl_id);
>  	if (ret)
>  		return ret;
> @@ -290,16 +296,18 @@ static int scmi_imx_misc_ctrl_get(const struct scmi_protocol_handle *ph,
>  	ret = ph->xops->do_xfer(ph, t);
>  	if (!ret) {
>  		out = t->rx.buf;
> -		*num = le32_to_cpu(out->num);
> +		num_values = le32_to_cpu(out->num);
>  
> -		if (*num >= max_num ||
> -		    *num * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
> +		if (num_values > max_values || num_values >= max_num ||
> +		    num_values * sizeof(__le32) > t->rx.len - sizeof(__le32)) {
>  			ph->xops->xfer_put(ph, t);
>  			return -EINVAL;
>  		}

Why does num_values have to be less than max_num, can it not be equal to? Isn't max_num
already smaller than max_msg_size due to the initialisation above?

Regards,
Phil


