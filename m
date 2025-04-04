Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF4DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WijxwuknPlk1r+qbDwTmKSMgFhejiaMbZahqZ6sp/hA=; b=06aMJbyLuFQFGv79EYyuH2JuYp
	5etFbcUSR/aLB9vXWevJKjXbB6RCU/l+Eee2gxEvQsprqPsRAq5eQOb7Lavtv55fHT18IjQXLNBrx
	Jeu4jjkD8eMhCeboRO4OJeHJmCXPSThq5ucqV0/nELPOxZLNMmsAzlBygGYVZ7IzneSRib5v93TTb
	5sqhDSk4VFnry0gf1OVosefbM6P40gAgKjDMgbVIu0ZW0Ei9DH04ByIDA6JIgH4Jotb2S/IIh+z8l
	RKUJ7wACBDxlgxW4UZOmAB9JQfhE3sPfffAfUHMriZNFSzelnp6sEO/F/qMPYdh/9prJ+U7cVsFRi
	0RKDT5fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0djX-0000000BKld-0MzA;
	Fri, 04 Apr 2025 09:53:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0db9-0000000BJLE-07PJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 09:44:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2E8D1515;
	Fri,  4 Apr 2025 02:44:28 -0700 (PDT)
Received: from [10.162.40.17] (a077893.blr.arm.com [10.162.40.17])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40D8C3F59E;
	Fri,  4 Apr 2025 02:44:23 -0700 (PDT)
Message-ID: <f0e1ce67-8341-4c44-993c-dac31db00c59@arm.com>
Date: Fri, 4 Apr 2025 15:14:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: Expose AIDR_EL1 via sysfs
To: Oliver Upton <oliver.upton@linux.dev>,
 linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>
References: <20250403231626.3181116-1-oliver.upton@linux.dev>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250403231626.3181116-1-oliver.upton@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_024427_174032_E46EE544 
X-CRM114-Status: GOOD (  25.00  )
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

On 4/4/25 04:46, Oliver Upton wrote:
> The KVM PV ABI recently added a feature that allows the VM to discover
> the set of physical CPU implementations, identified by a tuple of
> {MIDR_EL1, REVIDR_EL1, AIDR_EL1}. Unlike other KVM PV features, the
> expectation is that the VMM implements the hypercall instead of KVM as
> it has the authoritative view of where the VM gets scheduled.
> 
> To do this the VMM needs to know the values of these registers on any
> CPU in the system. While MIDR_EL1 and REVIDR_EL1 are already exposed,
> AIDR_EL1 is not. Provide it in sysfs along with the other identification
> registers.
> 
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> ---
>  Documentation/ABI/testing/sysfs-devices-system-cpu |  1 +
>  Documentation/arch/arm64/cpu-feature-registers.rst | 13 +++++++------
>  arch/arm64/include/asm/cpu.h                       |  1 +
>  arch/arm64/kernel/cpuinfo.c                        |  3 +++
>  4 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> index 206079d3bd5b..9bbf4c27c237 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -485,6 +485,7 @@ What:		/sys/devices/system/cpu/cpuX/regs/
>  		/sys/devices/system/cpu/cpuX/regs/identification/
>  		/sys/devices/system/cpu/cpuX/regs/identification/midr_el1
>  		/sys/devices/system/cpu/cpuX/regs/identification/revidr_el1
> +		/sys/devices/system/cpu/cpuX/regs/identification/aidr_el1
>  		/sys/devices/system/cpu/cpuX/regs/identification/smidr_el1
>  Date:		June 2016
>  Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> diff --git a/Documentation/arch/arm64/cpu-feature-registers.rst b/Documentation/arch/arm64/cpu-feature-registers.rst
> index 253e9743de2f..add66afc7b03 100644
> --- a/Documentation/arch/arm64/cpu-feature-registers.rst
> +++ b/Documentation/arch/arm64/cpu-feature-registers.rst
> @@ -72,14 +72,15 @@ there are some issues with their usage.
>      process could be migrated to another CPU by the time it uses the
>      register value, unless the CPU affinity is set. Hence, there is no
>      guarantee that the value reflects the processor that it is
> -    currently executing on. The REVIDR is not exposed due to this
> -    constraint, as REVIDR makes sense only in conjunction with the
> -    MIDR. Alternately, MIDR_EL1 and REVIDR_EL1 are exposed via sysfs
> -    at::
> +    currently executing on. REVIDR and AIDR are not exposed due to this
> +    constraint, as these registers only make sense in conjunction with
> +    the MIDR. Alternately, MIDR_EL1, REVIDR_EL1, and AIDR_EL1 are exposed
> +    via sysfs at::
>  
>  	/sys/devices/system/cpu/cpu$ID/regs/identification/
> -	                                              \- midr
> -	                                              \- revidr
> +	                                              \- midr_el1
> +	                                              \- revidr_el1
> +	                                              \- aidr_el1

Right, the existing ones are also marked with _el1 suffix as well.

>  
>  3. Implementation
>  --------------------
> diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
> index 81e4157f92b7..71493b760b83 100644
> --- a/arch/arm64/include/asm/cpu.h
> +++ b/arch/arm64/include/asm/cpu.h
> @@ -44,6 +44,7 @@ struct cpuinfo_arm64 {
>  	u64		reg_dczid;
>  	u64		reg_midr;
>  	u64		reg_revidr;
> +	u64		reg_aidr;
>  	u64		reg_gmid;
>  	u64		reg_smidr;
>  	u64		reg_mpamidr;
> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index 285d7d538342..621218d2a991 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -328,11 +328,13 @@ static const struct kobj_type cpuregs_kobj_type = {
>  
>  CPUREGS_ATTR_RO(midr_el1, midr);
>  CPUREGS_ATTR_RO(revidr_el1, revidr);
> +CPUREGS_ATTR_RO(aidr_el1, aidr);
>  CPUREGS_ATTR_RO(smidr_el1, smidr);
>  
>  static struct attribute *cpuregs_id_attrs[] = {
>  	&cpuregs_attr_midr_el1.attr,
>  	&cpuregs_attr_revidr_el1.attr,
> +	&cpuregs_attr_aidr_el1.attr,
>  	NULL
>  };
>  
> @@ -469,6 +471,7 @@ static void __cpuinfo_store_cpu(struct cpuinfo_arm64 *info)
>  	info->reg_dczid = read_cpuid(DCZID_EL0);
>  	info->reg_midr = read_cpuid_id();
>  	info->reg_revidr = read_cpuid(REVIDR_EL1);
> +	info->reg_aidr = read_cpuid(AIDR_EL1);
>  
>  	info->reg_id_aa64dfr0 = read_cpuid(ID_AA64DFR0_EL1);
>  	info->reg_id_aa64dfr1 = read_cpuid(ID_AA64DFR1_EL1);
> 
> base-commit: e8b471285262d1561feb2eb266aab6ebe7094124

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

