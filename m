Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EBDC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+4sW+yDnGognoqpVpy7Utn+T6JhTFSZnyd9HvUFB7qk=; b=S7hUTW0hNt/eStGqPi+vg0VZMB
	0kcZ4Tah2pPu1ClExfgrES75ZOizEQ6FzwgT4SnGMPAOOitTlP31yXRh/BolnXn7F5lIASHVnHH9b
	3w+Pss/VxkrCv0njb17cmPtDZ5YIjaEAxLe3aIkDzidTH4qDtkQPrf059mOTPugyMDkopJTi60HcG
	UvFw3xZwZNIoGk/PvKe3Hp2XDzIviP+9FmnP9ZbrHBvLgxECDlOFkD5qpzOFd6mVN0XSjRGcxVHzk
	4wv7CgdYTCAs30LNgTHyPbNc6Of0CbeX1DxeslikomWSsFc4tYv98keKpEEfXoVBR1GiHyjKpF/LA
	JO0yHyJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0rB-0000000B9WT-2sKb;
	Fri, 28 Feb 2025 13:56:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0oe-0000000B8ur-0RFl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 13:54:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DCFE1515;
	Fri, 28 Feb 2025 05:54:26 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 281E33F6A8;
	Fri, 28 Feb 2025 05:54:07 -0800 (PST)
Date: Fri, 28 Feb 2025 13:54:04 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <tglx@linutronix.de>,
	Sudeep Holla <sudeep.holla@arm.com>, <peterz@infradead.org>,
	<mpe@ellerman.id.au>, <linux-arm-kernel@lists.infradead.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<pierre.gondois@arm.com>, <dietmar.eggemann@arm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>,
	<rafael@kernel.org>, <jonathan.cameron@huawei.com>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>, <sshegde@linux.ibm.com>
Subject: Re: [PATCH v11 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
Message-ID: <Z8G__C7n4zwje2MW@bogus>
References: <20250218141018.18082-1-yangyicong@huawei.com>
 <20250218141018.18082-2-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218141018.18082-2-yangyicong@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_055412_230113_2868CB41 
X-CRM114-Status: GOOD (  25.52  )
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

On Tue, Feb 18, 2025 at 10:10:15PM +0800, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Currently if architectures want to support HOTPLUG_SMT they need to
> provide a topology_is_primary_thread() telling the framework which
> thread in the SMT cannot offline. However arm64 doesn't have a
> restriction on which thread in the SMT cannot offline, a simplest
> choice is that just make 1st thread as the "primary" thread. So
> just make this as the default implementation in the framework and
> let architectures like x86 that have special primary thread to
> override this function (which they've already done).
> 
> There's no need to provide a stub function if !CONFIG_SMP or
> !CONFIG_HOTPLUG_SMT. In such case the testing CPU is already
> the 1st CPU in the SMT so it's always the primary thread.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
> Pre questioned in v9 [1] whether this works on architectures not using
> CONFIG_GENERIC_ARCH_TOPOLOGY, See [2] for demonstration hacking on LoongArch
> VM and this also works. Architectures should use this on their own situation.
> [1] https://lore.kernel.org/linux-arm-kernel/427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com/
> [2] https://lore.kernel.org/linux-arm-kernel/a5690fee-3019-f26c-8bad-1d95e388e877@huawei.com/
> 
>  arch/powerpc/include/asm/topology.h |  1 +
>  arch/x86/include/asm/topology.h     |  2 +-
>  include/linux/topology.h            | 22 ++++++++++++++++++++++
>  3 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 16bacfe8c7a2..da15b5efe807 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -152,6 +152,7 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>  {
>  	return cpu == cpu_first_thread_sibling(cpu);
>  }
> +#define topology_is_primary_thread topology_is_primary_thread
>  
>  static inline bool topology_smt_thread_allowed(unsigned int cpu)
>  {
> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
> index ec134b719144..6c79ee7c0957 100644
> --- a/arch/x86/include/asm/topology.h
> +++ b/arch/x86/include/asm/topology.h
> @@ -229,11 +229,11 @@ static inline bool topology_is_primary_thread(unsigned int cpu)
>  {
>  	return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
>  }
> +#define topology_is_primary_thread topology_is_primary_thread
>  
>  #else /* CONFIG_SMP */
>  static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
>  static inline int topology_max_smt_threads(void) { return 1; }
> -static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
>  static inline unsigned int topology_amd_nodes_per_pkg(void) { return 1; }
>  #endif /* !CONFIG_SMP */
>  
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 52f5850730b3..b3aba443c4eb 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -240,6 +240,28 @@ static inline const struct cpumask *cpu_smt_mask(int cpu)
>  }
>  #endif
>  
> +#ifndef topology_is_primary_thread
> +
> +#define topology_is_primary_thread topology_is_primary_thread
> +
> +static inline bool topology_is_primary_thread(unsigned int cpu)
> +{
> +	/*
> +	 * On SMT hotplug the primary thread of the SMT won't be disabled.

I may be misunderstanding the term "SMT hotplug" above. For me it is
comparable with logical CPU hotplug, so the above statement may be
misleading. IIUC, what you mean above is if SMT is disabled, the
primary thread will always remain enabled/active. Does that make sense
or am I missing something ?

--
Regards,
Sudeep

