Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816D4D3B7FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 15:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMbErR1kDrKaLdnhhH0bIvrZqM1mrEO4UUBPsYoS3y0=; b=1+tPg0yi8rf1AHdt7UjiywzBA4
	u4T0Q+VxHDf2M27BRGHfB3iINsZRGECPSGc2AuvUV1BTqnBXF+1P9n+4Y122AQPqYmK2MihZ86Pvp
	zLwHp92qJPFaUa/PX4OGyIGXRQJc/YWMGQnZLBm8vvR1/AKItpzDXK12E03JnfQG0za03XdreccSW
	4ZZKPmhI19u5mTevaDQFlkkexUbiYGcdlq2GdfApL6XsJNRO6WIjStxaBpL1p70wEEOrcqg6FHzt7
	MjCcqBB2VjzH/FAeP/p+J+oJWU+pDFRSG64sni0BUvievq4sGKUqIAbOWVgTVE3PlwHzB1wt3mxds
	UdmzwpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzP6-0000000ERaV-1Bo1;
	Tue, 09 Dec 2025 15:13:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSzP3-0000000ERa8-0r35
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 15:13:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE9D9175D;
	Tue,  9 Dec 2025 07:13:16 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B33D33F762;
	Tue,  9 Dec 2025 07:13:20 -0800 (PST)
Message-ID: <0ea282be-c44f-4562-9104-1efe57348a3e@arm.com>
Date: Tue, 9 Dec 2025 15:13:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 02/38] arm64: mpam: Re-initialise MPAM regs when CPU
 comes online
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-3-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-3-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_071325_309526_8AE93111 
X-CRM114-Status: GOOD (  19.16  )
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

On 12/5/25 21:58, James Morse wrote:
> Now that the MPAM system registers are expected to have values that change,
> reprogram them based on struct task_struct when a CPU is brought online.
> 
> Previously MPAM's 'default PARTID' of 0 was used this is the PARTID that
> hardware guarantees to reset. Because there are a limited number of
> PARTID, this value is exposed to user space, meaning resctrl changes
> to the resctrl default group would also affect kernel threads.
> Instead, use the task's PARTID value for kernel work on behalf of
> user-space too.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>  arch/arm64/kernel/cpufeature.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 5ed401ff79e3..429128a181ac 100644
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
> @@ -2439,13 +2440,16 @@ test_has_mpam(const struct arm64_cpu_capabilities *entry, int scope)
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
> +	int cpu = smp_processor_id();
> +	u64 regval = 0;
> +
> +	if (IS_ENABLED(CONFIG_MPAM))
> +		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));

CONFIG_MPAM -> CONFIG_ARM64_MPAM

> +
> +	write_sysreg_s(regval, SYS_MPAM1_EL1);
> +	isb();
> +
> +	write_sysreg_s(regval, SYS_MPAM0_EL1);
>  }
>  
>  static bool

Thanks,

Ben


