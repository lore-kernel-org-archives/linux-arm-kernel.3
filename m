Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FAFECD983
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIGtsCjedCkQ2XcBx++sVU0LQGhcodgsYVu5gusy8bY=; b=YHA3nL8xU5J/okgbKit/qlXnKh
	RyNR/24XuCJWObbFnS72tJ+4ibfF4heNyYgQjlVcJoSQxnAeB2JQWlrej8zG/QneEVX4/SptWjiv1
	aXW0WxfUEb8a3DVZhKMW1PYzgKy1r6TFtUebijmjhhsfVY0qQIVmXTm18LoxZuTkYceCBM0dE6kgx
	tlnRuAelJuEAlQ9NIfln0ZhrmZFZoVSgpi7ZY4GXRn2imsADNEjjSl+LQWmDPnbQH4GLU8CsDeK+A
	y+q8LCrzTroqLhcLwkbE054upMckQ8TRqXu6g1O9NyHIfbctRZe9DTUcfqBkerF5EVhM/NVtTmdaK
	XfNzudEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo221-0000000ADXu-12fH;
	Thu, 05 Feb 2026 16:16:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo21x-0000000ADXP-2hgL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 16:16:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56515339;
	Thu,  5 Feb 2026 08:16:25 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E314C3F632;
	Thu,  5 Feb 2026 08:16:25 -0800 (PST)
Date: Thu, 5 Feb 2026 16:16:23 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
	dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
	fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
	jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	peternewman@google.com, punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com, reinette.chatre@intel.com,
	rohit.mathew@arm.com, scott@os.amperecomputing.com,
	sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com, will@kernel.org, corbet@lwn.net,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
	zengheng4@huawei.com, linux-doc@vger.kernel.org,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: Re: [PATCH v4 04/41] arm64: mpam: Context switch the MPAM registers
Message-ID: <aYTCV8E9ZFn4_FND@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
 <20260203214342.584712-5-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203214342.584712-5-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_081633_803031_30621355 
X-CRM114-Status: GOOD (  27.98  )
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

On Tue, Feb 03, 2026 at 09:43:05PM +0000, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> MPAM allows traffic in the SoC to be labeled by the OS, these labels are
> used to apply policy in caches and bandwidth regulators, and to monitor
> traffic in the SoC. The label is made up of a PARTID and PMG value. The x86
> equivalent calls these CLOSID and RMID, but they don't map precisely.
> 
> MPAM has two CPU system registers that is used to hold the PARTID and PMG
> values that traffic generated at each exception level will use. These can
> be set per-task by the resctrl file system. (resctrl is the defacto
> interface for controlling this stuff).
> 
> Add a helper to switch this.
> 
> struct task_struct's separate CLOSID and RMID fields are insufficient to
> implement resctrl using MPAM, as resctrl can change the PARTID (CLOSID) and
> PMG (sort of like the RMID) separately. On x86, the rmid is an independent
> number, so a race that writes a mismatched closid and rmid into hardware is
> benign. On arm64, the pmg bits extend the partid.
> (i.e. partid-5 has a pmg-0 that is not the same as partid-6's pmg-0).  In
> this case, mismatching the values will 'dirty' a pmg value that resctrl
> believes is clean, and is not tracking with its 'limbo' code.
> 
> To avoid this, the partid and pmg are always read and written as a
> pair. This requires a new u64 field. In struct task_struct there are two
> u32, rmid and closid for the x86 case, but as we can't use them here do
> something else. Add this new field, mpam_partid_pmg, to struct thread_info
> to avoid adding more architecture specific code to struct task_struct.
> Always use READ_ONCE()/WRITE_ONCE() when accessing this field.
> 
> Resctrl allows a per-cpu 'default' value to be set, this overrides the
> values when scheduling a task in the default control-group, which has
> PARTID 0. The way 'code data prioritisation' gets emulated means the
> register value for the default group needs to be a variable.
> 
> The current system register value is kept in a per-cpu variable to avoid
> writing to the system register if the value isn't going to change.  Writes
> to this register may reset the hardware state for regulating bandwidth.
> 
> Finally, there is no reason to context switch these registers unless there
> is a driver changing the values in struct task_struct. Hide the whole thing
> behind a static key. This also allows the driver to disable MPAM in
> response to errors reported by hardware. Move the existing static key to
> belong to the arch code, as in the future the MPAM driver may become a
> loadable module.
> 
> All this should depend on whether there is an MPAM driver, hide it behind
> CONFIG_ARM64_MPAM.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> CC: Amit Singh Tomar <amitsinght@marvell.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

