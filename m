Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE046C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 15:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IjQQV0x4v7pxOJTTVBCFNy8jphgOpJOuxHypSpBUQU=; b=oMSeMn123ckCdS22TAm89WbPNB
	utoCNTKdZKVz8twxktOMjn/yosZmW5P4cbBNhrBaItZeqLRVQ49RQTNTdomkwF+kJ6KdPnXsX2kyY
	UUToK8/GqSA2djeqadl2QOB3nLCot7RYGaOoKLBzCI1gF+tBVbUJoJzVbMfzmLDtpkRATIRI/Rsnu
	/IhGnqHzhg3gYyMZwURL/5hZ1d5yJIyLqwNm0EHPtOXx3MOWjCz3K8yjA+K0RW9Pf+kAj8C1MrprM
	wfshHem8whAg6OzwfPlXI8FJVxU6awr03Jwdl75tqzaQfS/1G2lbkNX2/1+j99eBU1ymqhCTZuk8/
	iBem6Wqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8EA-0000000BX2L-04T1;
	Fri, 26 Jun 2026 15:12:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd8E7-0000000BX1y-0hNo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 15:12:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 596401E7D;
	Fri, 26 Jun 2026 08:12:12 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68D2D3F632;
	Fri, 26 Jun 2026 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782486736; bh=YN7HFeAn5PfLzBdHTnw12iJICI72jFBKITQg8GRt9JI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W4OK0Qj/gfEiAScIK4WRs1+dVyd7SXFPAI+0BUFrcXuVHPnbTliWZzqYxLs3rNdQI
	 4s5PWJrgQ8F5NTwPDsn9Shr56QFSSGvxFWGKWd/D7lYrWZOS+D08a5l6+jG5+suUU4
	 ONIuI3yT9d+BIeSeJ2JJHdwLAJoWoEbNTVCuuzEg=
Date: Fri, 26 Jun 2026 16:12:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com,
	dev.jain@arm.com, rppt@kernel.org, david@kernel.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com,
	shanghaoqiang@xiaomi.com, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>, Tamas.Petz@arm.com,
	Michiel.VanTol@arm.com
Subject: Re: [PATCH v4 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
Message-ID: <20260626151214.GA1794676@e132581.arm.com>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_081219_379346_266EE2E9 
X-CRM114-Status: GOOD (  10.75  )
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

On Thu, Jun 18, 2026 at 04:47:20PM +0800, Wen Jiang wrote:

> Besides accelerating the mapping path, this also enables large
> mappings (PMD and cont-PTE) for vmap, which are currently not
> supported.

I verified this series with large vmap() mappings for Arm trace buffer
units (TRBE and SPE), and the results are positive.

Arm trace buffer units use the CPU's page tables for address translation
when writing trace data to DRAM. The larger vmap() mapping granules
reduce TLB pressure, resulting in significantly fewer L2D TLB refills
and reduced L1D TLB refills. The decrease in dtlb_walk indicates that
fewer page table walks are required and that address translations are
more often satisfied by cached TLB entries.

The detailed results are included below for reference.

Thanks for working on this, and here is my test tag:

Tested-by: Leo Yan <leo.yan@arm.com>

P.s. I applied a local change to set PERF_PMU_CAP_AUX_PREFER_LARGE in
the CoreSight and SPE drivers to allocate large memory chunks. This
change will be sent out once the MM changes are agreed.


## Results with TRBE

Test command:

  taskset -c 2 perf stat -C 10 -e cycles:u,instructions:u,dtlb_walk:u,l1d_tlb:u,l1d_tlb_refill:u,l2d_tlb_refill:u \
    -- taskset -c 2 perf record -C 10 -m ,1G -e cs_etm// \
    -- taskset -c 10 ./sparse_branch_delay.elf

The benchmark was run 5 times. CPU10 was isolated and dedicated to
running the workload while collecting the TLB statistics.

Before this series:

 +----------------+--------+--------+--------+--------+--------+----------+
 |TLB Metrics     |   Run1 |   Run2 |   Run3 |   Run4 |   Run5 |     Avg. |
 +----------------+--------+--------+--------+--------+--------+----------+
 | dtlb_walk      |     63 |     75 |     62 |     73 |     69 |     68.4 |
 +----------------+--------+--------+--------+--------+--------+----------+
 | l1d_tlb        |   2093 |   2189 |   2237 |   2036 |   2086 |   2128.2 |
 +----------------+--------+--------+--------+--------+--------+----------+
 | l1d_tlb_refill |    154 |    153 |    150 |    165 |    157 |    155.8 |
 +----------------+--------+--------+--------+--------+--------+----------+
 | l2d_tlb_refill | 161325 | 161403 | 161432 | 161580 | 161439 | 161435.8 |
 +----------------+--------+--------+--------+--------+--------+----------+

After this series:

 +----------------+--------+--------+--------+--------+--------+----------+----------+
 |TLB Metrics     |   Run1 |   Run2 |   Run3 |   Run4 |   Run5 |     Avg. |    Diff. |
 +----------------+--------+--------+--------+--------+--------+----------+----------+
 | dtlb_walk      |     67 |     59 |     60 |     58 |     53 |     59.4 |  -13.16% |
 +----------------+--------+--------+--------+--------+--------+----------+----------+
 | l1d_tlb        |   6710 |   7120 |   6662 |   6626 |   6542 |   6732.0 | +216.32% |
 +----------------+--------+--------+--------+--------+--------+----------+----------+
 | l1d_tlb_refill |    126 |    117 |    119 |    117 |    119 |    119.6 |  -23.23% |
 +----------------+--------+--------+--------+--------+--------+----------+----------+
 | l2d_tlb_refill |    506 |    489 |    485 |    506 |    489 |   495.0  |  -99.69% |
 +----------------+--------+--------+--------+--------+--------+----------+----------+

## Results with SPE

Test command:

  taskset -c 2 perf stat -C 10 -e cycles:u,instructions:u,dtlb_walk:u,l1d_tlb:u,l1d_tlb_refill:u,l2d_tlb_refill:u \
    -- taskset -c 2 perf record -C 10 -m ,512M -e arm_spe_0/ts_enable=1,pa_enable=1,period=64,min_latency=0/ \
    -- taskset -c 10 dd if=/dev/zero of=/dev/shm/dd_mem_test bs=1M count=1024 status=progress

The benchmark was run five times. CPU10 was isolated and dedicated to
running the workload while collecting the TLB statistics.

Before this series:

 +----------------+--------+--------+--------+--------+--------+----------+
 |TLB Metrics     |   Run1 |   Run2 |   Run3 |   Run4 |   Run5 |     Avg. |
 +----------------+--------+--------+--------+--------+--------+----------+
 | dtlb_walk      |   2090 |   1709 |   1679 |   1519 |   1555 |   1710.4 |
 +----------------+--------+--------+--------+--------+--------+----------+
 | l1d_tlb        | 254450 | 257227 | 252517 | 252535 | 254752 | 254296.2 |
 +----------------+--------+--------+--------+--------+--------+----------+
 | l1d_tlb_refill |  16023 |  16088 |  15944 |  15989 |  15956 |  16000.0 |
 +----------------+--------+--------+--------+--------+--------+----------+
 | l2d_tlb_refill |   5887 |   4204 |   3713 |   4556 |   5620 |   4796.0 |
 +----------------+--------+--------+--------+--------+--------+----------+

After this series:

 +----------------+--------+--------+--------+--------+--------+----------+----------+
 |TLB Metrics     |   Run1 |   Run2 |   Run3 |   Run4 |   Run5 |     Avg. |    Diff. |
 +----------------+--------+--------+--------+--------+--------+----------+----------+
 | dtlb_walk      |   1111 |   1301 |   1229 |   1166 |   1771 |   1315.6 |  -23.08% |
 +----------------+--------+--------+--------+--------+--------+----------+----------+
 | l1d_tlb        | 257462 | 257420 | 257241 | 259968 | 261324 | 258683.0 |   +1.73% |
 +----------------+--------+--------+--------+--------+--------+----------+----------+
 | l1d_tlb_refill |  15954 |  15919 |  15948 |  15962 |  15968 |  15950.2 |   -0.31% |
 +----------------+--------+--------+--------+--------+--------+----------+----------+
 | l2d_tlb_refill |   2672 |   2558 |   2801 |   2478 |   4147 |   2931.2 |  -38.88% |
 +----------------+--------+--------+--------+--------+--------+----------+----------+

