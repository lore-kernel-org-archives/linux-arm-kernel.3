Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66104C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoE+mQ90cc8FXPpwsEZf1ynry64jLGcjimQNFLDVus0=; b=eDN1Zame+tg5AAP1x37/A8Lp+v
	u1gPoWLobVcXdCjNz9CtJZUDvBkHDPMqPOxQtTOA2KGZQE2y6AXXCKs7CEpeiw+Bd6R+GfO7kxW89
	6gBzBtKAg3rbi8ZhzOFkCR6VF2J7T/+Nlcr80CuP9i2Y9FW6qJLb91RwvKzOOUUxexZY2TIeO89Az
	y+4wwrEUX7FuNhYpiRM3nEqvS3LD4JXdNkxqAqN/dZJ7zQcoPqecOCERjaxTkp9HMdmDMWJkBB2Er
	ZoM75SOgWNQGJbQWWtS6wZiOjwO4FXo0fiAFs0JmVvCuicWFTTz6pZIUMZeETzqdD0+OjdbkiTgPB
	zvptZ+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Lg0-00000000APW-0ix4;
	Fri, 25 Apr 2025 16:13:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8K5m-0000000HRnl-3Qdc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 14:31:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AE6034AA46;
	Fri, 25 Apr 2025 14:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF68BC4CEE4;
	Fri, 25 Apr 2025 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745591510;
	bh=UHdGkzvg9C+rC/4JDTJ4Eo9xVcjMOcIroVQ+uX2ZkKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ww7C8ZsKD4tFuPg33urvoD8Mi6HYfO7igLvyI8H6RSA+gIkc++dDqq5zwJEOQWHv6
	 IC7d8VGyWZdvJm/a1ysitlAuoZvSUSKnA8tUTRLYTqGqUZlC/66wTgYdFKmvcB09WQ
	 JHu2Hz4tsMcsqLBs7/hJ84NaBVkqZRg+Ng2ZK3iELEQ0YdAhmBGLowiP8ydjfSU8AD
	 Gswte8ufcefAjWDm8BldtUiC8ufT+5PjueQr7huk9eppcvR5bB7mukIuc1ukAqq/PV
	 sJQS1l5L8RtXewhBkUFiTG5rQvslDb2q470IL1jFRf7OuhVVhsP7ifDS0+ayhA/T5N
	 XR90PTymwnXwQ==
Date: Fri, 25 Apr 2025 11:31:47 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Junhao He <hejunhao3@huawei.com>, peterz@infradead.org,
	mingo@redhat.com, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, james.clark@linaro.org, leo.yan@arm.com,
	john.g.garry@oracle.com, will@kernel.org, mike.leach@linaro.org,
	yangyicong@hisilicon.com, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxarm@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] perf vendor events arm64: Fill up Desc field for
 Hisi hip08 hha pmu
Message-ID: <aAuc0xx-WqVKH0d3@x1>
References: <20250418070812.3771441-1-hejunhao3@huawei.com>
 <20250418070812.3771441-2-hejunhao3@huawei.com>
 <20250425120654.00007e4c@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425120654.00007e4c@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_073150_870981_9729EA92 
X-CRM114-Status: GOOD (  14.89  )
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

On Fri, Apr 25, 2025 at 12:06:54PM +0100, Jonathan Cameron wrote:
> On Fri, 18 Apr 2025 15:08:10 +0800
> Junhao He <hejunhao3@huawei.com> wrote:
> 
> > In the same PMU, when some JSON events have the "BriefDescription" field
> > populated while others do not, the cmp_sevent() function will split these
> > two types of events into separate groups. As a result, when using perf
> > list to display events, the two types of events cannot be grouped together
> > in the output.
> > 
> > before patch:
> >  $ perf list pmu
> >  ...
> >  uncore hha:
> >    hisi_sccl1_hha2/sdir-hit/
> >    hisi_sccl1_hha2/sdir-lookup/
> >  ...
> >  uncore hha:
> >    edir-hit
> >       [Count of The number of HHA E-Dir hit operations. Unit: hisi_sccl1_hha2]
> >  ...
> > 
> > after patch:
> >  $ perf list pmu
> >  ...
> >  uncore hha:
> >    edir-hit
> >       [Count of The number of HHA E-Dir hit operations. Unit: hisi_sccl1_hha2]
> >    sdir-hit
> >       [Count of The number of HHA S-Dir hit operations. Unit: hisi_sccl1_hha2]
> >    sdir-lookup
> >       [Count of the number of HHA S-Dir lookup operations. Unit: hisi_sccl1_hha2]
> >  ...
> > 
> > Signed-off-by: Junhao He <hejunhao3@huawei.com>
> > Reviewed-by: James Clark <james.clark@linaro.org>
> One trivial comment inline that might be good to tidy up.

These can come as a follow up patch, I think.

> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Applied.

- Arnaldo

