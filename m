Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A9B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 16:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dJnG4QDA;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Pp0Hq8zy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7hO7j2WXv/PYcl55M/dCw5Cjb0o53osmcDal0KCyt7Y=; b=dJnG4QDA3E4mOh
	4b8mFxExFzRwLZIzGiS16d1d5wwgVZFp+wH6t7yERf+HzcpKzSP1TmWEnKU+Z1xzhuXvpKsBOSSdW
	mSC3sT2qmFlkK6syDmnN8NsulmO8b4kP8bX1ffYftl+FKLfpZqnj082sNW6Pst8U9ubrYyiCFE4xz
	NOq/SN9ArVwKHj79k/QMvwGuj3+NKQJjJVMK0juQBbuIPpI8puIYeO2H4ro+IHeStZSbKES8865UZ
	OyX6x8n1f34XIj5vbTe8GP3Ke9SSzAvZ/IuO3KmwiiX/fAwT6qguQ7rXRVnzyTZkd/4jndLlh9675
	yiu2tzFYvH8uv6QvBrnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHX9-00000003AdG-2bPm;
	Tue, 03 Nov 2026 16:38:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOHX6-00000003AZ4-12IE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 16:38:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 467311595;
	Tue,  3 Nov 2026 08:38:44 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A8F93F628;
	Tue,  3 Nov 2026 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793723927; bh=DVeSfP6PI+YI1+rJ351kSNVh7maxZUYnlX0df1Cjh70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pp0Hq8zyGtIZVg8FSCk/GPvJ8sMpcdvBS7KVszXZY0J3usDWySRRAFqVl3uWvsClF
	 G/6lqtuflXknv2ZwgY1op6XKbJIrkiOp5q3oFQ0xDfyxE533L6SC4xyA9dxwYBVq9W
	 iA7sQhV6kJAhyeVfKsxU4Q1iM0vOvz4GUIYuE+UE=
Message-ID: <49141409-b0af-46f9-8e1e-47f7c9ed5ae2@arm.com>
Date: Tue, 3 Nov 2026 16:38:43 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 08/10] arm_mpam: resctrl: Require a component for
 each monitoring event
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <3384e5bedb29e3a0bd7fa383939db8ca70c4a733.1792443633.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <3384e5bedb29e3a0bd7fa383939db8ca70c4a733.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_083848_344430_F6F5E499 
X-CRM114-Status: GOOD (  23.04  )
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

Seems good to me.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

On 19/10/2026 23:07, Reinette Chatre wrote:
> Setting up a monitoring domain looks up, for each monitoring event, the
> component of the event's class that contains the CPU and records it in
> the domain. Reading and resetting the event's counters in the domain
> then use the recorded component.
> 
> If an event's class has no component for the CPU, the domain is still
> set up as long as another event's class has one, and the event is left
> without a component. Reading or resetting the event's counters in that
> domain then dereferences a NULL component. This is not expected to
> happen since only classes that cover all possible CPUs are picked for
> monitoring.
> 
> Fail setting up the monitoring domain, with a warning, if an event's
> class has no component for the CPU, so that every event of a monitoring
> domain has a component.
> 
> Keep the check that at least one component was found. It now only fails
> if no event has a class, and so captures that a resource that supports
> monitoring has at least one monitoring event with a class.
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 63c5bf45856d..36a924734484 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1661,9 +1661,11 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
>  			continue;       // dummy resource
>  
>  		mon_comp = find_component(mon->class, cpu);
> +		if (WARN_ON_ONCE(!mon_comp))
> +			return -EFAULT;
> +
>  		dom->mon_comp[eventid] = mon_comp;
> -		if (mon_comp)
> -			any_mon_comp = mon_comp;
> +		any_mon_comp = mon_comp;
>  	}
>  	if (WARN_ON_ONCE(!any_mon_comp))
>  		return -EFAULT;


