Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AC6EA3C4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 10:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diC0Gr1IYhIGgcqLTUwv/w+5+3AcqlMRR1F4lMh/V0U=; b=G+BkZe6xfnGqLx5dJsOqEM2/M0
	bRwDEaGopz0qLyNn4uEeRURGL6NLpy5g8ctB0rNv5mA9zDcVUlifZ9+DaVFMy2VKSu1fBioN+XfhQ
	Az4OVuyBsX3wrgc3wkR3tymt3Wm/RE0ptwJ7lnYsUwwpEwf7skbVqSuT2vAr8DLM0zDLY9opRuals
	R0+qUWafku5Thfg1Ru7umfZBFAshX1Pc8KnIaKnmggBFxWEVKvKuZXY0jP8ENPEQumrCZoXNzD13o
	x1zLNylh5C6noTbKhrvzu7OCb+G5Uvo8czlROb5DEKZSJAGmigC2L6/vjHvTdYgxOvGP1rcfrNDPk
	ZcB6O0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmzg-0000000AByz-0ctL;
	Thu, 09 Apr 2026 10:52:16 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmzZ-0000000ABxp-2dbI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 10:52:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488afb0427eso10147815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 03:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775731928; x=1776336728; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=diC0Gr1IYhIGgcqLTUwv/w+5+3AcqlMRR1F4lMh/V0U=;
        b=F4YDjYX/pR5me9uewgURa6JNo28aAnMXFQUNSZgFEOYaiBQH7Atm43vnpJBYYsS0Rj
         bm8g/qHwDLe9yN2EwxBe5pdZRX81himpLw/ms5peCEMZten/hN+sZPmpQMEYSIZ+K19v
         TkmO+wVE5gF9oOb+SCSUkNnRjAeLjR6OWFPTrxaisJmIi0lXB8yToSIeXtV2KFEn4SIU
         bJNGyHjOWVsPlMxP/20DjJeORm1TvlEOKEu3HQ3l6l+55tErbue9PQ+Rh14rc5cf5d66
         WqzKCbx3AoNp+3zBEYOYJHiogj+xGQVeo6hSl9Ce2FiaSHIul7kOUJ5cXyQQ//yXeK6Z
         6FmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775731928; x=1776336728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=diC0Gr1IYhIGgcqLTUwv/w+5+3AcqlMRR1F4lMh/V0U=;
        b=b74T70WbMuVqjhuXC/HpVeLyfn6NkAsB0rP9R92csy9tTzXGFQeCPzY/eoS56AsVkF
         3FY2QIqUj5Qmxx9iM9bAvBI9LBMM7sdiOupkIDCxzVi+uyZwwC2bJcFJx92/3ctu71Vd
         rp7HnuU3PGZSUN4w7iOovjkLn4iuX4cijcjR2h4UuB31K5Jpj5G+02uBZGoz+md1c5P/
         v4tCsGYIgGKUJji94dRlYmu0fv5AJSJOeho0xLxjqTY2KVOYi3AaqFTnGFhWfxlCisb+
         1rL/B3epc8CFXdCJihIEaUHqhF5ahsXQpeyqFI1G6XCDzfcHHZPsXrX6w7dKZKGeM35L
         /P3w==
X-Forwarded-Encrypted: i=1; AJvYcCXhiI+G7AiS2AhGLDLhe80XYOlSfbaa5lMdTIssRitsOia/LBg+erQEmw0ixOb5daTvRf7UYdw2fKyKSv5jQzcG@lists.infradead.org
X-Gm-Message-State: AOJu0Yys7sc8CQzCJqVLJn5pFpqWYLBwdnh/OFraBErGHJXYyH41fBIw
	7r5NArXwu0WaYpGiPfyh+4NdTE6QgjWuOpAO/Ycupvx82uI2z/zONEO9xYLekLy6YAc=
X-Gm-Gg: AeBDiesPurOXmHILq2mWYPNI2odiBZ81qzXBhtXPZPJLbITiZgUcqq7dloGk+OrNvZq
	A2aaEnynVE6D0R+vIS4NLBw2ZuYXc0nuaR2Gmf/l2V6N02zRFhTu7LwftkFOXKKdGWRTgDL4YSi
	hrAsyiA2/HuZBg/yjzmiOx3a5EpvnwAejnwEcBvRdvEiKF8EYyEXH8olhf/8T8+IERLXw1UsfBZ
	iSiL34UGZYeU3sHneDbpN7iwYgfHvddEXaZPhBbWlibeRBsrIVFonXdG8sbWsHpRxXvhVpBXlIp
	nvfCQYiJx9/FBDPCpHRkSZKAJoASQHKdMBqLXDWE0IjtoTEJvpLiWx59/gn0OhdcJkiPPDVch+G
	Xgo1in3cRmLYVwMGzNuVZaZcjdeVetNifWQWhIoI1Bi9W4O5oa1w+vvg8zwt7zhmhXgj1PfEi22
	hjs+/xYztQ0YopNIyjkH+u4oBYHhEd
X-Received: by 2002:a05:6000:2084:b0:43d:1e22:26c9 with SMTP id ffacd0b85a97d-43d292e24f4mr35429541f8f.42.1775731927489;
        Thu, 09 Apr 2026 03:52:07 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm63199443f8f.30.2026.04.09.03.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 03:52:07 -0700 (PDT)
Message-ID: <e2241b98-92a6-45e0-a9d3-061f1ed69ae1@linaro.org>
Date: Thu, 9 Apr 2026 11:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 17/20] coresight: trbe: Save and restore state across
 CPU low power state
To: Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>,
 Keita Morisaki <keyz@google.com>, Yuanfang Zhang
 <quic_yuanfang@quicinc.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
 <20260405-arm_coresight_path_power_management_improvement-v10-17-13e94754a8be@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-17-13e94754a8be@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_035209_727005_A69D9086 
X-CRM114-Status: GOOD (  30.65  )
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



On 05/04/2026 4:02 pm, Leo Yan wrote:
> From: Yabin Cui <yabinc@google.com>
> 
> TRBE context can be lost when a CPU enters low power states.  If a trace
> source is restored while TRBE is not, tracing may run without an active
> sink, which can lead to hangs on some devices (e.g., Pixel 9).

Can't this still happen if saving the source times out on "wait for 
TRCSTATR.IDLE to go up"?

That would make coresight_pm_save() exit early, not saving the active 
TRBE state. Then when coresight_pm_restore() is called it restores a 
stale inactive sink, then enables the source again which is the state 
that can hang.

> 
> The save and restore flows are described in the section K5.5 "Context
> switching" of Arm ARM (ARM DDI 0487 L.a). This commit adds save and
> restore callbacks with following the software usages defined in the
> architecture manual.
> 
> During the restore flow, since TRBLIMITR_EL1.E resets to 0 on a warm
> reset, the trace buffer unit is disabled when idle resume, it is safe to
> restore base/pointer/status registers first and program TRBLIMITR_EL1
> last.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> Tested-by: James Clark <james.clark@linaro.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: James Clark <james.clark@linaro.org>
> Co-developed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 59 +++++++++++++++++++++++++++-
>   1 file changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index 14e35b9660d76e47619cc6026b94929b3bb3e02b..c7cbca45f2debd4047b93283ea9fe5dd9e1f2ebf 100644
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
> @@ -1189,6 +1204,46 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	return IRQ_HANDLED;
>   }
>   
> +static int arm_trbe_save(struct coresight_device *csdev)
> +{
> +	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
> +	struct trbe_save_state *state = &cpudata->save_state;
> +
> +	state->trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
> +
> +	/* Disable the unit, ensure the writes to memory are complete */
> +	if (state->trblimitr & TRBLIMITR_EL1_E)
> +		trbe_drain_and_disable_local(cpudata);
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
> +	write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1);
> +	write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
> +	write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
> +
> +	if (!(state->trblimitr & TRBLIMITR_EL1_E)) {
> +		write_sysreg_s(state->trblimitr, SYS_TRBLIMITR_EL1);
> +	} else {
> +		/*
> +		 * The section K5.5 Context switching, Arm ARM (ARM DDI 0487
> +		 * L.a), S_PKLXF requires a Context synchronization event to
> +		 * guarantee the Trace Buffer Unit will observe the new values
> +		 * of the system registers.
> +		 */
> +		isb();
> +		set_trbe_enabled(cpudata, state->trblimitr);
> +	}
> +}
> +
>   static const struct coresight_ops_sink arm_trbe_sink_ops = {
>   	.enable		= arm_trbe_enable,
>   	.disable	= arm_trbe_disable,
> @@ -1198,7 +1253,9 @@ static const struct coresight_ops_sink arm_trbe_sink_ops = {
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


