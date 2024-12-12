Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79054E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 11:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtaH+wZEt5kdBBbkttZKPg/4+ptJawCKPDRLZa+Pnhc=; b=Y8OJRqlptD/leQv7cawIR2VNQt
	E0k7LzBUXP7tCsBdSGM6UOD2N6F92OzH3dr0FLAGw1DLTQvG0e6UDE83PB0c9gFd7DSVRQCRvgyV2
	U2c9lQhI3Fn0cesN6C6P3X1JoUgKoh67vPWcpDye8EobZJ16tW7FQcIwf+NPmLjfWElbnv1wi9e7S
	2xuZFMS2HL+dS2ukvsNwek9CduK6xca1R7P0O4f2i/l1GUiUyiKqPV/l7+oSaqZyxKtd2Tsil7heL
	B5Kf1x+VQxLugfPYxzqu/52OZf6PeAlu6Uh8FEYQSfrgoj5LprLozAtt0T/m+ZnhNOAEucgMZAnoZ
	dj8LZBrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLh2S-000000008t8-41o3;
	Thu, 12 Dec 2024 11:07:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLh1M-000000008bY-3fpF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 11:06:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BBC4153B;
	Thu, 12 Dec 2024 03:06:42 -0800 (PST)
Received: from [10.1.37.59] (e127648.arm.com [10.1.37.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 883B53F720;
	Thu, 12 Dec 2024 03:06:11 -0800 (PST)
Message-ID: <df140f26-496d-44ce-8363-ffc908f2effa@arm.com>
Date: Thu, 12 Dec 2024 11:06:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] cpufreq: apple-soc: Set fallback transition
 latency to APPLE_DVFS_TRANSITION_TIMEOUT
To: Nick Chan <towinchenmi@gmail.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Asahi Linux <asahi@lists.linux.dev>,
 Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
 Linux power management <linux-pm@vger.kernel.org>,
 Devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
 <20241212070344.3858-7-towinchenmi@gmail.com>
Content-Language: en-US
From: Christian Loehle <christian.loehle@arm.com>
In-Reply-To: <20241212070344.3858-7-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_030616_958788_0D750AAF 
X-CRM114-Status: GOOD (  13.72  )
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

On 12/12/24 07:03, Nick Chan wrote:
> The driver already assumes transitions will not take longer than
> APPLE_DVFS_TRANSITION_TIMEOUT in apple_soc_cpufreq_set_target(), so it
> makes little sense to set CPUFREQ_ETERNAL as the transition latency
> when the transistion latency is not given by the opp-table.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Reviewed-by: Christian Loehle <christian.loehle@arm.com>

> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
> index 94e57f055a5f..c9f31a3653e2 100644
> --- a/drivers/cpufreq/apple-soc-cpufreq.c
> +++ b/drivers/cpufreq/apple-soc-cpufreq.c
> @@ -291,7 +291,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	transition_latency = dev_pm_opp_get_max_transition_latency(cpu_dev);
>  	if (!transition_latency)
> -		transition_latency = CPUFREQ_ETERNAL;
> +		transition_latency = APPLE_DVFS_TRANSITION_TIMEOUT * 1000;
>  
>  	policy->cpuinfo.transition_latency = transition_latency;
>  	policy->dvfs_possible_from_any_cpu = true;


