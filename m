Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED51E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cUhN8C5mVnF6Q6CJkf5vIACTPwUHO9uKLHC7m5cVOY0=; b=fieRU5uoHCtz+wKwjODdMt0UiL
	FHTie8Hs8KjsJihoDxfNuzpXExiBVH5kgt/YLfOFzKZvPBk1/PCWi1pdqFsdpZRQ75w7ZT3w+7qYn
	QFPCnVsfQryEAlRV5EFgjrNA5FUrZUNxfVQaeJX7aAMlnCS2RSxJlBG/5+gDc4nk33oamNBPeQcyV
	Smby8J2vFe+xIylincDwEbyIXZ4zyfjlKvBzK8TJDulHmSLTXu5zgaOirYzz8af/fGR8i9akGO5bE
	Dz/XzuQmMKX8Zu1nlaJVmngqfJMrswSewH9nsL7ve6q+GaU3ivN90SH2B/H02auCar51OF1qZLXeJ
	IG4Ye8Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWI0V-0000000GIY3-1sLP;
	Fri, 10 Jan 2025 16:37:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHmv-0000000GDts-3L61
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 16:23:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE5F9497;
	Fri, 10 Jan 2025 08:23:36 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 846453F66E;
	Fri, 10 Jan 2025 08:23:06 -0800 (PST)
Date: Fri, 10 Jan 2025 16:23:00 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, linuxarm@huawei.com,
	shameerali.kolothum.thodi@huawei.com, Jonathan.Cameron@huawei.com,
	jiangkunkun@huawei.com, yangyicong@hisilicon.com
Subject: Re: [PATCH] arm64: of: handle multiple threads in ARM cpu node
Message-ID: <Z4FJZPRg75YIUR2l@J2N7QTR9R3>
References: <20250110161057.445-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110161057.445-1-alireza.sanaee@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_082309_918897_230DB68E 
X-CRM114-Status: GOOD (  31.68  )
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

On Fri, Jan 10, 2025 at 04:10:57PM +0000, Alireza Sanaee wrote:
> Update `of_parse_and_init_cpus` to parse reg property of CPU node as
> an array based as per spec for SMT threads.
> 
> Spec v0.4 Section 3.8.1:

Which spec, and why do we care?

> The value of reg is a <prop-encoded-**array**> that defines a unique
> CPU/thread id for the CPU/threads represented by the CPU node.  **If a CPU
> supports more than one thread (i.e.  multiple streams of execution) the
> reg property is an array with 1 element per thread**.  The address-cells
> on the /cpus node specifies how many cells each element of the array
> takes. Software can determine the number of threads by dividing the size
> of reg by the parent node's address-cells.

We already have systems where each thread gets a unique CPU node under
/cpus, so we can't rely on this to determine the topology.

Further, there are bindings which rely on being able to address each
CPU/thread with a unique phandle (e.g. for affinity of PMU interrupts),
which this would break.

> An accurate example of 1 core with 2 SMTs:
> 
> 	cpus {
> 		#size-cells = <0x00>;
> 		#address-cells = <0x01>;
> 
> 		cpu@0 {
> 			phandle = <0x8000>;
> 			**reg = <0x00 0x01>;**
> 			enable-method = "psci";
> 			compatible = "arm,cortex-a57";
> 			device_type = "cpu";
> 		};
> 	};
> 
> Instead of:
> 
> 	cpus {
> 		#size-cells = <0x00>;
> 		#address-cells = <0x01>;
> 
> 		cpu@0 {
> 			phandle = <0x8000>;
> 			reg = <0x00>;
> 			enable-method = "psci";
> 			compatible = "arm,cortex-a57";
> 			device_type = "cpu";
> 		};
> 
> 		cpu@1 {
> 			phandle = <0x8001>;
> 			reg = <0x01>;
> 			enable-method = "psci";
> 			compatible = "arm,cortex-a57";
> 			device_type = "cpu";
> 		};
> 	};
> 
> which is **NOT** accurate.

It might not follow "the spec" you reference (and haven't named), but I
think it's a stretch to say it's inaccurate.

Regardless, as above I do not think this is a good idea. While it allows
the DT to be written in a marginally simpler way, it makes things more
complicated for the kernel and is incompatible with bindings that we
already support.

If anything "the spec" should be relaxed here.

Mark.

> 
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>  arch/arm64/kernel/smp.c | 74 +++++++++++++++++++++++------------------
>  1 file changed, 41 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
> index 3b3f6b56e733..8dd3b3c82967 100644
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -689,53 +689,61 @@ static void __init acpi_parse_and_init_cpus(void)
>  static void __init of_parse_and_init_cpus(void)
>  {
>  	struct device_node *dn;
> +	u64 hwid;
> +	u32 tid;
>  
>  	for_each_of_cpu_node(dn) {
> -		u64 hwid = of_get_cpu_hwid(dn, 0);
> +		tid = 0;
>  
> -		if (hwid & ~MPIDR_HWID_BITMASK)
> -			goto next;
> +		while (1) {
> +			hwid = of_get_cpu_hwid(dn, tid++);
> +			if (hwid == ~0ULL)
> +				break;
>  
> -		if (is_mpidr_duplicate(cpu_count, hwid)) {
> -			pr_err("%pOF: duplicate cpu reg properties in the DT\n",
> -				dn);
> -			goto next;
> -		}
> +			if (hwid & ~MPIDR_HWID_BITMASK)
> +				goto next;
>  
> -		/*
> -		 * The numbering scheme requires that the boot CPU
> -		 * must be assigned logical id 0. Record it so that
> -		 * the logical map built from DT is validated and can
> -		 * be used.
> -		 */
> -		if (hwid == cpu_logical_map(0)) {
> -			if (bootcpu_valid) {
> -				pr_err("%pOF: duplicate boot cpu reg property in DT\n",
> -					dn);
> +			if (is_mpidr_duplicate(cpu_count, hwid)) {
> +				pr_err("%pOF: duplicate cpu reg properties in the DT\n",
> +				       dn);
>  				goto next;
>  			}
>  
> -			bootcpu_valid = true;
> -			early_map_cpu_to_node(0, of_node_to_nid(dn));
> -
>  			/*
> -			 * cpu_logical_map has already been
> -			 * initialized and the boot cpu doesn't need
> -			 * the enable-method so continue without
> -			 * incrementing cpu.
> +			 * The numbering scheme requires that the boot CPU
> +			 * must be assigned logical id 0. Record it so that
> +			 * the logical map built from DT is validated and can
> +			 * be used.
>  			 */
> -			continue;
> -		}
> +			if (hwid == cpu_logical_map(0)) {
> +				if (bootcpu_valid) {
> +					pr_err("%pOF: duplicate boot cpu reg property in DT\n",
> +					       dn);
> +					goto next;
> +				}
> +
> +				bootcpu_valid = true;
> +				early_map_cpu_to_node(0, of_node_to_nid(dn));
> +
> +				/*
> +				 * cpu_logical_map has already been
> +				 * initialized and the boot cpu doesn't need
> +				 * the enable-method so continue without
> +				 * incrementing cpu.
> +				 */
> +				continue;
> +			}
>  
> -		if (cpu_count >= NR_CPUS)
> -			goto next;
> +			if (cpu_count >= NR_CPUS)
> +				goto next;
>  
> -		pr_debug("cpu logical map 0x%llx\n", hwid);
> -		set_cpu_logical_map(cpu_count, hwid);
> +			pr_debug("cpu logical map 0x%llx\n", hwid);
> +			set_cpu_logical_map(cpu_count, hwid);
>  
> -		early_map_cpu_to_node(cpu_count, of_node_to_nid(dn));
> +			early_map_cpu_to_node(cpu_count, of_node_to_nid(dn));
>  next:
> -		cpu_count++;
> +			cpu_count++;
> +		}
>  	}
>  }
>  
> -- 
> 2.43.0
> 
> 

