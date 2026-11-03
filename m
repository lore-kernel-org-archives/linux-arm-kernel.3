Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1DA606FCEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jR1hKjCH;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ZnDuSfKU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rEef8FS7q0lvCkkrIL907JgA/rs6+IUe1wrxy5V7xDA=; b=jR1hKjCHUG6wal
	KfpX+y2QMM1PxwTP+7AY92oyMut3RRv4IzSnNQgnovtvjVReBChXofA6zlkfoX3RCW0q5Fio3vzTW
	pzPgx2XgFFFJj7tOdGkw24OE4BhpqUKqzyDoZF7XVFZ03wPiLwxUk++n8Ubhot4MkhUvNq2hAV8wx
	9j8iS1jDp94DA0gRdnNOIxFkJRTQEdpkRMIrtrROJ5VznhJSRKhS6jponBQ0yTiYKfLDW4/GM1W2E
	aPlvjy2FHtTY8sRJgkCh65Xvee7/w0kszXgL0huyOec2JN3x1Cboq52lfC/Ecp9TqpqpfQQrPRoP0
	TQcpyHsey0zOyEfkeJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOG13-00000002pua-2q9Y;
	Tue, 03 Nov 2026 15:01:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOG11-00000002prS-2g7I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 15:01:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3E3C1595;
	Tue,  3 Nov 2026 07:01:30 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 521733F628;
	Tue,  3 Nov 2026 07:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793718094; bh=CG6q8wsIPq+ixhkuVkm9929Wn3zQbR8LSPlxbsnxgtI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZnDuSfKUzzE9MrbULG40+AhOWauF13XR9ar+iCOPiMJNHMlvLoOqwPvWBa47p0fK1
	 8UJSFcHsd+Px1RBaKuZYevFUjD0Ba7z8RiIURshnbBLyoPtH8jIV86ji1j1uml8ztU
	 RsMBYlU5UXEbTrhovtUPjd5a7Em9ROyM3SdqHRUo=
Message-ID: <308b326e-9fc8-4d49-9c85-c3b9cb9288f3@arm.com>
Date: Tue, 3 Nov 2026 15:01:30 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 01/10] arm_mpam: resctrl: Use find_component() when
 allocating a domain
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <94ddff51b91f4a51965baf0384c2368e292c1a8c.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_070135_772098_6ABB53E7 
X-CRM114-Status: GOOD (  25.73  )
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

The change seems good but I think the commit message can be cut down at bit.

On 19/10/2026 23:07, Reinette Chatre wrote:
> mpam_resctrl_alloc_domain() starts by checking that the resource's
> class has a component whose CPU affinity includes the CPU, and fails the
> domain allocation otherwise. When the resource supports allocation, that
> component also backs the control domain. The check uses an open-coded
> walk of the class's component list, while the same function uses
> find_component() to find the component backing each monitoring event.
> 
> The open-coded walk duplicates find_component(). It also holds the SRCU
> read lock until mpam_resctrl_alloc_domain() returns, 

, -> .

which suggests that
> the component needs this protection while the domain is set up.
> 
> The component does not need it. Components are freed only when an MSC
> fails to probe, in which case MPAM is never enabled and no resctrl
> domain is created, or by mpam_disable(), which first removes the CPU
> hotplug callbacks and thereby tears down all resctrl domains. A component> therefore outlives every domain that refers to it.

You can drop the above section. The SRCU read lock, as you say, is just
intended for walking the list and modulo any bugs we can just take that
as read.

However, ...> The SRCU read lock is
> only needed while walking the component list, and find_component() holds
> it for that walk. 


In addition, mpam_resctrl_alloc_domain() only runs
> from MPAM's CPU hotplug startup callback, which already holds the SRCU
> read lock throughout.

I think this can go from the commit message too. It is interesting that
you point it out though as that is unexpected. I should have used
scoped_guard() in the case you are removing and in mpam_cpu_online()
rather than guard() so that the lock can be dropped as early as possible
and make the intent of the lock clearer.

Thanks,

Ben

> 
> Replace the open-coded walk with find_component().
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9cec5843e8fa..3d5f90f9f1f3 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1623,21 +1623,12 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
>  	struct rdt_l3_mon_domain *mon_d;
>  	struct rdt_ctrl_domain *ctrl_d;
>  	struct mpam_class *class = res->class;
> -	struct mpam_component *comp_iter, *ctrl_comp;
> +	struct mpam_component *ctrl_comp;
>  	struct rdt_resource *r = &res->resctrl_res;
>  
>  	lockdep_assert_held(&domain_list_lock);
>  
> -	ctrl_comp = NULL;
> -	guard(srcu)(&mpam_srcu);
> -	list_for_each_entry_srcu(comp_iter, &class->components, class_list,
> -				 srcu_read_lock_held(&mpam_srcu)) {
> -		if (cpumask_test_cpu(cpu, &comp_iter->affinity)) {
> -			ctrl_comp = comp_iter;
> -			break;
> -		}
> -	}
> -
> +	ctrl_comp = find_component(class, cpu);
>  	/* class has no component for this CPU */
>  	if (WARN_ON_ONCE(!ctrl_comp))
>  		return ERR_PTR(-EINVAL);


