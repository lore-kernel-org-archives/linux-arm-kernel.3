Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FC0CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 13:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxFWun/R23WEIRiXlEM2lMq18Wubin4tDp9Ph8dTnAc=; b=xEZ3CTMzd3kN4jIb02pi6R44Xl
	Pq+GDLCsXmG+2AtQdDcjvzAw1bZtcie182+/hOrnztv4yduCxc2JEONHIQ6aOV6Sx+DiqPtRmzJC/
	bYxG1OwfqKg9oFaTeoYiZQNBJiovxG6yyWGmq3AsQMVHaZ6YEXiyTa0r+WedTmKB7PUR3vuHMWEP2
	MCGzhh6YaZibJtkJKUS+Lhjdx4P6T/n8H8p1ntbrwMzQdoUPeHtWlsrl6JJ3RIu4M6ftMP6ie/EJA
	woBqgp9QSmMkqNuOKCKzNjnq6VqnkMAiFswceK2vfQ0q79zYW+Iqp7t8OJb0164c/UgVf2aTlHpRY
	z8Dy/CUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLMJ-0000000EXAJ-23aS;
	Wed, 10 Sep 2025 13:59:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLMG-0000000EX5h-1Yzn;
	Wed, 10 Sep 2025 13:59:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 556841595;
	Wed, 10 Sep 2025 06:59:27 -0700 (PDT)
Received: from [10.1.25.55] (e122027.cambridge.arm.com [10.1.25.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54D863F694;
	Wed, 10 Sep 2025 06:59:30 -0700 (PDT)
Message-ID: <2489d50a-a075-42bc-92a3-7570581fe508@arm.com>
Date: Wed, 10 Sep 2025 14:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/10] drm/panthor: devfreq: expose get_dev_status and
 make it more generic
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250905-mt8196-gpufreq-v1-0-7b6c2d6be221@collabora.com>
 <20250905-mt8196-gpufreq-v1-8-7b6c2d6be221@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250905-mt8196-gpufreq-v1-8-7b6c2d6be221@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_065936_554174_9D392BD7 
X-CRM114-Status: GOOD (  22.55  )
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

On 05/09/2025 11:23, Nicolas Frattaroli wrote:
> The only device-specific part of panthor's get_dev_status devfreq
> callback is getting the clock frequency. All the other logic surrounding
> what it does may be useful for other devfreq implementations however.
> 
> Expose it in the panthor_devfreq.h header file, and make it call back
> into get_cur_freq instead of poking the common clock framework directly.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 29 +++++++++++++++++------------
>  drivers/gpu/drm/panthor/panthor_devfreq.h |  3 +++
>  2 files changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 02eb3ca15d1874e1cbafc6b614b196c5cc75b6a1..d495dd856299826c4bddc205087d8914d01d7fc4 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -43,6 +43,15 @@ static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
>  	return err;
>  }
>  
> +static int panthor_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
> +{
> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
> +
> +	*freq = clk_get_rate(ptdev->clks.core);
> +
> +	return 0;
> +}
> +

I don't see any reason why this was moved up here as part of this patch?
Otherwise this looks fine to me.

Thanks,
Steve

>  static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
>  {
>  	pdevfreq->busy_time = 0;
> @@ -50,14 +59,18 @@ static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
>  	pdevfreq->time_last_update = ktime_get();
>  }
>  
> -static int panthor_devfreq_get_dev_status(struct device *dev,
> -					  struct devfreq_dev_status *status)
> +int panthor_devfreq_get_dev_status(struct device *dev,
> +				   struct devfreq_dev_status *status)
>  {
>  	struct panthor_device *ptdev = dev_get_drvdata(dev);
>  	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
> +	struct devfreq_dev_profile *p = pdevfreq->devfreq->profile;
>  	unsigned long irqflags;
> +	int ret;
>  
> -	status->current_frequency = clk_get_rate(ptdev->clks.core);
> +	ret = p->get_cur_freq(dev, &status->current_frequency);
> +	if (ret)
> +		return ret;
>  
>  	spin_lock_irqsave(&pdevfreq->lock, irqflags);
>  
> @@ -79,15 +92,7 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
>  
>  	return 0;
>  }
> -
> -static int panthor_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
> -{
> -	struct panthor_device *ptdev = dev_get_drvdata(dev);
> -
> -	*freq = clk_get_rate(ptdev->clks.core);
> -
> -	return 0;
> -}
> +EXPORT_SYMBOL(panthor_devfreq_get_dev_status);
>  
>  static struct devfreq_dev_profile panthor_devfreq_profile = {
>  	.timer = DEVFREQ_TIMER_DELAYED,
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
> index e8b5ccddd45c52ee3215e9c84c6ebd9109640282..a891cb5fdc34636444f141e10f5d45828fc35b51 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -52,6 +52,9 @@ void panthor_devfreq_suspend(struct panthor_device *ptdev);
>  void panthor_devfreq_record_busy(struct panthor_device *ptdev);
>  void panthor_devfreq_record_idle(struct panthor_device *ptdev);
>  
> +int panthor_devfreq_get_dev_status(struct device *dev,
> +				   struct devfreq_dev_status *status);
> +
>  unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
>  
>  #endif /* __PANTHOR_DEVFREQ_H__ */
> 


