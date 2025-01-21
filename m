Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659F2C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENcOYGqRioU/9ihcSEEFfnUaDfvEIG5xAfpIwJ8DI8A=; b=T/KFF3iRoZDGnn9hr77RZ/IL3Y
	WUYY7ggvGNlmUxuUc7RjDCWeGqk17mq7gLJTvF8Uhllm1JCFAzVu23QYIHhSlN9v28vltaZRVPPYa
	4se/YuNkoomTCNGOmxWLyw4w45pAJfXiUfn4hAQxG0dMc1dV0L0xdPPYyboaf+5iqchW1Qp3xl5fT
	UTPXxMJr6qzHW+RuT1RWSLKe1k8VlvYsHm7xujamlWeO0IWHYHcsJ7RWCrpjRWmaUWw/7fT2LFU+n
	DqhZGPlAgT/evkn+/ck3VNYjSj/CykUFAkMWO9N/4AatAjLTMHIAzalL3eyL+z9narmuZfY6RgSS7
	cBeK7IFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taC3N-00000007hJB-4BLy;
	Tue, 21 Jan 2025 11:04:18 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBtO-00000007f7O-2Dti
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:53:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2165448243fso117584495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 02:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737456837; x=1738061637; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ENcOYGqRioU/9ihcSEEFfnUaDfvEIG5xAfpIwJ8DI8A=;
        b=cOMe1TkI+xT3Z6JWy6gApL4Ep9KVGzrWsXUPtq5HNIgglVR+URuNSdhX8WByyxbVta
         1B04eI6mr2zNscHhQKloz/cDgEJ6gxGogkhOyav5u+32yYL8lQPSSPose/5ftACziEx3
         OY46o9lUvRjI/TewuPZ2vDpkmwb3GRbEf8slXDlYeSjMfxaRIM8jtCNnKDNYZ97WJmIl
         f4eESNvbn3glpV/ZB8PhuZtzE/qXrehGUgIfcGiwHP0nXLhcT9FFsXaSFXNUlWHOroOz
         YH1Qux8T4t8to2IhPRTSf0+3M6bx7uC/7mEZ1qYHSk2u/WzVylGszkQp0mTy2wjxY4h+
         jqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737456837; x=1738061637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENcOYGqRioU/9ihcSEEFfnUaDfvEIG5xAfpIwJ8DI8A=;
        b=GRWh9R9zx8Gdlb60UV1fva3G485w2awlovw7mBTDlCEofrTgffhbrIue6alz9lPvfR
         wpxxrbYt6eMpqMno5B7/59STwBdbxeZeyV8rPVRXOfjMbwysvr0f0mWtXV8KcpsuSApK
         bmmMyzkQYfSXMGcMrLDu0Fy4KRwryKTZti3xioYJopyrX7bA1NUvpmcoszl6eXEwVl/J
         redNU/I8buDgNshzuwfxzsLHjJHbzFLal2rHO4BmYUfAsxUhWzRtxpq/J1QhVA0Q7XeW
         mvuWPwoay6YJcvO/c1PmoP7HMRvkbnzCogj64CcQzxZ0O+o7x4/A5GIzhjkhx1u+Utqn
         tGHA==
X-Forwarded-Encrypted: i=1; AJvYcCXF0aNYTIHm2GFPiopc6JzHre8z2anr9Fh+isP7h4PYQ8xYS/Zshy/hCInLlvtWwBOJg/7U845fx9FswFXx9V+2@lists.infradead.org
X-Gm-Message-State: AOJu0YzqpgZbv8ohU84IyayUt9gE9cUq8KGDDorEZb+AmZogc0bDhtgw
	JdFNG6mW4EKqjTU4ZXJwuz/e9SZo46QGFcVL0drUSYkkRQQgfTlK0GmMLK09qk8=
X-Gm-Gg: ASbGncvkz1Y9yRGp08iU8LJhqfueZJrzV/Xo6qWqMM47k3MUcfnhUTQXf3rTRx6L3/3
	QuBcjZErinTiZbpCIPEBs5xcjvqSBhog/2u5MdoFF3lnt5moDHAhjGVZRrMtYvVvf3aHwaJVsZa
	x/DkYP2rGsKLewUMXT1qjbgsb/r9IfJiw3Ze5OblaSEiu3x0H8DAxk474b+2e6bsWpJBjK7Q8cF
	E3DTVNjB3CgYjwpSFErvz55V1+W/TIspztTP2PqORaOV9KKbM+k/7AZ1rTl1XPk+0fnMtGz
X-Google-Smtp-Source: AGHT+IEuSER7ZHNDig6EsFOlbiWEGwJUjzQk6/UxpR2ZgEZDY1r5dRIoJzux0fIbg2I24q8x/2ZFgg==
X-Received: by 2002:a17:903:32c9:b0:216:46f4:7e3d with SMTP id d9443c01a7336-21c3550f34emr265771255ad.15.1737456837580;
        Tue, 21 Jan 2025 02:53:57 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb767asm75949395ad.84.2025.01.21.02.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 02:53:56 -0800 (PST)
Date: Tue, 21 Jan 2025 16:23:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 2/5] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20250121105355.sdrgmjv2w2256qfn@vireshk-i7>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-3-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121084435.2839280-3-beata.michalska@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_025358_583001_95EFA87F 
X-CRM114-Status: GOOD (  16.12  )
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
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 6f45684483c4..b2a8efa83c98 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -733,12 +733,20 @@ __weak int arch_freq_get_on_cpu(int cpu)
>  	return -EOPNOTSUPP;
>  }
>  
>  static ssize_t show_scaling_cur_freq(struct cpufreq_policy *policy, char *buf)
>  {
>  	ssize_t ret;
>  	int freq;
>  
> -	freq = arch_freq_get_on_cpu(policy->cpu);
> +	freq = IS_ENABLED(CONFIG_CPUFREQ_ARCH_CUR_FREQ)
> +		? arch_freq_get_on_cpu(policy->cpu)
> +		: 0;
> +
>  	if (freq > 0)
>  		ret = sysfs_emit(buf, "%u\n", freq);
>  	else if (cpufreq_driver->setpolicy && cpufreq_driver->get)

Maybe this should be a separate commit ? And also I am not very happy
with the new kconfig option. I don't want others to use it as we want
to get rid of this for X86 too eventually. Making it a kconfig option
allows anyone to enable it and then depend on it without us knowing..

Rather just write it as "if (x86)", with a comment on what we plan to
do with it in few release cycles.

-- 
viresh

