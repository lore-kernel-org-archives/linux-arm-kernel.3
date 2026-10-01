Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ACCACA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kioH6FD2uWvntc8cL4msZrH2Tz0anweBh9VtrlELY3w=; b=jqE+NEXkDRgs8M6uZDfDjws2vk
	uWSEGiXwMkaEy7Mf6ghVegz44gz3jd2K92B31Zl/ph7T/E+55UA7BLA9LJ30pvOY5a2BNbsZFyWay
	MF7zB6GQ8pk3UANONGOErpIja+lNdcUS6CVLcHiN3iGpAEaR2TNh86PxkgnrVQa8l8NEHx+ykscM4
	9kw3frST7o1XWI/iebJkmOirS9fcx4+GpFn222cyWSUm4amupz0f9aO6eqZkgW9dBgzZq7XDtXBd6
	d3luRnajPGyk5RPwk5RlYwiwTHlaWLfBPe2OmYj2pNsVp3EH7HIGPHFsbhMcLTYbl0P2v2UuqyR9e
	tMiRC1zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEcB-00000008anZ-1UmQ;
	Thu, 01 Oct 2026 11:06:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCEc6-00000008amU-0kYu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:06:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1A18497;
	Thu,  1 Oct 2026 04:06:05 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 629933F86F;
	Thu,  1 Oct 2026 04:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790852769; bh=+V5xRtwSpEjK63wJ+cyKK9U6lr5/HJMU+DNwniXIDPM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QA4Dw1zgbThIBjOabcmXcqRHYzROk+Gtzp31ZMqTM1Gizq4hBiCin0fp9CZK59U3Z
	 lnsZgFVLWM+YD5l+BCQwOtq4F4JiM/pb/+vop0z4oiTIc3E6LJHU7eaxU6vNx7EXKu
	 x7Lh+csDbTkySVd40j7jwq/nY4waPO8BTz6TOZ1s=
Date: Thu, 1 Oct 2026 12:05:54 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	will@kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v21 7/9] arm64: Block hibernate and kexec while RMM is
 active
Message-ID: <ar4-kg8Jq9BTn7Sb@arm.com>
References: <20261001084555.1456543-1-suzuki.poulose@arm.com>
 <20261001084555.1456543-8-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001084555.1456543-8-suzuki.poulose@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_040612_465769_5E40A815 
X-CRM114-Status: GOOD (  36.47  )
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

On Thu, Oct 01, 2026 at 09:45:53AM +0100, Suzuki K Poulose wrote:
> RMM can be deactivated only after all delegated granules have been
> reclaimed. If a new kernel is entered while any granules remain in the
> Realm PAS, accesses to that memory can raise a Granule Protection Fault
> and be fatal to the new kernel.
> 
> Crash kexec/kdump needs separate handling. It can be supported only once
> the crash kernel can tolerate delegated memory inherited from the primary
> kernel. i.e., be able to read the pages safely and fixup the GPF. Until
> then disable the kexec completely.
> 
> Hibernate has a similar problem. The image cannot be safely saved for
> delegated pages, as the RMM doesn't support exporting the pages.
> 
> Disable both kexec and hiberation while the RMM is active.

I would mention that this adds a new arch_hibernation_available() hook
called from hibernation_available(), otherwise the hibernation
maintainers may not realise why they've been cc'ed.

Alternatively, just introduce the hook as a separate patch without any
arch code.

> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Pavel Machek <pavel@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v20:
>  - Add arch_hibernation_available() hook for archs to have a say and drop the
>    other checks.
> Changes since v19:
>  - New patch to disable kexec and hibernation with RMM
> ---
>  arch/arm64/kernel/hibernate.c     | 14 ++++++++++++++
>  arch/arm64/kernel/machine_kexec.c | 11 +++++++++++
>  include/linux/suspend.h           |  1 +
>  kernel/power/hibernate.c          |  8 +++++++-
>  4 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
> index 7bf1174277772..08e03d24b93a8 100644
> --- a/arch/arm64/kernel/hibernate.c
> +++ b/arch/arm64/kernel/hibernate.c
> @@ -10,6 +10,8 @@
>   * Copyright (C) 2006 Rafael J. Wysocki <rjw@sisk.pl>
>   */
>  #define pr_fmt(x) "hibernate: " x
> +
> +#include <linux/arm-rmi-cmds.h>
>  #include <linux/cpu.h>
>  #include <linux/kvm_host.h>
>  #include <linux/pm.h>
> @@ -105,6 +107,18 @@ void notrace restore_processor_state(void)
>  {
>  }
>  
> +bool arch_hibernation_available(void)
> +{
> +	/*
> +	 * If we have activated the RMM, there could be pages that are
> +	 * delegated to the RMM. Trying to save them to the image will be fatal.
> +	 * Also, we donate pages to the RMM at activation and restoring data
> +	 * to those pages are going to be fatal.
> +	 * Hence, disable the hibernation when the RMM is active
> +	 */
> +	return !cpus_are_stuck_in_kernel() && !is_rmm_active();
> +}

For now, I would keep is_rmm_active() only in here as not to change the
behaviour for pKVM. "disk" would disappear from /sys/power/state with
this patch. I think it's the correct thing to do for pKVM as well but we
can discuss this separately once this goes in (I also think pKVM using
cpus_are_stuck_in_kernel() is a bit of a bodge but it's a handy hook
called in the right places).

> +
>  int arch_hibernation_header_save(void *addr, unsigned int max_size)
>  {
>  	struct arch_hibernate_hdr *hdr = addr;
> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
> index 8f9bc2327dc85..48f343704cb54 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -6,6 +6,7 @@
>   * Copyright (C) Huawei Futurewei Technologies.
>   */
>  
> +#include <linux/arm-rmi-cmds.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
> @@ -59,6 +60,16 @@ int machine_kexec_prepare(struct kimage *kimage)
>  		return -EBUSY;
>  	}
>  
> +	/*
> +	 * We will be able to allow kdump to proceed, once we have the support
> +	 * for handling GPF from vmcore accesses to delegated pages. Until then
> +	 * block kexec completely.
> +	 */
> +	if (is_rmm_active()) {
> +		pr_err("Can't kexec: RMM is active.\n");
> +		return -EBUSY;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index b02876f1ae38a..a3815027773c5 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -401,6 +401,7 @@ int hibernate_quiet_exec(int (*func)(void *data), void *data);
>  int hibernate_resume_nonboot_cpu_disable(void);
>  int arch_hibernation_header_save(void *addr, unsigned int max_size);
>  int arch_hibernation_header_restore(void *addr);
> +bool arch_hibernation_available(void);
>  
>  #else /* CONFIG_HIBERNATION */
>  static inline void register_nosave_region(unsigned long b, unsigned long e) {}
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index d2479c69d71a4..9d9d53828542f 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -106,11 +106,17 @@ bool hibernation_in_progress(void)
>  	return !atomic_read(&hibernate_atomic);
>  }
>  
> +__weak bool arch_hibernation_available(void)
> +{
> +	return true;
> +}
> +
>  bool hibernation_available(void)
>  {
>  	return nohibernate == 0 &&
>  		!security_locked_down(LOCKDOWN_HIBERNATION) &&
> -		!secretmem_active() && !cxl_mem_active();
> +		!secretmem_active() && !cxl_mem_active() &&
> +		arch_hibernation_available();
>  }

With the comments above addressed:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

