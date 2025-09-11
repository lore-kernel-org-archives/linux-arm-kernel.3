Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A448ACAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8UjAK5/KbZW/Gzdd4fnBbO0QKUMCsyz9kqqgznPvQg=; b=dPiTUNTQNjuDdedO2RyhChpuy3
	5mvVCDYtJDCzjjpYQlriQZrxJCligbluMlX0o83/Y0AOUrGNUelWT4LEH0NoZ5yCBFYLlm0lcDHIb
	yrKVto7D2a5zAMibyD6aOA18Gd8wlCG9vz1HhGqLUPAkkAcnEWbU07FbL2jFmSoplUTnvrXRUlJRH
	K7VBASLCbdcZaQQ8gKisDUzYTGTNToQpu//6SIVpTmZsqCPM//SlA4e60tjIPC6YrGLMhDqko1xDJ
	yFz6sHdLnggqtwQvVHyXbrYrPEEiVr6wD4zM1HOIbPtT91GrfcjrTuZFBxwGPLMpXBTF1qpq2fO5E
	4IPK51hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjH7-00000003uit-0RsP;
	Thu, 11 Sep 2025 15:31:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwjH4-00000003ui7-27ju
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:31:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C145C153B;
	Thu, 11 Sep 2025 08:31:40 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D7233F63F;
	Thu, 11 Sep 2025 08:31:44 -0700 (PDT)
Message-ID: <aaefa134-b520-42d2-a700-4f7382b0318f@arm.com>
Date: Thu, 11 Sep 2025 16:31:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/29] arm_mpam: Add helpers for managing the locking
 around the mon_sel registers
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-13-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20250910204309.20751-13-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_083150_671688_85706E0D 
X-CRM114-Status: GOOD (  26.53  )
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

Hi James,

On 9/10/25 21:42, James Morse wrote:
> The MSC MON_SEL register needs to be accessed from hardirq for the overflow
> interrupt, and when taking an IPI to access these registers on platforms
> where MSC are not accesible from every CPU. This makes an irqsave
> spinlock the obvious lock to protect these registers. On systems with SCMI
> mailboxes it must be able to sleep, meaning a mutex must be used. The
> SCMI platforms can't support an overflow interrupt.
> 
> Clearly these two can't exist for one MSC at the same time.
> 
> Add helpers for the MON_SEL locking. The outer lock must be taken in a
> pre-emptible context before the inner lock can be taken. On systems with
> SCMI mailboxes where the MON_SEL accesses must sleep - the inner lock
> will fail to be 'taken' if the caller is unable to sleep. This will allow
> callers to fail without having to explicitly check the interface type of
> each MSC.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
> Change since v1:
>  * Made accesses to outer_lock_held READ_ONCE() for torn values in the failure
>    case.
> ---
>  drivers/resctrl/mpam_devices.c  |  3 +--
>  drivers/resctrl/mpam_internal.h | 37 +++++++++++++++++++++++++++++----
>  2 files changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 24dc81c15ec8..a26b012452e2 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -748,8 +748,7 @@ static int mpam_msc_drv_probe(struct platform_device *pdev)
>  
>  		mutex_init(&msc->probe_lock);
>  		mutex_init(&msc->part_sel_lock);
> -		mutex_init(&msc->outer_mon_sel_lock);
> -		raw_spin_lock_init(&msc->inner_mon_sel_lock);
> +		mpam_mon_sel_lock_init(msc);
>  		msc->id = pdev->id;
>  		msc->pdev = pdev;
>  		INIT_LIST_HEAD_RCU(&msc->all_msc_list);
> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
> index 828ce93c95d5..4cc44d4e21c4 100644
> --- a/drivers/resctrl/mpam_internal.h
> +++ b/drivers/resctrl/mpam_internal.h
> @@ -70,12 +70,17 @@ struct mpam_msc {
>  
>  	/*
>  	 * mon_sel_lock protects access to the MSC hardware registers that are
> -	 * affected by MPAMCFG_MON_SEL.
> +	 * affected by MPAMCFG_MON_SEL, and the mbwu_state.
> +	 * Access to mon_sel is needed from both process and interrupt contexts,
> +	 * but is complicated by firmware-backed platforms that can't make any
> +	 * access unless they can sleep.
> +	 * Always use the mpam_mon_sel_lock() helpers.
> +	 * Accessed to mon_sel need to be able to fail if they occur in the wrong
> +	 * context.
>  	 * If needed, take msc->probe_lock first.
>  	 */
> -	struct mutex		outer_mon_sel_lock;
> -	raw_spinlock_t		inner_mon_sel_lock;
> -	unsigned long		inner_mon_sel_flags;
> +	raw_spinlock_t		_mon_sel_lock;
> +	unsigned long		_mon_sel_flags;
>  

These stale variables can be removed in the patch that introduced them,
outer_mon_sel_lock, inner_mon_sel_lock, inner_mon_sel_flags. Jonathan
has already pointed out the stale comment and paragraph in the commit
message.

Thanks,

Ben


