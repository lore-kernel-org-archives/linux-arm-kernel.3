Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0A4C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 12:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXd84MWT9J/gikFAc2/6/fhbocQG2Hff1bA383aOfwY=; b=jo3qAWq4JNSMMrI2VYYFaLCMft
	0q9HO7k41gk8oXSRHtN8DC988GwWe13wXeMDaJVAOCh+UpcnXZ8UiK4/bUg/EVOfuXQCnFfTdQwYu
	waZt6UrBSKRwjgWvLeVhqKhCRu2yrnjsQeu85xielJTw4etbFkmbmENp+ISp4OLT8Z/ZMpy9xoWfm
	9s/UO2/DpbJPoLMVWILQWGdZQ9XQxVw5rntSTDV4kHmadXN7HJjQNH+KYuOUNYUdNUVV0cOUCpOaT
	x8O0+1pE271Dg1PgukCTUCzqIUDmnLchQ+PvO3bIdrF8z7G6lgF6qRqWyh6vIUQWrWr38d5kry6jY
	PQWGMd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3pb-0000000E6ob-3xOk;
	Fri, 14 Mar 2025 12:08:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3lV-0000000E6B4-28LZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 12:03:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39EDD1424;
	Fri, 14 Mar 2025 05:03:57 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28E3F3F5A1;
	Fri, 14 Mar 2025 05:03:46 -0700 (PDT)
Date: Fri, 14 Mar 2025 12:03:38 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Subject: Re: [PATCH] pmdomain: arm: scmi_pm_domain: Remove redundant state
 verification
Message-ID: <Z9QbGiuK9XTEpAdE@pluto>
References: <20250314095851.443979-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314095851.443979-1-sudeep.holla@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_050349_595945_5ADCF302 
X-CRM114-Status: GOOD (  23.13  )
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

On Fri, Mar 14, 2025 at 09:58:51AM +0000, Sudeep Holla wrote:
> Currently, scmi_pd_power() explicitly verifies whether the requested
> power state was applied by calling state_get(). While this check could
> detect failures where the state was not properly updated, ensuring
> correctness is the responsibility of the SCMI firmware.
> 
> Removing this redundant state_get() call eliminates an unnecessary
> round-trip to the firmware, improving efficiency. Any mismatches
> between the requested and actual states should be handled by the SCMI
> firmware, which must return a failure if state_set() is unsuccessful.
> 
> Additionally, in some cases, checking the state after powering off a
> domain may be unreliable or unsafe, depending on the firmware
> implementation.
> 
> This patch removes the redundant verification, simplifying the function
> without compromising correctness.
> 
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Cristian Marussi <cristian.marussi@arm.com>
> Reported-and-tested-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---
>  drivers/pmdomain/arm/scmi_pm_domain.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
> index 86b531e15b85..2a213c218126 100644
> --- a/drivers/pmdomain/arm/scmi_pm_domain.c
> +++ b/drivers/pmdomain/arm/scmi_pm_domain.c
> @@ -24,8 +24,7 @@ struct scmi_pm_domain {
>  
>  static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
>  {
> -	int ret;
> -	u32 state, ret_state;
> +	u32 state;
>  	struct scmi_pm_domain *pd = to_scmi_pd(domain);
>  
>  	if (power_on)
> @@ -33,13 +32,7 @@ static int scmi_pd_power(struct generic_pm_domain *domain, bool power_on)
>  	else
>  		state = SCMI_POWER_STATE_GENERIC_OFF;
>  
> -	ret = power_ops->state_set(pd->ph, pd->domain, state);
> -	if (!ret)
> -		ret = power_ops->state_get(pd->ph, pd->domain, &ret_state);
> -	if (!ret && state != ret_state)
> -		return -EIO;
> -
> -	return ret;
> +	return power_ops->state_set(pd->ph, pd->domain, state);
>  }

...not sure about the history of this but it would have also definitely
failed consistently on any systen where the SCMI Server exposes resources
physical states (an IMPDEF behaviour), so that after a successfull set_OFF
on a shared resource a subsequent get() could return that the resource is
still physically ON if it was still needed by the other agennts sharing it...

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

