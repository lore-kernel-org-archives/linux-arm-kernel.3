Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F63C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 14:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ifXXIOFUCTrffgXgl0/x/2tZXJkHmuH2M65rt03QFpo=; b=jFL+3/IZKU7jt+PZFHROPzB0Kb
	c/AM+0wNUcpCjIEJ5uWOIDJVUoeWIrU3KKaTA4q+yeiL5Y6LIz6zL8PD7NyRs89f/rpS331T0Pm+m
	NHLlg8mvMwkXP2bpIdfll3LvdI31LYFjRZriAKL+QJfH8QnZUyugE9Pq2qgXpoF+nqtnpyu605fvK
	OLruKd/vSbOepiELWqzu01091u/VZOMi1fl/oCFH8DOhwJtMRASCCV1f8uNmJs52tVyoUxvtoJukD
	vaTFDPsKFd5auKn/zrI0nuoYRy+RjU/qo7KJrHpXVkgm60NuNh58zmC0cWFdUJ+UMmB9STqd/8x2O
	u0GemZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EfT-00000007Vf3-3PAn;
	Tue, 22 Apr 2025 14:32:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DXo-00000007H2I-1iYx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 13:20:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BDC1152B;
	Tue, 22 Apr 2025 06:20:07 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D4733F5A1;
	Tue, 22 Apr 2025 06:20:11 -0700 (PDT)
Date: Tue, 22 Apr 2025 14:20:06 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: James Clark <james.clark@linaro.org>, yangyicong@hisilicon.com,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, wangyushan12@huawei.com, caijingtao@huawei.com,
	xueshan2@huawei.com, prime.zeng@hisilicon.com, acme@kernel.org,
	namhyung@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
	jolsa@kernel.org, john.g.garry@oracle.com, leo.yan@linux.dev,
	irogers@google.com, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] perf arm-spe: Add support for SPE Data Source packet on
 HiSilicon HIP12
Message-ID: <20250422132006.GG28953@e132581.arm.com>
References: <20250408122809.37884-1-yangyicong@huawei.com>
 <89741897-6c8f-4b75-8ec3-675111ea60a1@linaro.org>
 <20250422102952.GD28953@e132581.arm.com>
 <ccb8ce65-8241-0670-25c8-f8245fbc5e22@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccb8ce65-8241-0670-25c8-f8245fbc5e22@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_062012_498645_3FBADBED 
X-CRM114-Status: GOOD (  22.26  )
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

On Tue, Apr 22, 2025 at 08:31:43PM +0800, Yicong Yang wrote:

[...]

> >>> +	case ARM_SPE_HISI_HIP_PEER_CLUSTER:
> >>> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE1 | PERF_MEM_LVL_HIT;
> >>> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_L3;
> > 
> > Seems to me, a CPU has L3 cache, would the cluster has a higher level's
> > cache?
> 
> In my case, the cluster CPUs share the L3 cache and there's several clusters.
> L3's the highest level cache in the system.

If so, you might need to revise the cache levels for:

  ARM_SPE_HISI_HIP_PEER_CPU
  ARM_SPE_HISI_HIP_PEER_CPU_HITM

IIUC, cluster CPUs share L3 cache, and every CPU in a cluster has
L1/L2 cache, for PEER_CPU cases, the memory level should be L2.

[...]

> >>> +	case ARM_SPE_HISI_HIP_REMOTE_SOCKET:
> >>> +		data_src->mem_lvl = PERF_MEM_LVL_REM_CCE2;
> >>> +		data_src->mem_lvl_num = PERF_MEM_LVLNUM_ANY_CACHE;
> >>> +		data_src->mem_remote = PERF_MEM_REMOTE_REMOTE;
> >>> +		data_src->mem_snoopx = PERF_MEM_SNOOPX_PEER;
> >>
> >> Hi Yicong,
> >>
> >> Is the mem_snoop setting missing from this one?
> > 
> > The field 'mem_snoopx' is an extension to the field 'mem_snoop'.
> > 
> > If the field 'mem_snoopx' is set, it is no need to set 'mem_snoop'.
> > 
> 
> they should not be mutal exclusive. mem_snoopx provides the information where
> the cacheline comes from while mem_snoop provides the status of the cacheline.
> if hardware supports we can gather both information from the data source, like
> above for ARM_SPE_HISI_HIP_PEER_CLUSTER_HITM.

My understanding is the PERF_MEM_SNOOPX_PEER flag was extended for
support Arm SPE.  Other snoop flags were original from x86 arch.

I agreed that in some cases above, both the flags PERF_MEM_SNOOPX_PEER
and PERF_MEM_SNOOP_HITM can be set together, you can parse cache sharing
with different --display options:

  perf c2c report --display tot    => based on HITM flags
  perf c2c report --display peer   => based on SNOOPX_PEER flag

> for other cases if there's mem_snoopx information I think mem_snoop can be dropped,
> this won't make differeces. Checked c2c_decode_stats(), only PERF_MEM_SNOOP_HIT and
> PERF_MEM_SNOOP_HITM is useful when summarizing c2c statistics.

It is about how to present accurate results.

E.g., for REMOTE_SOCKET type, it is hard to say the data from remote
DRAM or any level's cache.  Since more hardware details are absent, this
is why I suggested not to set 'mem_snoop' for REMOTE_SOCKET.

Thanks,
Leo

