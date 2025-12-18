Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F43CD6ACE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 10:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KBZ4kngHz4nSdNUr3WEEynRgoxo3LXlMcyTui2TImWE=; b=xgWRpALLFtlyaB1JFzypaEJteN
	Cd4G2vj3lG7zjQvoLAgT2S1nAm22NY9c2mvFqGplyqSz6v4sWu9v70zTsNPn/JCRXv1ZM6MPSdDTP
	rZLv/mIQyAuFLWgz1JRGCBQARiR62PlNUerG0SjMsEeiU40P0Au4hdDBYsF14iyMrd9fGClo9Fcm9
	w7CusiijkOstW5HKEOqFqMbTROMyeym1oBWgDGcbPSXJOf6DgPwbRCV7/iQScvGUsLxk1qfdmq+i3
	2t8Erp/HzvmCPsHyZrBsClNuGu5Y4+W2tEYWEzZ6+BVN6rLq5b7vYKrAGqZK7MyuhwoX0iz+23Tm9
	MXLEMUCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBUw-00000008FfJ-3na1;
	Thu, 18 Dec 2025 10:44:42 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBUt-00000008FeH-3sXA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 10:44:41 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dX6jN4VrfzHnGjS;
	Thu, 18 Dec 2025 18:44:08 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B04740539;
	Thu, 18 Dec 2025 18:44:35 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 18 Dec
 2025 10:44:34 +0000
Date: Thu, 18 Dec 2025 10:44:33 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, D
 Scott Phillips OS <scott@os.amperecomputing.com>,
	<carl@os.amperecomputing.com>, <lcherian@marvell.com>,
	<bobo.shaobowang@huawei.com>, <tan.shaopeng@fujitsu.com>,
	<baolin.wang@linux.alibaba.com>, Jamie Iles <quic_jiles@quicinc.com>, "Xin
 Hao" <xhao@linux.alibaba.com>, <peternewman@google.com>,
	<dfustini@baylibre.com>, <amitsinght@marvell.com>, David Hildenbrand
	<david@kernel.org>, Dave Martin <dave.martin@arm.com>, Koba Ko
	<kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
	<fenghuay@nvidia.com>, <baisheng.gao@unisoc.com>, Gavin Shan
	<gshan@redhat.com>, Ben Horgan <ben.horgan@arm.com>, <rohit.mathew@arm.com>,
	<reinette.chatre@intel.com>, Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: Re: [RFC PATCH 05/38] arm64: mpam: Add helpers to change a task or
 cpu's MPAM PARTID/PMG values
Message-ID: <20251218104433.00002196@huawei.com>
In-Reply-To: <20251205215901.17772-6-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
	<20251205215901.17772-6-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_024440_254038_487350DB 
X-CRM114-Status: GOOD (  18.18  )
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

On Fri, 5 Dec 2025 21:58:28 +0000
James Morse <james.morse@arm.com> wrote:

> Care must be taken when modifying the PARTID and PMG of a task in any
> per-task structure as writing these values may race with the task being
> scheduled in, and reading the modified values.
> 
> Add helpers to set the task properties, and the CPU default value.
> These use WRITE_ONCE() that pairs with the READ_ONCE() in mpam_get_regval()
> to avoid causing torn values.
> 
> CC: Dave Martin <Dave.Martin@arm.com>
> CC: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  arch/arm64/include/asm/mpam.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
> index 86a55176f884..2960ffaf6574 100644
> --- a/arch/arm64/include/asm/mpam.h
> +++ b/arch/arm64/include/asm/mpam.h
> @@ -5,6 +5,7 @@
>  #define __ASM__MPAM_H
>  
>  #include <linux/bitops.h>
> +#include <linux/bitfield.h>
>  #include <linux/init.h>
>  #include <linux/jump_label.h>
>  #include <linux/percpu.h>
> @@ -37,6 +38,35 @@ extern u64 arm64_mpam_global_default;
>   * A value in struct thread_info is used instead of struct task_struct as the
>   * cpu's u64 register format is used, but struct task_struct has two u32'.
>   */
I'd be tempted to reorder this so the comment ends up near at least
one use of task_thread_info(tsk)->mpam_partid_pmg. Otherwise it is even
less obvious what it is referring to.

Easiest might be to put the mpam_get_regval() before the mpam_set_task_partid_pmg()


> +static inline void mpam_set_cpu_defaults(int cpu, u16 partid_d, u16 partid_i,
> +					 u8 pmg_d, u8 pmg_i)
> +{
> +	u64 default_val;
> +
> +	default_val = FIELD_PREP(MPAM0_EL1_PARTID_D, partid_d);
> +	default_val |= FIELD_PREP(MPAM0_EL1_PARTID_I, partid_i);
> +	default_val |= FIELD_PREP(MPAM0_EL1_PMG_D, pmg_d);
> +	default_val |= FIELD_PREP(MPAM0_EL1_PMG_I, pmg_i);
> +
> +	WRITE_ONCE(per_cpu(arm64_mpam_default, cpu), default_val);
> +}
> +
> +static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
> +					    u16 partid_d, u16 partid_i,
> +					    u8 pmg_d, u8 pmg_i)
> +{
> +#ifdef CONFIG_ARM64_MPAM
> +	u64 regval;
> +
> +	regval = FIELD_PREP(MPAM0_EL1_PARTID_D, partid_d);
> +	regval |= FIELD_PREP(MPAM0_EL1_PARTID_I, partid_i);
> +	regval |= FIELD_PREP(MPAM0_EL1_PMG_D, pmg_d);
> +	regval |= FIELD_PREP(MPAM0_EL1_PMG_I, pmg_i);

Maybe a macro or helper to build regval given this replicates the block in
mpam_set_cpu_defaults.  Obviously ignore if this changes in later patches!

> +
> +	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
> +#endif
> +}
> +
>  static inline u64 mpam_get_regval(struct task_struct *tsk)
>  {
>  #ifdef CONFIG_ARM64_MPAM


