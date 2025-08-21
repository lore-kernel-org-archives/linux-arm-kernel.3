Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B1ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 10:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oczo8BqWoxAu72Yl1h11Twj/njC3ajgarOax9nDxmtg=; b=jZBb/z9rXh9JrBLB+6CnFNuzfR
	v1shhnGlqE8U2yxTPD+tBqAzw7W1zdxsnhNYuQkAtu21EFCvFaP10unxvldfBEuOMnirNVBM6JbD0
	hpF2o4oh3or0qQKLJ6iogHix7uJzprgIAheqfuueqMOPD7/Eux4VE3ixIigr+Pa4YCPZAKsQCaFlC
	QnvrrwN5nu5/AqgWzyfYr7YZUGQDRzqxKN3NI7RqgoqADn/23HbzWnZc2SePueq4dFRSkCSH9JhH/
	+vK8qTCBZd71VFtf6sE+T4Me7JMWgyW8tD4nRHs+u6mxd/e5q1AAT0lN/c04ieyH8mav8nlHxfziO
	Uty7b/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2UB-0000000GaJA-0rxd;
	Thu, 21 Aug 2025 10:25:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up0Vw-0000000GDMv-1DJA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 08:19:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 307041515;
	Thu, 21 Aug 2025 01:19:07 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 217CA3F63F;
	Thu, 21 Aug 2025 01:19:14 -0700 (PDT)
Date: Thu, 21 Aug 2025 09:19:11 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/7] firmware: arm_scmi: add is_gpio() function
Message-ID: <aKbWf5SuDPNcfJWj@pluto>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
 <fbcf6cca-784e-47bb-9b61-3028f59a92ba@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbcf6cca-784e-47bb-9b61-3028f59a92ba@sabinyo.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_011916_363225_D0E97322 
X-CRM114-Status: GOOD (  13.54  )
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

On Sun, Jul 20, 2025 at 02:38:42PM -0500, Dan Carpenter wrote:
> Parse the GPIO response in scmi_pinctrl_attributes(), set the gpio
> flag, and create an is_gpio() function pointer so that it can be queried.
> 

Hi,

> In SCMI only functions and pins have a GPIO flag so that's why groups are
> not handled here.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

[snip]

>  static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
>  	.count_get = scmi_pinctrl_count_get,
>  	.name_get = scmi_pinctrl_name_get,
> +	.is_gpio = scmi_pinctrl_is_gpio,
>  	.group_pins_get = scmi_pinctrl_group_pins_get,
>  	.function_groups_get = scmi_pinctrl_function_groups_get,
>  	.mux_set = scmi_pinctrl_mux_set,
> diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
> index 688466a0e816..b4ad32067fc4 100644
> --- a/include/linux/scmi_protocol.h
> +++ b/include/linux/scmi_protocol.h
> @@ -792,6 +792,8 @@ struct scmi_pinctrl_proto_ops {
>  	int (*name_get)(const struct scmi_protocol_handle *ph, u32 selector,
>  			enum scmi_pinctrl_selector_type type,
>  			const char **name);
> +	int (*is_gpio)(const struct scmi_protocol_handle *ph, u32 selector,
> +		       enum scmi_pinctrl_selector_type type);

Doxygen comment above too please...

With that fixed, LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

