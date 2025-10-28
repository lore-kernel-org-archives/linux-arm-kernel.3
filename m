Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE51CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 05:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCqr2A4tFWO56+nsiAFj8w8uU6z9HieZzNnrp5Dee6U=; b=M5qvIoWqIXXFN6+EYvxrQSJdGA
	MSfCe2vCXNFCckB987hECqmsa4ZrNOL0l/cH5JeFJ0gSkQ3xmM3ibcSpfup/ZT9weUpUlLMw1/6UO
	lYjUTj/wIBIqQoSZHHJ6Oeh594cKx6zo1VmpCdBXixNI6p6R2UlYWDUk2vMsM9CjktXZAiD5uRj7l
	u9EAvtX4VCx4WYg/VU2Mf6p88dvdHS9Z/3WP1ulunsVvHmKD0gkWR8BRzS6XQEVbCMoQt1wSxx1WD
	AveOjjkmwRa8LGt5kwGHsoZUJhU9R/oOFuhKBFgIL432hdGER5wUzdJHRcMIxV/eNUE5/2orpOjQG
	rBCwuq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDbyl-0000000FEbM-0b2G;
	Tue, 28 Oct 2025 05:10:43 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDbyi-0000000FEb0-2mXV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 05:10:41 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-782e93932ffso4099796b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 22:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761628239; x=1762233039; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NCqr2A4tFWO56+nsiAFj8w8uU6z9HieZzNnrp5Dee6U=;
        b=AF+AQyyyfOOnmQJiL2PrsuZg7oG/TC8tyIrVfSfISXVhwJvQiRcHI1JnS+2u2WrKa2
         KWd5gDAG/NOHIgg+UWQhpM3cfj7QVL1EdzGoC3nD6uwHm7s0pYI/MZ3gx123ajTz6glR
         VWlvU85T6tnk2Bu/4gqI3Ofja1/suaaafKFyZMvHniiWVnLvyB/65oUrptzCwM8/eYKi
         WYP8CV3xX2IJVwUGH6svkGKFKenTnxz8hNiF4KjQ2dUyMv2JkcEBHbxcKAaWgdGMN1fx
         gbrwKrbUAYcu34Utid2rejTCfFExTf+lZ8jQV+KhtXsTMHD1L4pUO9W7NR2t51DC0UK9
         r+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761628239; x=1762233039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCqr2A4tFWO56+nsiAFj8w8uU6z9HieZzNnrp5Dee6U=;
        b=iw+ZkuVpc/qnh5DebCSTwndC8yw890HygsTO2Bf0w3MWRn+SD+Cd41eMHXjeuLijiY
         +TmoycMZpzR2yCewbTV2s9KVYW1X7vq1FIKEj8lGKmmxu3eWmr6NNFItcpy3UH14HiQb
         rAXbPKwWno3HR/JhgWBYJtNnxHCjrW6cEk+ALymdE8yrt9PmOgiEU1mqP0iSsY8jbTWW
         9Y/yc7BsFRwgGbZ8bu7DNfK9uDzIDS6Ye1FOg3DkGQjoraJRBuHfjfzhUL3+53RUBe33
         ES2yxkF+Y4Oq3Y4dWHgHOM71TNC612Y3niUoVS8DVMnNb5WQrO09RTS9AUOBCHy7QHez
         VfiA==
X-Forwarded-Encrypted: i=1; AJvYcCVBTVung7fax6bdRMlMUm8bMJt0Dg9JxeS1ekJ8LlvhHh9VE7Xn/QCOaYVVXVeeyOh4XWiBIXV9oK2ii2/mgKB6@lists.infradead.org
X-Gm-Message-State: AOJu0YyX6bFQfv/M2kjjMRM7vGRuslvl2hKuHYer0m0lt7tzkNmom5QT
	Yws6o/LD+HIOL68E6jQjgBpS9wf5NBYFRH7ofKk0CPSVxYN7FwXCajStRi+OcmNXCEg=
X-Gm-Gg: ASbGnctrwrQBYrrvPstROiHHqm4j4nP9NK8fQXd4FlhViFLnBb649JXj6ktRq9S7ou+
	uy5mJYGRzwraWAcnC2XGGGtBzjt0DB6uioGBZc/4jqqm1mk0ES0ye7ybpPsJT3/UU3qhVo9e3xc
	j5JQ7aUP9FNjCDJ8g5ebe8jxlOM07FJ0vb00omLPJfoYaUqzwhmUbH/DLPqnc+RriiPW4QHq2EU
	z/mForSpGa1cwzyO5baIId67X2Te2L2w1igH3eZzuhwDClD77u//5/vMgnRqEb81m/GWo6vMt3U
	2RSjDliYtw6UScyWOj28Vh/5rbmcxouuns9j6JW5/zzpzwYbibAEHyeW6rfaAwxU+wFOWQ7jwmF
	3qw/jN8g2cNVTil9PSPyIzAK24NKx1CyO5rm/GYZVG4WXqRuR/tIBM5g5AhiKJo1HNTOZhQJe5l
	0REA==
X-Google-Smtp-Source: AGHT+IH3PzOT/Gzd4Jq84gD+JDZaE7asS8taydUlJ6e8s64E1mDRpk69qEQv1J7IkKuekdlAsY/POA==
X-Received: by 2002:a05:6a00:4f93:b0:7a2:7157:6d95 with SMTP id d2e1a72fcca58-7a441bde05dmr3061529b3a.14.1761628238847;
        Mon, 27 Oct 2025 22:10:38 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a41408e617sm10106630b3a.67.2025.10.27.22.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 22:10:37 -0700 (PDT)
Date: Tue, 28 Oct 2025 10:40:35 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jie Zhan <zhanjie9@hisilicon.com>
Cc: rafael@kernel.org, ionela.voinescu@arm.com, beata.michalska@arm.com, 
	zhenglifeng1@huawei.com, linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, jonathan.cameron@huawei.com
Subject: Re: [PATCH v2 1/2] cpufreq: CPPC: Don't warn if FIE init fails to
 read counters
Message-ID: <h2k4enovkvyasxkf3s6ceslpdnhhuvems3jmmv6a2q2zg4nsap@tlsqppgiszwo>
References: <20250828110212.2108653-1-zhanjie9@hisilicon.com>
 <20250828110212.2108653-2-zhanjie9@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828110212.2108653-2-zhanjie9@hisilicon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_221040_710543_14B158FB 
X-CRM114-Status: GOOD (  20.52  )
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

On 28-08-25, 19:02, Jie Zhan wrote:
> During the CPPC FIE initialization, reading perf counters on offline cpus
> should be expected to fail.  Don't warn on this case.
> 
> Also, change the error log level to debug since FIE is optional.
> 
> Co-developed-by: Bowen Yu <yubowen8@huawei.com>
> Signed-off-by: Bowen Yu <yubowen8@huawei.com> # Changing loglevel to debug
> Signed-off-by: Jie Zhan <zhanjie9@hisilicon.com>
> ---
>  drivers/cpufreq/cppc_cpufreq.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
> index 4a17162a392d..7724318b3415 100644
> --- a/drivers/cpufreq/cppc_cpufreq.c
> +++ b/drivers/cpufreq/cppc_cpufreq.c
> @@ -144,16 +144,10 @@ static void cppc_cpufreq_cpu_fie_init(struct cpufreq_policy *policy)
>  		init_irq_work(&cppc_fi->irq_work, cppc_irq_work);
>  
>  		ret = cppc_get_perf_ctrs(cpu, &cppc_fi->prev_perf_fb_ctrs);
> -		if (ret) {
> -			pr_warn("%s: failed to read perf counters for cpu:%d: %d\n",
> +		if (ret && cpu_online(cpu)) {
> +			pr_debug("%s: failed to read perf counters for cpu:%d: %d\n",
>  				__func__, cpu, ret);
> -
> -			/*
> -			 * Don't abort if the CPU was offline while the driver
> -			 * was getting registered.
> -			 */
> -			if (cpu_online(cpu))
> -				return;
> +			return;

diff --git a/drivers/cpufreq/cppc_cpufreq.c b/drivers/cpufreq/cppc_cpufreq.c
index 7724318b3415..5a30c1ec0cdd 100644
--- a/drivers/cpufreq/cppc_cpufreq.c
+++ b/drivers/cpufreq/cppc_cpufreq.c
@@ -144,6 +144,11 @@ static void cppc_cpufreq_cpu_fie_init(struct cpufreq_policy *policy)
                init_irq_work(&cppc_fi->irq_work, cppc_irq_work);
 
                ret = cppc_get_perf_ctrs(cpu, &cppc_fi->prev_perf_fb_ctrs);
+
+               /*
+                * Don't abort as the CPU was offline while the driver was
+                * getting registered.
+                */
                if (ret && cpu_online(cpu)) {
                        pr_debug("%s: failed to read perf counters for cpu:%d: %d\n",
                                __func__, cpu, ret);

Applied with this diff.

-- 
viresh

