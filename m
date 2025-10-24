Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E25F3CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2zR8MDkegwg6orcspkhzjkSMYr/Sn5SRSP5/WTkX/w=; b=j03zK87idpscmlqXfuiKRdt+K6
	mHlKiMNK21fc1rmOO0M3wrv3uxKYy+1ZHxt31M88buEoHXBnc0FU6Zg/Zdiu7duC8kzm8ynVeHy8E
	lSg+TBSbiXACrv9Zjmt83IkYikZUh+6gkeocOw0ovEy2mmpV7dy7hASiLkzOwI29g6ZpNqbj7rRjd
	51aqqMwRZigBdl39pjpJRssPyttOyTz67lncorp4vpYKtXHUBTMiFe71Gcxuf6dPNCBi/2BZacLFL
	GjwmBusUis57N3bsLwwWCneC3eZ+h8c+ybbEIx825bzmXkqni2Tw1Vdpi0GergIwJdFkCxy8/RZZ5
	xxd0ibGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCM8T-0000000ABVj-0axc;
	Fri, 24 Oct 2025 18:03:33 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCM8Q-0000000ABTl-0E3j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 18:03:31 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ctVzL6WlJz6M4gJ;
	Sat, 25 Oct 2025 01:59:42 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 4DB8B140417;
	Sat, 25 Oct 2025 02:03:26 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 24 Oct
 2025 19:03:24 +0100
Date: Fri, 24 Oct 2025 19:03:23 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>, Koba
 Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Rob Herring
	<robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>, "Rafael Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v3 18/29] arm_mpam: Register and enable IRQs
Message-ID: <20251024190323.0000328d@huawei.com>
In-Reply-To: <20251017185645.26604-19-james.morse@arm.com>
References: <20251017185645.26604-1-james.morse@arm.com>
	<20251017185645.26604-19-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_110330_401675_66CA16E2 
X-CRM114-Status: GOOD (  21.99  )
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

On Fri, 17 Oct 2025 18:56:34 +0000
James Morse <james.morse@arm.com> wrote:

> Register and enable error IRQs. All the MPAM error interrupts indicate a
> software bug, e.g. out of range partid. If the error interrupt is ever
> signalled, attempt to disable MPAM.
> 
> Only the irq handler accesses the MPAMF_ESR register, so no locking is
> needed. The work to disable MPAM after an error needs to happen at process
> context as it takes mutex. It also unregisters the interrupts, meaning
> it can't be done from the threaded part of a threaded interrupt.
> Instead, mpam_disable() gets scheduled.
> 
> Enabling the IRQs in the MSC may involve cross calling to a CPU that
> can access the MSC.
> 
> Once the IRQ is requested, the mpam_disable() path can be called
> asynchronously, which will walk structures sized by max_partid. Ensure
> this size is fixed before the interrupt is requested.
> 
> CC: Rohit Mathew <rohit.mathew@arm.com>
> Tested-by: Rohit Mathew <rohit.mathew@arm.com>
> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>
One trivial thing inline to reduce the patch churn a tiny bit.
May not be worth the hassle.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 545482e112b7..f18a22f825a0 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -14,6 +14,9 @@



>  static void mpam_enable_once(void)
>  {
> -	mutex_lock(&mpam_list_lock);
> -	mpam_enable_merge_features(&mpam_classes);
> -	mutex_unlock(&mpam_list_lock);

Can you shift this later in the earlier patch (ordering clearly doesn't matter)
so as to reduce churn here?

> +	int err;
>  
>  	/*
>  	 * Once the cpuhp callbacks have been changed, mpam_partid_max can no
> @@ -1318,6 +1572,27 @@ static void mpam_enable_once(void)
>  	partid_max_published = true;
>  	spin_unlock(&partid_max_lock);
>  
> +	/*
> +	 * If all the MSC have been probed, enabling the IRQs happens next.
> +	 * That involves cross-calling to a CPU that can reach the MSC, and
> +	 * the locks must be taken in this order:
> +	 */
> +	cpus_read_lock();
> +	mutex_lock(&mpam_list_lock);
> +	mpam_enable_merge_features(&mpam_classes);
> +
> +	err = mpam_register_irqs();
> +
> +	mutex_unlock(&mpam_list_lock);
> +	cpus_read_unlock();
> +
> +	if (err) {
> +		pr_warn("Failed to register irqs: %d\n", err);
> +		mpam_disable_reason = "Failed to enable.";
> +		schedule_work(&mpam_broken_work);
> +		return;
> +	}
> +
>  	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline,
>  				      "mpam:online");
>  
> @@ -1385,6 +1660,8 @@ void mpam_disable(struct work_struct *ignored)
>  	}
>  	mutex_unlock(&mpam_cpuhp_state_lock);
>  
> +	mpam_unregister_irqs();
> +
>  	idx = srcu_read_lock(&mpam_srcu);
>  	list_for_each_entry_srcu(class, &mpam_classes, classes_list,
>  				 srcu_read_lock_held(&mpam_srcu))


