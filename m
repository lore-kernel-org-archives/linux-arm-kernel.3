Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B7BCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFc0VoFvYY53gOzaTSoOiv9otAvjAINrEvNr98Xggoc=; b=jQoHBnyOACs1Y/Pd0AB6aGQksl
	lyhnHUBIhab0iGqd0qz1SnBWUZRM0ZoY1iUitY6Yrkjre+7Vy2Zb9hKw4YLoVaqB7d8z4CcSNG0jT
	gz9yrpCC/xEYyZHLxKnfGO61nDQysFle8yC6NQ6LwThSea5LBhGEs2V3ORc29fImyUzkq4dhuiLOb
	IJieKbTYMIR7vThBMbLGcLjI5zLf8PHsvFcsdxfKS3z5uiyoPL7BWF8uYkTcPGtzmNCeS/jmoe3Xt
	MAi/1Hq4Ea2rj4Ga6bdHh22rd3BhV1TAth/wRUComd9lr+dOD6MxL9ebJvpb05ZhmRbkq8dy8PXzo
	//VnGifw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3Jx-0000000GMqA-2nDX;
	Thu, 04 Jun 2026 08:20:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3Ju-0000000GMph-15ro
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 08:20:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3D013297;
	Thu,  4 Jun 2026 01:20:45 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EE7FD3F7D8;
	Thu,  4 Jun 2026 01:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780561250; bh=xx4q8zA0SDvN+Zn0mJt/nZF2yaNi8H3ZSogpxfNtLDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBXd5CG+Kw6LL3Z4p7LfEbspjPtluKqFtPwlqSvB7gMo+FkOMRXEUzIzw8YIkodTH
	 5cfr6vGu5hfm2waGS4loALDrp8AsIwkxiZPthmIUwEjoK01BV2uy+NuQT4FHx7Zp2C
	 2NcAeygFzCwWLdxy4tNOTyHo+5qDb5CzLEAqoEHA=
Date: Thu, 4 Jun 2026 09:20:47 +0100
From: Leo Yan <leo.yan@arm.com>
To: Amir Ayupov <aaupov@meta.com>
Cc: James Clark <james.clark@linaro.org>, stable@vger.kernel.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] perf cs-etm: stamp pid/tid/EL on each buffered packet to
 fix cross-pid attribution
Message-ID: <20260604082047.GL101133@e132581.arm.com>
References: <20260515021135.1729028-1-aaupov@meta.com>
 <f767dc3b-9796-4b12-a776-1de6a9ff3f99@linaro.org>
 <CAMOD+7+_HE3E+FFg6GPfG31GzVBzF1qhcQ=i-eiEgiGcn3WRvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMOD+7+_HE3E+FFg6GPfG31GzVBzF1qhcQ=i-eiEgiGcn3WRvw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_012054_445235_5195EEB8 
X-CRM114-Status: GOOD (  13.46  )
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

Hi Amir,

On Wed, Jun 03, 2026 at 01:10:17PM -0700, Amir Ayupov wrote:
> Hi James,
> 
> Thank you for picking it up.
> 
> I tested the v2 patch series and it looks good. There was a minor
> difference in 2/39 tested perf data files: the number of brstack samples
> differs by one, however, there was no loss of binary profile. The resulting
> BOLT profile converted from the perf script output was identical, so I'm OK
> with v2 patch as-is.

Sorry jumping in as brstack is mentioned.

Now branch stack is maintained per-CPU wise, it mixes up branch stack
cross threads. The patch 03 in the series [1] refactors branch stack
per-thread by using common code.

Hope this can benefit a bit the profiling data quality and in case
you are interested in.

Thanks,
Leo

[1] https://lore.kernel.org/linux-perf-users/20260526-b4-arm_cs_callchain_support_v1-v6-3-f9f49f53c9dd@arm.com/

