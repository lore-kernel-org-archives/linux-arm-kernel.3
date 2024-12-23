Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91F5E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 16:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUUV295mpc1NgWVAaH8bN5B1CaPaQGL1yN4rYo6A568=; b=qfu7TFzqw44d47V/NhTI8BN41g
	uTSx33UN3d4ZGdMArRVbOetezqDJW9odzVxHjuvYswTr+C1cVJ398XrUmTs9hfCMMm+G+1UJsIO2W
	V5mtOR/FR0pqZXokOZYV9nsBvhvI1nTedj9tkfzTkiiBSfDfL5/rmrloCphzPcfnXhUDpy3H2D4sj
	4ZR47pUg3SRWdkPm4ilyOKL+5+Z6c7+mSKkVIp4JrriDKhkHDj+byZ3cvm1Czd+op9RMdbcq5eCEq
	1Tt108q9slMvKpkpYavZPPWqkU5YuwRT8pGZod0AdrE8le6eRdkAtE4o5axdCCsQjAMRjdeo1aRlN
	uVSWBVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlHc-0000000AOhG-3K97;
	Mon, 23 Dec 2024 16:27:52 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlCm-0000000ANfN-1zf3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 16:22:54 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH39l6JzWz6K9VV;
	Tue, 24 Dec 2024 00:18:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 58D2C140B3C;
	Tue, 24 Dec 2024 00:22:42 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 17:22:41 +0100
Date: Mon, 23 Dec 2024 16:22:39 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>, <yangyicong@hisilicon.com>
Subject: Re: [PATCH] drivers/perf: hisi: Set correct IRQ affinity for PMUs
 with no association
Message-ID: <20241223162239.00005774@huawei.com>
In-Reply-To: <20241223125134.57885-1-yangyicong@huawei.com>
References: <20241223125134.57885-1-yangyicong@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_082252_668641_2C1D4BE1 
X-CRM114-Status: GOOD (  14.42  )
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

On Mon, 23 Dec 2024 20:51:34 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> For PMUs with no association, the hisi_pmu->on_cpu is initialized
> according to the NUMA locality but use a wrong CPU for the interrupt
> affinity. The CPU selected from cpumask_local_spread() can be different
> from the CPU by the cpuhp callback. Fix this by setting the IRQ affinity
> to hisi_pmu->on_cpu.
> 
> Fixes: 6cd137088fdf ("drivers/perf: hisi: Refactor the detection of associated CPUs")
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/perf/hisilicon/hisi_uncore_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> index 83bdc9c31367..ef058b1dd509 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
> @@ -510,7 +510,7 @@ int hisi_uncore_pmu_online_cpu(unsigned int cpu, struct hlist_node *node)
>  			return 0;
>  
>  		hisi_pmu->on_cpu = cpumask_local_spread(0, dev_to_node(hisi_pmu->dev));
> -		WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(cpu)));
> +		WARN_ON(irq_set_affinity(hisi_pmu->irq, cpumask_of(hisi_pmu->on_cpu)));
>  		return 0;
>  	}
>  


