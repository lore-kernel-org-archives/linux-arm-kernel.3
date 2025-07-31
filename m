Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C65C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHPYYGnBf79UhPIq/C+wY/vBL724rTX+hvnVdaQR0Hw=; b=QF7xX5D+mdx0lnMLCeHG7FUmgy
	Yhv53pkvuzvyrkYVSutRKwsbsTUjzpZK5Lqo3t8wK9urw3rFl/GG5I1tGNG49o4xG22TmJclCXrFY
	AMC0iawr82O7/Pidkui/qOjdhUw9k1tCBJhEjbAtMMqqBnqzM3zH9106Ea0TuElFWfhQ+PoQfQsnP
	h5PTSEcHGqPX3YndhF4MJLm8AM9+8dhGbbqOK9klobUYkrn/gZ2U5rNW1/vnA63nfHa6LXWw5FeX/
	FOLVGSkojKOcdadlN3b7FToozpyWHYGof291UkQK6BnqbeHbmd+zSxO5XJ7ZfOLOUVXoCVtzGDtxM
	B4zkZuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSGz-00000003YXV-2gq0;
	Thu, 31 Jul 2025 12:20:37 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSCZ-00000003Y6K-1DUw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 12:16:04 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bt7H56H4Dz6HJg3;
	Thu, 31 Jul 2025 20:11:45 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F18B1402EA;
	Thu, 31 Jul 2025 20:16:01 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 31 Jul
 2025 14:16:00 +0200
Date: Thu, 31 Jul 2025 13:15:59 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yushan Wang <wangyushan12@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>
Subject: Re: [PATCH 2/8] drivers/perf: hisi: Export hisi_uncore_pmu_isr()
Message-ID: <20250731131559.00005001@huawei.com>
In-Reply-To: <20250729153823.2026154-3-wangyushan12@huawei.com>
References: <20250729153823.2026154-1-wangyushan12@huawei.com>
	<20250729153823.2026154-3-wangyushan12@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_051603_481699_06F4E5D6 
X-CRM114-Status: GOOD (  15.95  )
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

On Tue, 29 Jul 2025 23:38:17 +0800
Yushan Wang <wangyushan12@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently Uncore PMU framework assume one PMU device only have one
> interrupt and will help register the interrupt handler. It cannot
> support a PMU with multiple interrupt resources.  An uncore PMU may
> have multiple interrupts that can share the same handler.  Export
> hisi_uncore_pmu_isr() to allow drivers register the irq handler by
> their own routine.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  drivers/perf/hisilicon/hisi_uncore_pmu.c | 3 ++-
>  drivers/perf/hisilicon/hisi_uncore_pmu.h | 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> index 3050899ddf17..ff20ad54f51b 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> @@ -149,7 +149,7 @@ static void hisi_uncore_pmu_clear_event_idx(struct hisi_pmu *hisi_pmu, int idx)
>  	clear_bit(idx, hisi_pmu->pmu_events.used_mask);
>  }
>  
> -static irqreturn_t hisi_uncore_pmu_isr(int irq, void *data)
> +irqreturn_t hisi_uncore_pmu_isr(int irq, void *data)
>  {
>  	struct hisi_pmu *hisi_pmu = data;
>  	struct perf_event *event;
> @@ -178,6 +178,7 @@ static irqreturn_t hisi_uncore_pmu_isr(int irq, void *data)
>  
>  	return IRQ_HANDLED;
>  }
> +EXPORT_SYMBOL_NS_GPL(hisi_uncore_pmu_isr, "HISI_PMU");
>  
>  int hisi_uncore_pmu_init_irq(struct hisi_pmu *hisi_pmu,
>  			     struct platform_device *pdev)
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
> index 50a97e79076a..40aac70352e9 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
> @@ -163,6 +163,7 @@ int hisi_uncore_pmu_offline_cpu(unsigned int cpu, struct hlist_node *node);
>  ssize_t hisi_uncore_pmu_identifier_attr_show(struct device *dev,
>  					     struct device_attribute *attr,
>  					     char *page);
> +irqreturn_t hisi_uncore_pmu_isr(int irq, void *data);
>  int hisi_uncore_pmu_init_irq(struct hisi_pmu *hisi_pmu,
>  			     struct platform_device *pdev);
>  void hisi_uncore_pmu_init_topology(struct hisi_pmu *hisi_pmu, struct device *dev);


