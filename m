Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F65C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KjZofD8UCzXhhI1yPDaoEBGyezpEQ9lP3/wUlAw80Q=; b=1dO8HtuFBBS13UfegfsHHwQw2F
	oH8Z11wDxYpklo89jUNOJmpiF3IJ650HKFFAz6ed4pWZDNjp+zBf3B3rqMPqpknytkxgnyAW2suYN
	PJEMgFK2eh1OEIJ3uceykmACYpUYO8bGRjPBXdEUHXDJrAw5NsENQioAkk72fKK9LHaSeEiIR3MHk
	3CSfuapMHbwr5NMLjiirVI+BeA4JitK/NICVMFOuX3Ou9QoVB9C3RapuhQVdR7wjno2wrWDq2bGlh
	r4r3R6mYvkkwIHc6MXyv3bPWs32Wj/Du2hgeuoreN+GvBeOV1Dg4iU7IWKEywT8MMuCYPLZtaEffG
	on0x916g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsUS-0000000AE99-10id;
	Wed, 18 Jun 2025 13:06:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRquJ-00000009vdE-0PTO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 11:24:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC4951BC0;
	Wed, 18 Jun 2025 04:24:21 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 132823F58B;
	Wed, 18 Jun 2025 04:24:42 -0700 (PDT)
Date: Wed, 18 Jun 2025 12:24:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Yicong Yang <yangyicong@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
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
Message-ID: <20250618112440.GC794930@e132581.arm.com>
References: <aEyGg98z-MkcClXY@x1>
 <1762acd6-df55-c10b-e396-2c6ed37d16c1@huawei.com>
 <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com>
 <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
 <20250617141810.GB794930@e132581.arm.com>
 <aFJ-Za6oRGKKASN1@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFJ-Za6oRGKKASN1@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_042443_230428_2BF2A71E 
X-CRM114-Status: GOOD (  26.48  )
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

On Wed, Jun 18, 2025 at 09:52:53AM +0100, Mark Rutland wrote:

[...]

> > > Other than that, I think that userspace should just maintain its own
> > > infrastructure, and only pull in things from kernel sources when there's
> > > a specific reason to. Otherwise we're just creating busywork.
> > 
> > I agree with the methodology.
> > 
> > Since Arnaldo is facing build failure when sync headers between kernel
> > and perf tool, to avoid long latency, let us split the refactoriing
> > into separate steps.
> > 
> > As a first step, I think my previous suggestion is valid, we can create a
> > header tools/perf/arch/arm64/include/cputype.h with below code:
> > 
> >   #include "../../../../arch/arm64/include/asm/cputype.h"
> 
> Directly including the kernel header introduces the very fragility that
> having a copy was intended to avoid. NAK to that.

My suggestion is not to include the kernel header, nor to modify the
copy header. :)

Instead, I suggested creating a new header within the perf tool (under
perf's arm64 folder) and then include the copy header in tools:

  tools/arch/arm64/include/asm/cputype.h

> I've replied to the same effect Yicong's patch [1,2].
> 
> If we want to share headers between userspace and kernel, we should
> refactor those headers such that this is safe by construction.
> 
> There is no need to update the userspace headers just because the kernel
> headers have changed, so the simple solution in the short term is to
> suppress the warning from check-headers.sh.

Sure, makes sense for me.

@Arnaldo, as Mark suggested, do you want me to send a patch to remove
cputype.h checking in check-headers.sh or it is fine to keep the warning
until finish the header refactoring?

@Yicong, could you confirm if you proceed to refactor the MIDR? thanks!

Just note, I searched tools folder and found kselftest also uses the
cputype.h header. The refactoring should not break the files below.

$ git grep cputype.h
perf/check-headers.sh:check arch/arm64/include/asm/cputype.h '-I "^#include [<\"]\(asm/\)*sysreg.h"'
perf/util/arm-spe.c:#include "../../arch/arm64/include/asm/cputype.h"
testing/selftests/kvm/arm64/psci_test.c:#include <asm/cputype.h>
testing/selftests/kvm/lib/arm64/vgic.c:#include <asm/cputype.h>

Thanks,
Leo

> [1] https://lore.kernel.org/linux-arm-kernel/dc5afc5c-060c-8bcb-c3a7-0de49a7455fb@huawei.com/T/#m23dfbea6af559f3765d89b9d8427213588871ffd
> [2] https://lore.kernel.org/linux-arm-kernel/dc5afc5c-060c-8bcb-c3a7-0de49a7455fb@huawei.com/T/#m6acbfa00002af8ee791266ea86a58f8f994ed710
> 
> Mark.
> 
> > 
> >   static bool is_perf_midr_in_range_list(u32 midr,
> >                                          struct midr_range const *ranges)
> >   {
> >           while (ranges->model) {
> >                   if (midr_is_cpu_model_range(midr, ranges->model,
> >                                   ranges->rv_min, ranges->rv_max))
> >                           return true;
> >                   ranges++;
> >           }
> > 
> >           return false;
> >   }
> > 
> > Then, once we can generate a dynamic MIDR header file, we can use that
> > header and define the midr_range structure specifically in the perf.
> > In the end, perf can avoid to include kernel's cputype.h.
> > 
> > If no objection, Yicong, do you mind preparing the patch mentioned
> > above? Thanks!
> > 
> > Leo

