Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D181CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 00:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SovXZeidkxb+f2nxu3IUvrmsRI1+mbgwRLBssLQhxNA=; b=4ml1xod+n3jSv7Iw86dgruhs8l
	CgJ5YNXu37FmBBHr5NR5af7DHlZ3S2GPFCkbJVXZHX6ucXrlAM15HzPnMz+SsbpICQSfesmBpKFUc
	rqcrCNZEXI+lTaHyJpgLjuNOogfk+2qEkHjylB7fVxDmouqP9XT5cu253YlMMIFT1X9rmtivHYKHN
	yoPgoo/s282+rxOjzeDtTmt5poYdko92toorYkUPRa12a/XvmVQkayKBbVVgiJ8mP/D9thFOx88Gl
	UusT9lg96pi429ygjcH8dxHrxP84ZyD9TaD2WH1PfSIVBdlRmGaVUWfrpf+BTGHDxOPHdaRF/cSS1
	1EH4yC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utbe8-00000002siZ-0Q7C;
	Wed, 03 Sep 2025 00:46:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZ44-00000002INk-0uq4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 22:01:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756850478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SovXZeidkxb+f2nxu3IUvrmsRI1+mbgwRLBssLQhxNA=;
	b=S8ALRLwbPrEbayi92AyR/gIYcU0iCbP43z5Yt+LFxAK4uTJZGyjhyDLh1QgEpAIghpZ8y7
	+ICxLOTG2B2bI6FR9941VNVc2QcotH1NNzA1dtdFt+rRl/af7Tamnlqywhl1cYs+TFVzZR
	cjvpU5zsBOyGfVRGgwZX/T7p9qaGbtY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-8Pd9W2Y8Nte3dJNEK5O3Rw-1; Tue, 02 Sep 2025 18:01:18 -0400
X-MC-Unique: 8Pd9W2Y8Nte3dJNEK5O3Rw-1
X-Mimecast-MFC-AGG-ID: 8Pd9W2Y8Nte3dJNEK5O3Rw_1756850477
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7ea01ed5d7cso647381085a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 15:01:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756850477; x=1757455277;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SovXZeidkxb+f2nxu3IUvrmsRI1+mbgwRLBssLQhxNA=;
        b=M+28Q3Lv6TamQ+4z63uZvKnOJv13zQLjm3aa6dZE1q2EhMB0dFhqHyCPhoPHqvxFIX
         ll2xon1iBC/u+L16gFLR2Z/xEZK20ItKpoRLjZ7H/OvBtl7jn1EGPe15BCrgXBZTZ++a
         gGOj8vKgnef+quZmhou/uhE1M0WmByLsVPtZ/HAR+ru9mdhLEgEbP03+L8ivOD/l3gRN
         md4I6E1YG8wR/L5cyIphMukcuYtg7FN75EeKd5taMssXLKS/I3t7XSall2ie/1lmgsfJ
         1JCPu2fRTKwKkEHIjYKPj94AfMEhZUT1hjUL8qP8p5waYn8EBDaOr8zPy283LKiBCVPp
         vYhg==
X-Forwarded-Encrypted: i=1; AJvYcCWGMILmoJvS+e3ZwTC5h1R97yLnPDpdfcVd7s9kWw2viB3nd99eTjS6L0dKetxOy0deUKF++xDxw1n6agFWhTgI@lists.infradead.org
X-Gm-Message-State: AOJu0YyVpVWdcX5nmvq7aBC1oQMfGaA7NdA3l38kwl/OttFgQvkOkecw
	MvQ5OuaA4BftZSNW8O5RfQxGt9daxd/9FQScVUOpcnxBljlL+qHUpMlALezTrWDyG5b1jTrCSSW
	oqNRAcmzBol7eWhJ6THFhx2V1ko7qPLZ+UIz5ExDkOl3m42rDVzOrcT4QEvc+yEpHytjT+muiZl
	HV
X-Gm-Gg: ASbGnctk/gm0tQMO4kwUAMDJopDXpW6oqXefLeOPnkpg/WncdvNJ+Tz2lHrkjtWQ6Y0
	XK02+ooB/OOcyTCYK7jfcAC8klavFMreULMswPWDRb/9boMQdwuVYz6wzlru/nymHMmVICKdPdF
	Ns9pUjH9snht+qij2EPc2mKuKwSCDpZDSQ397i3ALrmCSto4fld50/WGVzbfyoHWdkp8hJHZLUD
	fiuKPbtLu+JN5NxV+WrdM0Y+De8DU/h3710h9lgVMX7/H6yBSiLJsZtMLMfMkSdOlq3StkMoJxg
	zzxE8lzS/AU0/ytrbzc8vdxW0VEm/a2JJAF4Lvh10uK/6PsrdjOWZf9HKdXTHcQeoj2ZCjTfwaa
	2yWK+PAJQGSNgpo/TJiY=
X-Received: by 2002:a05:620a:3182:b0:7e8:6955:90fe with SMTP id af79cd13be357-7ff2aa225d7mr1459467885a.42.1756850477013;
        Tue, 02 Sep 2025 15:01:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0PC62ojWiM/vLd9z8Xwp9bJyLjgplk2IMzQjw47Isk4CcYNDohrklNKP/ZniSDGJVijAGoA==
X-Received: by 2002:a05:620a:3182:b0:7e8:6955:90fe with SMTP id af79cd13be357-7ff2aa225d7mr1459458685a.42.1756850476355;
        Tue, 02 Sep 2025 15:01:16 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aaacfeb4bsm15561385a.41.2025.09.02.15.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 15:01:15 -0700 (PDT)
Date: Tue, 2 Sep 2025 18:01:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] clk: Introduce clk_hw_set_spread_spectrum
Message-ID: <aLdpKEwfqP448eMd@x1>
References: <20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com>
 <20250901-clk-ssc-version1-v2-1-1d0a486dffe6@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20250901-clk-ssc-version1-v2-1-1d0a486dffe6@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZTgUJ_cOzZwC-HJ43wvktM4tjRsKjJZDJxbvOp-RqH4_1756850477
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_150120_334401_72320005 
X-CRM114-Status: GOOD (  27.07  )
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

On Mon, Sep 01, 2025 at 11:51:45AM +0800, Peng Fan wrote:
> Add clk_hw_set_spread_spectrum to configure a clock to enable spread
> spectrum feature. set_spread_spectrum ops is added for clk drivers to
> have their own hardware specific implementation.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk.c            | 26 ++++++++++++++++++++++++++
>  include/linux/clk-provider.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b821b2cdb155331c85fafbd2fac8ab3703a08e4d..06db8918a1b35e3280e565272bc4603a88295a92 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2802,6 +2802,32 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>  
> +int clk_hw_set_spread_spectrum(struct clk_hw *hw, struct clk_spread_spectrum *conf)
> +{
> +	struct clk_core *core;
> +	int ret;
> +
> +	if (!hw)
> +		return 0;
> +
> +	core = hw->core;
> +
> +	clk_prepare_lock();
> +
> +	ret = clk_pm_runtime_get(core);
> +	if (ret)
> +		goto fail;
> +
> +	if (core->ops->set_spread_spectrum)
> +		ret = core->ops->set_spread_spectrum(hw, conf);
> +
> +	clk_pm_runtime_put(core);
> +
> +fail:
> +	clk_prepare_unlock();
> +	return ret;
> +}
> +
>  /**
>   * clk_get_parent - return the parent of a clk
>   * @clk: the clk whose parent gets returned
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 630705a47129453c241f1b1755f2c2f2a7ed8f77..251035a96244c34ff2cbaaa349a08f4ea094e7fc 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -84,6 +84,24 @@ struct clk_duty {
>  	unsigned int den;
>  };
>  
> +#define	CLK_SSC_NO_SPREAD	0
> +#define	CLK_SSC_CENTER_SPREAD	1
> +#define	CLK_SSC_UP_SPREAD	2
> +#define	CLK_SSC_DOWN_SPREAD	3
> +
> +/**
> + * struct clk_spread_spectrum - Structure encoding spread spectrum of a clock
> + *
> + * @modfreq_hz:		Modulation frequency
> + * @spread_bp:		Modulation percent in permyriad
> + * @method:		Modulation method
> + */
> +struct clk_spread_spectrum {
> +	u32 modfreq_hz;
> +	u32 spread_bp;
> +	u32 method;
> +};
> +
>  /**
>   * struct clk_ops -  Callback operations for hardware clocks; these are to
>   * be provided by the clock implementation, and will be called by drivers
> @@ -178,6 +196,11 @@ struct clk_duty {
>   *		separately via calls to .set_parent and .set_rate.
>   *		Returns 0 on success, -EERROR otherwise.
>   *
> + * @set_spread_spectrum: Configure the modulation frequency, modulation percentage
> + *		and method. This callback is optional for clocks that does not
> + *		support spread spectrum feature or no need to enable this feature.
> + *		Returns 0 on success, -EERROR otherwise.

I think it would be worthwhile to call out in the kdocs that this helps
to reduce EMI. How does this sound?

@set_spread_spectrum: Optional callback used to configure the spread
		spectrum modulation frequency, percentage, and method
		to reduce EMI by spreading the clock frequency over a
		wider range.
		Returns 0 on success, -EERROR otherwise.

Everything else looks good to me.

Brian


