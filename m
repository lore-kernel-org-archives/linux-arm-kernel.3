Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3208BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaShWNrh8xqJsChqLQXbq/S6v28mwBiwc0lzJT4p18c=; b=riuBr5Let5TmFVnJwn3nawPVkM
	XCaFfGgeQj4+ro7DKR7kZz8F5katHSrw9C49yKPyhU5o7Duqdeg/VcegBZXOYK6xMip6VlAG935++
	bNdCsRPFRl0IPJNSVSqM8chvvIDps7kZnN+/Ttm0iQSwk3+G/e1lyoNU1pE2MMJflWigPnlNk1/gv
	R89ovzq4DFPGV2B2HuGpysH9ioaE9g8lCRnL1BwZktGIurgqsLwIrlTpn7CvQ9ble0CgAgcc8/h8K
	DU0L53k+7HnARbZidJsK0kDto1PJ+C+X4mEhl7j0PozlCNPW7p9iYzgkyZ4N9ayjMdAaygaaZ8+nC
	j/+1wSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQa8-00000005MwP-3Jtt;
	Mon, 10 Nov 2025 12:01:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQa3-00000005MvS-0wop
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:01:11 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42b32ff5d10so658880f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776065; x=1763380865; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WaShWNrh8xqJsChqLQXbq/S6v28mwBiwc0lzJT4p18c=;
        b=inaoNQaytRUz9c1XnBjBemcjqgrYpB7Br7ITWuzazA2+MfWdbsrtUAGSOzL1w+PUZV
         WC19kX+SyBBn37yL8Y7kMy32IJ/B5cadGSXm5tAANdVR53jnwY4EKYKOdbp8zOqYjJSO
         xscO5bU5XLhLWfolIzmyDuKqBNZGdRukvXDxNeJ2bj+VxDPRMqmx1JC3uZEHIQG80cZS
         +W0RsZR7ypjXEoxNf3B1w1klE4VkdAUYtWhHCP/EnFimi8c+T0lBn3DW0APFDyi82cjU
         tK2tOwui4HGGTpm1G1r7r26LbtufB3Gh5uGFO4P3seBCn93L6GvW8a3317/RP+H1F3z3
         98jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776065; x=1763380865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaShWNrh8xqJsChqLQXbq/S6v28mwBiwc0lzJT4p18c=;
        b=G5O/ZOPcAVyujncCMdVCywuiNfmQtRhW18DxZy4jLihRpmqu7ZCaY/QIB5/Wjj8qkJ
         DMf37bwE6UyP8E8/9UIFB7Q0+n2WZ2oHeSe28nlKSp9icClhIXs3M0V+SdN7W20YVl/X
         HdVsO6RNIzMxnKZMTViEiR7+eSyZ+M5EZOIotnMT8Y/riWb/ezpvx29duSayHZnUT8rT
         c5jrZpDtkrVY8dNfhcZS7wieawjryy5osBnfsrKBT67PYc/bGuvpURrlsvgNuqrpEuEg
         Wi4AndJfg5MHazoaz250fxTv5TGIb5QXFTjUgfvdcN2Fv6y64dRdd/efbn01kRDonM0L
         KqCA==
X-Forwarded-Encrypted: i=1; AJvYcCXEbgJRxGuuaQWCWvhsbgK2r5BmwqigfmYNMrDpZyhU1GeCE2sEVR46ZV3Io9plHmE6zRiuHKNOp9k/GkDpYiZd@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn4tK+UR8d0b4ODjaJc7urSilv5cg6U3zxSE1JzOjUPGM0MH/F
	Vv9hPU2pETzV0M8jjvZmBPGpbFIXsg4hxs0EEBrPRVP+zkKp+8IFLAgBRBDJjtVi4uk=
X-Gm-Gg: ASbGnctSNWUPWpIHkt8CZkYfS3qBvKhHkNeEtTIMa9SbPy+AhGoW6iOYQ5+fEJeWkwo
	QwZaaByQsy416GU5TnOTrNJ4g2IH7P5PX3KZNMYWMqPtVYnbFX2dqC3rJTHEJ6mnOLvb6N8Jcst
	M1OUNn9Rhg664/cx8HuVzUWRltMHLvq3C9TJfv8bRH7n0q7H2DS/W5uugTuXchV6R6s2KYq/6On
	4bFfWwjSDVany9vVaHY4ybdZGANsyPELfH5jIbplJdmovFvZyc99VhymdW7MnK9DwAeIiaFGRaO
	2oPyFE1LQ5nCDjZRj3fI4MnTxn/BqhDxouVaVSl7od3haBMl/xkfVZ2bAqBDMCq6KpFIROy20Kd
	gcIK/oCLpYR0oLG7Wgje9uqnHn2MDKBtaUZmPxmHV4AkCE5EqTuKBGY1+RxgICHSfAcPLSFNiqu
	kdgO4W82pCNc2jckOAxopNPCjthl8=
X-Google-Smtp-Source: AGHT+IFHXiJfQOsei5FeiIX7TY7RDuzWN8+54PxT+rKzAObbcVV1CiuAO99mbIKkD+YHpAY5lotwEg==
X-Received: by 2002:a05:6000:1848:b0:428:3d14:7378 with SMTP id ffacd0b85a97d-42b26fc3e26mr8297649f8f.24.1762776065165;
        Mon, 10 Nov 2025 04:01:05 -0800 (PST)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b322d533dsm11129513f8f.0.2025.11.10.04.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 04:01:04 -0800 (PST)
Message-ID: <61dc6f04-41da-4272-82b1-1789201eb06d@linaro.org>
Date: Mon, 10 Nov 2025 12:01:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] coresight: trbe: Save and restore state across
 CPU low power state
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Yuanfang Zhang <quic_yuanfang@quicinc.com>
References: <20251104-arm_coresight_path_power_management_improvement-v4-0-3d4bba674709@arm.com>
 <20251104-arm_coresight_path_power_management_improvement-v4-13-3d4bba674709@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20251104-arm_coresight_path_power_management_improvement-v4-13-3d4bba674709@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_040107_303688_7B76ADC7 
X-CRM114-Status: GOOD (  32.01  )
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



On 04/11/2025 3:21 pm, Leo Yan wrote:
> From: Yabin Cui <yabinc@google.com>
> 
> Similar to ETE, TRBE may lose its context when a CPU enters low power
> state. To make things worse, if ETE is restored without TRBE being
> restored, an enabled source device with no enabled sink devices can
> cause CPU hang on some devices (e.g., Pixel 9).
> 
> The save and restore flows are described in the section K5.5 "Context
> switching" of Arm ARM (ARM DDI 0487 L.a). This commit adds save and
> restore callbacks with following the software usages defined in the
> architecture manual.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Co-developed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 84 +++++++++++++++++++++++++++-
>   1 file changed, 83 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 3c82ab4394fde1e3dd4371a9b1703da4d8f6db9d..9888a153bc2f99b4826f6103bdbc12304c9c94cb 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -116,6 +116,20 @@ static int trbe_errata_cpucaps[] = {
>    */
>   #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES	256
>   
> +/*
> + * struct trbe_save_state: Register values representing TRBE state
> + * @trblimitr		- Trace Buffer Limit Address Register value
> + * @trbbaser		- Trace Buffer Base Register value
> + * @trbptr		- Trace Buffer Write Pointer Register value
> + * @trbsr		- Trace Buffer Status Register value
> + */
> +struct trbe_save_state {
> +	u64 trblimitr;
> +	u64 trbbaser;
> +	u64 trbptr;
> +	u64 trbsr;
> +};
> +
>   /*
>    * struct trbe_cpudata: TRBE instance specific data
>    * @trbe_flag		- TRBE dirty/access flag support
> @@ -134,6 +148,7 @@ struct trbe_cpudata {
>   	enum cs_mode mode;
>   	struct trbe_buf *buf;
>   	struct trbe_drvdata *drvdata;
> +	struct trbe_save_state save_state;
>   	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
>   };
>   
> @@ -1189,6 +1204,71 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	return IRQ_HANDLED;
>   }
>   
> +static int arm_trbe_save(struct coresight_device *csdev)
> +{
> +	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
> +	struct trbe_save_state *state = &cpudata->save_state;
> +
> +	if (cpudata->mode == CS_MODE_DISABLED)
> +		return 0;
> +
> +	/*
> +	 * According to the section K5.5 Context switching, Arm ARM (ARM DDI
> +	 * 0487 L.a), the software usage VKHHY requires a TSB CSYNC instruction
> +	 * to ensure the program-flow trace is flushed, which has been executed
> +	 * in ETM driver.
> +	 */
> +
> +	/* Disable trace buffer unit */
> +	state->trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
> +	write_sysreg_s(state->trblimitr & ~TRBLIMITR_EL1_E, SYS_TRBLIMITR_EL1);
> +
> +	/*
> +	 * Execute a further Context synchronization event. Ensure the writes to
> +	 * memory are complete.
> +	 */
> +	trbe_drain_buffer();
> +
> +	/* Synchronize the TRBE disabling */
> +	isb();

Can we use set_trbe_disabled() here, and set_trbe_enabled() for restore 
below. There is a bit of duplication and they do the same thing except 
this version here always has trbe_drain_buffer() rather than it being 
conditional. I'm not sure if that is correct as they should both be the 
same?

set_trbe_disabled() already reads TRBLIMITR_EL1 so you can return it.

> +
> +	state->trbbaser = read_sysreg_s(SYS_TRBBASER_EL1);
> +	state->trbptr = read_sysreg_s(SYS_TRBPTR_EL1);
> +	state->trbsr = read_sysreg_s(SYS_TRBSR_EL1);
> +	return 0;
> +}
> +
> +static void arm_trbe_restore(struct coresight_device *csdev)
> +{
> +	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
> +	struct trbe_save_state *state = &cpudata->save_state;
> +
> +	if (cpudata->mode == CS_MODE_DISABLED)
> +		return;
> +
> +	write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1);
> +	write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
> +	write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
> +	write_sysreg_s(state->trblimitr & ~TRBLIMITR_EL1_E, SYS_TRBLIMITR_EL1);
> +
> +	/*
> +	 * According to the section K5.5 Context switching, Arm ARM (ARM DDI
> +	 * 0487 L.a), the software usage PKLXF requires a Context
> +	 * synchronization event to guarantee the Trace Buffer Unit will observe
> +	 * the new values of the System registers.
> +	 */
> +	isb();
> +
> +	/* Enable the Trace Buffer Unit */
> +	write_sysreg_s(state->trblimitr, SYS_TRBLIMITR_EL1);
> +
> +	/* Synchronize the TRBE enable event */
> +	isb();
> +
> +	if (trbe_needs_ctxt_sync_after_enable(cpudata))
> +		isb();

Especially this double isb() part shouldn't be duplicated as that could 
get broken in a refactor in the future.

> +}
> +
>   static const struct coresight_ops_sink arm_trbe_sink_ops = {
>   	.enable		= arm_trbe_enable,
>   	.disable	= arm_trbe_disable,
> @@ -1198,7 +1278,9 @@ static const struct coresight_ops_sink arm_trbe_sink_ops = {
>   };
>   
>   static const struct coresight_ops arm_trbe_cs_ops = {
> -	.sink_ops	= &arm_trbe_sink_ops,
> +	.pm_save_disable	= arm_trbe_save,
> +	.pm_restore_enable	= arm_trbe_restore,
> +	.sink_ops		= &arm_trbe_sink_ops,
>   };
>   
>   static ssize_t align_show(struct device *dev, struct device_attribute *attr, char *buf)
> 


