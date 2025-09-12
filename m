Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9B2CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICyBDjHu6nEpGaPeiPRZEhk4xWKqqS6TSzVGLHG14j8=; b=d6Xk8zGql1yzabAPsNMREUzXcu
	SP0l3B4U8PdAFXox81F7w6jfP0xjErD0M+AUdhT24pt/qaPaxupfetenin+fDs9lOg79j4eMOQu3m
	Ors2lbJVpXyrB1926IcXvqBqj361CC1dOIIxDyt7qK/ERX5HyXhb4LsvxpBDdBJJB+6GA7Npi7izC
	TjV9+fuFea1hisgJe4Wn9KnrVugWeXaAaYsfcVhxe8bgjJd0XTSfDPtcU1j0Ynh++5a7dRp037lnN
	AiYwaHxXsw9Qiz9QUTn8OstmrZ/HouCrf3r2/+vH6/RUyJ9xLHq6GTw3jAm2F6VvpUPQtbzLbMRdU
	wjVnMosw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2NU-000000090yD-0Ufh;
	Fri, 12 Sep 2025 11:55:44 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2NQ-000000090vN-2Tt7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:55:42 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cNXqX6c7Xz6M4Wk;
	Fri, 12 Sep 2025 19:52:56 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 4330814037D;
	Fri, 12 Sep 2025 19:55:38 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Sep
 2025 13:55:37 +0200
Date: Fri, 12 Sep 2025 12:55:35 +0100
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
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 15/29] arm_mpam: Reset MSC controls from cpu hp
 callbacks
Message-ID: <20250912125535.0000151c@huawei.com>
In-Reply-To: <20250910204309.20751-16-james.morse@arm.com>
References: <20250910204309.20751-1-james.morse@arm.com>
	<20250910204309.20751-16-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_045540_932909_CB6F2316 
X-CRM114-Status: GOOD (  23.13  )
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

On Wed, 10 Sep 2025 20:42:55 +0000
James Morse <james.morse@arm.com> wrote:

> When a CPU comes online, it may bring a newly accessible MSC with
> it. Only the default partid has its value reset by hardware, and
> even then the MSC might not have been reset since its config was
> previously dirtyied. e.g. Kexec.
> 
> Any in-use partid must have its configuration restored, or reset.
> In-use partids may be held in caches and evicted later.
> 
> MSC are also reset when CPUs are taken offline to cover cases where
> firmware doesn't reset the MSC over reboot using UEFI, or kexec
> where there is no firmware involvement.
> 
> If the configuration for a RIS has not been touched since it was
> brought online, it does not need resetting again.
> 
> To reset, write the maximum values for all discovered controls.
> 
> CC: Rohit Mathew <Rohit.Mathew@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
Just one trivial passing comment from me.

Jonathan

> ---
> Changes since RFC:
>  * Last bitmap write will always be non-zero.
>  * Dropped READ_ONCE() - teh value can no longer change.
>  * Write 0 to proporitional stride, remove the bwa_fract variable.
>  * Removed nested srcu lock, the assert should cover it.
> ---
>  drivers/resctrl/mpam_devices.c  | 117 ++++++++++++++++++++++++++++++++
>  drivers/resctrl/mpam_internal.h |   8 +++
>  2 files changed, 125 insertions(+)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index cd8e95fa5fd6..0353313cf284 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c

>  
> @@ -818,6 +921,20 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
>  
>  static int mpam_cpu_offline(unsigned int cpu)
>  {
> +	int idx;
> +	struct mpam_msc *msc;
> +
> +	idx = srcu_read_lock(&mpam_srcu);

Might be worth using
guard(srcu)(&mpam_srcu);
here but only real advantage it bring is in hiding the local idx variable
away.  

> +	list_for_each_entry_srcu(msc, &mpam_all_msc, all_msc_list,
> +				 srcu_read_lock_held(&mpam_srcu)) {
> +		if (!cpumask_test_cpu(cpu, &msc->accessibility))
> +			continue;
> +
> +		if (atomic_dec_and_test(&msc->online_refs))
> +			mpam_reset_msc(msc, false);
> +	}
> +	srcu_read_unlock(&mpam_srcu, idx);
> +
>  	return 0;
>  }



