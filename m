Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51933606EEBB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3DBxHLwF;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=REy1YgCe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Wkiei5f031Olo+3i6CqJNkj3qPX9f5twKRL/qwtW7Xo=; b=3DBxHLwFWvyJbu
	ynfJCzcMm6aNgRuh0oy5UXJXW4GXQV+pT8xzohATSYBnc4ekDUhEXFucUx821PyzkcxJTGZGGdMh+
	4XfynBDAXo7+myJIbH57CuNkHf2E8fmtScHDBkzel0EFSWEQEYCD2qIwSbWTOfnpX2LXh5FYBZ76Q
	t+iRxd4HbtXV06nIjfJEoQLhbdMjOGNJS4HddJZK03/gkSg6oeu7gAg3KAuKc7dnjzPmuxN/o8RsG
	w7T73wYDB7r/qwV13MQK7AaV50bkJN+fk2nTp4o7IkeSDaxQQElqCz2+9KHv0/wwVy4UrlFm847j5
	l6eJrPS3DjUNILW+iSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGwd-000000032qV-2rud;
	Tue, 03 Nov 2026 16:01:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGwY-000000032pH-2aZK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:01:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 050B81595;
	Tue,  3 Nov 2026 08:00:58 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C8283F673;
	Tue,  3 Nov 2026 08:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793721661; bh=6wtQ649mZLnh1QZPpY5qMjizB73z4wqwnxTTLMnkZrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=REy1YgCe9Vd9A3LdNVqT7mYMgVMDhrwo49K9PjynHx0TObmO/SfJvupHCd4znUOm/
	 AebGUT39EWzOFPPJU4I6HXyLQkjoODBDB7YlVKMaLtvek/4htq8LtqXTc1jW8TVhOO
	 4d9wGryNqv7WhwIbr6fFy8dIccEVLKMtB2PA4c3g=
Message-ID: <104d71f0-8fb3-4196-ac32-93ef89f78540@arm.com>
Date: Tue, 3 Nov 2026 16:00:57 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 04/10] arm_mpam: resctrl: Split control and
 monitoring domain setup into helpers
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <20621c28067916be2709fc4437473f1ccad7e334.1792443633.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20621c28067916be2709fc4437473f1ccad7e334.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_080105_537434_D9805738 
X-CRM114-Status: GOOD (  28.92  )
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

Generally makes sense.

On 19/10/2026 23:07, Reinette Chatre wrote:
> mpam_resctrl_alloc_domain() allocates one structure that holds both the
> control domain and the monitoring domain of a resource. It sets up
> whichever of the two domains the resource supports, with the setup of
> both open coded in the function, and undoes the control domain if
> setting up the monitoring domain fails.
> 
> Apart from the code that manages domains, every user of the structure
> accesses only one of its two domains, so the monitoring domain can be
> given a structure of its own. Doing so starts with separating its setup
> from that of the control domain.
> 
> Move the setup of each domain into its own helper in preparation for
> giving the monitoring domain its own structure as part of supporting
> multiple controls per resource. Keep the allocation and the error
> handling in mpam_resctrl_alloc_domain() so that a failure to set up the
> monitoring domain still undoes the control domain.
> 
> No functional change intended.
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 116 ++++++++++++++++++++-------------
>  1 file changed, 70 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index dc442851fd7e..246560247a28 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1615,13 +1615,77 @@ static struct mpam_component *find_component(struct mpam_class *class, int cpu)
>  	return NULL;
>  }
>  
> +static int mpam_resctrl_setup_ctrl_domain(unsigned int cpu,
> +					  struct rdt_resource *r,
> +					  struct mpam_component *comp,
> +					  struct mpam_resctrl_dom *dom)
> +{
> +	struct rdt_ctrl_domain *ctrl_d = &dom->resctrl_ctrl_dom;
> +	int err;
> +
> +	dom->ctrl_comp = comp;
> +
> +	mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
> +	ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
> +	err = resctrl_online_ctrl_domain(r, ctrl_d);
> +	if (err)
> +		return err;
> +
> +	mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);
> +
> +	return 0;
> +}
> +
> +static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
> +					 struct rdt_resource *r,
> +					 struct mpam_resctrl_dom *dom)
> +{
> +	struct rdt_l3_mon_domain *mon_d = &dom->resctrl_mon_dom;
> +	struct mpam_component *any_mon_comp = NULL;
> +	enum resctrl_event_id eventid;
> +	struct mpam_resctrl_mon *mon;
> +	int err;
> +
> +	/*
> +	 * Even if the monitor domain is backed by a different
> +	 * component, the L3 component IDs need to be used... only
> +	 * there may be no ctrl_comp for the L3.
> +	 * Search each event's class list for a component with
> +	 * overlapping CPUs and set up the dom->mon_comp array.
> +	 */
> +
> +	for_each_mpam_resctrl_mon(mon, eventid) {
> +		struct mpam_component *mon_comp;
> +
> +		if (!mon->class)
> +			continue;       // dummy resource
> +
> +		mon_comp = find_component(mon->class, cpu);
> +		dom->mon_comp[eventid] = mon_comp;
> +		if (mon_comp)
> +			any_mon_comp = mon_comp;
> +	}
> +	if (!any_mon_comp) {
> +		WARN_ON_ONCE(0);
> +		return -EFAULT;
> +	}

If you squash the the warning patch into patch 3 as I suggest there then
this copy needs to change too (of course).

Thanks,

Ben

> +
> +	mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
> +	mon_d->hdr.type = RESCTRL_MON_DOMAIN;
> +	err = resctrl_online_mon_domain(r, &mon_d->hdr);
> +	if (err)
> +		return err;
> +
> +	mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
> +
> +	return 0;
> +}
> +
>  static void mpam_resctrl_alloc_domain(unsigned int cpu,
>  				      struct mpam_resctrl_res *res)
>  {
>  	int err;
>  	struct mpam_resctrl_dom *dom;
> -	struct rdt_l3_mon_domain *mon_d;
> -	struct rdt_ctrl_domain *ctrl_d;
>  	struct mpam_class *class = res->class;
>  	struct mpam_component *comp;
>  	struct rdt_resource *r = &res->resctrl_res;
> @@ -1638,57 +1702,17 @@ static void mpam_resctrl_alloc_domain(unsigned int cpu,
>  		return;
>  
>  	if (r->alloc_capable) {
> -		dom->ctrl_comp = comp;
> -
> -		ctrl_d = &dom->resctrl_ctrl_dom;
> -		mpam_resctrl_domain_hdr_init(cpu, comp, r->rid, &ctrl_d->hdr);
> -		ctrl_d->hdr.type = RESCTRL_CTRL_DOMAIN;
> -		err = resctrl_online_ctrl_domain(r, ctrl_d);
> +		err = mpam_resctrl_setup_ctrl_domain(cpu, r, comp, dom);
>  		if (err)
>  			goto free_domain;
> -
> -		mpam_resctrl_domain_insert(&r->ctrl_domains, &ctrl_d->hdr);
>  	} else {
>  		pr_debug("Skipped control domain online - no controls\n");
>  	}
>  
>  	if (r->mon_capable) {
> -		struct mpam_component *any_mon_comp = NULL;
> -		struct mpam_resctrl_mon *mon;
> -		enum resctrl_event_id eventid;
> -
> -		/*
> -		 * Even if the monitor domain is backed by a different
> -		 * component, the L3 component IDs need to be used... only
> -		 * there may be no ctrl_comp for the L3.
> -		 * Search each event's class list for a component with
> -		 * overlapping CPUs and set up the dom->mon_comp array.
> -		 */
> -
> -		for_each_mpam_resctrl_mon(mon, eventid) {
> -			struct mpam_component *mon_comp;
> -
> -			if (!mon->class)
> -				continue;       // dummy resource
> -
> -			mon_comp = find_component(mon->class, cpu);
> -			dom->mon_comp[eventid] = mon_comp;
> -			if (mon_comp)
> -				any_mon_comp = mon_comp;
> -		}
> -		if (!any_mon_comp) {
> -			WARN_ON_ONCE(0);
> -			goto offline_ctrl_domain;
> -		}
> -
> -		mon_d = &dom->resctrl_mon_dom;
> -		mpam_resctrl_domain_hdr_init(cpu, any_mon_comp, r->rid, &mon_d->hdr);
> -		mon_d->hdr.type = RESCTRL_MON_DOMAIN;
> -		err = resctrl_online_mon_domain(r, &mon_d->hdr);
> +		err = mpam_resctrl_setup_mon_domain(cpu, r, dom);
>  		if (err)
>  			goto offline_ctrl_domain;
> -
> -		mpam_resctrl_domain_insert(&r->mon_domains, &mon_d->hdr);
>  	} else {
>  		pr_debug("Skipped monitor domain online - no monitors\n");
>  	}
> @@ -1697,8 +1721,8 @@ static void mpam_resctrl_alloc_domain(unsigned int cpu,
>  
>  offline_ctrl_domain:
>  	if (r->alloc_capable) {
> -		mpam_resctrl_offline_domain_hdr(cpu, &ctrl_d->hdr);
> -		resctrl_offline_ctrl_domain(r, ctrl_d);
> +		mpam_resctrl_offline_domain_hdr(cpu, &dom->resctrl_ctrl_dom.hdr);
> +		resctrl_offline_ctrl_domain(r, &dom->resctrl_ctrl_dom);
>  	}
>  free_domain:
>  	kfree(dom);


