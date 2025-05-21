Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA45FC54E65
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 10:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYp3OP2iF0WW+e6DH4LjnP4ZaeJDXFfWaNaLPPnPy4g=; b=TuXcKgygNB0yh+IEO3hYAyklcQ
	J6IfOtsEJl/Ul2bprUSrzixNIg+shfdGVc2yzv6WEQCCInjLoUpvx1aJgGFiZ21Y5klEF2KxbPNdD
	uI7hvlEnvcuHjqFNGbiGphbtlJYsN+H/UK2kqTSzZQkYXeNMQSrLha23iqzrQMB4TPtjHJJNGZwsQ
	bqF377ZeJJHkI7bp5EHqA+Yvh/RFRpUlXYobWTISH7ai9yRoN0gWbkOOlj7CQM6yo9vQjyEwoaxpi
	cDSAFXkaqRcsZ3tYEOmFEHb3DGrjLeVbpLUC3J6hb3b/8xc4hQxlFAKyjI9oNY5SYNQzDprntPC2G
	IizOD6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgsk-0000000FWJu-41RU;
	Wed, 21 May 2025 10:41:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHgpV-0000000FW6c-0Aez
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 10:37:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E68C1515;
	Wed, 21 May 2025 03:37:30 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 039463F6A8;
	Wed, 21 May 2025 03:37:44 -0700 (PDT)
Date: Wed, 21 May 2025 11:37:42 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: acme@kernel.org, namhyung@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, peterz@infradead.org, mingo@redhat.com,
	mark.rutland@arm.com, jolsa@kernel.org, john.g.garry@oracle.com,
	james.clark@linaro.org, leo.yan@linux.dev, irogers@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, jonathan.cameron@huawei.com,
	hejunhao3@huawei.com, linuxarm@huawei.com, wangyushan12@huawei.com,
	caijingtao@huawei.com, xueshan2@huawei.com,
	prime.zeng@hisilicon.com, yangyicong@hisilicon.com
Subject: Re: [PATCH v2 3/3] perf mem: Count L2 HITM for c2c statistic
Message-ID: <20250521103742.GB2565659@e132581.arm.com>
References: <20250425033845.57671-1-yangyicong@huawei.com>
 <20250425033845.57671-4-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425033845.57671-4-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_033745_121483_063502A3 
X-CRM114-Status: GOOD (  15.62  )
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

On Fri, Apr 25, 2025 at 11:38:45AM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> L2 HITM is not counted in c2c statistic decoding. Count it for lcl_hitm
> like how we handle L2 Peer snoop.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>

Reviewed-by: Leo Yan <leo.yan@arm.com>

> ---
>  tools/perf/util/mem-events.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/util/mem-events.c b/tools/perf/util/mem-events.c
> index 884d9aebce91..a384a866a562 100644
> --- a/tools/perf/util/mem-events.c
> +++ b/tools/perf/util/mem-events.c
> @@ -680,7 +680,10 @@ do {				\
>  			if (lvl & P(LVL, LFB)) stats->ld_fbhit++;
>  			if (lvl & P(LVL, L1 )) stats->ld_l1hit++;
>  			if (lvl & P(LVL, L2)) {
> -				stats->ld_l2hit++;
> +				if (snoop & P(SNOOP, HITM))
> +					HITM_INC(lcl_hitm);
> +				else
> +					stats->ld_l2hit++;
>  
>  				if (snoopx & P(SNOOPX, PEER))
>  					PEER_INC(lcl_peer);
> 
> -- 
> 2.24.0
> 

