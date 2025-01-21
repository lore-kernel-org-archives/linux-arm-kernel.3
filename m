Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D03CC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjjne0E3+H0DxvpYvXQJEPPLzeITfjRK1it/y9/KiaE=; b=i4JgJZlKIYf25YGcmug0Li4is+
	9mGCSIjeTh7DmPEiaZMvKhvuN9n0iWoj4KNvLpsM0EBfXV7TUtlp6Mvy9gfowNuZGpKunY8bwDKL4
	WAQ4Vm68CqIxMu1QE2gnsAPz7+/mDLVnNY2SHMU7LQuki6qKWDRZVV6D4w21dGDF/htwODiBBPh2g
	zQ519fANkpJLMEN7rm4Y76fwPybE43W8NyNetrrv9fzM4nHBRaC5YOpAas6TLHcYWBb0woQDyn2aJ
	uvviMt5D0phESYAyBf35V2zvy/lG1ermg4GFYeoCvD6xEpxfgNjFy/Wr1mxtVoThreTP6u9QdnKLO
	FGj8b0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taByN-00000007gYx-3jyX;
	Tue, 21 Jan 2025 10:59:07 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBmn-00000007dpQ-47Zk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:47:11 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21628b3fe7dso94067185ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 02:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737456429; x=1738061229; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bjjne0E3+H0DxvpYvXQJEPPLzeITfjRK1it/y9/KiaE=;
        b=taus03XFRA8OqPFSEOwFjuY5isXRmteJafCtsJhsIPQaKiSvPFprR3VXX0+Algd4Nr
         zNF6TTpVhv4gflTuyUvVg2g2oIrhR91wRnNtSrx9WYdvr3UOlf9jxyxNt7nY41r1AFQz
         reQSgzYfhMLXN3eS8j1BSuolOFU64e6n9iyFMoLXxBCRfFIcmE2T0WXJbbQXHaAuzIjh
         pyCvyKOXYpRk9QyFjyqF0nDUw3+z/EGgZRCFpuHkPah0/TAc3UpcWayLBYkJppWjd9au
         ZMYZK7JgM8vfved/yrTSz/v7/LdhOoJc+YlypZAZCQ2YKEKFWHGPKOS06SD2VgexsK3s
         3Rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737456429; x=1738061229;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjjne0E3+H0DxvpYvXQJEPPLzeITfjRK1it/y9/KiaE=;
        b=lEm2aWv5Egin+N/lbW0huMdL34D31mg2+sQX74JZ5J5JQ83PLmSUisPe/JwmuqGfSe
         ZenmnDHKLf/hl0i4shS3ooWecpopg2FRu0Q1l6fjcn3w7pxMO7U3wdnrMaCx6Pc+rnq1
         F63He4dWtjPNDlnCM+oGZvSbn33g2ymESIc0DcJAxb21UciL52NNz90TyhPuht//4JAH
         lv600yRrhhsJasbp9/5Cws53A5czGi0G+8OFy+EpcDeRAKM8ODdPioc3hbYcvFNj8jqa
         UuU9025QmYPCF9OT0EQm0ypxXSzrdmxMlxCzl6g84hmvmclCEQMcezmPgnr6aepj0lx2
         MovA==
X-Forwarded-Encrypted: i=1; AJvYcCW2eywaqkT2PeLR6nXzY0V75peRRuEA7vVEDlEfAywB8VrhhCKEr7JtHfyW+m5bEYeEWvqiqhg+JaLzw8rgAT9Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyeAgtV80HmEZs7fZ8jqPJ0+FaCgBOaHL3QqcBFHlHQbOmCYSHK
	eepWuLXjur1uxZHxu6lWMjLz3cApGlPosugxWkzCcxbnRBiB6H/WSmNCBpPutfQ=
X-Gm-Gg: ASbGncv/P87U8PHMSFTDa8+ch/rT2eItgztlEE914kQIoqRkWbIRl78wx5Oeqfr8apO
	mMBUjMWCldWC0/1SctoBzGiv8phINvpYyTOfe0K350xh/RMQjQNNReOXhiKa0qdEaBhOBzOrFuN
	sSDydAq+9119GHWfEMVzJqzzxthlf8ILMEJIJEH6eeBAN6i2CAAWGS8q5HWHEZECDmspPnqEKF1
	olO5NNGVGKza2R/4LP5jr1zR0MAdSN9wEjBGkwUWCzgJZOiP7xHddGBQp+CmTQFZbtwlThFMycD
	QoKuZxc=
X-Google-Smtp-Source: AGHT+IGJD1dOPoV4WHlzi5WBxwqsVI7hrl9CV1yzciPVE32NItswuJUQXBovrfqj5yvKVARoiyBnQw==
X-Received: by 2002:a17:903:11cd:b0:215:b5c6:9ee8 with SMTP id d9443c01a7336-21c351d3065mr220669285ad.7.1737456429087;
        Tue, 21 Jan 2025 02:47:09 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceba3f8sm76268275ad.97.2025.01.21.02.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 02:47:08 -0800 (PST)
Date: Tue, 21 Jan 2025 16:17:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com
Subject: Re: [PATCH v9 1/5] cpufreq: Allow arch_freq_get_on_cpu to return an
 error
Message-ID: <20250121104706.2gcegucb6hcuksrd@vireshk-i7>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-2-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121084435.2839280-2-beata.michalska@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_024710_069157_AFAF3417 
X-CRM114-Status: GOOD (  22.32  )
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

On 21-01-25, 08:44, Beata Michalska wrote:
> Allow arch_freq_get_on_cpu to return an error for cases when retrieving
> current CPU frequency is not possible, whether that being due to lack of
> required arch support or due to other circumstances when the current
> frequency cannot be determined at given point of time.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  arch/x86/kernel/cpu/aperfmperf.c | 2 +-
>  arch/x86/kernel/cpu/proc.c       | 7 +++++--
>  drivers/cpufreq/cpufreq.c        | 8 ++++----
>  include/linux/cpufreq.h          | 2 +-
>  4 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/aperfmperf.c b/arch/x86/kernel/cpu/aperfmperf.c
> index f642de2ebdac..6cf31a1649c4 100644
> --- a/arch/x86/kernel/cpu/aperfmperf.c
> +++ b/arch/x86/kernel/cpu/aperfmperf.c
> @@ -498,7 +498,7 @@ void arch_scale_freq_tick(void)
>   */
>  #define MAX_SAMPLE_AGE	((unsigned long)HZ / 50)
>  
> -unsigned int arch_freq_get_on_cpu(int cpu)
> +int arch_freq_get_on_cpu(int cpu)
>  {
>  	struct aperfmperf *s = per_cpu_ptr(&cpu_samples, cpu);
>  	unsigned int seq, freq;
> diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
> index 41ed01f46bd9..d79f5845a463 100644
> --- a/arch/x86/kernel/cpu/proc.c
> +++ b/arch/x86/kernel/cpu/proc.c
> @@ -86,9 +86,12 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>  		seq_printf(m, "microcode\t: 0x%x\n", c->microcode);
>  
>  	if (cpu_has(c, X86_FEATURE_TSC)) {
> -		unsigned int freq = arch_freq_get_on_cpu(cpu);
> +		int freq = arch_freq_get_on_cpu(cpu);
>  
> -		seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
> +		if (freq <= 0)
> +			seq_puts(m, "cpu MHz\t\t: Unknown\n");
> +		else
> +			seq_printf(m, "cpu MHz\t\t: %u.%03u\n", freq / 1000, (freq % 1000));
>  	}
>  
>  	/* Cache size */
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 418236fef172..6f45684483c4 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -728,18 +728,18 @@ show_one(cpuinfo_transition_latency, cpuinfo.transition_latency);
>  show_one(scaling_min_freq, min);
>  show_one(scaling_max_freq, max);
>  
> -__weak unsigned int arch_freq_get_on_cpu(int cpu)
> +__weak int arch_freq_get_on_cpu(int cpu)
>  {
> -	return 0;
> +	return -EOPNOTSUPP;
>  }
>  
>  static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
>  {
>  	ssize_t ret;
> -	unsigned int freq;
> +	int freq;
>  
>  	freq = arch_freq_get_on_cpu(policy->cpu);
> -	if (freq)
> +	if (freq > 0)

>= ?

Since we can return error now, 0 should be considered a valid
frequency value ?

>  		ret = sysfs_emit(buf, "%u\n", freq);
>  	else if (cpufreq_driver->setpolicy && cpufreq_driver->get)
>  		ret = sysfs_emit(buf, "%u\n", cpufreq_driver->get(policy->cpu));
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 7fe0981a7e46..02fd4746231d 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -1184,7 +1184,7 @@ static inline int of_perf_domain_get_sharing_cpumask(int pcpu, const char *list_
>  }
>  #endif
>  
> -extern unsigned int arch_freq_get_on_cpu(int cpu);
> +extern int arch_freq_get_on_cpu(int cpu);
>  
>  #ifndef arch_set_freq_scale
>  static __always_inline
> -- 
> 2.25.1

-- 
viresh

