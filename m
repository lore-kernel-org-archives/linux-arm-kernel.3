Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E558ECAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykN1fhcN+BgDhyvUANmiPUFHkQX51aOUk9s/ymYlhpQ=; b=FY3oho/xYHhVjqb53v75sFXDGk
	fsYZzgX1Qd5qWFcS4K0WkXxfdnrwQyFqFqhrEJVN0R76iZ3J2hb08cQko8C5t3NWiRacjH+q9ZhEi
	YxoVscQV0w+Q6LhbwJxHlbOxZlDxFRSSRXtkQVldy4JTE+sDkyKuJK8+N2mmq4a9H1Vj7iMqiE2th
	6DvYVe5Xp16Y/Y9Qynkxy2mdwVbjzGh6l0rhv03qDgxSDVq4v1bqnay2lDc7oiZrr2nk478BvEtcU
	AMP43W3P5q+Oft6paRbi+THT09GZUKMZHnmb5qQ3drQcrkuKZpqqImneG6iFJwdYL4Iqa7qviLIi4
	ZlLBzKqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwitq-00000003lgD-3hYR;
	Thu, 11 Sep 2025 15:07:50 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwito-00000003leG-1vCl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:07:49 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cN19D68wwz6GD8p;
	Thu, 11 Sep 2025 23:06:24 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F8BD1400D9;
	Thu, 11 Sep 2025 23:07:40 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 11 Sep
 2025 17:07:39 +0200
Date: Thu, 11 Sep 2025 16:07:37 +0100
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
	Danilo Krummrich <dakr@kernel.org>, Lecopzer Chen <lecopzerc@nvidia.com>
Subject: Re: [PATCH v2 10/29] arm_mpam: Add cpuhp callbacks to probe MSC
 hardware
Message-ID: <20250911160737.0000492f@huawei.com>
In-Reply-To: <20250910204309.20751-11-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-11-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_080748_783216_07D0683E 
X-CRM114-Status: GOOD (  23.31  )
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

On Wed, 10 Sep 2025 20:42:50 +0000
James Morse <james.morse@arm.com> wrote:

> Because an MSC can only by accessed from the CPUs in its cpu-affinity
> set we need to be running on one of those CPUs to probe the MSC
> hardware.
> 
> Do this work in the cpuhp callback. Probing the hardware will only
> happen before MPAM is enabled, walk all the MSCs and probe those we can
> reach that haven't already been probed as each CPU's online call is made.
> 
> This adds the low-level MSC register accessors.
> 
> Once all MSCs reported by the firmware have been probed from a CPU in
> their respective cpu-affinity set, the probe-time cpuhp callbacks are
> replaced.  The replacement callbacks will ultimately need to handle
> save/restore of the runtime MSC state across power transitions, but for
> now there is nothing to do in them: so do nothing.
> 
> The architecture's context switch code will be enabled by a static-key,
> this can be set by mpam_enable(), but must be done from process context,
> not a cpuhp callback because both take the cpuhp lock.
> Whenever a new MSC has been probed, the mpam_enable() work is scheduled
> to test if all the MSCs have been probed. If probing fails, mpam_disable()
> is scheduled to unregister the cpuhp callbacks and free memory.
> 
> CC: Lecopzer Chen <lecopzerc@nvidia.com>
> Signed-off-by: James Morse <james.morse@arm.com>

Trivial suggestion inline. Either way
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> +
> +/* Before mpam is enabled, try to probe new MSC */
> +static int mpam_discovery_cpu_online(unsigned int cpu)
> +{
> +	int err = 0;
> +	struct mpam_msc *msc;
> +	bool new_device_probed = false;
> +
> +	guard(srcu)(&mpam_srcu);
> +	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		if (!cpumask_test_cpu(cpu, &msc->accessibility))
> +			continue;
> +
> +		mutex_lock(&msc->probe_lock);
> +		if (!msc->probed)
> +			err = mpam_msc_hw_probe(msc);
> +		mutex_unlock(&msc->probe_lock);
> +
> +		if (!err)
> +			new_device_probed = true;
> +		else
> +			break;
Unless this going to get more complex why not

		if (err)
			break;

		new_device_probed = true;
> +	}
> +
> +	if (new_device_probed && !err)
> +		schedule_work(&mpam_enable_work);
> +	if (err) {
> +		mpam_disable_reason = "error during probing";
> +		schedule_work(&mpam_broken_work);
> +	}
> +
> +	return err;
> +}

> +static void mpam_enable_once(void)
> +{
> +	mpam_register_cpuhp_callbacks(mpam_cpu_online, mpam_cpu_offline);
> +
> +	pr_info("MPAM enabled\n");

Feels too noisy given it should be easy enough to tell. pr_dbg() perhaps.


> +}



