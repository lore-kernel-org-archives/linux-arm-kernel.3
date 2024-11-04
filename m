Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E83D132BF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTUz6pqhnIdOaHRrosUpdnh8jyl6vVR3vMJsxxxtuoA=; b=axGoqTJDLn4rNf6Tv9J/jsxT34
	i7z7yj3JVML2nsBJcRoKFZlS3V1ObPmR9DMmPobidnCzcsfw4pdEzZliOr6q73rHQV6w7J/sHglnf
	VWNxP6eqMZZTvuSBXATy+gBDiNgMcT+Q8MSDU+uWF9A70itowRjVTxMI6yqu3Vg/oKSuI9Mj3xooZ
	mKItOPKCHrG7g3xByhRBWa4TKWBnZnyqbbB9w6qUa0iXk5+BNruGodgjhKdvkap2ApftjOUg4nSl4
	mnAEEV0va5OSAf/bgMguxqIQWB62T24fEzr4/QJygQGwif+Ut7DPuhM+oayQAz1AsZURiJzUxFmYL
	Rt2/QGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7whF-0000000Dlpc-1T2n;
	Mon, 04 Nov 2024 13:00:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7weP-0000000DlLl-23Lr;
	Mon, 04 Nov 2024 12:57:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56B4AFEC;
	Mon,  4 Nov 2024 04:58:12 -0800 (PST)
Received: from [10.57.56.89] (unknown [10.57.56.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C91BD3F6A8;
	Mon,  4 Nov 2024 04:57:40 -0800 (PST)
Message-ID: <9f7a33a6-ac69-4fac-946a-ccb90060d243@arm.com>
Date: Mon, 4 Nov 2024 12:58:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] PM: EM: Fix wrong return value in
 mtk_cpufreq_get_cpu_power()
To: Jinjie Ruan <ruanjinjie@huawei.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, hector.yuan@mediatek.com,
 qperret@google.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241104113615.1397410-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20241104113615.1397410-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_045745_607231_6A9822B1 
X-CRM114-Status: GOOD (  16.77  )
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



On 11/4/24 11:36, Jinjie Ruan wrote:
> mtk_cpufreq_get_cpu_power() return 0 if the policy is NULL. Then in
> em_create_perf_table(), the later zero check for power is not invalid
> as power is uninitialized. As Lukasz suggested, it must return -EINVAL when
> the 'policy' is not found. So return -EINVAL to fix it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4855e26bcf4d ("cpufreq: mediatek-hw: Add support for CPUFREQ HW")
> Suggested-by: Lukasz Luba <lukasz.luba@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Fix the driver instead of em_create_perf_table() as suggested.
> - Update the commit message.
> - Add Suggested-by.
> ---
>   drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> index 8925e096d5b9..aeb5e6304542 100644
> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> @@ -62,7 +62,7 @@ mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
>   
>   	policy = cpufreq_cpu_get_raw(cpu_dev->id);
>   	if (!policy)
> -		return 0;
> +		return -EINVAL;
>   
>   	data = policy->driver_data;
>   

LGTM,

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

