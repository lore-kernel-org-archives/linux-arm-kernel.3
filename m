Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C28CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 16:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NnpABZ83+Jlqa1zMOsmsak0Kpbk7IaZzZ0gEIC585M=; b=CWwybhLrZVqNPI/Fqh+B9QTAsw
	9vgBbUnzVuiv82Afv+eFCjnewz7hrqtNaBTogbJnuAddiWH7d095SqYeD/+HWz6x5VZHl/scxj7Rs
	7qepZTuySG4Om3vU1QM+dFKRBvS8D/EXCWDhght+bw64cHm+ybTs7kW1NE9TK2p1bKMqNKScS0vMU
	A86UTHpyvoVaCMkIoyO9d+0YRxfSZh8IJVEs3ADKG9LeLKZNuScP8rJACpbke5lbefukRrob3JAcs
	ZSySFmMemDLlYtG7y2uGhEQu8fWS5jziJwp0+hy8tiU5pVVw3BTe8hV5GkCGJJ7TizieW6PiYfvVW
	WIBgjFug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJy3-0000000CCIV-2FM5;
	Tue, 04 Nov 2025 16:33:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJy0-0000000CCI2-3Tv4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 16:33:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E1E4D4463B;
	Tue,  4 Nov 2025 16:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF42EC4CEF8;
	Tue,  4 Nov 2025 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762273987;
	bh=7Nhqg7rnAqISHVj5SR6lWoy1vxnR8q+G6X9/T5vR1hs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OBlQOQ9MRaJ0W2X3BcDi8b7JyuF0BNN4kluGrMzs/tQpZRkVZr+8LYGdc4fyTWh5l
	 EqIQY++aUs89wQ6ioa9b343cCROG8x5uMa6eE+uFlEzinFNyhUSf/9cXebm6PuOCdH
	 tFB2srRazlF27A+PyO+7nsd4ILM4rXipAZARhPTISVoO1pEoan7eTk2Bln1DucdkbH
	 c1IVXpaW77M+kNO4BGNKwlKYgHwucZvNltBEA7+CrJcvthfGX0yq7c7MlLlPD4KB/X
	 gOcCPfljS01ayTqX0MS8g73BtmHc3fwp6xnQr+r7Qnsc3Dx4GQbE6oF9WNJaJFxKvv
	 c1Tzmd31EJ6Kg==
Date: Tue, 4 Nov 2025 16:33:03 +0000
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyccccc@gmail.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] perf: arm_pmu: Fix build on arm if
 !CONFIG_GENERIC_ARCH_TOPOLOGY
Message-ID: <aQoqv75M85w9lk8f@willie-the-truck>
References: <20251104134004.6964-1-yangyccccc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104134004.6964-1-yangyccccc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_083308_911022_A1FBF47A 
X-CRM114-Status: GOOD (  17.89  )
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

On Tue, Nov 04, 2025 at 09:40:04PM +0800, Yicong Yang wrote:
> The SMT implementation is retrieved by topology_core_has_smt() which
> depends on CONFIG_GENERIC_ARCH_TOPOLOGY. The config is optional on
> arm platforms so protect the usage with CONFIG_GENERIC_ARCH_TOPOLOGY.
> 
> Fixes: c3d78c34ad00 ("perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202511041757.vuCGOmFc-lkp@intel.com/
> Signed-off-by: Yicong Yang <yangyccccc@gmail.com>
> ---
>  drivers/perf/arm_pmu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> index ae437791b5f8..f38bdeb906f0 100644
> --- a/drivers/perf/arm_pmu.c
> +++ b/drivers/perf/arm_pmu.c
> @@ -925,11 +925,13 @@ int armpmu_register(struct arm_pmu *pmu)
>  	if (ret)
>  		return ret;
>  
> +#ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
>  	/*
>  	 * By this stage we know our supported CPUs on either DT/ACPI platforms,
>  	 * detect the SMT implementation.
>  	 */
>  	pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
> +#endif
>  
>  	if (!pmu->set_event_filter)
>  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
> -- 
> 2.50.1 (Apple Git-155)

Wouldn't we be better off adding something like:

#else
static inline bool topology_core_has_smt(int cpu) { return false; }
#endif /* CONFIG_GENERIC_ARCH_TOPOLOGY */

to the bottom of include/linux/arch_topology.h?

Will

