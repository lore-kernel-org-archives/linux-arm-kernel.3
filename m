Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1E8606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sLDZl767;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=e2OkDeBd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MtgmlSq/wLXyKUqIJNKMXSd3v0+8x03pojIWA2PC1Hg=; b=sLDZl767ywkWzy
	dM8Atz5OicmBe8Mk79BTff0KKAPHsnzDN8PUsnuMtzPeboHKYhBOtVI8ojltHWDkmaIUIyZrh3/5g
	a7av88qmVEv+YD0x/aADb5D/OkOSk5dUP5M1F6RfeJ59Qa+eWruAEJI4RI0hPN0Lp7ODtmLyHVUYj
	NILV72K1LxWhxf1LU64QGWpJfvevi0XvYNoHasldoqCJ/jpKyznWl/EJLKHBsFNiaz6RkOKtAv6Qd
	ce6XshXw8F4OcQI1jSMfbuC+8sk6De+hZQn8W3jKBgfJFFp4WX5kxSlBLRguW/JHOJSVKUdZ41TjF
	IqSv8HcWpsTFUDh4pC8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGb2-00000002zlG-48dw;
	Tue, 03 Nov 2026 15:38:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGb1-00000002zkX-0fVh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:38:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6F471595;
	Tue,  3 Nov 2026 07:38:42 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30EBD3F673;
	Tue,  3 Nov 2026 07:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793720326; bh=PRt83NVmmeftqI7uI4/rjj41pGn0lWYhl49v4YHgSO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e2OkDeBdDdqJKbB3wAHuxL5pvJ5ws97cC+ajn7JByBdjfu/luYj/punPqUIjuQkJo
	 VFe/gFJEn5IL72cdQebHQjcbB0c1aim35njHBSbRhg3/UmljkN2FAhb1j8jR8devxD
	 gfnFI1en+uoqM4//dN4TtSC3E47eHR2cwqqFT9dY=
Message-ID: <2008960d-b5d3-41e5-b9c8-29c5d54c2c3e@arm.com>
Date: Tue, 3 Nov 2026 15:38:42 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 03/10] arm_mpam: resctrl: Do not fail CPU online
 when domain setup fails
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <660ffee2c7d069aed25c2757c51e12b28318bbc7.1792443633.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <660ffee2c7d069aed25c2757c51e12b28318bbc7.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_073847_299563_ED3C38C0 
X-CRM114-Status: GOOD (  37.44  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Reinette,

Thanks for addressing this.

On 19/10/2026 23:07, Reinette Chatre wrote:
> When a CPU comes online, mpam_resctrl_online_cpu() adds it to the resctrl
> domains of each resource in use, and sets up a new domain when the CPU
> is the first of its domain to come online. A failure to set up a domain
> is returned as the failure of MPAM's CPU hotplug startup callback.
> 
> The CPU hotplug core does not run the teardown callback for a CPU whose
> startup callback failed, so everything done for the CPU before the
> failure stays in place: the CPU remains in the domains of the resources
> that were handled before the failing one, and MPAM's per-MSC state for
> the CPU is not undone. If the failure happens when MPAM installs its
> CPU hotplug callbacks during enabling, the hotplug core discards the
> callbacks, leaving MPAM enabled and resctrl initialized but MPAM no
> longer notified of CPU hotplug. If it happens when a CPU comes online
> later, the CPU fails to come online.
> 
> Setting up a domain only fails if a memory allocation fails or if a
> class unexpectedly has no component for the CPU. For such rare failures
> losing a resctrl domain is a smaller cost than failing CPU online or
> leaving MPAM in an inconsistent state.
> 
> Do not report domain setup failures from mpam_resctrl_online_cpu() and
> leave the CPU without a domain for that resource. Make
> mpam_resctrl_alloc_domain() return nothing since its failures are no
> longer reported. Keep adding the CPU to resctrl's default group even
> when a domain could not be set up, since the CPU is online and runs
> tasks regardless, and resctrl expects every online CPU to belong to a
> resource group. Drop the warning when a CPU going offline has no domain,
> since a missing domain is now expected.
> 
> Only domains that were set up are exposed through resctrl and torn down
> when their CPUs go offline. When another CPU of the same domain comes
> online, it sets up the domain again, and if that succeeds the domain
> does not include the CPU for which setup failed.
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
>  drivers/resctrl/mpam_devices.c  |  2 +-
>  drivers/resctrl/mpam_internal.h |  4 ++--
>  drivers/resctrl/mpam_resctrl.c  | 31 +++++++++++++++----------------
>  3 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..d17d7a72dba1 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2249,7 +2249,7 @@ static int mpam_cpu_online(unsigned int cpu)
>  	}
>  
>  	if (mpam_resctrl_enabled)
> -		return mpam_resctrl_online_cpu(cpu);
> +		mpam_resctrl_online_cpu(cpu);
>  
>  	return 0;
>  }
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 1f86cc158100..84c7adbb1a40 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -525,13 +525,13 @@ int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
>  #ifdef CONFIG_RESCTRL_FS
>  int mpam_resctrl_setup(void);
>  void mpam_resctrl_exit(void);
> -int mpam_resctrl_online_cpu(unsigned int cpu);
> +void mpam_resctrl_online_cpu(unsigned int cpu);
>  void mpam_resctrl_offline_cpu(unsigned int cpu);
>  void mpam_resctrl_teardown_class(struct mpam_class *class);
>  #else
>  static inline int mpam_resctrl_setup(void) { return 0; }
>  static inline void mpam_resctrl_exit(void) { }
> -static inline int mpam_resctrl_online_cpu(unsigned int cpu) { return 0; }
> +static inline void mpam_resctrl_online_cpu(unsigned int cpu) { }
>  static inline void mpam_resctrl_offline_cpu(unsigned int cpu) { }
>  static inline void mpam_resctrl_teardown_class(struct mpam_class *class) { }
>  #endif /* CONFIG_RESCTRL_FS */
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index b07e5dd895dd..dc442851fd7e 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1615,8 +1615,8 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
>  	return NULL;
>  }
>  
> -static struct mpam_resctrl_dom *
> -mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
> +static void mpam_resctrl_alloc_domain(unsigned int cpu,
> +				      struct mpam_resctrl_res *res)
>  {
>  	int err;
>  	struct mpam_resctrl_dom *dom;
> @@ -1631,11 +1631,11 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  	comp = find_component(class, cpu);
>  	/* class has no component for this CPU */
>  	if (WARN_ON_ONCE(!comp))
> -		return ERR_PTR(-EINVAL);
> +		return;
>  
>  	dom = kzalloc_node(sizeof(*dom), GFP_KERNEL, cpu_to_node(cpu));
>  	if (!dom)
> -		return ERR_PTR(-ENOMEM);
> +		return;

Do you think a warning is warranted here?

>  
>  	if (r->alloc_capable) {
>  		dom->ctrl_comp = comp;
> @@ -1678,7 +1678,6 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  		}
>  		if (!any_mon_comp) {
>  			WARN_ON_ONCE(0);

I think you could fold in your patch 7 here.
arm_mpam: resctrl: Warn when no monitoring component is found for a CPU

Thanks,

Ben

> -			err = -EFAULT;
>  			goto offline_ctrl_domain;
>  		}
>  
> @@ -1694,7 +1693,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  		pr_debug("Skipped monitor domain online - no monitors\n");
>  	}
>  
> -	return dom;
> +	return;
>  
>  offline_ctrl_domain:
>  	if (r->alloc_capable) {
> @@ -1703,9 +1702,6 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  	}
>  free_domain:
>  	kfree(dom);
> -	dom = ERR_PTR(err);
> -
> -	return dom;
>  }
>  
>  /*
> @@ -1757,7 +1753,7 @@ mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
>  	return mpam_resctrl_get_mon_domain_from_cpu(cpu);
>  }
>  
> -int mpam_resctrl_online_cpu(unsigned int cpu)
> +void mpam_resctrl_online_cpu(unsigned int cpu)
>  {
>  	struct mpam_resctrl_res *res;
>  	enum resctrl_res_level rid;
> @@ -1772,9 +1768,13 @@ int mpam_resctrl_online_cpu(unsigned int cpu)
>  
>  		dom = mpam_resctrl_get_domain_from_cpu(cpu, res);
>  		if (!dom) {
> -			dom = mpam_resctrl_alloc_domain(cpu, res);
> -			if (IS_ERR(dom))
> -				return PTR_ERR(dom);
> +			/*
> +			 * On failure the CPU is left without a domain for this
> +			 * resource, which mpam_resctrl_offline_cpu() tolerates.
> +			 * resctrl_online_cpu() still adds the CPU to the default
> +			 * group because the CPU is online and runs tasks.
> +			 */
> +			mpam_resctrl_alloc_domain(cpu, res);
>  		} else {
>  			if (r->alloc_capable) {
>  				struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
> @@ -1790,8 +1790,6 @@ int mpam_resctrl_online_cpu(unsigned int cpu)
>  	}
>  
>  	resctrl_online_cpu(cpu);
> -
> -	return 0;
>  }
>  
>  void mpam_resctrl_offline_cpu(unsigned int cpu)
> @@ -1812,8 +1810,9 @@ void mpam_resctrl_offline_cpu(unsigned int cpu)
>  		if (!res->class)
>  			continue;	// dummy resource
>  
> +		/* The domain may be missing if its setup failed. */
>  		dom = mpam_resctrl_get_domain_from_cpu(cpu, res);
> -		if (WARN_ON_ONCE(!dom))
> +		if (!dom)
>  			continue;
>  
>  		if (r->alloc_capable) {


