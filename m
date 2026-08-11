Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6433FC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 10:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LKTW4Q8RE5r050/7Dy6J8DZH0W0Onq+4vKec7r0Eu0=; b=hBlLGTiH82cjoimNLqWKoc5M9c
	jXlDf/4k4IEEV0d6ckbIoqDD9XgkhGSxJ1Rdb3leevSSVQVwq+euMh20OVsvqUO8pM20NU0yFJJAc
	wVpb5t0K9DEXi9IUYRxa3sA3fFTVRgxPXbNA0yVKBI1oaAE3RVhyJLlNTZ28e1wpkZx3j++Z1/0+Z
	EMj9tn5RMbbe4lh9cmiwELo/fgMatvaUbeWyMKPL9Me73+peJvtg8lr7zz4r9bz4RdYT/q6KbwH+g
	Xw9kqrCYZt/6sfavubjFK0pVyEmanButOsgNBZL7ircBuX5dloJ+TTDW1/30NZyOH/foJw797Rgr+
	d7Wu/b8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjKF-0000000Dnv3-0bkV;
	Tue, 11 Aug 2026 10:03:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtjKB-0000000DnuF-1hPw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 10:03:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFC9014BF;
	Tue, 11 Aug 2026 03:03:03 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 651363F86F;
	Tue, 11 Aug 2026 03:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786442587; bh=kYPhLWKxR3+5jaSK8JPDXB+JKQ0jVQZ+rr8T0uNd6ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7ZbLBmzr2DWSirU7DLFNV/N2RKZb+F9Rz2obnyV/Zp7k0JBTIqmiM4dRAwbz+fDk
	 QWl8tZ1bAkow8brr4gY8owcEu7m2l0HnaNUYkmW0P2GDwOhWm2gAgcRqT15o2GUi9t
	 w0oQVv5RGBJeCdMzUTbX/giAbnDq/yjNbX+Ox5Qw=
Date: Tue, 11 Aug 2026 12:02:55 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Sean Wang <seanwang1@lenovo.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Xuewen Yan <xuewen.yan@unisoc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sumit Gupta <sumitg@nvidia.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v3] arm64: topology: add source check in
 arch_cpu_idle_enter()
Message-ID: <anrzT-ez3b7uYaCt@arm.com>
References: <20260811072830.10028-1-seanwang1@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811072830.10028-1-seanwang1@lenovo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_030311_518365_4381DBB1 
X-CRM114-Status: GOOD (  31.12  )
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

On Tue, Aug 11, 2026 at 03:28:30PM +0800, Sean Wang wrote:
> arch_cpu_idle_enter() directly calls amu_scale_freq_tick() to update
> arch_freq_scale when a CPU enters idle. This bypasses the sft_data
> pointer check that topology_clear_scale_freq_source() relies on.
> 
> As a result, even after calling topology_clear_scale_freq_source()
> with SCALE_FREQ_SOURCE_ARCH to disable AMU-based frequency scaling,
> the arch_freq_scale value can still be modified by AMU counters when
> the CPU goes idle through the arch_cpu_idle_enter() path.
> 
> Add topology_is_scale_freq_source() helper to check whether a specific
> frequency scaling source is currently registered for a CPU. Use it
> in arch_cpu_idle_enter() to verify that AMU is the active source
> before calling amu_scale_freq_tick().
> 
> This ensures that topology_clear_scale_freq_source() properly
> disables AMU updates in both the tick path (already handled by
> topology_scale_freq_tick()) and the idle path.
> 
> Co-developed-by: Xuewen Yan <xuewen.yan@unisoc.com>
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> Signed-off-by: Sean Wang <seanwang1@lenovo.com>
> ---
>  arch/arm64/kernel/topology.c  |  3 ++-
>  drivers/base/arch_topology.c  | 13 +++++++++++++
>  include/linux/arch_topology.h |  1 +
>  3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index b32f13358fbb..1dbd8f4c3178 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -175,7 +175,8 @@ void arch_cpu_idle_enter(void)
>  
>  	/* Kick in AMU update but only if one has not happened already */
>  	if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> -	    time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))
> +	    time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)) &&
> +	    topology_is_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpu))
>  		amu_scale_freq_tick();
I'm not entirely convinced you gained a lot by that.
It's one additional check per each enter_idle for case where AMUs are the
source vs 2 additional check when it is not.
Will try to figure out smth less 'invasive'.

Aside: I should have probably asked that earlier, but I am not sure I do fully
understand the case we are trying to fix here.
The topology_set_scale_freq_source prefers arch source to others. So if the AMUs
were chosen to server as the source for the freq scale - I do not see why the
sfd would be changed. That would require calling sequence clear-set to get a
different source in place. I do understand the issue itself, though how did we
end up there in the first place ?

---
BR
Beata
>  }
>  
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a..6049e77bbe1d 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -127,6 +127,19 @@ void topology_clear_scale_freq_source(enum scale_freq_source source,
>  }
>  EXPORT_SYMBOL_GPL(topology_clear_scale_freq_source);
>  
> +bool topology_is_scale_freq_source(enum scale_freq_source source, unsigned int cpu)
> +{
> +	struct scale_freq_data *sfd;
> +	bool ret;
> +
> +	rcu_read_lock_sched();
> +	sfd = rcu_dereference_sched(*per_cpu_ptr(&sft_data, cpu));
> +	ret = (sfd && sfd->source == source);
> +	rcu_read_unlock_sched();
> +
> +	return ret;
> +}
> +
>  void topology_scale_freq_tick(void)
>  {
>  	struct scale_freq_data *sfd = rcu_dereference_sched(*this_cpu_ptr(&sft_data));
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index ebd7f8935f96..fb7c1fe74808 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -48,6 +48,7 @@ struct scale_freq_data {
>  void topology_scale_freq_tick(void);
>  void topology_set_scale_freq_source(struct scale_freq_data *data, const struct cpumask *cpus);
>  void topology_clear_scale_freq_source(enum scale_freq_source source, const struct cpumask *cpus);
> +bool topology_is_scale_freq_source(enum scale_freq_source source, unsigned int cpu);
>  
>  DECLARE_PER_CPU(unsigned long, hw_pressure);
>  
> -- 
> 2.25.1
> 

