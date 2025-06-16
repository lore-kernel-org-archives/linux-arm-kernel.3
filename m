Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ABEC7115F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fY7R+anpFVUw9c0KfZyW6SVRxUtKa3iHpRuGdqcoma4=; b=0YdCqyNK5aTNZ3A17mVK88MyOz
	rPe7oXapdR1afm/pde8S2eARPqNeq0kwgI7pydbY+dHjoyNPOPuN9Tk6HtqBAmPhULhOpp8C5TF9N
	eW4Ys/PUPldevi7JwyQzDs01ztrGArM4N/s1bLcELmHN2Hxmvv6oLx0wJPGLr55TslGoJeWmommnh
	GFA4m53EFIEuU5g4Y3sXMon0v7f7M6XoKOtsu5MHPFO7ypyKZj1hFByXVzRe9Nqouhv29HHlkIfK5
	ownEqlq2h/rPovGgEZtZZ5rHto6NH5UGdmopkA9Aa/R5skW8LVlpU+pb3QqKSH2C1LsZg8fGBbSqj
	Fd4jXwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREa5-00000005Dk0-2xQc;
	Mon, 16 Jun 2025 18:29:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCNb-00000004xfQ-0qSV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 16:08:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 606641515;
	Mon, 16 Jun 2025 09:07:52 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 593B23F673;
	Mon, 16 Jun 2025 09:08:13 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:08:11 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	yangyicong@hisilicon.com, James Clark <james.clark@linaro.org>,
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
Message-ID: <20250616160811.GA794930@e132581.arm.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_090815_282617_72371692 
X-CRM114-Status: GOOD (  21.20  )
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

On Mon, Jun 16, 2025 at 11:04:08PM +0800, Yicong Yang wrote:

[...]

> >> +static bool is_perf_midr_in_range_list(u32 midr, struct midr_range
> >> const *ranges)
> >> +{
> >> +       while (ranges->model) {
> >> +               if (midr_is_cpu_model_range(midr, ranges->model,
> >> +                                           ranges->rv_min, ranges->rv_max)) {
> >> +                       return true;
> >> +               }
> >> +               ranges++;
> >> +       }
> >> +       return false;
> >> +}
> > 
> > Maybe we can make it more general. For example, move this function into
> > a common header such as tools/perf/arch/arm64/include/cputype.h. Then,
> > util/arm-spe.c can include this header.
> > 
> 
> ok this sounds just like as before except rename the midr check function and modify the
> users in perf. will do in below steps:
> - move cpu_errata_set_target_impl()/is_midr_in_range_list() out of cputype.h
>   since they're only used in the kernel with errata information
> - introduce is_target_midr_in_range_list() in cputype.h to test certain MIDR
>   is within the ranges. (is_perf_midr_in_range_list() only make sense in
>   userspace and is a bit strange to me in a kernel header). maybe reimplement
>   is_midr_in_range_list() with is_target_midr_in_range_list() otherwise there's
>   no users in kernel
> - copy cputype.h to userspace and make users use new is_target_midr_in_range_list()
> 
> this will avoid touching the kernel too much and userspace don't need to implement
> a separate function.

My understanding is we don't need to touch anything in kernel side, we
simply add a wrapper in perf tool to call midr_is_cpu_model_range().

When introduce is_target_midr_in_range_list() in kernel's cputype.h,
if no consumers in kernel use it and only useful for perf tool, then
it is unlikely to be accepted.

Thanks,
Leo

