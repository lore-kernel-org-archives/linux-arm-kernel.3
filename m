Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F8ECCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Oq/GPmuBLsTY8Av2UJYLNH0P0AYmxlI1V5awo5gufM=; b=QmxI/hKRw81RJeIL5FqlKtRTU9
	vjtUG8jW2q4bcJXECutwe3nc3Nwto8W5RFz58x7D3nnrY6+ZoIWEYkoadCEYUDEGBwJ4mV6kl26Uc
	U6iD8qQADz5iYF2cZvve1nqd0kXqQffx3j3o+ziaYHKlx1stPwsFO/p7qpDkQek6V/42fSClmHqcb
	iE0/e52wzkA6Xy6OmxFwAoauiwjovDY30RwMqRwI8Xv85GmV0zL/ZHe635WRPS7xYxP+E+nRreKQ8
	JGCLyUpwkCxXVg013Xcn1nBNuLSkY3ZJ9KXz/oxudWJPFqPGm3hpnM2lteFVI2INIgLjXS91KR0gC
	AlTGFW9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlwX-00000007KOA-2m9c;
	Mon, 19 Oct 2026 11:54:17 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlwV-00000007KNU-2V4B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:54:16 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48b042c0728so504495f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 04:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792410853; x=1793015653; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Oq/GPmuBLsTY8Av2UJYLNH0P0AYmxlI1V5awo5gufM=;
        b=fwiAum2v8B/cDiW1KxPwXWmCu5dT4CwgdrPzUuccpzvzxBOK/CgHNVAicmI4I0ondz
         7Ze9lyLUMKyNmQFnL9XdJnw4MNRsU4owB3H5vcvDLibAjh1cTuioCBfw/M04RnfxYGNl
         DWS0aR6fbgKPNwXip8333/YlTiQcFKoQ96C7zEHxvzHdzcTZXFwSEUQ2f9KVGwA6Tdgp
         kji8Ycxecb1Y38DDDWVcARJOR4wiylzGftb0K41FZnfcvYYO6rUu8BPIiUs4FmdO+BsA
         6GxLD0gt0WB99pziOct7BvPli1H3rJ5a692xESBt7bM9dzgcrOICmw+OQsIc3GMECYQ6
         7W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410853; x=1793015653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Oq/GPmuBLsTY8Av2UJYLNH0P0AYmxlI1V5awo5gufM=;
        b=r6kkaqyn7iarzzbn4U/CdAEtaezIlbR9Y4GGGcM9FBoKz54zVnq21Ni871nK1G7nL0
         k9ahsvKo7YFCXEPAWwcpZ63tDlKfM12pZOfOab/6eQAoJ0hR/PKEFoGd2pBjQQY9IJtD
         4bpO6Bp7h+Q8d6A5Hf7T1iGuBIThqSztbtqgsfXonDZyjeshUXN5HfVf+/A/cWv22foz
         E52MBevedyD4XoNQpClZqW1lpfoZr37+MKl3dAPiA+6bTN4bklVsFvQpizbHHB1zn8/8
         lkjUzKO0fYnlRs5pWIJbTf0VX19OFGoC0+m79n30GImoPaFSIR8SvujWkz0W6EX0hNxo
         YYUQ==
X-Forwarded-Encrypted: i=1; AKwUvByTeJ4iFLwGjTJqjzEHfAGuRMlhkmQk9Lqc2arthydcKQD0ClSyugcd5dntYIvyfF6EczaVVd+QwCEd4ShXvgSu@lists.infradead.org
X-Gm-Message-State: AFq9FYKVlUumLw2NfTjO+513ewNloY8QTuYJgGcCVQhaWJGSZoAPyGm8
	uFs2DStUhPY8hXPmKaMZ629yU+kS1nUlWLIpena2Qv7qV+x6dyEtqbv2ie3I3HiG/sU=
X-Gm-Gg: AYBFou16P7g+EbjQ0/GDB0+kGXdITGDH4DSOKw2jSAzuuu1Eg+GRQNWKn1pPw1DSJHC
	E9VHaPrvJGoVNnNSTGxzn8JytFhdYZA4bHKGMkzbw+VWya7OlsRo5OI0huNE1VYSQqrLCkHpvfn
	VTTwrl+vzkUvMZgYRuxSoAap7vTI6skQmOKkxV273UJesp39lOzIMBXZr1k4B79Vp4pXeOpZPIr
	+jEZ1lpN7FK6idWE9ABmZMhW/HXqrfqjW4uwz7RKmdlpQ50lXGT5PfOSkN81RM2Ace8l47SD9RE
	htfBhCMBSX3Q8Y/Vs1LHnOzXiG6bmVjI6yv+t3z3cGdKaCpkkg0DwG1dwV+TwBcDUAlr91kMFGJ
	ERb5NhE0ltwB2G7Rl4Q2l3OaBo4YwVLakyKkrMxqti+nOyw9s1mVYd07oM02BKpwnFoWicx9RBj
	12hw94MtCx/BFcMWmjljUoUvJsJ0X0Ki8dTQbZnT8mpyKZHmqBaoVNOq3Xaln7vh65MAvMd9YIl
	xc=
X-Received: by 2002:a05:6000:2dc8:b0:48c:4d32:ccf8 with SMTP id ffacd0b85a97d-48e07bbe524mr14711381f8f.16.1792410853522;
        Mon, 19 Oct 2026 04:54:13 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4d4978sm21216127f8f.21.2026.10.19.04.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 04:54:12 -0700 (PDT)
Message-ID: <aadce723-2a51-4d57-8d16-03a101d1a93f@linaro.org>
Date: Mon, 19 Oct 2026 12:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/25] coresight: trbe: Track per-CPU sink interrupt
 handling
To: Leo Yan <leo.yan@arm.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
References: <20260915-arm_cs_support_aux_sample-v1-0-35cf6f297d20@arm.com>
 <20260915-arm_cs_support_aux_sample-v1-12-35cf6f297d20@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260915-arm_cs_support_aux_sample-v1-12-35cf6f297d20@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_045415_674240_0CE4FC72 
X-CRM114-Status: GOOD (  24.58  )
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



On 15/09/2026 16:48, Leo Yan wrote:
> A sampling NMI can interrupt TRBE while it is using the active AUX
> handle or buffer. Circular buffer mode avoids wrap interrupts but can
> still generate fault interrupts.
> 
> Add an in_interrupt flag to per-CPU sinks and set it around the TRBE IRQ
> handler. Compiler barriers keep AUX buffer accesses between the flag
> updates. This lets NMI callbacks detect when they have interrupted sink
> handling before modifying its state.
> 
> Assisted-by: Codex:gpt-6
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   drivers/hwtracing/coresight/coresight-trbe.c | 17 ++++++++++++++++-
>   include/linux/coresight.h                    |  2 ++
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index ab3c5c7d27f3d272b07eade1e6452559808b196c..8eb625d3fc99db57a18e35ef59ef814dacf20a09 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -1185,7 +1185,7 @@ static u64 cpu_prohibit_trace(void)
>   	return trfcr;
>   }
>   
> -static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
> +static irqreturn_t __arm_trbe_irq_handler(int irq, void *dev)
>   {
>   	struct perf_output_handle **handle_ptr = dev;
>   	struct perf_output_handle *handle = *handle_ptr;
> @@ -1249,6 +1249,21 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>   	return IRQ_HANDLED;
>   }
>   
> +static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
> +{
> +	struct coresight_device *csdev = coresight_get_percpu_sink(smp_processor_id());
> +	irqreturn_t ret;
> +
> +	/* Circular Buffer mode can still interrupt on a fault. */
> +	WRITE_ONCE(csdev->in_interrupt, true);
> +	barrier();
> +	ret = __arm_trbe_irq_handler(irq, dev);
> +	barrier();
> +	WRITE_ONCE(csdev->in_interrupt, false);
> +
> +	return ret;
> +}
> +
>   static int arm_trbe_save(struct coresight_device *csdev)
>   {
>   	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index ddf18c970e343041787424c2019f2b5dd49154c2..8830c30be0df53a22525ef4fc3c7e41a0ec6fd90 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -275,6 +275,7 @@ struct coresight_trace_id_map {
>    *		when a source has been selected and a path is enabled from
>    *		source to that sink. A sink can also become enabled but not
>    *		activated if it's used via Perf.
> + * @in_interrupt: Per-CPU sink interrupt handler is running.
>    * @ea:		Device attribute for sink representation under PMU directory.
>    * @def_sink:	cached reference to default sink found for this device.
>    * @nr_links:   number of sysfs links created to other components from this
> @@ -299,6 +300,7 @@ struct coresight_device {
>   	bool orphan;
>   	/* sink specific fields */
>   	bool sysfs_sink_activated;
> +	bool in_interrupt;
>   	struct dev_ext_attribute *ea;
>   	struct coresight_device *def_sink;
>   	struct coresight_trace_id_map perf_sink_id_map;
> 
Reviewed-by: James Clark <james.clark@linaro.org>


