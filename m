Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BDFC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8L/9Mm00e3Yxhsk3w8MtBmvSjQ3BfRLFH4vhaVAtqsc=; b=zyoEuKPTCPJnU1m0AVt7jmOHek
	fVhMMCAipnpoqyGKPuv13hMppplgRyPhu5dEypt7Ii7ctUeci28jWTf20ApKQ/zXiH1cTR0EjzgOr
	f+zbq+anjpzpDiqRfCCX5qhcNWg7puAYDGlgpsgxg2Ja3EMyslyAbKW3vVzQfO+CWgtk/dUmlozeU
	fPa1b/xVYrdDLXUeZPzuaFtegk/xkTo18YPdJPVHj7eZT4atgkVUjKwiWy/MuY74y7fDDCFFLSj3t
	Xtel15kH6spdTPwwqUl6g8NMZvIuCfHe8duryHYzqnhLSbbNrKch21hpxI0yYfEzAx1Jjcmp0++gE
	8P1muIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS1y-0000000B5gV-2ySE;
	Tue, 03 Jun 2025 13:50:18 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRsI-0000000B4J5-0Ejo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:40:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so62107885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748958016; x=1749562816; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8L/9Mm00e3Yxhsk3w8MtBmvSjQ3BfRLFH4vhaVAtqsc=;
        b=a3U83Q0XysaPSqX2SRKeMmWTyIznXhyGB2Qf8I1HyCODVC3knEegu7YB+WZuekfSGk
         gq6l169Dvi0f6aVVlxN9+fk/ea74cBv4O/51l782xIMK2cSS6fxkSLHoQiERCyrIxJb0
         rRq/mQeVjj53H+vDSYWq+EWglXKbvihPYLodgxnFLL5Ib91IF0yxqExQTszOqQA89Uf1
         +qcwavs/NkKvr9WwD6WxAwMSMn9HuNjTI2zUnqCixHljuqogffrC6ho2IGMgoa0MfINc
         x+snkbW6SbbRoUTXj6uOQ5WflT33JsH4UnRtsILKfJ2YvBd9Y1ZtU3fNk87zD5vKtqDR
         feoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958016; x=1749562816;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8L/9Mm00e3Yxhsk3w8MtBmvSjQ3BfRLFH4vhaVAtqsc=;
        b=klRNRJwKnxr91HQcTbtBC6cPWX+mL1PfavR2zJ4xWrYdK61IHqWt9qeL5yJpNYvMnt
         5BCxKaJK4qaPWhJDv424CASAsUo266MsBMI3HsBUaQAmkMQGuChlgl6fsK5hyh5fiRY1
         YaZFuk0cCUcgWYBz6DyUKWydpUcedoRxLP8H151c2rtn2jl7Nf4UXe1xGTyIxqoHzOhB
         EwgDUp9xU4a1sDXF+ANiFclbxq53Pb7HVGLjw84bIWqc8c58ZQmY1zr9HmZJZrj7JB6s
         HS8VHA3Fh08xb7BrPzcT5ooK9ztK8+qRUlh09BpGbGSZPyuZ2yV/wva/8WEht0uCynft
         ITrw==
X-Forwarded-Encrypted: i=1; AJvYcCXnEKXMn75ejhba+ft56YET6bmeYKTmPjgwH8Fgtq5g+nqd6ssPRTxDpbumF8ALq2zIg7cHrB4le1Y5Ei4Sbcsd@lists.infradead.org
X-Gm-Message-State: AOJu0YwTaEMdhggb1YEze1GeT+bqE3DbJE+b3oIqffsSsGd2rNUWN67z
	LRqeM0mjElaIX/NQl+TdNxj09pcnUERAOiKGrfxLJj9zN6ZGKxR5kO3C7jZHX4GkvsA=
X-Gm-Gg: ASbGnctev5qJTTRwwmxbyIIRBowVqQftH3XKFh26VUZfPQL2k+RntAGzCY7OXO2NGLy
	96Y5pIrek+eBTtbHSMrtC1tqtnzI/bfSN7uGiCTA3GcclmexuwUfM8himL6UfzkZtmRRlRbZVBU
	VJI0FvMaghKnc+3PjFWVjAk+SvYf0jxBwwiqwo3466guEchfpykCP58+AuNfhUVyXqIOZiMZha0
	Wkki0O4HUHjPMcsTJOZ4XTEGl7zNcOvPTAWdL0oigcygUuFxRmI9CtSGi1BhNIQgVouBLNLeu4w
	hLesNkjBcfnz7AHbtoIX+xmFzEBa4DJ4mcyHT0XqcSRvJFKxAaw8XryU
X-Google-Smtp-Source: AGHT+IHLLaZ+u2FWYKd09LLXdxf8QC7KuJZ8jzpuGukv+y309xzr6qBeBIYA9pNOvzpPA300VUgJZw==
X-Received: by 2002:a05:6000:2008:b0:3a4:cfbf:51ae with SMTP id ffacd0b85a97d-3a4fe154ecfmr9656829f8f.4.1748958016386;
        Tue, 03 Jun 2025 06:40:16 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009748fsm18095059f8f.80.2025.06.03.06.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 06:40:15 -0700 (PDT)
Message-ID: <f8ef3a37-2be2-4c07-bd88-888fedc4cd4d@linaro.org>
Date: Tue, 3 Jun 2025 14:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] coresight: etm4x: Control the trace unit in CPU
 suspend
To: Leo Yan <leo.yan@arm.com>
References: <20250516160742.1200904-1-leo.yan@arm.com>
 <20250516160742.1200904-2-leo.yan@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, Yabin Cui <yabinc@google.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250516160742.1200904-2-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_064018_110067_09C595FF 
X-CRM114-Status: GOOD (  25.38  )
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



On 16/05/2025 5:07 pm, Leo Yan wrote:
> If a trace unit has been enabled, a CPU suspend operation misses to
> disable the trace unit.  After the CPU resumes, it also does not follow
> the general flow for re-enabling the trace unit.  As a result, this may
> lead to a wrong state machine for the ETM.
> 
> This commit stops the trace unit during the CPU suspend flow and
> re-enables the trace unit in the resume flow.
> 
> Fixes: f188b5e76aae ("coresight: etm4x: Save/restore state across CPU low power states")
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 6a5898355a83..b12d59b89a49 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1820,6 +1820,11 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   	state = drvdata->save_state;
>   
>   	state->trcprgctlr = etm4x_read32(csa, TRCPRGCTLR);
> +
> +	/* Stop the trace unit if it is enabled */
> +	if (state->trcprgctlr)

etm4_cpu_save() looks at coresight_get_mode() to determine enabled 
state. Seems a bit inconsistent to look directly at the enable bit right 
after checking coresight_get_mode().

> +		etm4_disable_trace_unit(drvdata);
> +

Section 3.4.1 in ARM IHI 0064H.b doesn't say that anything extra needs 
to be done here, and it implies that restoring to an enabled state 
should work. It might make sense to mention why it diverges from the 
published sequence. Or get the sequence updated? I suppose that document 
doesn't include ETE and I see there is one extra register missing from 
__etm4_cpu_save() which is written to in etm4_disable_trace_unit().

Plus we end up doing extra things like two waits on TRCSTATR.PMSTABLE.

>   	if (drvdata->nr_pe)
>   		state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
>   	state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
> @@ -1951,7 +1956,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   	etm4_cs_unlock(drvdata, csa);
>   	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
>   
> -	etm4x_relaxed_write32(csa, state->trcprgctlr, TRCPRGCTLR);
>   	if (drvdata->nr_pe)
>   		etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
>   	etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
> @@ -2035,6 +2039,15 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   
>   	/* Unlock the OS lock to re-enable trace and external debug access */
>   	etm4_os_unlock(drvdata);
> +
> +	/*
> +	 * Re-enable the trace unit if it was enabled before suspend.
> +	 * Put it after etm4_os_unlock() as unlocking the OS lock is the
> +	 * prerequisite for enabling the trace unit.
> +	 */
> +	if (state->trcprgctlr)
> +		etm4_enable_trace_unit(drvdata);
> +
>   	etm4_cs_lock(drvdata, csa);
>   }
>   


