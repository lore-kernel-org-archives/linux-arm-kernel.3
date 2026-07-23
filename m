Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD63C44532
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ffb8HuUn7oxunFjlvB6SA3X4fMM99E5+jBR0sfFb7F0=; b=ECWbEBrG3v2KASpalTByRuEPUn
	UDp+eS8MiEnS2Vza/ZKalz7IUnqDFg0ZFoRn9SB/UNUYh7AXuX47cw7CsDpOPWg5obntIzuHGRYZg
	kRC5GW+QIVIDQxApa+1B+QLT7cAEZ27N8Djx1lGCs2VvxJFt3wiKnkQoQJBsYqUWsWYnlq8EWj+p6
	4I2ePre4m+kkKvAfAWPBa7yyPp92JJM33vrpk4ibbL51gFHrNia/Pq3bmPBvP7uDAQUuo8FobHgJP
	28owKuGCQPRPUoi0kV9Eb7F0kZCzaunNKjW91PvySvNDZTShbfhqVLVazhBo8mV3CURl5BII9GySh
	FhiTjP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiIg-0000000D2iI-248D;
	Thu, 23 Jul 2026 01:32:38 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiId-0000000D2hW-3dub
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 01:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1784770350; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Ffb8HuUn7oxunFjlvB6SA3X4fMM99E5+jBR0sfFb7F0=;
	b=okLIvtG4mug7pL/6YCBLegVzQIJGKFlrsl7tLYJS0u8JtEOkE/QXeYYkQOpxCchxA/4gU0I0WAhRqYpeVg68On9ulMzNYseZ6+/CR8Jlxg9iXCd0TUQWBe21FvVosQaond0JghEnf0CdpgpfX06u0vHjDDdJu6x8AkAQOgZsTxo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R861e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X7eTJH5_1784770346;
Received: from 30.246.177.242(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X7eTJH5_1784770346 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 23 Jul 2026 09:32:27 +0800
Message-ID: <31bebd39-8534-417c-866d-6d6e3468473c@linux.alibaba.com>
Date: Thu, 23 Jul 2026 09:32:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] perf: Remove redundant dev_err()/dev_err_probe()
To: Pan Chuang <panchuang@vivo.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Frank Li <Frank.li@nxp.com>,
 Xu Yang <xu.yang_2@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 "moderated list:ARM PMU PROFILING AND DEBUGGING"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM PMU PROFILING AND DEBUGGING"
 <linux-perf-users@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>,
 "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
 "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>
References: <20260717103123.34887-1-panchuang@vivo.com>
 <20260717103123.34887-2-panchuang@vivo.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260717103123.34887-2-panchuang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183236_578581_AD049EDF 
X-CRM114-Status: GOOD (  12.01  )
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



On 7/17/26 6:31 PM, Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() and dev_err_probe() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>   drivers/perf/alibaba_uncore_drw_pmu.c | 5 +----
>   drivers/perf/fsl_imx8_ddr_perf.c      | 4 +---
>   drivers/perf/fsl_imx9_ddr_perf.c      | 4 +---
>   drivers/perf/fujitsu_uncore_pmu.c     | 2 +-
>   drivers/perf/qcom_l2_pmu.c            | 5 +----
>   drivers/perf/qcom_l3_pmu.c            | 5 +----
>   drivers/perf/starfive_starlink_pmu.c  | 2 +-
>   drivers/perf/xgene_pmu.c              | 4 +---
>   8 files changed, 8 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/perf/alibaba_uncore_drw_pmu.c b/drivers/perf/alibaba_uncore_drw_pmu.c
> index 74786a5dd6a2..fc934bccf4a6 100644
> --- a/drivers/perf/alibaba_uncore_drw_pmu.c
> +++ b/drivers/perf/alibaba_uncore_drw_pmu.c
> @@ -449,11 +449,8 @@ static struct ali_drw_pmu_irq *__ali_drw_pmu_init_irq(struct platform_device
>   	 */
>   	ret = devm_request_irq(&pdev->dev, irq_num, ali_drw_pmu_isr,
>   			       IRQF_SHARED, dev_name(&pdev->dev), irq);
> -	if (ret < 0) {
> -		dev_err(&pdev->dev,
> -			"Fail to request IRQ:%d ret:%d\n", irq_num, ret);
> +	if (ret < 0)
>   		goto out_free;
> -	}
>   
>   	ret = irq_set_affinity_hint(irq_num, cpumask_of(irq->cpu));
>   	if (ret)
For Alibaba PMU part,

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks,
Shuai

