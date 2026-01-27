Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91767D34097
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcDs1qd16dQ6i9WVBNuLqJ2ZE/IBrRebY3XykorDy3o=; b=kKQr7h1L5RwZ6TfG/+QVbfbM65
	cBzYfHmHz9JvQGCPTkGykzkCwIlp2kP70VrYoXQsd59DTdW1fJmunAVzLIvODO3nSdn/s/tN/VHwU
	i10g7Zjp0yqxvlc2r0u7zsJs07TRtVyYKHMYjaEi4OkYgSURutimZMWASZ+YvQdIOG0xAwClCIYKN
	HDX3gsKwS5VUJnXN90Ih24IXjCpRrYZOKlTgn2iTlyayd8BwFyOsGUI6JALtey0M7ZRTrfSEUASYl
	SpOtkT70Nb59snF1o1dxl3TlxB5VGT0iPwPkEiyhEu8QOT5HxIalSZE6nl1RLdIyBp9f9ruufu7Xq
	pQcjIoXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklSo-0000000Eaes-1hZP;
	Tue, 27 Jan 2026 15:58:46 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklSl-0000000EadJ-1wAB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 15:58:45 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0qn623cczJ46Yd;
	Tue, 27 Jan 2026 23:58:02 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 696134056A;
	Tue, 27 Jan 2026 23:58:38 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 15:58:37 +0000
Date: Tue, 27 Jan 2026 15:58:35 +0000
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
Subject: Re: [RFT PATCH 1/7] perf stat: Check color's length instead of the
 pointer
Message-ID: <20260127155835.000011c9@huawei.com>
In-Reply-To: <20260126123514.3238425-2-wangyushan12@huawei.com>
References: <20260126123514.3238425-1-wangyushan12@huawei.com>
	<20260126123514.3238425-2-wangyushan12@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_075843_807264_52414490 
X-CRM114-Status: GOOD (  13.29  )
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

On Mon, 26 Jan 2026 20:35:08 +0800
Yushan Wang <wangyushan12@huawei.com> wrote:

> Color string returned by metric_threshold_classify__color() is never
> NULL, check the presence of *color will always return true.
> 
> Fix this by change the checks against length of *color.
> 
> Fixes: 37b77ae95416 ("perf stat: Change color to threshold in print_metric")
> 
No blank line between tags.

Fixes: 37b77ae95416 ("perf stat: Change color to threshold in print_metric")
Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

Some of the scripting run against the kernel uses that lack of blank lines
as a heuristic to identify what is a tag vs other similar looking text.

Thanks,

Jonathan

> Signed-off-by: Yushan Wang <wangyushan12@huawei.com>
> ---
>  tools/perf/builtin-script.c    | 2 +-
>  tools/perf/util/stat-display.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
> index 62e43d3c5ad7..9fe90f564c69 100644
> --- a/tools/perf/builtin-script.c
> +++ b/tools/perf/builtin-script.c
> @@ -2100,7 +2100,7 @@ static void script_print_metric(struct perf_stat_config *config __maybe_unused,
>  	perf_sample__fprintf_start(NULL, mctx->sample, mctx->thread, mctx->evsel,
>  				   PERF_RECORD_SAMPLE, mctx->fp);
>  	fputs("\tmetric: ", mctx->fp);
> -	if (color)
> +	if (strlen(color))
>  		color_fprintf(mctx->fp, color, fmt, val);
>  	else
>  		printf(fmt, val);
> diff --git a/tools/perf/util/stat-display.c b/tools/perf/util/stat-display.c
> index 6d02f84c5691..91c0c1020f4e 100644
> --- a/tools/perf/util/stat-display.c
> +++ b/tools/perf/util/stat-display.c
> @@ -474,7 +474,7 @@ static void print_metric_std(struct perf_stat_config *config,
>  		do_new_line_std(config, os);
>  
>  	n = fprintf(out, " # ");
> -	if (color)
> +	if (strlen(color))
>  		n += color_fprintf(out, color, fmt, val);
>  	else
>  		n += fprintf(out, fmt, val);
> @@ -607,7 +607,7 @@ static void print_metric_only(struct perf_stat_config *config,
>  	if (mlen < strlen(unit))
>  		mlen = strlen(unit) + 1;
>  
> -	if (color)
> +	if (strlen(color))
>  		mlen += strlen(color) + sizeof(PERF_COLOR_RESET) - 1;
>  
>  	color_snprintf(str, sizeof(str), color ?: "", fmt ?: "", val);


