Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A450C71155
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 03:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfLgLRHI6/h62D2Tcn5JyRMJVJHoxYNZRQY9pJZrgfk=; b=P6f/j3u8c0hBd1Zv8IIgGOBDDq
	3W37+4pupl6A/sft0Js1WS0cTJPwQXjN/Fo9+o/RHs7Ka8RqYEGO+4NPflxQttQb6nav5yDtbCvEj
	NvPJs60xotWwCv+wQrjollt7vLD+mUBQtSksMH7mvtAaLu6UEMC7Hz/OkMJ71qbKg3YaGrzCjBTA7
	SC7saBjt6LsQDR+Kh3x4e+Rrdyc3NWA8pXVgl3bEyYOYA2TTeQy5LN2SlHBL+K2x/4cMlT1Iyo7k4
	mDTViUk+mTEvH35QPI6iYjR8o86k5nrVmNWsH5msDgvn719sEDDz8b1L8YYnaezD1p43uWB1oCqEh
	G7ase2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRj9u-00000008sXU-1itt;
	Wed, 18 Jun 2025 03:08:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRj3R-00000008rns-3MZF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 03:01:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 431BD4A2D0;
	Wed, 18 Jun 2025 03:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 130B7C4CEE3;
	Wed, 18 Jun 2025 03:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750215697;
	bh=t64bpj/Jy42DYE5bUAkvqiJUO9YUAIAKnwMoETOdEDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zw86FArFjjTfunSWC4ojQFaMimtGRXBLhq27l9ith755fD0O1H55k8KjjENbj6WsW
	 AsldrcTTz22pbtz9xsU8a2xCAzOvn6XW/Af9lFgUdVW8fjG/QHRZVp31Je0S9QwYkK
	 39+PcexM/neXhDJuFGfAdfOG+SUpiFrWRM2+8Lbp3nGENhqoGMR9SOw09N3ywCO/8T
	 kfwWpLN7xJ+jJqsUeArdkXqWhtvW65ojsoueVvYj6KsmRfLmE7C7wTmreWiD2UuZA+
	 umyu8Ljzmxs0/YbXlDB9oYzIzOEg5c7RYKVFc29/I7wFCU8PKOncJQEcaxwegaAxal
	 20VNzZl30OlSg==
Date: Tue, 17 Jun 2025 22:01:34 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, 
	iuliana.prodan@oss.nxp.com, "Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v5 1/3] pmdomain: core: introduce dev_pm_genpd_is_on()
Message-ID: <ihhh74pzm64nalva27ukpe7v3unx6j2r4opr5yeezm4mefgryi@pi7ky4sv2t7c>
References: <20250617193450.183889-1-hiagofranco@gmail.com>
 <20250617193450.183889-2-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617193450.183889-2-hiagofranco@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_200137_886108_2882CA22 
X-CRM114-Status: GOOD (  25.87  )
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

On Tue, Jun 17, 2025 at 04:34:48PM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> This helper function returns the current power status of a given generic
> power domain.
> 
> As example, remoteproc/imx_rproc.c can now use this function to check
> the power status of the remote core to properly set "attached" or
> "offline" modes.
> 
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> v4 -> v5:
> - s/dev_pm_genpd_is_on/dev_pm_genpd_is_on()/ in function description.
> - Updated function description to be explicit the function reflects the
>   current power status and that this might change after the function
>   returns, especially if the genpd is shared.
> 
> v3 -> v4:
> - New patch.
> ---
>  drivers/pmdomain/core.c   | 33 +++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h |  6 ++++++
>  2 files changed, 39 insertions(+)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index ff5c7f2b69ce..2f387e15cb75 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -758,6 +758,39 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
>  
> +/**
> + * dev_pm_genpd_is_on() - Get device's current power domain status
> + *
> + * @dev: Device to get the current power status
> + *
> + * This function checks whether the generic power domain associated with the
> + * given device is on or not by verifying if genpd_status_on equals
> + * GENPD_STATE_ON.
> + *
> + * Note: this function returns the power status of the genpd at the time of the
> + * call. The power status may change after due to activity from other devices
> + * sharing the same genpd. Therefore, this information should not be relied for
> + * long-term decisions about the device power state.
> + *
> + * Return: 'true' if the device's power domain is on, 'false' otherwise.
> + */
> +bool dev_pm_genpd_is_on(struct device *dev)
> +{
> +	struct generic_pm_domain *genpd;
> +	bool is_on;
> +
> +	genpd = dev_to_genpd_safe(dev);
> +	if (!genpd)
> +		return false;
> +
> +	genpd_lock(genpd);
> +	is_on = genpd_status_on(genpd);
> +	genpd_unlock(genpd);
> +
> +	return is_on;
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_genpd_is_on);
> +
>  /**
>   * pm_genpd_inc_rejected() - Adjust the rejected/usage counts for an idle-state.
>   *
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 0b18160901a2..c12580b6579b 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -301,6 +301,7 @@ void dev_pm_genpd_synced_poweroff(struct device *dev);
>  int dev_pm_genpd_set_hwmode(struct device *dev, bool enable);
>  bool dev_pm_genpd_get_hwmode(struct device *dev);
>  int dev_pm_genpd_rpm_always_on(struct device *dev, bool on);
> +bool dev_pm_genpd_is_on(struct device *dev);
>  
>  extern struct dev_power_governor simple_qos_governor;
>  extern struct dev_power_governor pm_domain_always_on_gov;
> @@ -393,6 +394,11 @@ static inline int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
>  	return -EOPNOTSUPP;
>  }
>  
> +static inline bool dev_pm_genpd_is_on(struct device *dev)
> +{
> +	return false;
> +}
> +
>  #define simple_qos_governor		(*(struct dev_power_governor *)(NULL))
>  #define pm_domain_always_on_gov		(*(struct dev_power_governor *)(NULL))
>  #endif
> -- 
> 2.39.5
> 

