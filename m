Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D572CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eH1kF3vyJN4PFd0nDtiZa2tcdP2LF6DQyEGzdkLqyTw=; b=n1P77s6pdQVdRnNU/+BdZ2Sdyg
	2mjxktvgFwG8HHdrGKy39Jl6IlVVFm31JMqquB1R/WPcsSytXsL0Y5sH9V70NS7rBXWrk+2XjQZCu
	7tEul1tTkoMEpesGadH7DUAXrM+e7HGTa1LC2UdzII59am4v4fBfbR+/8CqPVhneqzFY8DHUkuD6E
	ke8Eiqy4xKpU/5oASZJ2B+FP8WbzgiE+erUg9brlf+KrlWjN8SbLnMLUlgBsBJggOnZDKGLBbg7Br
	lACktENCBiBt8NxOvWl/zhB3wrAZ7vfINP1RfmlDJjE7In/cZhZLe5QMMlwjUlSXYEBl13630lL9x
	RGRvrY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtSm-0000000C3No-2zTP;
	Tue, 26 Aug 2025 13:11:48 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqtKs-0000000C1md-3xMb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 13:03:40 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cB76x0Yb3z6L5C1;
	Tue, 26 Aug 2025 21:00:09 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 175E21402F3;
	Tue, 26 Aug 2025 21:03:31 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 26 Aug
 2025 15:03:30 +0200
Date: Tue, 26 Aug 2025 14:03:29 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yushan Wang <wangyushan12@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<robin.murphy@arm.com>, <yangyicong@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@h-partners.com>
Subject: Re: [PATCH v2 1/9] drivers/perf: hisi: Relax the event ID check in
 the framework
Message-ID: <20250826140329.0000146c@huawei.com>
In-Reply-To: <20250821135049.2010220-2-wangyushan12@huawei.com>
References: <20250821135049.2010220-1-wangyushan12@huawei.com>
	<20250821135049.2010220-2-wangyushan12@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_060339_125820_52FB37C6 
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

On Thu, 21 Aug 2025 21:50:41 +0800
Yushan Wang <wangyushan12@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Event ID is only using the attr::config bit [7, 0] but we check the
> event range using the whole 64bit field. It blocks the usage of the
> rest field of attr::config. Relax the check by only using the
> bit [7, 0].
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

Acked-by: Jonathan Cameron <jonathan.cameron@huawei.com>

One comment inline but up to you whether you act on it.

> ---
>  drivers/perf/hisilicon/hisi_uncore_pmu.c | 2 +-
>  drivers/perf/hisilicon/hisi_uncore_pmu.h | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> index a449651f79c9..6594d64b03a9 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> @@ -234,7 +234,7 @@ int hisi_uncore_pmu_event_init(struct perf_event *event)
>  		return -EINVAL;
>  
>  	hisi_pmu = to_hisi_pmu(event->pmu);
> -	if (event->attr.config > hisi_pmu->check_event)
> +	if ((event->attr.config & HISI_EVENTID_MASK) > hisi_pmu->check_event)
>  		return -EINVAL;
>  
>  	if (hisi_pmu->on_cpu == -1)
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.h b/drivers/perf/hisilicon/hisi_uncore_pmu.h
> index 777675838b80..6186b232f454 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
> @@ -43,7 +43,8 @@
>  		return FIELD_GET(GENMASK_ULL(hi, lo), event->attr.config);  \
>  	}
>  
> -#define HISI_GET_EVENTID(ev) (ev->hw.config_base & 0xff)
> +#define HISI_EVENTID_MASK	0xff

I'd use GENMASK(7, 0) here but this one is obvious enough that it's not important
and clearly you are just moving the definition.

> +#define HISI_GET_EVENTID(ev) ((ev)->hw.config_base & HISI_EVENTID_MASK)
>  
>  #define HISI_PMU_EVTYPE_BITS		8
>  #define HISI_PMU_EVTYPE_SHIFT(idx)	((idx) % 4 * HISI_PMU_EVTYPE_BITS)


