Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEABCDB471
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 20:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TrQZE9vH39dIRDw32V4DNDUUodeQOx70heLgohi/mA=; b=3B0Zvytabqhs+7z3M1taZ9F8B5
	yTNFtbQcjQglrAcylNMRdgSCsf/FEw3+xxlGkZdOcbpMQnq6vO3pItvSUobjWI+3O4WNQTyI3gXMQ
	+kdjG32WiPc00zd0YXgmacp+UPJXPSwpEGVvo8ONUiGEslyVcTm+U1qMIA2zQmt/A2WUQFr53nyth
	T6rXIs73qs8ecpyOlswMLtBSx4WYH23AG9DETR3xB5Uk60HSklgvJlzggXLyYRRGCwTJ2S47OgRX1
	PapqIqfSm3l85vrR+4i/WaMgzazByjkZgW90/DOBCqT/E3RKzU724m93YmXaWHMYrDAkZ/FOI8UF2
	gjJy4A6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7Ru-00000006pA5-3PgL;
	Tue, 23 Jun 2026 20:10:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc7Rt-00000006p9x-1tZD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 20:10:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99CF760008;
	Tue, 23 Jun 2026 20:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1071F000E9;
	Tue, 23 Jun 2026 20:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782245420;
	bh=8TrQZE9vH39dIRDw32V4DNDUUodeQOx70heLgohi/mA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=asEztcvPQ0Qf1LSCraHYg3M2kMxixqmxcDmg7KxK4v9lajXjJ7NiSl+hkqIlYTIqF
	 QuNpna1+Hpu92/DLFRuk5Fc/Y8fRH4s5Yy1v+n6GLoDgEjycRjTrPiCwJqbTRrWM6z
	 h8O3pSBLK7EE+rdh0OgE3Wm0J8Ca7iLPnaQX4zVGtnf9nkbKpFkyo5oF3SdCvSGVaO
	 /a0owvNBzJ6tOB1esP/TbrU0HrTDVDidVJNdOz09qbt1nw5BHBgjOrEhRZv9wZCU/k
	 1NjfCzKtHhlREKUcVXwgGX41rxC4GJdUwv2SiXbuij/Fn4Iy0980+aKiVwGtQy3a0Y
	 XYuP7M3bcNMqQ==
Date: Tue, 23 Jun 2026 22:10:16 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: "Carlos Song (OSS)" <carlos.song@oss.nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, s.hauer@pengutronix.de, 
	festevam@gmail.com, carlos.song@nxp.com, haibo.chen@nxp.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v5] i2c: imx: mark I2C adapter when hardware is powered
 down
Message-ID: <ajrn2kvH_MelCv4Q@zenone.zhora.eu>
References: <20260525030400.3182911-1-carlos.song@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525030400.3182911-1-carlos.song@oss.nxp.com>
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

Hi Oleksij,

Any chance you can give this a review?

Thanks,
Andi

On Mon, May 25, 2026 at 11:04:00AM +0800, Carlos Song (OSS) wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> On some i.MX platforms, certain I2C client drivers keep a periodic
> workqueue which continues to trigger I2C transfers.
> 
> During system suspend/resume, there exists a time window between:
>   - suspend_noirq and the system entering suspend
>   - the system starting to resume and resume_noirq
> 
> In this window, the I2C controller resources such as clock and pinctrl
> may already be disabled or not yet restored.
> 
> If a workqueue triggers an I2C transfer in this period, the driver
> attempts to access I2C registers while the hardware resources are
> unavailable, which may lead to system hang.
> 
> Mark the I2C adapter as suspended during noirq suspend and block new
> transfers until resume, ensuring that I2C transfers are only issued
> when hardware resources are available.
> 
> Fixes: 358025ac091e ("i2c: imx: make controller available until system suspend_noirq() and from resume_noirq()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
> Change for v5:
>   - Remake commit log including the issue detail from Mukesh's
>     suggestion.
> Change for v4:
>   - Restore hrtimer when pm_runtime_force_suspend failed when slave mode
>     enabled.
> Change for v3:
>   - Add hrtimer_cancel in i2c_imx_suspend_noirq to cancel slave_timer for
>     safe suspend in i2c slave mode.
> Change for v2:
>   - Call i2c_mark_adapter_suspended() before pm_runtime_force_suspend()
>     to prevent potential deadlock if a transfer is active during suspend.
>   - Roll back with i2c_mark_adapter_resumed() if pm_runtime_force_suspend()
>     fails.
> ---
>  drivers/i2c/busses/i2c-imx.c | 45 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 28313d0fad37..73317ddd5f02 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1922,6 +1922,47 @@ static int i2c_imx_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> +static int __maybe_unused i2c_imx_suspend_noirq(struct device *dev)
> +{
> +	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	i2c_mark_adapter_suspended(&i2c_imx->adapter);
> +
> +	/*
> +	 * Cancel the slave timer before powering down to prevent
> +	 * i2c_imx_slave_timeout() from accessing hardware registers
> +	 * while the clock is disabled.
> +	 */
> +	hrtimer_cancel(&i2c_imx->slave_timer);
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret) {
> +		i2c_mark_adapter_resumed(&i2c_imx->adapter);
> +		if (i2c_imx->slave) {
> +			hrtimer_forward_now(&i2c_imx->slave_timer, I2C_IMX_CHECK_DELAY);
> +			hrtimer_restart(&i2c_imx->slave_timer);
> +		}
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused i2c_imx_resume_noirq(struct device *dev)
> +{
> +	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	i2c_mark_adapter_resumed(&i2c_imx->adapter);
> +
> +	return 0;
> +}
> +
>  static int i2c_imx_suspend(struct device *dev)
>  {
>  	/*
> @@ -1955,8 +1996,8 @@ static int i2c_imx_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops i2c_imx_pm_ops = {
> -	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				  pm_runtime_force_resume)
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(i2c_imx_suspend_noirq,
> +				  i2c_imx_resume_noirq)
>  	SYSTEM_SLEEP_PM_OPS(i2c_imx_suspend, i2c_imx_resume)
>  	RUNTIME_PM_OPS(i2c_imx_runtime_suspend, i2c_imx_runtime_resume, NULL)
>  };
> -- 
> 2.43.0
> 

