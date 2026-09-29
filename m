Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DF6C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QFsn630Py9AAgmOeUOScJpmEIDQZd/kQytbMgzq4hBY=; b=ThSxG+u4bYPXcmNkObj6prClxc
	UO9aWaRrQHk7FLtaE8/DFiBSpC0Xug9je7lcsf3yK1XEsW21pjSbEEAeZCAKofUpMY3XLzd6TcVAj
	7Rc/QEukdYpXBDXQhgiNz9P9L4bn+3vGVrpIbIrBfJyBozBpnzt0qyKrc5WNP7EBf+/kAqnb/Rrih
	OK0/FVljyoAL41FG3I6WCugzOnWqSiwisWHNyi1CHrenGvdMYc5fCYvSNk9WIYbtvrmoWRVQhC9LV
	Omfo1JMvLt+b3/ULbrZ1azdIxIfwCBjC7GHeB7T/2STxoCEpNO7TViP42c/Tsgf2HRoz93oaCWmh0
	sHUwBwAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYJm-00000003jLl-1ExX;
	Tue, 29 Sep 2026 13:56:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYJk-00000003jLM-1cE3
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 13:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QFsn630Py9AAgmOeUOScJpmEIDQZd/kQytbMgzq4hBY=; b=R2rsLJZuCR/7yJlk/c3YYlZH32
	5pw51T2ph3bnqMHBxUw8Sfm89aurFHeWr+NT5aOWPKi8Tifrz1I/lpuXbc+3eDWVTdz7pPEVLOzbM
	UPo6fxjLXPpxGU7XrmHB/lAbE2AOMD20VUmCpx5SJkyPcb/xKSJpJfruTrAKwqe5DQArC6XiPD+jg
	KmkPtXscPurqrhoBIBN+Y211Wsxq8a/V3BvNJzf/eJym6hzLfYtaR/5ie+wTXFO2JfiMTrY6I51SO
	+mPEuLv13a0CtTzR79pfMbb/FPiFQfmwgEJzbcUUEworEnQqunOL0WMM+c7osakVvq2ax5F2DOa9W
	xoowVLyA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBYJQ-00000002hsX-3wJ9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 13:56:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90D4D1476;
	Tue, 29 Sep 2026 06:55:57 -0700 (PDT)
Received: from [10.0.153.43] (e121487-lin.cambridge.arm.com [10.0.153.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C9833F85F;
	Tue, 29 Sep 2026 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790690161; bh=m19B67tO6yA36DYUEW/3W38fHYK7u9VkS9Qn+xT2Cjg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D3dCr0pvlRcVbfNihRuMchu/3XaIn8876ItpJktMauXeVWiJoVYk97kIAeGRtuZHC
	 Un19rkp4+rtvXrHyGcDuaCFCuwwKQL3n3AA+RlvDY0ifHcKwQy9yO5+V+S6F0U1mBr
	 cBA9Z4+F0vMFQZpl8hS+2xCsh4Ll09Nq0AImkmYs=
Message-ID: <491d09a3-cfaf-45d5-9715-459e89180068@arm.com>
Date: Tue, 29 Sep 2026 14:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: errata: Add Cortex-A725 erratum 3821522
 workaround
To: Beata Michalska <beata.michalska@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com,
 James.Morse@arm.com, xuewen.yan94@gmail.com, seanwang1@lenovo.com,
 linux-kernel@vger.kernel.org
References: <20260929134055.3241587-1-beata.michalska@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20260929134055.3241587-1-beata.michalska@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_145607_396466_15AF17B0 
X-CRM114-Status: GOOD (  30.36  )
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

Hi Beata,

On 9/29/26 14:40, Beata Michalska wrote:
> Cortex-A725 erratum 3821522 affects the CNT_CYCLES event, which can
> incur a significant increment error when a CPU enters and subsequently
> exits WFE or WFI, and may no longer track the system counter frequency.
> 
> The AMEVCNTR01_EL0 counter is being used as the AMU constant counter for
> frequency invariance and CPPC FFH feedback counters. Treat the affected
> AMU counter as unavailable by returning zero in the AMU counter paths,
> matching the existing convention used when the counter is disabled or
> unusable. This prevents the broken counter from being used as a reference
> source.
> 
> The erratum can also affect PMUv3 users of the CNT_CYCLES event, but this
> workaround intentionally does not change PMU event handling. Hiding or
> rejecting the PMU event from the erratum code would change the perf-visible
> PMU event interface, including raw event selection, and would need
> separate PMU specific approach rather than being folded into the AMU
> reference-counter workaround.
> 
> This also folds the per-erratum workarounds for ARM errata 2457168 and
> 3821522 into a single AMU constant-counter capability, as both require
> treating AMEVCNTR01 as unreliable and unavailable.
> 

Can we please split this in two patches:

1. Factor out ARM64_WORKAROUND_2457168 into generic ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
2. Wire up Cortex-A725 erratum 3821522

> CC: <stable@vger.kernel.org>
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> ---
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 30 +++++++++++++++++++++
>  arch/arm64/include/asm/cpucaps.h            |  3 ++-
>  arch/arm64/kernel/cpu_errata.c              | 29 +++++++++++++++-----
>  arch/arm64/kernel/cpufeature.c              |  2 +-
>  arch/arm64/kernel/topology.c                | 16 ++++++-----
>  arch/arm64/tools/cpucaps                    |  2 +-
>  7 files changed, 68 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
> index ac3248b9f2f3b..99a1eb4b833dd 100644
> --- a/Documentation/arch/arm64/silicon-errata.rst
> +++ b/Documentation/arch/arm64/silicon-errata.rst
> @@ -174,6 +174,8 @@ stable kernels.
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Cortex-A725     | #3456106        | ARM64_ERRATUM_3194386       |
>  +----------------+-----------------+-----------------+-----------------------------+
> +| ARM            | Cortex-A725     | #3821522        | ARM64_ERRATUM_3821522       |
> ++----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Cortex-X1       | #1502854        | N/A                         |
>  +----------------+-----------------+-----------------+-----------------------------+
>  | ARM            | Cortex-X1       | #3324344        | ARM64_ERRATUM_3194386       |
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5a51b0ef9440..cab741a695f52 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1040,9 +1040,17 @@ config ARM64_ERRATUM_1902691
>  
>  	  If unsure, say Y.
>  
> +config ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> +	bool
> +	# Targeting errata affecting AMEVCNTR01, the AMU constant counter.
> +	# On affected CPUs the counter may not increment at the expected rate,
> +	# making it unreliable. As a result, AMU users should treat it as
> +	# unavailable rather than relying on misleading counter values.
> +
>  config ARM64_ERRATUM_2457168
>  	bool "Cortex-A510: 2457168: workaround for AMEVCNTR01 incrementing incorrectly"
>  	depends on ARM64_AMU_EXTN
> +	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
>  	default y
>  	help
>  	  This option adds the workaround for ARM Cortex-A510 erratum 2457168.
> @@ -1073,6 +1081,28 @@ config ARM64_ERRATUM_2645198
>  
>  	  If unsure, say Y.
>  
> +config ARM64_ERRATUM_3821522
> +	bool "Cortex-A725: 3821522: workaround for possible CNT_CYCLES increment error due to WFE/WFI"
> +	depends on ARM64_AMU_EXTN
> +	select ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT
> +	default y
> +	help
> +	  This option adds the workaround for ARM Cortex-A725 erratum 3821522.
> +
> +	  On affected A725 cores, the CNT_CYCLES event may incur a significant
> +	  increment error when entering and subsequently exiting WFx.
> +	  As a result, the CNT_CYCLES may diverge from the system counter
> +	  frequency at which it is expected to increment.
> +	  This renders the AMU counter AMEVCNTR01, that implements CNT_CYCLES,
> +	  being unreliable and unsuitable for use.
> +
> +	  Since there is no hardware workaround, reads of the affected CNT_CYCLES
> +	  counter return 0 in the relevant paths. This causes users of the counter
> +	  to treat it as unavailable and is functionally equivalent to firmware
> +	  disabling the affected counter.
> +
> +	  If unsure, say Y.
> +
>  config ARM64_WORKAROUND_SPECULATIVE_UNPRIV_LOAD
>  	bool
>  
> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> index 76350b38f0d7a..120c5dc3c11d7 100644
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@ -75,8 +75,9 @@ cpucap_is_possible(const unsigned int cap)
>  		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
>  	case ARM64_HAS_LSUI:
>  		return IS_ENABLED(CONFIG_ARM64_LSUI);
> +	case ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT:
> +		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT);

Hmm, ARM64_WORKAROUND_2457168 has not been present here, so seeing
ARM64_WORKAROUND_BROKEN_AMU_CONSTCNT here is not quite expected...

>  	}
> -

Nitpick: unrelated change?

Thanks
Vladimir

