Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E91CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BoF2hZGnUTDHbRaBQUXOTtAXviZ7kQ2447ZSi7I63JQ=; b=0L9JQBur2m2KucU6989BPA7V6N
	mlzGt2EnNgx8ygx2d6C3lbBFzjAajRFUEBbl92ilfv9/XdtDv0TpmmDd4HmBypDDa8dEUIBZ/orpJ
	907RhL0Nsrwo3kIj6mLdMA4qSHzRfSs6qajGsoBNuImaStPV7LOmN3wWK2i5zSJ/7uRRkBGUMpUeC
	M7VVqTRb91TwuHGm5nKsLvGTnj6zF6ae11coBzKDElcgiJEvkr9vB6QptS6ssSvjMuqNRgTROCg1+
	EH2X1+btt/EJlrvdk5Xx9VlaCDTExEeQXBdDcQLroVoF6pIf/q+vwbSE2bY8vuygDbXmsbgBbq1A+
	vEic5Xkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrij-0000000BIiN-2FwV;
	Tue, 12 Aug 2025 16:19:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmJk-0000000AW24-3p9a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:33:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBB0D25E1;
	Tue, 12 Aug 2025 03:33:11 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 529DA3F738;
	Tue, 12 Aug 2025 03:33:17 -0700 (PDT)
Date: Tue, 12 Aug 2025 11:33:14 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org,
	james.clark@linaro.org, robh@kernel.org, anshuman.khandual@arm.com,
	jonathan.cameron@huawei.com, hejunhao3@huawei.com,
	linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangyushan12@huawei.com, yangyicong@hisilicon.com
Subject: Re: [PATCH 2/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
Message-ID: <aJsYah_DGPIQ5v3-@J2N7QTR9R3>
References: <20250812080830.20796-1-yangyicong@huawei.com>
 <20250812080830.20796-3-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812080830.20796-3-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_033320_987079_850BB7C8 
X-CRM114-Status: GOOD (  24.05  )
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

On Tue, Aug 12, 2025 at 04:08:30PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> CPU_CYCLES is expected to count the logical CPU (PE) clock. Currently it's
> preferred to use PMCCNTR_EL0 for counting CPU_CYCLES, but it'll count
> processor clock rather than the PE clock (ARM DDI0487 L.b D13.1.3) if
> one of the SMT siblings is not idle on a multi-threaded implementation.
>
> So don't use it on SMT cores.

This is rather unfortunate.

When does this actually matter?

Per ARM DDI 0487 L.b, page D14-6918:

| If FEAT_PMUv3p9 is implemented, then CPU_CYCLES does not increment
| when the clocks are stopped by WFI and WFE instructions. Otherwise, it
| is CONSTRAINED UNPREDICTABLE whether or not CPU_CYCLES continues to
| increment when the clocks are stopped by WFI and WFE instructions.

... so prior to FEAT_PMUv3p9, no-one could rely on the difference
anyway.

> When counting cycles on SMT CPU 2-3 and CPU 3 is idle, without this
> patch we'll get:
> [root@client1 tmp]# perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
> --taskset 2 --timeout 1
> [...]
>  Performance counter stats for 'CPU(s) 2-3':
> 
> CPU2           2880457316      cycles
> CPU3           2880459810      cycles
>        1.254688470 seconds time elapsed
> 
> With this patch the idle state of CPU3 is observed as expected:
> [root@client1 ~]#  perf stat -e cycles -A -C 2-3 -- stress-ng -c 1
> --taskset 2 --timeout 1
> [...]
>  Performance counter stats for 'CPU(s) 2-3':
> 
> CPU2           2558580492      cycles
> CPU3               305749      cycles
>        1.113626410 seconds time elapsed
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/perf/arm_pmuv3.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 95c899d07df5..ed3149632b71 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -1002,6 +1002,15 @@ static bool armv8pmu_can_use_pmccntr(struct pmu_hw_events *cpuc,
>  	if (has_branch_stack(event))
>  		return false;
>  
> +	/*
> +	 * The PMCCNTR_EL0 increments from the processor clock rather than
> +	 * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll continue
> +	 * counting on a WFI PE if one of its SMT silbing is not idle on a
> +	 * multi-threaded implementation. So don't use it on SMT cores.
> +	 */
> +	if (cpumask_weight(topology_sibling_cpumask(smp_processor_id())) > 1)
> +		return false;

This effectively forbids use of PMCCNTR_EL0 for any events.

Is there any existing event that it is useful for?

Mark.

> +
>  	return true;
>  }
>  
> -- 
> 2.24.0
> 

