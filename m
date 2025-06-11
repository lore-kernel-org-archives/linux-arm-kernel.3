Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B668C71134
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhFWt9zk7azecthiA82QHnZd98qw/ught3FPcagMY3Q=; b=UGoDUp1vc430LXqUEO8x52OhMM
	wcvRorJ8WNflHDeA4lzyfyCx2pYHqkr45Xp3jETj3WFyzZg0af7vLWaY39A138XAlBlRA6Q6H+nBL
	KboWufUd9H8Xw7qXpBdXXI9a2A2l8vrYUYzfa8PwZI3b7s72wJHZ+hmWcRMkbQrYWtSYpq3+qIEwW
	hDs42XrX1e3XoYSmCJwMPAC9RKr9ssvRrAE9Uiy9NxZOi7JqkfcSJcltvVCZkwR4EvhvibgvPQxcf
	88MIxylzMLz1vEH78eV1Et906WakZ2fYcORTA1Wlk+ee2PJnexj/CByCzVyiXCkyTJBhltWAxBd7O
	wZZyH+pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRXf-0000000B36g-0Fel;
	Wed, 11 Jun 2025 19:55:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNRI-0000000APXE-13g2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 458B16154E;
	Wed, 11 Jun 2025 15:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEFB5C4CEE3;
	Wed, 11 Jun 2025 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749655951;
	bh=wyORKykEhxu3HxEky3H3KWL4Pst5ul6jgrJKEYkWToc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5LbLylMgDrTABeXSsL1rJM23sHGOq3I5MDpYQxZ8jHqLpLEQUzoa3U3krtosfpZ5
	 ilyC7zaB/DhuLToP6mlcsk0vmnNSEfzpT0FkSIEoVfO9ZZ8RlO7D8ZYT4xdR6Hqt+t
	 I0x6yE4ErgCP07WLT4QGNb+43VHHa5WpAzfdXnuJBpI8GP9U1GMVsEhRFQkl9N1zPA
	 mPxV9bNr7nzIwksW3B4MqkxE/Bm3UH1m/uLc8HyvuSNPztqvv1mmbWZpzzgsATBXI7
	 ql8NGyvTiLFbFzZQowVVh3PwwcPBSg5mdVv718wVMY5XjijAbBgMH2fAkfVAYH7T+p
	 J4I0RF1GYqX+A==
Date: Wed, 11 Jun 2025 10:32:28 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, 
	iuliana.prodan@oss.nxp.com, "Rafael J . Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v4 1/3] pmdomain: core: introduce dev_pm_genpd_is_on
Message-ID: <iuotfsnaft3623lchzop6sbu5ox56scdr57uia56qm6ummcvzt@yisczcdzbc3b>
References: <20250602131906.25751-1-hiagofranco@gmail.com>
 <20250602131906.25751-2-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602131906.25751-2-hiagofranco@gmail.com>
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

On Mon, Jun 02, 2025 at 10:19:03AM -0300, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 
> This helper function returns the current power status of a given generic
> power domain.
> 

Please correct me if I'm wrong, but this returns the momentary status of
the device's associated genpd, and as genpds can be shared among devices
wouldn't there be a risk that you think the genpd is on but then that
other device powers it off?

> As example, remoteproc/imx_rproc.c can now use this function to check
> the power status of the remote core to properly set "attached" or
> "offline" modes.

I presume this example works because there is a dedicated, single usage,
genpd for the remoteproc instance?

> 
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> ---
> v4: New patch.
> ---
>  drivers/pmdomain/core.c   | 27 +++++++++++++++++++++++++++
>  include/linux/pm_domain.h |  6 ++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index ff5c7f2b69ce..bcb74d10960c 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -758,6 +758,33 @@ int dev_pm_genpd_rpm_always_on(struct device *dev, bool on)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_genpd_rpm_always_on);
>  
> +/**
> + * dev_pm_genpd_is_on - Get device's power status

Functions in kernel-doc should have () prefix

> + *
> + * @dev: Device to get the current power status
> + *
> + * This function checks whether the generic power domain is on or not by
> + * verifying if genpd_status_on equals GENPD_STATE_ON.
> + *

If my understanding is correct, I'd like a warning here saying that this
is dangerous if the underlying genpd is shared.

Regards,
Bjorn

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

