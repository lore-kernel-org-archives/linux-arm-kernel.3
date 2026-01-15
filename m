Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026D5D4660A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 18:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfT/4CEB5xIpxa5aAhYw1szuoO7Mk9sMtwELgrgFNOs=; b=uSpUXcNuM2/ZYa47mO/N2dtLE/
	1KiBABFJbMUBvom37374AazY1tQaEsSPReQ8barbxax+ePugl2ir/GGUTcaEIvxpRT1+lKfEt+qPz
	QsLwcmQ3AxMQDaCPL/IzDf+C+8s42g5zKoFAfRacRJ1kxct/wJBTdR7x3jaPgcJfpHh3JAlPP6EKz
	OkWb5D6mCDAmw/rsO/hr67btwHUFwEspjS4v0UN6lTxb9BQQi7V61D8r2iL5xVbzbgNvHoEpi2Xu1
	JSvKhhJMdmZBf76Ovvbb4+WXICB2oF6RcGBeDQtWcYBDWYw2olZh+9Cq+chU4fv+D4A7xoTUkmM3S
	J+nI2dEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRrR-0000000CwGF-19G0;
	Thu, 15 Jan 2026 18:14:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgRrO-0000000CwFi-2xIA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 18:14:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D2791515;
	Thu, 15 Jan 2026 10:14:10 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E26803F632;
	Thu, 15 Jan 2026 10:14:11 -0800 (PST)
Date: Thu, 15 Jan 2026 18:14:09 +0000
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
	suzuki.poulose@arm.com, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 07/47] arm64: mpam: Re-initialise MPAM regs when CPU
 comes online
Message-ID: <aWkucXgE6g2lwvkj@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-8-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112165914.4086692-8-ben.horgan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_101418_863877_B336FD81 
X-CRM114-Status: GOOD (  28.06  )
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

On Mon, Jan 12, 2026 at 04:58:34PM +0000, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> Now that the MPAM system registers are expected to have values that change,
> reprogram them based on the previous value when a CPU is brought online.
> 
> Previously MPAM's 'default PARTID' of 0 was always used for MPAM in
> kernel-space as this is the PARTID that hardware guarantees to
> reset. Because there are a limited number of PARTID, this value is exposed
> to user-space, meaning resctrl changes to the resctrl default group would
> also affect kernel threads.  Instead, use the task's PARTID value for
> kernel work on behalf of user-space too. The default of 0 is kept for both
> user-space and kernel-space when MPAM is not enabled.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> CONFIG_MPAM -> CONFIG_ARM64_MPAM
> Check mpam_enabled
> Comment about relying on ERET for synchronisation
> Update commit message
> ---
>  arch/arm64/kernel/cpufeature.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index c840a93b9ef9..0cdfb3728f43 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -86,6 +86,7 @@
>  #include <asm/kvm_host.h>
>  #include <asm/mmu.h>
>  #include <asm/mmu_context.h>
> +#include <asm/mpam.h>
>  #include <asm/mte.h>
>  #include <asm/hypervisor.h>
>  #include <asm/processor.h>
> @@ -2483,13 +2484,17 @@ test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
>  static void
>  cpu_enable_mpam(const struct arm64_cpu_capabilities *entry)
>  {
> -	/*
> -	 * Access by the kernel (at EL1) should use the reserved PARTID
> -	 * which is configured unrestricted. This avoids priority-inversion
> -	 * where latency sensitive tasks have to wait for a task that has
> -	 * been throttled to release the lock.
> -	 */
> -	write_sysreg_s(0, SYS_MPAM1_EL1);

Is this comment about priority inversion no longer valid? I see thread
switching sets the same value for both MPAM0 and MPAM1 registers but I
couldn't find an explanation why this is now better when it wasn't
before.

MPAM1 will also be inherited by IRQ handlers AFAICT.

> +	int cpu = smp_processor_id();
> +	u64 regval = 0;
> +
> +	if (IS_ENABLED(CONFIG_ARM64_MPAM) && static_branch_likely(&mpam_enabled))
> +		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
> +
> +	write_sysreg_s(regval, SYS_MPAM1_EL1);
> +	isb();
> +
> +	/* Synchronising the EL0 write is left until the ERET to EL0 */
> +	write_sysreg_s(regval, SYS_MPAM0_EL1);

I mentioned before, is it worth waiting until ERET?

Related to this, do LDTR/STTR use MPAM0 or MPAM1? I couldn't figure out
from the Arm ARM. If they use MPAM0, then we need the ISB early for the
uaccess routines, at least in the thread switching path (an earlier
patch).

-- 
Catalin

