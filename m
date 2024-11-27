Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A87D6ACF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vy2xlTbgPnYX5SFsXNs+vGxKtjPPkFsz8owHPBZ67wE=; b=NOdF7sxocnZkF8MHWrb/gAfoKs
	HiyIVcsbmiy0Z8utCOkwHhBRtLukoJCVqSOA9lsyM5cr93dqYRsYpp7zjLhR8hVGQllb5k75TMj3Y
	6IqExDGFM7aqNgb3uU45h7Kr+k9ckYONVxG7fVM05Y2SS/1Z9J4pJfDHGd4INee4FO5DexL20Nzrv
	c5uEuYCfXmrwNaUwk8vkg0cb2zg8ZKYbBRhyMCTukGrLKsiWJrHA79TA0E8+7OU//IRvRqnyKKgIb
	hxErtAsn/DJ+224wWwRt0M1bTWgt2mmSni/AzJbakVMhR5O5yD3CaopYiDBRXeq8l9J3AZdbbqtg+
	oxagVbfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKwq-0000000Ddno-0O7M;
	Wed, 27 Nov 2024 16:31:28 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKvr-0000000DdV4-1BEL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:30:28 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53df1e063d8so933349e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 08:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732725025; x=1733329825; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vy2xlTbgPnYX5SFsXNs+vGxKtjPPkFsz8owHPBZ67wE=;
        b=ORjkHW+w3Zb7TFsKvtG2ceOKZ5sIbaeOJ6+aPUrFP+j9jZf4cgt5Fsjr9MrkEjM/JM
         L2L2L40XIV6L/Ri7sHNyYab6YNGKt2l82BBBHEQtKy6LnqrWKzwTC1MXdw8nWQS8mF6U
         QhOIu0+RCjR4dWfbmiUAv7ANseOEL0qYfK9gloAx2nT6pMElHIDXHoSSJYEAZwWQerhe
         2EWlT8SprKRXb1dwTnyFTdqul70T/jrfR5W5wd+8YBa86T0ozvKqSjNxdyHNlzskvTI5
         X6A9BXz5tp3IlWwMt4HX9qfFSz7DjFoSHqb/iQZa3UTqGO+d2rpWQ1GdaOL9pNMfKbQ2
         CvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732725025; x=1733329825;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vy2xlTbgPnYX5SFsXNs+vGxKtjPPkFsz8owHPBZ67wE=;
        b=C4p75qd9+UKdkVwR/3lXduN7QZOmnLMzYa3jrKKVkP1R5aRd/JH1M0jD8Bdb7ez2pU
         el4n+anFH4tIHxFI6rM2KNSUQQ2c6IcwyJ+bpYbu9GK0BgtrjrbhWtqNln56xfJvpBsS
         fouQCHl6rJ2m6MtjTMv9MJi4JzavTQ3lbbUyNTdTM7BydH40K0RJJ49JVzyBV9YEqFab
         YqT1p0KQPl96kuSZ38ZWlv8BdM7TycRm/vJpQ6tOHvC/OZPkny8UVoJlhk78LGEVJucy
         WzUIQh8rQQZA/pbGjmsYw8MHZDGOMMPU3f2td4ghzfnvuKhWr4uQ+/bKbevgI9+IW4uD
         K7xA==
X-Forwarded-Encrypted: i=1; AJvYcCVKlXudTY2nKWqQ+pFjGZn4EP9H6cy9MkzugUZ3oGtFkaEejIMSoFHnN0wj7UhfVIQpfxBzNo3b+3GSPr2dbTI/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5RNv0CNdGuV4lZNrs3+IcmjnmCqp9j98jXtfC1A0BX15RTsch
	010kZ+Zo3lpAPoyyH2mPfjsTGH2SDWyz2OHJQ+4VM6v0pvICTrer9cRjNIMTMlc=
X-Gm-Gg: ASbGncvMxDq07uEGu9MOJ544lSY4sqIHlVzBpPS68NJANpMN9d2Pk1L2O4XYP6zhkz7
	KlNeQe+VRixWh0jN6zxRur1SDNZP/fO6FmRhFSciY4JrEzHvUnMsPVRR2rjFBB91R38I6r+GkQv
	w8xXQQD7wOCJDqX7DJeNImlURZ7uOUjvQXXxTQwu2MyWDlmFYYr7/3K8nZwI1T5FQK+GOtpe+Lb
	kVHDXJ7nEfoVi8DZYpJscPzzLJ8kBSyHuHnphz84FqD4krC1lFoSrpTqgFC
X-Google-Smtp-Source: AGHT+IHF0JIBFwJk4rP7zdQcbAHf6fXibvYGSKmQAXl1iioCcHPIlj4/oQChnGQ0j5nwZ2Yh87b58A==
X-Received: by 2002:a05:6512:3d04:b0:53d:de69:debd with SMTP id 2adb3069b0e04-53df00d05ecmr2373496e87.17.1732725024853;
        Wed, 27 Nov 2024 08:30:24 -0800 (PST)
Received: from [192.168.68.163] ([145.224.90.200])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d02a0fc5b5sm5712623a12.56.2024.11.27.08.30.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 08:30:23 -0800 (PST)
Message-ID: <ec11e7f4-ed82-44eb-8e72-5a5094b67cda@linaro.org>
Date: Wed, 27 Nov 2024 16:30:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] coresight-etm4x: change etmv4_drvdata spinlock type
 to raw_spinlock_t
To: Yeoreum Yun <yeoreum.yun@arm.com>, suzuki.poulose@arm.com,
 mike.leach@linaro.org
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, nd@arm.com,
 alexander.shishkin@linux.intel.com, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org
References: <20241125094816.365472-1-yeoreum.yun@arm.com>
 <20241125094816.365472-3-yeoreum.yun@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241125094816.365472-3-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_083027_341512_A5083EC2 
X-CRM114-Status: GOOD (  27.68  )
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



On 25/11/2024 9:48 am, Yeoreum Yun wrote:
> From: Levi Yun <yeoreum.yun@arm.com>
> 
> In coresight-etm4x drivers, etmv4_drvdata->spinlock can be held during
> __schedule() by perf_event_task_sched_out()/in().
> 
> Since etmv4_drvdata->spinlock type is spinlock_t and
> perf_event_task_sched_out()/in() is called after acquiring rq_lock,
> which is raw_spinlock_t (an unsleepable lock),
> this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.
> 
> To address this, change type etmv4_drvdata->spinlock
> in coresight-etm4x drivers, which can be called
> by perf_event_task_sched_out()/in(), from spinlock_t to raw_spinlock_t.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

[...]

> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index a9f19629f3f8..2e6b79c37f87 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -174,99 +174,99 @@ static ssize_t reset_store(struct device *dev,
>   	if (kstrtoul(buf, 16, &val))
>   		return -EINVAL;
>   
> -	spin_lock(&drvdata->spinlock);
> -	if (val)
> -		config->mode = 0x0;
> +	scoped_guard(raw_spinlock, &drvdata->spinlock) {
> +		if (val)
> +			config->mode = 0x0;
>   
> -	/* Disable data tracing: do not trace load and store data transfers */
> -	config->mode &= ~(ETM_MODE_LOAD | ETM_MODE_STORE);
> -	config->cfg &= ~(TRCCONFIGR_INSTP0_LOAD | TRCCONFIGR_INSTP0_STORE);
> +		/* Disable data tracing: do not trace load and store data transfers */
> +		config->mode &= ~(ETM_MODE_LOAD | ETM_MODE_STORE);
> +		config->cfg &= ~(TRCCONFIGR_INSTP0_LOAD | TRCCONFIGR_INSTP0_STORE);
>   
> -	/* Disable data value and data address tracing */
> -	config->mode &= ~(ETM_MODE_DATA_TRACE_ADDR |
> -			   ETM_MODE_DATA_TRACE_VAL);
> -	config->cfg &= ~(TRCCONFIGR_DA | TRCCONFIGR_DV);
> +		/* Disable data value and data address tracing */
> +		config->mode &= ~(ETM_MODE_DATA_TRACE_ADDR |
> +				   ETM_MODE_DATA_TRACE_VAL);
> +		config->cfg &= ~(TRCCONFIGR_DA | TRCCONFIGR_DV);
>   
> -	/* Disable all events tracing */
> -	config->eventctrl0 = 0x0;
> -	config->eventctrl1 = 0x0;
> +		/* Disable all events tracing */
> +		config->eventctrl0 = 0x0;
> +		config->eventctrl1 = 0x0;
>   
> -	/* Disable timestamp event */
> -	config->ts_ctrl = 0x0;
> +		/* Disable timestamp event */
> +		config->ts_ctrl = 0x0;
>   
> -	/* Disable stalling */
> -	config->stall_ctrl = 0x0;
> +		/* Disable stalling */
> +		config->stall_ctrl = 0x0;
>   
> -	/* Reset trace synchronization period  to 2^8 = 256 bytes*/
> -	if (drvdata->syncpr == false)
> -		config->syncfreq = 0x8;
> +		/* Reset trace synchronization period  to 2^8 = 256 bytes*/
> +		if (drvdata->syncpr == false)
> +			config->syncfreq = 0x8;
>   
> -	/*
> -	 * Enable ViewInst to trace everything with start-stop logic in
> -	 * started state. ARM recommends start-stop logic is set before
> -	 * each trace run.
> -	 */
> -	config->vinst_ctrl = FIELD_PREP(TRCVICTLR_EVENT_MASK, 0x01);
> -	if (drvdata->nr_addr_cmp > 0) {
> -		config->mode |= ETM_MODE_VIEWINST_STARTSTOP;
> -		/* SSSTATUS, bit[9] */
> -		config->vinst_ctrl |= TRCVICTLR_SSSTATUS;
> -	}
> +		/*
> +		 * Enable ViewInst to trace everything with start-stop logic in
> +		 * started state. ARM recommends start-stop logic is set before
> +		 * each trace run.
> +		 */
> +		config->vinst_ctrl = FIELD_PREP(TRCVICTLR_EVENT_MASK, 0x01);
> +		if (drvdata->nr_addr_cmp > 0) {
> +			config->mode |= ETM_MODE_VIEWINST_STARTSTOP;
> +			/* SSSTATUS, bit[9] */
> +			config->vinst_ctrl |= TRCVICTLR_SSSTATUS;
> +		}
>   
> -	/* No address range filtering for ViewInst */
> -	config->viiectlr = 0x0;
> +		/* No address range filtering for ViewInst */
> +		config->viiectlr = 0x0;
>   
> -	/* No start-stop filtering for ViewInst */
> -	config->vissctlr = 0x0;
> -	config->vipcssctlr = 0x0;
> +		/* No start-stop filtering for ViewInst */
> +		config->vissctlr = 0x0;
> +		config->vipcssctlr = 0x0;
>   
> -	/* Disable seq events */
> -	for (i = 0; i < drvdata->nrseqstate-1; i++)
> -		config->seq_ctrl[i] = 0x0;
> -	config->seq_rst = 0x0;
> -	config->seq_state = 0x0;
> +		/* Disable seq events */
> +		for (i = 0; i < drvdata->nrseqstate-1; i++)
> +			config->seq_ctrl[i] = 0x0;
> +		config->seq_rst = 0x0;
> +		config->seq_state = 0x0;
>   
> -	/* Disable external input events */
> -	config->ext_inp = 0x0;
> +		/* Disable external input events */
> +		config->ext_inp = 0x0;
>   
> -	config->cntr_idx = 0x0;
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> -		config->cntrldvr[i] = 0x0;
> -		config->cntr_ctrl[i] = 0x0;
> -		config->cntr_val[i] = 0x0;
> -	}
> +		config->cntr_idx = 0x0;
> +		for (i = 0; i < drvdata->nr_cntr; i++) {
> +			config->cntrldvr[i] = 0x0;
> +			config->cntr_ctrl[i] = 0x0;
> +			config->cntr_val[i] = 0x0;
> +		}
>   
> -	config->res_idx = 0x0;
> -	for (i = 2; i < 2 * drvdata->nr_resource; i++)
> -		config->res_ctrl[i] = 0x0;
> +		config->res_idx = 0x0;
> +		for (i = 2; i < 2 * drvdata->nr_resource; i++)
> +			config->res_ctrl[i] = 0x0;
>   
> -	config->ss_idx = 0x0;
> -	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> -		config->ss_ctrl[i] = 0x0;
> -		config->ss_pe_cmp[i] = 0x0;
> -	}
> +		config->ss_idx = 0x0;
> +		for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> +			config->ss_ctrl[i] = 0x0;
> +			config->ss_pe_cmp[i] = 0x0;
> +		}
>   
> -	config->addr_idx = 0x0;
> -	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
> -		config->addr_val[i] = 0x0;
> -		config->addr_acc[i] = 0x0;
> -		config->addr_type[i] = ETM_ADDR_TYPE_NONE;
> -	}
> +		config->addr_idx = 0x0;
> +		for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
> +			config->addr_val[i] = 0x0;
> +			config->addr_acc[i] = 0x0;
> +			config->addr_type[i] = ETM_ADDR_TYPE_NONE;
> +		}
>   
> -	config->ctxid_idx = 0x0;
> -	for (i = 0; i < drvdata->numcidc; i++)
> -		config->ctxid_pid[i] = 0x0;
> +		config->ctxid_idx = 0x0;
> +		for (i = 0; i < drvdata->numcidc; i++)
> +			config->ctxid_pid[i] = 0x0;
>   
> -	config->ctxid_mask0 = 0x0;
> -	config->ctxid_mask1 = 0x0;
> +		config->ctxid_mask0 = 0x0;
> +		config->ctxid_mask1 = 0x0;
>   
> -	config->vmid_idx = 0x0;
> -	for (i = 0; i < drvdata->numvmidc; i++)
> -		config->vmid_val[i] = 0x0;
> -	config->vmid_mask0 = 0x0;
> -	config->vmid_mask1 = 0x0;
> +		config->vmid_idx = 0x0;
> +		for (i = 0; i < drvdata->numvmidc; i++)
> +			config->vmid_val[i] = 0x0;
>   
> -	spin_unlock(&drvdata->spinlock);
> +		config->vmid_mask0 = 0x0;
> +		config->vmid_mask1 = 0x0;
> +	}

There's a lot of churn in this function just to use the new scoped 
guard, but there was only one lock and unlock anyway. There are a few 
other cases of this in the whole set.

The scoped guards make it easier to write correct code, but I'm not sure 
we gain anything here other than a bigger diff and more to review by 
changing already working code. Having said that I did review all the 
changes and I'm pretty sure they're all ok, so I'm on the fence about 
whether it's worth going back and undoing all of them.

Surely updating to raw spinlocks is a search and replace to fix a 
specific problem, and the scoped guard stuff can be done on a case by 
case basis when anything is re-written in the future?

I don't know if we're considering a fixes tag, if PREEMPT_RT is 6.12? 
It's probably not necessary but if so we definitely want to minimise the 
change.


