Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9996FCFA762
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=58wLSjoCtJmPW1lQLR4kpgVeNHbmr/e22y2z3O0EZnY=; b=pPRKz4RBXcf5EDQnYbhk1Uw/+P
	nisEBi00IZ93Nu5XP3BgFZq6jxtegdhd0zfO/8wucrYcsB3uEyuyujx5aehRimOU4coS9Pf7mnu/o
	YpsLt1lqp2k9tUPmDkuUFyIdQYcYc26E2vbPBvdWZF+8Eb/tMngkEQF5yLyMIGms8I24ylDoKqixl
	jS/hI94Fu8UK1WjOaLtrni7FikL8Pk0F4XH2Z9yJjGs2xrw+3Iv9U4D+zwIXIkIknp5cmVDiSEDZq
	yUBMRMG0/Nr3+b2nG68er3XKO7DgBICmo5pgGjjrwpP3oFyWBRVfSEw5SdUw1YA64Reh4VRyQjHH7
	fgRt1jPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNOz-000000089LG-2Jdi;
	Fri, 21 Nov 2025 09:26:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNOw-000000089Kl-0o8k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 09:25:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477a219db05so11654905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 01:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763717156; x=1764321956; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58wLSjoCtJmPW1lQLR4kpgVeNHbmr/e22y2z3O0EZnY=;
        b=iKYHL0KBlyl8uShsz54nTCTjQiPn4/jKbW6zMy5EzOwXjTZc7DquMOyHxL9crzM8uB
         EUEd7sPoK/Y1+xNw6isiVpLDt90s7tTTaXsJ/yAWUBhfVIUImXkgAeVxWhJA8YbvnkRf
         ETelbPuVwZBwADOA15sJWOzG/iGzFQ+TzSrdhGD2cGzGFyE7JeXia1tGaBfGikJ4+v6D
         ESvM8UvezCFmCJSXQ4AHGcjazoAuN3qZ3rurOpfh+gpykt4Vm4JgOiti5Ig34TWQbLhW
         TL9TGOldGuR43pH84Mx76PgYIWcHVjn6zeTJyunK22FEFxGSvPa3ZrTUlmOydLGLJ9pU
         nnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763717156; x=1764321956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58wLSjoCtJmPW1lQLR4kpgVeNHbmr/e22y2z3O0EZnY=;
        b=c44216/o9WqIPkxM37sB2xspTprsw5eS4oNdTkBhoc6RMuktt1rKe05phQ6DQNQku6
         ui/ikJdKMEboTFAW4N1SUPDerWX/ead3NSKXg8ZppoMOmnrd3KyGU1CAwp93MXDQP5/i
         oG3DJLsfStwANbrxRh+Lgyrf0S1h7C4T6Yx6HT58SBKPb/DIXumq/2UeQbqaouWp3h99
         7WRLYgH0hrWFhnbIboDdB/O5o45h2wdpqF/HKozeekEOKNbEdYJHC2yLkJ6qekhPlZ3y
         8i8FMrQJaqFPMILB8KfiujHncR/K5LxRDVa8/+ofvArPMpAmxuH84MWIIXkWpHR27QRc
         vWig==
X-Forwarded-Encrypted: i=1; AJvYcCWGmKUzV+cXB+uGqIowurmzvqN2GlMgOiDGEpWIcDTVcvvRewPBFrglCiqQjpDImP0JW32zkQNrIN11qTLD6YxN@lists.infradead.org
X-Gm-Message-State: AOJu0YxiNRZEXVOdXlAMh8yMGYHjQBpUAoIp4Z6vNtopoYJbKHQMRcao
	Oo3lVaslVxlfcOVVdtKRCNXYcVxnl48p3VrCs9CmgN31gwvKSwsIptPD1uspdVT5eH4=
X-Gm-Gg: ASbGnct1SWEW7DUxNW+FU4fZu35MCrkSRiC4lwzMmoS1VEKfqI1EExfC78Yg/P5ug7C
	S58uDv3zSMl1rusP/6lQ/Q9nrDLzgJPwxwWEyC7iThQcvywzGLgikwyeKPRl7SzrjoifGfzXBmb
	buvfOW6A7T30SPpP7+hVO9FmXqjQiEN8FrlK27Znqj13jGe/gxB0G8Pw/9WIjXqcho2N+D/vbJ+
	cZ34tNbD9L26KTNUL0PFSJcyu1KBNxAjX7NNjp3mDIZeMnNkkgorvwPcNNmFqXjs/rMip8i73dI
	rG58WYcHJpdaOU9P4ks78gaKSuxRsuGrH+OxSeZVFEq7Al8ZbS8fde3xnaocjk0X8d4+xmSLkiw
	fWYulPWccnMl/ReZWSoQQauplVqKFiLxNr2qMrXJJV6zX5PFsy4qd1wZOuUsFZ/PDj4QIXuKlqS
	yYuKGyO429FXLhw3+5sA==
X-Google-Smtp-Source: AGHT+IEFUMDrJEcj1YdLI40b8qr8K1kgEr1NPgybegm0BhMiyY1WM8obZIXGtWivL6UxNUN6wVEB4g==
X-Received: by 2002:a05:600c:5249:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-477c10c858bmr13810195e9.4.1763717156078;
        Fri, 21 Nov 2025 01:25:56 -0800 (PST)
Received: from [192.168.0.39] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3aef57sm31489005e9.11.2025.11.21.01.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 01:25:55 -0800 (PST)
Message-ID: <85f08f72-7608-4076-a474-579eb4c7dc4c@linaro.org>
Date: Fri, 21 Nov 2025 11:25:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dmaengine: stm32-dma3: introduce ddata2dev helper
To: Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: dmaengine@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251103-dma3_improv-v1-0-57f048bf2877@foss.st.com>
 <20251103-dma3_improv-v1-4-57f048bf2877@foss.st.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20251103-dma3_improv-v1-4-57f048bf2877@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_012558_667359_CF733C63 
X-CRM114-Status: GOOD (  24.51  )
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



On 11/3/25 12:15, Amelie Delaunay wrote:
> ddata2dev helper returns the device pointer from struct dma_device stored
> in stm32_dma3_ddata structure.
> Device pointer from struct dma_device has been initialized with &pdev->dev,
> so the ddata2dev helper returns &pdev->dev.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  drivers/dma/stm32/stm32-dma3.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
> index 29ea510fa539..9f49ef8e2972 100644
> --- a/drivers/dma/stm32/stm32-dma3.c
> +++ b/drivers/dma/stm32/stm32-dma3.c
> @@ -333,6 +333,11 @@ static struct device *chan2dev(struct stm32_dma3_chan *chan)
>  	return &chan->vchan.chan.dev->device;
>  }
>  
> +static struct device *ddata2dev(struct stm32_dma3_ddata *ddata)
> +{
> +	return ddata->dma_dev.dev;
> +}

Not really sure how much this helper actually simplifies the code. To me
it appears as if there is no improvement, but this is a personal
preference.> +
>  static void stm32_dma3_chan_dump_reg(struct stm32_dma3_chan *chan)
>  {
>  	struct stm32_dma3_ddata *ddata = to_stm32_dma3_ddata(chan);
> @@ -392,6 +397,7 @@ static void stm32_dma3_chan_dump_hwdesc(struct stm32_dma3_chan *chan,
>  	} else {
>  		dev_dbg(chan2dev(chan), "X\n");
>  	}
> +
This newline here appears to be unintended >  }
>  
>  static struct stm32_dma3_swdesc *stm32_dma3_chan_desc_alloc(struct stm32_dma3_chan *chan, u32 count)
> @@ -1110,7 +1116,7 @@ static int stm32_dma3_alloc_chan_resources(struct dma_chan *c)
>  	struct stm32_dma3_ddata *ddata = to_stm32_dma3_ddata(chan);
>  	int ret;
>  
> -	ret = pm_runtime_resume_and_get(ddata->dma_dev.dev);
> +	ret = pm_runtime_resume_and_get(ddata2dev(ddata));
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1144,7 +1150,7 @@ static int stm32_dma3_alloc_chan_resources(struct dma_chan *c)
>  	chan->lli_pool = NULL;
>  
>  err_put_sync:
> -	pm_runtime_put_sync(ddata->dma_dev.dev);
> +	pm_runtime_put_sync(ddata2dev(ddata));
>  
>  	return ret;
>  }
> @@ -1170,7 +1176,7 @@ static void stm32_dma3_free_chan_resources(struct dma_chan *c)
>  	if (chan->semaphore_mode)
>  		stm32_dma3_put_chan_sem(chan);
>  
> -	pm_runtime_put_sync(ddata->dma_dev.dev);
> +	pm_runtime_put_sync(ddata2dev(ddata));
>  
>  	/* Reset configuration */
>  	memset(&chan->dt_config, 0, sizeof(chan->dt_config));
> @@ -1610,11 +1616,11 @@ static bool stm32_dma3_filter_fn(struct dma_chan *c, void *fn_param)
>  		if (!(mask & BIT(chan->id)))
>  			return false;
>  
> -	ret = pm_runtime_resume_and_get(ddata->dma_dev.dev);
> +	ret = pm_runtime_resume_and_get(ddata2dev(ddata));
>  	if (ret < 0)
>  		return false;
>  	semcr = readl_relaxed(ddata->base + STM32_DMA3_CSEMCR(chan->id));
> -	pm_runtime_put_sync(ddata->dma_dev.dev);
> +	pm_runtime_put_sync(ddata2dev(ddata));
>  
>  	/* Check if chan is free */
>  	if (semcr & CSEMCR_SEM_MUTEX)
> @@ -1636,7 +1642,7 @@ static struct dma_chan *stm32_dma3_of_xlate(struct of_phandle_args *dma_spec, st
>  	struct dma_chan *c;
>  
>  	if (dma_spec->args_count < 3) {
> -		dev_err(ddata->dma_dev.dev, "Invalid args count\n");
> +		dev_err(ddata2dev(ddata), "Invalid args count\n");
>  		return NULL;
>  	}
>  
> @@ -1645,14 +1651,14 @@ static struct dma_chan *stm32_dma3_of_xlate(struct of_phandle_args *dma_spec, st
>  	conf.tr_conf = dma_spec->args[2];
>  
>  	if (conf.req_line >= ddata->dma_requests) {
> -		dev_err(ddata->dma_dev.dev, "Invalid request line\n");
> +		dev_err(ddata2dev(ddata), "Invalid request line\n");
>  		return NULL;
>  	}
>  
>  	/* Request dma channel among the generic dma controller list */
>  	c = dma_request_channel(mask, stm32_dma3_filter_fn, &conf);
>  	if (!c) {
> -		dev_err(ddata->dma_dev.dev, "No suitable channel found\n");
> +		dev_err(ddata2dev(ddata), "No suitable channel found\n");
>  		return NULL;
>  	}
>  
> @@ -1665,6 +1671,7 @@ static struct dma_chan *stm32_dma3_of_xlate(struct of_phandle_args *dma_spec, st
>  
>  static u32 stm32_dma3_check_rif(struct stm32_dma3_ddata *ddata)
>  {
> +	struct device *dev = ddata2dev(ddata);
>  	u32 chan_reserved, mask = 0, i, ccidcfgr, invalid_cid = 0;
>  
>  	/* Reserve Secure channels */
> @@ -1676,7 +1683,7 @@ static u32 stm32_dma3_check_rif(struct stm32_dma3_ddata *ddata)
>  	 * In case CID filtering is not configured, dma-channel-mask property can be used to
>  	 * specify available DMA channels to the kernel.
>  	 */
> -	of_property_read_u32(ddata->dma_dev.dev->of_node, "dma-channel-mask", &mask);
> +	of_property_read_u32(dev->of_node, "dma-channel-mask", &mask);
>  
>  	/* Reserve !CID-filtered not in dma-channel-mask, static CID != CID1, CID1 not allowed */
>  	for (i = 0; i < ddata->dma_channels; i++) {
> @@ -1696,7 +1703,7 @@ static u32 stm32_dma3_check_rif(struct stm32_dma3_ddata *ddata)
>  				ddata->chans[i].semaphore_mode = true;
>  			}
>  		}
> -		dev_dbg(ddata->dma_dev.dev, "chan%d: %s mode, %s\n", i,
> +		dev_dbg(dev, "chan%d: %s mode, %s\n", i,
>  			!(ccidcfgr & CCIDCFGR_CFEN) ? "!CID-filtered" :
>  			ddata->chans[i].semaphore_mode ? "Semaphore" : "Static CID",
>  			(chan_reserved & BIT(i)) ? "denied" :
> @@ -1704,7 +1711,7 @@ static u32 stm32_dma3_check_rif(struct stm32_dma3_ddata *ddata)
>  	}
>  
>  	if (invalid_cid)
> -		dev_warn(ddata->dma_dev.dev, "chan%*pbl have invalid CID configuration\n",
> +		dev_warn(dev, "chan%*pbl have invalid CID configuration\n",
>  			 ddata->dma_channels, &invalid_cid);
>  
>  	return chan_reserved;
> 


