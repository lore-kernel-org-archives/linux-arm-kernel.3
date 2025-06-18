Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8B4C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 14:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yejNzaeT4AqdRcBrvlusXMKj3PtwKLMmx9ArpWPMOyU=; b=hSOc5CYGyv3T2hjmAXtxuCNmiD
	RaIKmn6ng+9H/bnPNYIPJsLZRZzCxd19xdISqy0iNiX3aSqKo6UVot2ItN9tdS2cPgGcxkOMFx/Tn
	tS1XBraMJh4rT1f69+/NNW3aBZN6q5dM8erX3MkMG9LQN08aP0pJe8BEcWrZ6sz1kl3G8ocJYm3EK
	DFiqH8FezYwz34fybIrkF/s1mkERJH8FEIgdrEnqlNE73m/7HcFLp0CbQF1saPGFRkY8EUtHVvy/J
	lL9MpV8VqHW79c9AfA1j2JrrQRqPy3fQp4AT/WVcC0xfqxGNOunDoGc0ZT5o26wI5F/6daYdFKulV
	SCVc/PoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuA2-0000000AVMu-0fSL;
	Wed, 18 Jun 2025 14:53:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsRN-0000000ADgD-1bTy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 13:02:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEF4614BF;
	Wed, 18 Jun 2025 06:02:35 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D72BF3F58B;
	Wed, 18 Jun 2025 06:02:55 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:02:54 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>, yangyicong@hisilicon.com,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	James Clark <james.clark@linaro.org>,
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
Message-ID: <20250618130254.GD794930@e132581.arm.com>
References: <2abcf4ec-4725-4e79-b8d3-a4ddbc00caba@linaro.org>
 <0b839ec1ae89439e95d7069adcbb95ab@huawei.com>
 <20250616130736.GA788469@e132581.arm.com>
 <2dc510b4-ff3d-edff-42be-f8260cd27840@huawei.com>
 <20250616160811.GA794930@e132581.arm.com>
 <aFBYrQgx2m8Nd-iG@J2N7QTR9R3>
 <20250617141810.GB794930@e132581.arm.com>
 <aFJ-Za6oRGKKASN1@J2N7QTR9R3>
 <20250618112440.GC794930@e132581.arm.com>
 <3dbc1f1b-a325-1525-f9f0-8172033438ec@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3dbc1f1b-a325-1525-f9f0-8172033438ec@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_060257_463606_AC21DA16 
X-CRM114-Status: GOOD (  21.39  )
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

On Wed, Jun 18, 2025 at 07:51:03PM +0800, Yicong Yang wrote:

[...]

> >> Directly including the kernel header introduces the very fragility that
> >> having a copy was intended to avoid. NAK to that.
> > 
> > My suggestion is not to include the kernel header, nor to modify the
> > copy header. :)
> > 
> > Instead, I suggested creating a new header within the perf tool (under
> > perf's arm64 folder) and then include the copy header in tools:
> > 
> >   tools/arch/arm64/include/asm/cputype.h
> > 
> 
> sorry for the misunderstood.:(
> in this way we still have the divergency in the long term and as a workaround
> this works same if we partly update the tools/arch/arm64/include/asm/cputype.h
> with only necessary MIDR updates and keep is_midr_in_range_list() unchanged.

Yes. So Mark's suggestion is reasonable that we can do refactoring first
to avoid syncing header.

[...]

> > @Yicong, could you confirm if you proceed to refactor the MIDR? thanks!
> 
> please feel free to take this over.

Thanks a lot for confirmation!  And thanks for working on the reported
issue.

> > Just note, I searched tools folder and found kselftest also uses the
> > cputype.h header. The refactoring should not break the files below.
> > 
> 
> they shouldn't affected. I did a kselftest build test with my latest patch
> and they were not affected.

I expect tools/arch/arm64/include/asm/cputype.h will be removed, and
a generated header (something like sys-midr.h) for MIDR refactoring.
If this is true, then we need to take care kselftest.

Thanks,
Leo

