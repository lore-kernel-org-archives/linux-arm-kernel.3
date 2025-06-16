Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3741CC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 15:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ahU+Fy7zos+HoJpvhgTaSEeCqnp1KaAvQIN2KReCpY=; b=NrtjLPfEyPlvEmX8yfYdn/jcjs
	WGwP4z/YoHtmHgqWBTr85IRKCjpNaTSD4tOtJRSaKnODhhuKxevlGtaQYN5FL05BPjz+6SiOTonDB
	xGynmFNPHwFRinf6l/4Xbh/Iw8wsA9ZLViX659PAjCvXoNwb5z4bA/v+N3CB91sLGh5HqzNzZhbiW
	r/Yw7+a4/6jTUfb9w3L4nbYJDhqY/HNFjfYrhGa4WMktAGqr4GjwCQ4ULgY2cK7wE7W3pDdlbMFYb
	2Mo/NGUPapjAux+/e2dyePWqLCWsRWxRUB10iLMNU2+4r41QY8klGrwNx1pjI1Etdwny0w+2eNb62
	5gx6c44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBik-00000004p8e-0N9M;
	Mon, 16 Jun 2025 15:26:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR9Yr-00000004UCc-34WY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 13:07:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05463168F;
	Mon, 16 Jun 2025 06:07:17 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 273733F673;
	Mon, 16 Jun 2025 06:07:38 -0700 (PDT)
Date: Mon, 16 Jun 2025 14:07:36 +0100
From: Leo Yan <leo.yan@arm.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: James Clark <james.clark@linaro.org>,
	yangyicong <yangyicong@huawei.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Ali Saidi <alisaidi@amazon.com>, Leo Yan <leo.yan@linaro.org>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	yangjinqian <yangjinqian1@huawei.com>,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Kan Liang <kan.liang@linux.intel.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: perf usage of arch/arm64/include/asm/cputype.h
Message-ID: <20250616130736.GA788469@e132581.arm.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_060741_817603_11F63455 
X-CRM114-Status: GOOD (  19.40  )
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

On Mon, Jun 16, 2025 at 09:54:43AM +0000, Shameerali Kolothum Thodi wrote:

[...]

> > > -bool is_midr_in_range_list(struct midr_range const *ranges) -{
> > > -	while (ranges->model)
> > > -		if (is_midr_in_range(ranges++))
> > > -			return true;
> > >   	return false;
> > >   }

> > Looks ok to me.
> > 
> > You could do it with slightly less churn on the kernel side if you keep the
> > function name and arguments the same there. There's only one usage in
> > Perf so that one could be renamed and have the midr argument added back
> > in.
> 
> +1.
> 
> Can we use a separate one for perf here, something like below(untested)?

Thanks for working on this. Agreed.

> --- a/tools/perf/util/arm-spe.c
> +++ b/tools/perf/util/arm-spe.c
> @@ -842,6 +842,18 @@ static void arm_spe__synth_memory_level(const
> struct arm_spe_record *record,
>                 data_src->mem_lvl |= PERF_MEM_LVL_REM_CCE1;
>  }
> 
> +static bool is_perf_midr_in_range_list(u32 midr, struct midr_range
> const *ranges)
> +{
> +       while (ranges->model) {
> +               if (midr_is_cpu_model_range(midr, ranges->model,
> +                                           ranges->rv_min, ranges->rv_max)) {
> +                       return true;
> +               }
> +               ranges++;
> +       }
> +       return false;
> +}

Maybe we can make it more general. For example, move this function into
a common header such as tools/perf/arch/arm64/include/cputype.h. Then,
util/arm-spe.c can include this header.

Thanks,
Leo

