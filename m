Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A163CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 01:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DIHMdSt4GvqiUavnW9Jzr8Gsnq5hKMz0enlBFVs5X8=; b=eaaZsZLtLODhWSp+SSqX2SMXKC
	Kf46o7tuUzx8J3uPQMB9d/9BnRM/b6pXIerFgfY+1vB0p/G6riU6F5TowRvWv8Ioq7JhUxDGYiGOf
	z9Nq6y0arTV94RClsAsfstllm7eHVsU0lP+p0nRAPa3Y4UsbnIyZvdZnJCkrsndAJBu9Yz9dz8O5j
	L3ffa5KWEiGE9v+xzoB9rru9pkBbQfHuMzv/6+yz71Oa8CrYajnQHJVqhvKzyR/BaQj3U8X7QZfn9
	3jl9+zFcQm7ZCYPZgFAkK3d92xmwtaKAl42/K8OtKaeGH0nI65pTnQTk4HN2/z8p3Oa0EZYeb4NCd
	qM5PYtlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCSMJ-0000000AUMI-3RiQ;
	Fri, 02 Oct 2026 01:46:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCSMH-0000000AULu-0T0a;
	Fri, 02 Oct 2026 01:46:46 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4333227;
	Fri,  2 Oct 2026 03:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1790905489;
	bh=oICVcHOz2Wfgzqh7GpipejxF0d1OizMTX25Z+t8idAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DL47LK26zxYWCGEwmH0pFphMpQcdDa446j4BIEW/6z2jrfgx1u/HPvf5LspF0B4qm
	 e6PUuZGYTLC1VVDdFuuXDusl9pBhG9xklqDGgx/8Sj4OayueF0WmZ/r+0sa/0dNgYP
	 l4McKnsWX9Tt+e/LWL/mGqJ/C9wK+61dNMGhnAiI=
Date: Fri, 2 Oct 2026 04:46:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Jacob Chen <jacob-chen@iotwrt.com>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: rkisp1: Switch to modern PM_OPS
Message-ID: <20261002014640.GB101842@killaraus.ideasonboard.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
 <20261001173610.158931-4-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001173610.158931-4-diederik@cknow-tech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_184645_324167_1B7A9143 
X-CRM114-Status: GOOD (  23.59  )
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

On Thu, Oct 01, 2026 at 07:34:53PM +0200, Diederik de Haas wrote:
> A new set of modern PM_OPS macros got defined in commit
> 1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")
> 
> Switch to those new macros so that the PM callbacks are always seen by the
> compiler, but discarded if not used. This lets us drop the __maybe_unused
> annotation from the callback functions.
> 
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

As the three patches in this series are independent from each other,
I've taken this in my tree.

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index f90e01301943..e619a949dbc9 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -305,7 +305,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
>   * Power
>   */
>  
> -static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
> +static int rkisp1_runtime_suspend(struct device *dev)
>  {
>  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>  
> @@ -331,7 +331,7 @@ static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
>  	return pinctrl_pm_select_sleep_state(dev);
>  }
>  
> -static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
> +static int rkisp1_runtime_resume(struct device *dev)
>  {
>  	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
>  	int ret;
> @@ -351,9 +351,8 @@ static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops rkisp1_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				pm_runtime_force_resume)
> -	SET_RUNTIME_PM_OPS(rkisp1_runtime_suspend, rkisp1_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +	RUNTIME_PM_OPS(rkisp1_runtime_suspend, rkisp1_runtime_resume, NULL)
>  };
>  
>  /* ----------------------------------------------------------------------------
> @@ -815,7 +814,7 @@ static struct platform_driver rkisp1_drv = {
>  	.driver = {
>  		.name = RKISP1_DRIVER_NAME,
>  		.of_match_table = of_match_ptr(rkisp1_of_match),
> -		.pm = &rkisp1_pm_ops,
> +		.pm = pm_ptr(&rkisp1_pm_ops),
>  	},
>  	.probe = rkisp1_probe,
>  	.remove = rkisp1_remove,

-- 
Regards,

Laurent Pinchart

