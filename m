Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AE3C79FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koyNuAYHed6J5Jl1VuK5dAOOpOEiHY4ZnY3gKSVR2l4=; b=V9U9ks5+peFH734fH76LX7/tZa
	SRKbrlm1ivQyENxa8353Qkf1hb8t4IY59z1+fXuak640NHYCvq9Pj3PyCCkdvuRda+1bJeu/vepj/
	ie9rWJE1ZgUiv73Mw04/fq9QJjgWIFdVarYCeM31c4Vz9ataUpr300xYNjZTNRq4OhN3GbZUfEga3
	XB0LbLTKtw7ev5RK3awXDkHarQyB1DaE1Ry8kRb8rCxmS02Ggbaq7iMhnetdFhNGJkn+AxzujFbet
	zd6/R07ZpNbx8RG5zmiWCH4NVSGXwW704ChqIy84gALAe0mtvtYxV1PlyPmqkHbJWOcNlrEeWxvtv
	pLAR32gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoz0-0000000BuBy-1pHZ;
	Mon, 05 Jan 2026 18:07:10 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoyx-0000000BuAk-0SB6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 18:07:08 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlMh73cXdzJ46BT;
	Tue,  6 Jan 2026 02:07:03 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id C6D5040086;
	Tue,  6 Jan 2026 02:07:03 +0800 (CST)
Received: from localhost (10.126.174.38) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 5 Jan
 2026 18:07:02 +0000
Date: Mon, 5 Jan 2026 18:07:00 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <amitsinght@marvell.com>, <baisheng.gao@unisoc.com>,
	<baolin.wang@linux.alibaba.com>, <carl@os.amperecomputing.com>,
	<dave.martin@arm.com>, <david@kernel.org>, <dfustini@baylibre.com>,
	<fenghuay@nvidia.com>, <gshan@redhat.com>, <james.morse@arm.com>,
	<kobak@nvidia.com>, <lcherian@marvell.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <punit.agrawal@oss.qualcomm.com>,
	<quic_jiles@quicinc.com>, <reinette.chatre@intel.com>,
	<rohit.mathew@arm.com>, <scott@os.amperecomputing.com>,
	<sdonthineni@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<xhao@linux.alibaba.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<corbet@lwn.net>, <maz@kernel.org>, <oupton@kernel.org>,
	<joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <kvmarm@lists.linux.dev>
Subject: Re: [PATCH v2 22/45] arm_mpam: resctrl: Add CDP emulation
Message-ID: <20260105180700.000037c8@huawei.com>
In-Reply-To: <20251219181147.3404071-23-ben.horgan@arm.com>
References: <20251219181147.3404071-1-ben.horgan@arm.com>
	<20251219181147.3404071-23-ben.horgan@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.126.174.38]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_100707_438912_54F66670 
X-CRM114-Status: GOOD (  20.41  )
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

On Fri, 19 Dec 2025 18:11:24 +0000
Ben Horgan <ben.horgan@arm.com> wrote:

> From: James Morse <james.morse@arm.com>
> 
> Intel RDT's CDP feature allows the cache to use a different control value
> depending on whether the accesses was for instruction fetch or a data
> access. MPAM's equivalent feature is the other way up: the CPU assigns a
> different partid label to traffic depending on whether it was instruction
> fetch or a data access, which causes the cache to use a different control
> value based solely on the partid.
> 
> MPAM can emulate CDP, with the side effect that the alternative partid is
> seen by all MSC, it can't be enabled per-MSC.
> 
> Add the resctrl hooks to turn this on or off. Add the helpers that match a
> closid against a task, which need to be aware that the value written to
> hardware is not the same as the one resctrl is using.
> 
> Update the 'arm64_mpam_global_default' variable the arch code uses during
> context switch to know when the per-cpu value should be used instead.
> 
> Awkwardly, the MB controls don't implement CDP. To emulate this, the MPAM
> equivalent needs programming twice by the resctrl glue, as resctrl expects
> the bandwidth controls to be applied independently for both data and
> instruction-fetch.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> CC: Amit Singh Tomar <amitsinght@marvell.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

Minor thing below.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
> index 5a78299ec464..ba0312b55d9f 100644
> --- a/include/linux/arm_mpam.h
> +++ b/include/linux/arm_mpam.h
> @@ -5,6 +5,7 @@
>  #define __LINUX_ARM_MPAM_H
>  
>  #include <linux/acpi.h>
> +#include <linux/resctrl_types.h>

This seems odd as nothing added to the header in this path appears to need it.
Maybe should be down in the c file or in a different patch?

>  #include <linux/types.h>
>  
>  struct mpam_msc;
> @@ -56,6 +57,8 @@ void resctrl_arch_set_cpu_default_closid(int cpu, u32 closid);
>  void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
>  void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 rmid);
>  void resctrl_arch_sched_in(struct task_struct *tsk);
> +bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
> +bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
>  
>  /**
>   * mpam_register_requestor() - Register a requestor with the MPAM driver


