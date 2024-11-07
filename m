Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9BDD29FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 02:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EV01TppF915ZdaCiS83lGcAfwGzIJPgp8mFb9ykKuO8=; b=F+nKfQoGEmKIYUV7Hmu5qKdmxY
	pZnT513225hJw5lrrtpP5zE4diM1xv4v5rzOq2rC7C1t7r06Dic9j0nUt4mOgvyzp1w6uF2xQi1zl
	Q+kqPv7vRvDBA/b77ZlZ3Tns9YAUfDFn3IrwIxDXaLR+NlODASuSMwOApNG60RXsIuHoxZyDY3lPe
	XNNMl9RHToVwf/yN7WaGbrSBKTnKDJN0JqVlD0RIpDQbjMNqYHEUJz8c23c/FnumQx9zvdDqLajnw
	rpJbjAoLjL23YTkGBZrcGoXzbPZxZtpY80R3Ra/Ca95knMHtlYlliqP6lV+XTPVUqT6P+tOPfoKr8
	iWr5UKog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8s1M-00000005QXa-1h3s;
	Thu, 07 Nov 2024 02:13:16 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rfQ-00000005LhD-1m9I;
	Thu, 07 Nov 2024 01:50:39 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XkQ2G62Lkz10PTp;
	Thu,  7 Nov 2024 09:48:06 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id E39FD180115;
	Thu,  7 Nov 2024 09:50:27 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemg200008.china.huawei.com (7.202.181.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 7 Nov 2024 09:50:27 +0800
Message-ID: <786c90d1-29e7-72a7-acc6-394b3bbaeb75@huawei.com>
Date: Thu, 7 Nov 2024 09:50:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] PM: EM: Fix wrong return value in
 mtk_cpufreq_get_cpu_power()
Content-Language: en-US
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <hector.yuan@mediatek.com>,
	<lukasz.luba@arm.com>, <qperret@google.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
References: <20241104113615.1397410-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20241104113615.1397410-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemg200008.china.huawei.com (7.202.181.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_175036_794463_5666FD38 
X-CRM114-Status: GOOD (  15.67  )
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



On 2024/11/4 19:36, Jinjie Ruan wrote:
> mtk_cpufreq_get_cpu_power() return 0 if the policy is NULL. Then in
> em_create_perf_table(), the later zero check for power is not invalid
> as power is uninitialized. As Lukasz suggested, it must return -EINVAL when
> the 'policy' is not found. So return -EINVAL to fix it.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4855e26bcf4d ("cpufreq: mediatek-hw: Add support for CPUFREQ HW")
> Suggested-by: Lukasz Luba <lukasz.luba@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Hi, could this be merged.

> ---
> v2:
> - Fix the driver instead of em_create_perf_table() as suggested.
> - Update the commit message.
> - Add Suggested-by.
> ---
>  drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
> index 8925e096d5b9..aeb5e6304542 100644
> --- a/drivers/cpufreq/mediatek-cpufreq-hw.c
> +++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
> @@ -62,7 +62,7 @@ mtk_cpufreq_get_cpu_power(struct device *cpu_dev, unsigned long *uW,
>  
>  	policy = cpufreq_cpu_get_raw(cpu_dev->id);
>  	if (!policy)
> -		return 0;
> +		return -EINVAL;
>  
>  	data = policy->driver_data;
>  

