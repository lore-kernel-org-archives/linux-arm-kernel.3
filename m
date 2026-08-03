Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EEBC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxMk4MUQUDc+H1bfo3Qxr4A1ELX+7kM8nIGEj1DxyWY=; b=ywo4/AcSkt0/Os8QpfqrPKBFkt
	LjlyTn1W7tkjnygv6DPbHPd0wPaLrD84LgVcWxHXdX18Pjdw4bhHuKXpn6thufrQ7qxY5bgdY/SX+
	MYJsDo6yf66C/bvjHoMLjsB16PaqdbVB8aZYY/ivevca6OYGpnjEZn1j+iVmne6aJdW9YncJRo+Mm
	daNZnosvDmrMBilNezhI6AiWtKGJqYwNWEP1rYEMsivZPRJpxfTB4M1F4KPPVkCjCr+rQC+6m9Hwt
	iKPAkJesmx6o5328Tv8ZZdZbRcZBXqEOG8MuCCRf58jeHVbNUZ73H55nJcBLy9ieMKkY2ewM65dKC
	GR/N1Hdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpTU-0000000Gllx-2hRn;
	Mon, 03 Aug 2026 10:00:48 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpTS-0000000GllT-0c1G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:00:47 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c197f968b3cso497609966b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785751243; x=1786356043; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QxMk4MUQUDc+H1bfo3Qxr4A1ELX+7kM8nIGEj1DxyWY=;
        b=i2HBJFbssIc5OVpJPAOmGTHol0+3B0Wk4H7Tp02mjfMCKMKOKUo/p/0DRifm5Jo1Gk
         yax1ydMpjmC2vCKy0YQ5WaoiFOcB8y+YQ4hEwPI+V31y1e6grReTOu4RXhXpH8f7sHLd
         GGJ3BqR4ntLIxcmPXcW4b5YuqYnyOefHEVtognMXwJ3KWSOFiaptMWdqXBnBE799ecyP
         OXB2M2YW4MYtky5pWjc7DZLAYIp7MTDG+zTTAMNvvB8ABCNHJYAfD8exc8usPHxjlBBB
         3a9lyZQiNtKokXA160A16Trq9MPcYdk+9s3swa+Gq8+ySHmQDHdODjksocx55CJmtT3g
         OUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751243; x=1786356043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QxMk4MUQUDc+H1bfo3Qxr4A1ELX+7kM8nIGEj1DxyWY=;
        b=A7/mhbZFbpI0jRUmEzmg90bqtC4xnE4MARkdBuT/U8MpZ6jRgrJ3LmewNfsbTVoCpG
         jxWJb6bpPoxnJ+Wlr5s67Bj23IOZXzIW9kWY6j6Bq2BdFfQxeuFii9sFCx2Miktn2JCN
         W5LpaRtg3e3wS24eOrQs552pdykt1vtGCkRpwc/LLyoYQw9r6cnGldBJklgRQRvWT6ii
         +DyFPy5gMmviUs1WwoqU+n1i+HJPj8+rtrbWlFutz3ccwYWGABWNSOe/QwLdCIOyKfO+
         wCaDTvVfWvWWsETOonw5OZ/1Nj/CkULKSrA+lrSfbcaqR7uG/Lv/O25qyHTD1L2NkD0Y
         GZLw==
X-Forwarded-Encrypted: i=1; AHgh+RrgB8wjDa8d77qSCf7q3Ifb62ZE/3VAFljqRGsL/ruLGkORto/jscj1byJRWU6InTzTyeZU+w2rjyDfTDEarv6o@lists.infradead.org
X-Gm-Message-State: AOJu0YzoA0VXQoyv6H+oKse4DzAoRTDkx51sjcHDk6uKVSfSehZydZgC
	8o2McL7KDa1Y+X2F9OC7I4HDDMIl7USls+E0q0yvyd7ZdBNtPTbcK377uKIxsvMQ+NU=
X-Gm-Gg: AR+sD10ZBntfTn+y8SxczD0MTYr49ZLZKHdXaLdwAI1TTkz3id8op2qI3vwsp8Hy/fq
	IW2sca3L9jvVFNDbnAPSEY+zKkhOD33IaIqYSxiTdMgDmkShDiHAAQhWYsDw5A0uGmIgU1baJlN
	+oK/e98lpW6mAdzQT4D/efPH9Mnul4RXTboyzTLuwjYdvj3Y9oa3TF4cHOcpOZYtppFYv8JRHOl
	zzr8AQUwTNO2uq1F2j+vzJAP6snJ74b5j3WeRsQRAXvceCUqBUd/7RlxsdFh7rVIXT4tvNHPUED
	EPltgNxHlzWi2ADyKtqNb/Q0VS7JeNXmFBv8XuKEbYw5C3pmrzrJVzArdVuCPuJM0BnbZ/BEccd
	UaFwsLtENIn4u/MuEl+EKbtNxV9v4OcMbz4q8PbhhMTVKkeh7SzbpdloHomyiensI9rTqpIh9yv
	Qt8i7WLpXpZifJXOJrfaE2twTxKwCL9BVb1oCSRj5EE4/tpGsQGHVMygQD0LK+LvUFLobK31Oli
	dv4cXA=
X-Received: by 2002:a17:906:a98:b0:c19:611c:fa94 with SMTP id a640c23a62f3a-c1fe7f520f5mr446666366b.27.1785751242813;
        Mon, 03 Aug 2026 03:00:42 -0700 (PDT)
Received: from [192.168.1.183] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c5b387sm496061166b.2.2026.08.03.03.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 03:00:41 -0700 (PDT)
Message-ID: <9f2c4bbd-5889-4899-b96d-41566363c408@linaro.org>
Date: Mon, 3 Aug 2026 11:00:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] perf/core: Clear the whole branch entry in
 perf_clear_branch_entry()
To: Puranjay Mohan <puranjay@kernel.org>, bpf@vger.kernel.org
Cc: Puranjay Mohan <puranjay12@gmail.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Leo Yan <leo.yan@arm.com>,
 Rob Herring <robh@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>,
 Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Stephane Eranian <eranian@google.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif
 <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20260616155716.2631508-1-puranjay@kernel.org>
 <20260616155716.2631508-3-puranjay@kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260616155716.2631508-3-puranjay@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_030046_250889_22F46965 
X-CRM114-Status: GOOD (  26.80  )
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



On 16/06/2026 16:57, Puranjay Mohan wrote:
> perf_clear_branch_entry_bitfields() resets the bitfields of struct
> perf_branch_entry one at a time and deliberately leaves from/to alone,
> since callers overwrite those immediately. The list of assignments has to
> be kept in sync with the struct by hand, and it has already drifted:
> new_type and priv were added to perf_branch_entry but never cleared here,
> so stale values can leak into the records handed to userspace.
> 
> Clear the entry with a single struct assignment instead:
> 
> 	*br = (struct perf_branch_entry){ };
> 
> Every caller writes from/to right after the clear, so zeroing them as well
> is harmless and the dead stores are elided on the x86 LBR read paths.
> There is no longer anything to keep in sync when a field is added.
> 
> The helper no longer touches only the bitfields, so rename it to
> perf_clear_branch_entry() and update the callers, fixing up the
> br+nr/br+out spacing on the touched lines while at it.
> 
> Fixes: b190bc4ac9e6 ("perf: Extend branch type classification")
> Fixes: 5402d25aa571 ("perf: Capture branch privilege information")
> Suggested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>   arch/x86/events/amd/brs.c   |  2 +-
>   arch/x86/events/amd/lbr.c   |  2 +-
>   arch/x86/events/intel/lbr.c |  6 +++---
>   drivers/perf/arm_brbe.c     |  2 +-
>   include/linux/perf_event.h  | 16 ++--------------
>   5 files changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/x86/events/amd/brs.c b/arch/x86/events/amd/brs.c
> index 06f35a6b58a5..68c5f42965e9 100644
> --- a/arch/x86/events/amd/brs.c
> +++ b/arch/x86/events/amd/brs.c
> @@ -343,7 +343,7 @@ void amd_brs_drain(void)
>   
>   		rdmsrq(brs_from(brs_idx), from);
>   
> -		perf_clear_branch_entry_bitfields(br+nr);
> +		perf_clear_branch_entry(br + nr);
>   
>   		br[nr].from = from;
>   		br[nr].to   = to;
> diff --git a/arch/x86/events/amd/lbr.c b/arch/x86/events/amd/lbr.c
> index d24da377df77..08401fd60585 100644
> --- a/arch/x86/events/amd/lbr.c
> +++ b/arch/x86/events/amd/lbr.c
> @@ -181,7 +181,7 @@ void amd_pmu_lbr_read(void)
>   		    entry.to.split.reserved)
>   			continue;
>   
> -		perf_clear_branch_entry_bitfields(br + out);
> +		perf_clear_branch_entry(br + out);
>   
>   		br[out].from	= sign_ext_branch_ip(entry.from.split.ip);
>   		br[out].to	= sign_ext_branch_ip(entry.to.split.ip);
> diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
> index 72f2adcda7c6..295da179fa74 100644
> --- a/arch/x86/events/intel/lbr.c
> +++ b/arch/x86/events/intel/lbr.c
> @@ -755,7 +755,7 @@ void intel_pmu_lbr_read_32(struct cpu_hw_events *cpuc)
>   
>   		rdmsrq(x86_pmu.lbr_from + lbr_idx, msr_lastbranch.lbr);
>   
> -		perf_clear_branch_entry_bitfields(br);
> +		perf_clear_branch_entry(br);
>   
>   		br->from	= msr_lastbranch.from;
>   		br->to		= msr_lastbranch.to;
> @@ -846,7 +846,7 @@ void intel_pmu_lbr_read_64(struct cpu_hw_events *cpuc)
>   		if (abort && x86_pmu.lbr_double_abort && out > 0)
>   			out--;
>   
> -		perf_clear_branch_entry_bitfields(br+out);
> +		perf_clear_branch_entry(br + out);
>   		br[out].from	 = from;
>   		br[out].to	 = to;
>   		br[out].mispred	 = mis;
> @@ -920,7 +920,7 @@ static void intel_pmu_store_lbr(struct cpu_hw_events *cpuc,
>   		to = rdlbr_to(i, lbr);
>   		info = rdlbr_info(i, lbr);
>   
> -		perf_clear_branch_entry_bitfields(e);
> +		perf_clear_branch_entry(e);
>   
>   		e->from		= from;
>   		e->to		= to;
> diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> index ba554e0c846c..effbdeacfcbb 100644
> --- a/drivers/perf/arm_brbe.c
> +++ b/drivers/perf/arm_brbe.c
> @@ -604,7 +604,7 @@ static bool perf_entry_from_brbe_regset(int index, struct perf_branch_entry *ent
>   		return false;
>   
>   	brbinf = bregs.brbinf;
> -	perf_clear_branch_entry_bitfields(entry);
> +	perf_clear_branch_entry(entry);
>   	if (brbe_record_is_complete(brbinf)) {
>   		entry->from = bregs.brbsrc;
>   		entry->to = bregs.brbtgt;
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 48d851fbd8ea..e034be4a473a 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1467,21 +1467,9 @@ static inline u32 perf_sample_data_size(struct perf_sample_data *data,
>   	return size;
>   }
>   
> -/*
> - * Clear all bitfields in the perf_branch_entry.
> - * The to and from fields are not cleared because they are
> - * systematically modified by caller.
> - */
> -static inline void perf_clear_branch_entry_bitfields(struct perf_branch_entry *br)
> +static inline void perf_clear_branch_entry(struct perf_branch_entry *br)
>   {
> -	br->mispred	= 0;
> -	br->predicted	= 0;
> -	br->in_tx	= 0;
> -	br->abort	= 0;
> -	br->cycles	= 0;
> -	br->type	= 0;
> -	br->spec	= PERF_BR_SPEC_NA;
> -	br->reserved	= 0;
> +	*br = (struct perf_branch_entry){ };
>   }
>   
>   extern void perf_output_sample(struct perf_output_handle *handle,

Reviewed-by: James Clark <james.clark@linaro.org>


