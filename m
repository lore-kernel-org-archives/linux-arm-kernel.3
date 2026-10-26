Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uQh85Tww;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=CuqQUOLg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1/hnSVO0qNWPHzymRfeFblNxFqKdYqMKmWvP+gKl0eY=; b=uQh85Tww1PJOhD
	UdjhH9icf5QRHy8s7JMtXYdZUBpy6tSAoce+bONLtzm87sx4mDargighle5rBo4sdRAqF7TC5KaBO
	d/fUfReaQT83NdmQqURBMlYlD73KdAUJ9fOKA3cXGi9LRC7jddTT4dh/MnGefbZaMtOOTAgWMEyf/
	Ke91ijx3udSFsJQXeMfpKUbP9pQArlxSi8xxS6Zy0F1F7NWAbsUrHKvjiFFTo+WluOjXau12j/Df9
	8MdJ9Z1gtbZoizAEgCbZcM1cG8mcKtkSarjtmWiX5pWw+ZRQTQm9qhNeS/O1x0aTdJUY6b4ISHKZh
	xP7Mabgh8JiroFeBQjpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHN8-000000028Hq-3j6c;
	Mon, 26 Oct 2026 09:52:06 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHN5-000000028Fs-135h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:52:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1/hnSVO0qNWPHzymRfeFblNxFqKdYqMKmWvP+gKl0eY=;
	b=CuqQUOLguK0FGBBx0r0fJQVdpKAooBNNu1J69jMzFkxc43D2a0tEV29Y6uLrOsp06m6QqE/JP
	zF0SDL9pHErTXuF0Oo0JdY/cIquSDZRgA5bJmfxkHTcaIHhKmorOIHzhAey+UmiR1yQATUE+39R
	2neOuihWOQOWT69XxR8wfMI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4jCpn353cYz1T4Fj;
	Mon, 26 Oct 2026 17:51:51 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A1E64057A;
	Mon, 26 Oct 2026 17:51:58 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 17:51:47 +0800
Message-ID: <a7419cfe-f597-408a-a982-f210b4a5be8c@huawei.com>
Date: Mon, 26 Oct 2026 17:51:47 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 03/10] arm_mpam: resctrl: Do not fail CPU online
 when domain setup fails
To: Reinette Chatre <reinette.chatre@intel.com>, <ben.horgan@arm.com>,
	<james.morse@arm.com>, <Dave.Martin@arm.com>, <fenghuay@nvidia.com>
CC: <tony.luck@intel.com>, <yu.c.chen@intel.com>, <babu.moger@amd.com>,
	<fustini@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <660ffee2c7d069aed25c2757c51e12b28318bbc7.1792443633.git.reinette.chatre@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <660ffee2c7d069aed25c2757c51e12b28318bbc7.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025203_908797_1FED32C4 
X-CRM114-Status: GOOD (  36.48  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/10/20 6:07, Reinette Chatre 写道:
> When a CPU comes online, mpam_resctrl_online_cpu() adds it to the resctrl
> domains of each resource in use, and sets up a new domain when the CPU
> is the first of its domain to come online. A failure to set up a domain
> is returned as the failure of MPAM's CPU hotplug startup callback.

Indeed the code works this way.

> 
> The CPU hotplug core does not run the teardown callback for a CPU whose
> startup callback failed, so everything done for the CPU before the
> failure stays in place: the CPU remains in the domains of the resources
> that were handled before the failing one, and MPAM's per-MSC state for
> the CPU is not undone. If the failure happens when MPAM installs its
> CPU hotplug callbacks during enabling, the hotplug core discards the
> callbacks, leaving MPAM enabled and resctrl initialized but MPAM no

By the way, I previously ran into a case during testing where adding the
"maxcpu" boot parameter caused MPAM enabling to fail.

Link:
https://lore.kernel.org/all/20261020134239.3921377-6-ruanjinjie@huawei.com/

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

Yes, We now always call resctrl_online_cpu() to add them to the default
group.

> when a domain could not be set up, since the CPU is online and runs
> tasks regardless, and resctrl expects every online CPU to belong to a
> resource group. Drop the warning when a CPU going offline has no domain,
> since a missing domain is now expected.

It is now valid for the domain to be empty when a CPU goes offline.

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
>  
>  	if (r->alloc_capable) {
>  		dom->ctrl_comp = comp;
> @@ -1678,7 +1678,6 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  		}
>  		if (!any_mon_comp) {
>  			WARN_ON_ONCE(0);
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

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  		if (r->alloc_capable) {

-- 
Best regards,
Jinjie


