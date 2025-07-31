Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E89DC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8u5dMhW8BUcTUWXBbbgiycQFZnF0lI4n8eI1dG1HmY=; b=jn0hmxAoOj4/HPbGlCt8SlAG0W
	K1leHXpWVAkGRqwsrzn/c1a+kuR3x+oDrY5UWKqoUtbNpBFe3lGDHHtjygBPwZQ5oyaslw+8pS89d
	vT3KDCrBE6AC+3tFFi7SwGXUUptK3cGBZ9r/0lyvL1D1XAM529CcA7EGhiycDWImjzo4rhq9BZ96g
	Uh458Y1x9qTNZ6Mq4QYdMzoUKIM28b9iQPFVFeVCRwEh8O8UOyTPTeS7MKRvXG9xFdElbS3aeCx9Q
	Qhucat/o/+zHBWD67eyTTqPGsYRhH7MZjn5jlssfdkRTOhAq2DPFODxSSnbuMR+4VLbjt8cKQfE8Y
	+OqA+r5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSEQ-00000003YGM-3bf3;
	Thu, 31 Jul 2025 12:17:58 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhSBp-00000003Y3P-0WX2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 12:15:18 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bt7Jg20bKz67kb7;
	Thu, 31 Jul 2025 20:13:07 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 236C71402EA;
	Thu, 31 Jul 2025 20:15:06 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 31 Jul
 2025 14:15:05 +0200
Date: Thu, 31 Jul 2025 13:15:03 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yushan Wang <wangyushan12@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>
Subject: Re: [PATCH 1/8] drivers/perf: hisi: Relax the event ID check in the
 framework
Message-ID: <20250731131503.0000740f@huawei.com>
In-Reply-To: <20250729153823.2026154-2-wangyushan12@huawei.com>
References: <20250729153823.2026154-1-wangyushan12@huawei.com>
	<20250729153823.2026154-2-wangyushan12@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_051517_305662_677E076D 
X-CRM114-Status: GOOD (  15.56  )
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

On Tue, 29 Jul 2025 23:38:16 +0800
Yushan Wang <wangyushan12@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Event ID is only using the attr::config bit [7, 0] but we check the
> event range using the whole 64bit field. It blocks the usage of the
> resident field of attr::config. Relax the check by only using the
> bit [7, 0].
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

Reviewed-by: Jonathan Csmeron <Jonathan.Cameron@huawei.com>

This seems sensible clean up even without the rest of the series.


> ---
>  drivers/perf/hisilicon/hisi_uncore_pmu.c | 2 +-
>  drivers/perf/hisilicon/hisi_uncore_pmu.h | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> index ef058b1dd509..3050899ddf17 100644
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
> index f4fed2544877..50a97e79076a 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.h
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.h
> @@ -43,7 +43,8 @@
>  		return FIELD_GET(GENMASK_ULL(hi, lo), event->attr.config);  \
>  	}
>  
> -#define HISI_GET_EVENTID(ev) (ev->hw.config_base & 0xff)
> +#define HISI_EVENTID_MASK	0xff
> +#define HISI_GET_EVENTID(ev) ((ev)->hw.config_base & HISI_EVENTID_MASK)
>  
>  #define HISI_PMU_EVTYPE_BITS		8
>  #define HISI_PMU_EVTYPE_SHIFT(idx)	((idx) % 4 * HISI_PMU_EVTYPE_BITS)


