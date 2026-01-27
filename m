Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCFDD3408E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7rolBnei6j63K9l1g9NXQPwoaUb4R3KpFcbxqLE6Rs=; b=eChTGgrun1On7UUvOBRysij2Mn
	UJ7NIpu2mSrj3sHRAdDRSoMaDnyX+6becfc4HZZG3t8cKr9EylEykSyXG45F7zIfsTrVi6q9eERWJ
	YbteSmd1OiAD7oiDbXsTL3T/ldd72EA+LEQZecHP/K1pic8yq4cUaRy5AE5WQ9p2H9v1AWEB9T2Y5
	fetf31fQwRulO8zouw/Nr4fU1qwJNSUBmdh07hWtS/GXnSFXtWPHRWnsqcMYAFln108+Q3Vj8oujI
	vK8jckG/NwohUvPPi+JuMQy0u5yzMP9JPTaNmYrolmntoD+GVwOBSsU1eNO1wX1IkzkaOFrr2lRoC
	owzMu+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklVQ-0000000EbFE-2IzK;
	Tue, 27 Jan 2026 16:01:28 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklVL-0000000EbEs-2dCe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 16:01:27 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0qrD5pBGzJ46Cf;
	Wed, 28 Jan 2026 00:00:44 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id E929B40569;
	Wed, 28 Jan 2026 00:01:20 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 16:01:19 +0000
Date: Tue, 27 Jan 2026 16:01:18 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Yushan Wang <wangyushan12@huawei.com>
CC: <mike.leach@linaro.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <adrian.hunter@intel.com>, <peterz@infradead.org>,
	<john.g.garry@oracle.com>, <shiju.jose@huawei.com>, <will@kernel.org>,
	<linux-perf-users@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <wangzhou1@hisilicon.com>
Subject: Re: [RFT PATCH 2/7] perf stat: Save unnecessary print_metric() call
Message-ID: <20260127160118.00001692@huawei.com>
In-Reply-To: <20260126123514.3238425-3-wangyushan12@huawei.com>
References: <20260126123514.3238425-1-wangyushan12@huawei.com>
	<20260126123514.3238425-3-wangyushan12@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_080126_048538_40BC5629 
X-CRM114-Status: GOOD (  16.31  )
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

On Mon, 26 Jan 2026 20:35:09 +0800
Yushan Wang <wangyushan12@huawei.com> wrote:

> Patch [1] removed the second branch of iostat_run, and changed num to 0
> since it is the default behavior. But during iostat_run, default value 1
> of num is required to avoid print_metric() call later.
> 
> Set num as 1 to avoid redundant print_metric() call that causes
> unaligned blank printed.
> 
> Fixes: b71f46a6a708 ("perf stat: Remove hard coded shadow metrics")
> 
> [1]: https://lore.kernel.org/all/20251111212206.631711-8-irogers@google.com/

Use a Link tag for links, but don't add them when they just point to the patch
you already have as a fixes tag.  Just refer to it as "The patch listed under
Fixes".
> 
> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> ---
>  tools/perf/util/stat-shadow.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
> index 9c83f7d96caa..9439baf8002f 100644
> --- a/tools/perf/util/stat-shadow.c
> +++ b/tools/perf/util/stat-shadow.c
> @@ -319,8 +319,10 @@ void perf_stat__print_shadow_stats(struct perf_stat_config *config,
>  	void *ctxp = out->ctx;
>  	int num = 0;
>  
> -	if (config->iostat_run)
> +	if (config->iostat_run) {
>  		iostat_print_metric(config, evsel, out);
> +		num = 1;
> +	}
>  
>  	perf_stat__print_shadow_stats_metricgroup(config, evsel, aggr_idx,
>  						  &num, NULL, out);


