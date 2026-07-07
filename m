Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051B4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:In-Reply-To:
	Mime-Version:Cc:Content-Type:From:References:Date:Subject:To:
	Content-Transfer-Encoding:Reply-To:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=khtBI9vvcocUFT3RIs3nuQxcI7AYB07xM0J6QTM+nSs=; b=UR2Fir5JHTW91q/gYlbA7xjgHU
	t9TbSiIEMq703LZInft2cPjAltuvgiAYEu5f+2bhc/w6fvPEaMSwzbrgjmwAtVr2Xrdo5LK7jCECa
	AFvEnPdbhgk4GYCQC6r78jzh8xE+CiNbiU4hqhH0kQTW1tDgrFTpSfcZLyK7lSySx5g5QbYeQ9vUP
	W5UUYwowcDhk1YrrZ8bw/hCjRynMQE/eqYpi/2QyOeW8+cd4wMGwURxFomBvYd64yWM/zJQVQ59yH
	h7iJ5rjeB0mXooGwR3/lNQR8YLvIg7TY4RYyhm/EtUe06vYSy497IEOieA68AhnDaWQe80olxyPMD
	Dj6C2yog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Uj-0000000ELgf-3ylm;
	Tue, 07 Jul 2026 07:45:29 +0000
Received: from va-2-16.ptr.blmpb.com ([209.127.231.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Ue-0000000ELex-3iB6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:45:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1783410315; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=khtBI9vvcocUFT3RIs3nuQxcI7AYB07xM0J6QTM+nSs=;
 b=DiBENkEB/nHVMY3VhsTt9ws6lB0tygp1A7/l0vmFLlOb5yTKqRN7qGPqEPl6Kae/wtlkEK
 1Ofwds7w++gtlsb3dE7yHhLzeEh+myv67P75N1gDB+A/KOquSFS8+P3zXGolOcuwtrrYp0
 JMjj9Y9RtPhwXi9cGOUmlxceAxujpq0nQVy7K5SZXBGm+cURHcVte5M++6xN81ZLLl2nr9
 ajduU6g6ZC76qYYDtSSuNxgC+V4jBTilSMiNDbo6j1s/WMa2wwh8AuRTDAsvpYt3mNCwdb
 etKGkVxBBzUuzg91+eh8h3VKeGQ/hO6dD+oFssVsjyCr3xrIrnepU8eyIlSNOw==
Content-Transfer-Encoding: 7bit
To: "Atish Patra" <atish.patra@linux.dev>
Subject: Re: [PATCH v8 12/22] RISC-V: perf: Modify the counter discovery mechanism
Date: Tue, 7 Jul 2026 15:45:10 +0800
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com> <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
Content-Language: en-US
X-Lms-Return-Path: <lba+26a4cae89+09963d+lists.infradead.org+yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
Received: from [100.86.219.172] ([58.250.106.115]) by smtp.feishu.cn with ESMTPS; Tue, 07 Jul 2026 15:45:12 +0800
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Cc: "Jiri Olsa" <jolsa@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, 
	"Mark Rutland" <mark.rutland@arm.com>, "Rob Herring" <robh@kernel.org>, 
	"Anup Patel" <anup@brainfault.org>, "Namhyung Kim" <namhyung@kernel.org>, 
	"Arnaldo Carvalho de Melo" <acme@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Ian Rogers" <irogers@google.com>, "Will Deacon" <will@kernel.org>, 
	"James Clark" <james.clark@linaro.org>, <yang.yicong@picoheart.com>, 
	<linux-arm-kernel@lists.infradead.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<devicetree@vger.kernel.org>, <linux-perf-users@vger.kernel.org>, 
	"Conor Dooley" <conor@kernel.org>
Mime-Version: 1.0
In-Reply-To: <20260701-counter_delegation-v8-12-7909f863a645@meta.com>
Message-Id: <90c1a299-617d-4b6d-8aa7-b776cb7c0c46@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004525_128008_006F2A25 
X-CRM114-Status: GOOD (  39.53  )
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

On 7/1/26 4:47 PM, Atish Patra wrote:
> From: Atish Patra <atishp@rivosinc.com>
> 
> If both counter delegation and SBI PMU is present, the counter
> delegation will be used for hardware pmu counters while the SBI PMU
> will be used for firmware counters. Thus, the driver has to probe
> the counters info via SBI PMU to distinguish the firmware counters.
> 
> The hybrid scheme also requires improvements of the informational
> logging messages to indicate the user about underlying interface
> used for each use case.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_sbi.c | 139 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 104 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
> index 74d934238821..c20f1e33c65d 100644
> --- a/drivers/perf/riscv_pmu_sbi.c
> +++ b/drivers/perf/riscv_pmu_sbi.c
> @@ -67,6 +67,20 @@ static bool sbi_v3_available;
>  static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
>  #define sbi_pmu_snapshot_available() \
>  	static_branch_unlikely(&sbi_pmu_snapshot_available)
> +static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
> +static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
> +
> +/* Avoid unnecessary code patching in the one time booting path*/
> +#define riscv_pmu_cdeleg_available_boot() \
> +	static_key_enabled(&riscv_pmu_cdeleg_available)
> +#define riscv_pmu_sbi_available_boot() \
> +	static_key_enabled(&riscv_pmu_sbi_available)
> +
> +/* Perform a runtime code patching with static key */
> +#define riscv_pmu_cdeleg_available() \
> +	static_branch_unlikely(&riscv_pmu_cdeleg_available)
> +#define riscv_pmu_sbi_available() \
> +		static_branch_likely(&riscv_pmu_sbi_available)
>  
>  static struct attribute *riscv_arch_formats_attr[] = {
>  	&format_attr_event.attr,
> @@ -89,7 +103,8 @@ static int sysctl_perf_user_access __read_mostly = SYSCTL_USER_ACCESS;
>  
>  /*
>   * This structure is SBI specific but counter delegation also require counter
> - * width, csr mapping. Reuse it for now.
> + * width, csr mapping. Reuse it for now we can have firmware counters for
> + * platfroms with counter delegation support.
>   * RISC-V doesn't have heterogeneous harts yet. This need to be part of
>   * per_cpu in case of harts with different pmu counters
>   */
> @@ -101,6 +116,8 @@ static unsigned int riscv_pmu_irq;
>  
>  /* Cache the available counters in a bitmask */
>  static unsigned long cmask;
> +/* Cache the available firmware counters in another bitmask */
> +static unsigned long firmware_cmask;
>  
>  static int sbi_pmu_event_find_cache(u64 config);
>  struct sbi_pmu_event_data {
> @@ -868,34 +885,38 @@ static int rvpmu_sbi_find_num_ctrs(void)
>  		return sbi_err_map_linux_errno(ret.error);
>  }
>  
> -static int rvpmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
> +static u32 rvpmu_deleg_find_ctrs(void)
> +{
> +	/* TODO */
> +	return 0;
> +}
> +
> +static int rvpmu_sbi_get_ctrinfo(u32 nsbi_ctr, u32 *num_fw_ctr, u32 *num_hw_ctr)
>  {
>  	struct sbiret ret;
> -	int i, num_hw_ctr = 0, num_fw_ctr = 0;
> +	int i;
>  	union sbi_pmu_ctr_info cinfo;
>  
> -	pmu_ctr_list = kzalloc_objs(*pmu_ctr_list, nctr);
> -	if (!pmu_ctr_list)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < nctr; i++) {
> +	for (i = 0; i < nsbi_ctr; i++) {
>  		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
>  		if (ret.error)
>  			/* The logical counter ids are not expected to be contiguous */
>  			continue;
>  
> -		*mask |= BIT(i);
> -
>  		cinfo.value = ret.value;
> -		if (cinfo.type == SBI_PMU_CTR_TYPE_FW)
> -			num_fw_ctr++;
> -		else
> -			num_hw_ctr++;
> -		pmu_ctr_list[i].value = cinfo.value;
> +		if (cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +			/* Track firmware counters in a different mask */
> +			firmware_cmask |= BIT(i);
> +			pmu_ctr_list[i].value = cinfo.value;

could this override the counter info initialized by rvpmu_deleg_find_ctrs()? 
the initialization from counter delegation performs prior to sbi, should we
check first here?

> +			*num_fw_ctr = *num_fw_ctr + 1;
> +		} else if (cinfo.type == SBI_PMU_CTR_TYPE_HW &&
> +			   !riscv_pmu_cdeleg_available_boot()) {
> +			*num_hw_ctr = *num_hw_ctr + 1;
> +			cmask |= BIT(i);
> +			pmu_ctr_list[i].value = cinfo.value;
> +		}
>  	}
>  
> -	pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num_hw_ctr);
> -
>  	return 0;
>  }
>  
> @@ -906,7 +927,7 @@ static inline void rvpmu_sbi_stop_all(struct riscv_pmu *pmu)
>  	 * which may include counters that are not enabled yet.
>  	 */
>  	sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_STOP,
> -		  0, pmu->cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
> +		  0, pmu->cmask | firmware_cmask, SBI_PMU_STOP_FLAG_RESET, 0, 0, 0);
>  }
>  
>  static inline void rvpmu_sbi_stop_hw_ctrs(struct riscv_pmu *pmu)
> @@ -1159,16 +1180,48 @@ static void rvpmu_ctr_stop(struct perf_event *event, unsigned long flag)
>  	/* TODO: Counter delegation implementation */
>  }
>  
> -static int rvpmu_find_num_ctrs(void)
> +static int rvpmu_find_ctrs(void)
>  {
> -	return rvpmu_sbi_find_num_ctrs();
> -	/* TODO: Counter delegation implementation */
> -}
> +	int num_sbi_counters = 0;
> +	u32 num_deleg_counters = 0;
> +	u32 num_hw_ctr = 0, num_fw_ctr = 0, num_ctr = 0;
> +	/*
> +	 * We don't know how many firmware counters are available. Just allocate
> +	 * for maximum counters the driver can support. The default is 64 anyways.
> +	 */
> +	pmu_ctr_list = kcalloc(RISCV_MAX_COUNTERS, sizeof(*pmu_ctr_list),
> +			       GFP_KERNEL);
> +	if (!pmu_ctr_list)
> +		return -ENOMEM;
>  
> -static int rvpmu_get_ctrinfo(int nctr, unsigned long *mask)
> -{
> -	return rvpmu_sbi_get_ctrinfo(nctr, mask);
> -	/* TODO: Counter delegation implementation */
> +	if (riscv_pmu_cdeleg_available_boot())
> +		num_deleg_counters = rvpmu_deleg_find_ctrs();
> +
> +	/* This is required for firmware counters even if the above is true */

does counter delegation depend on SBI PMU? may need further explanation here,
not sure if it's a rule from the spec or if it's the driver's policy.

> +	if (riscv_pmu_sbi_available_boot()) {
> +		num_sbi_counters = rvpmu_sbi_find_num_ctrs();
> +		if (num_sbi_counters < 0) {
> +			kfree(pmu_ctr_list);
> +			pmu_ctr_list = NULL;
> +			return num_sbi_counters;
> +		}
> +		if (num_sbi_counters > RISCV_MAX_COUNTERS)
> +			num_sbi_counters = RISCV_MAX_COUNTERS;
> +	}
> +
> +	/* cache all the information about counters now */
> +	if (riscv_pmu_sbi_available_boot())
> +		rvpmu_sbi_get_ctrinfo(num_sbi_counters, &num_fw_ctr, &num_hw_ctr);
> +
> +	if (riscv_pmu_cdeleg_available_boot()) {
> +		pr_info("%u firmware and %u hardware counters\n", num_fw_ctr, num_deleg_counters);
> +		num_ctr = num_fw_ctr + num_deleg_counters;
> +	} else {
> +		pr_info("%u firmware and %u hardware counters\n", num_fw_ctr, num_hw_ctr);
> +		num_ctr = num_sbi_counters;
> +	}
> +
> +	return num_ctr;
>  }
>  
>  static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
> @@ -1478,12 +1531,21 @@ static int rvpmu_device_probe(struct platform_device *pdev)
>  	int num_counters;
>  	bool irq_requested = false;
>  
> -	pr_info("SBI PMU extension is available\n");
> +	if (riscv_pmu_cdeleg_available_boot()) {
> +		pr_info("hpmcounters will use the counter delegation ISA extension\n");
> +		if (riscv_pmu_sbi_available_boot())
> +			pr_info("Firmware counters will use SBI PMU extension\n");
> +		else
> +			pr_info("Firmware counters will not be available as SBI PMU extension is not present\n");
> +	} else if (riscv_pmu_sbi_available_boot()) {
> +		pr_info("Both hpmcounters and firmware counters will use SBI PMU extension\n");
> +	}
> +
>  	pmu = riscv_pmu_alloc();
>  	if (!pmu)
>  		return -ENOMEM;
>  
> -	num_counters = rvpmu_find_num_ctrs();
> +	num_counters = rvpmu_find_ctrs();
>  	if (num_counters < 0) {
>  		pr_err("SBI PMU extension doesn't provide any counters\n");
>  		goto out_free;
> @@ -1495,9 +1557,6 @@ static int rvpmu_device_probe(struct platform_device *pdev)
>  		pr_info("SBI returned more than maximum number of counters. Limiting the number of counters to %d\n", num_counters);
>  	}
>  
> -	/* cache all the information about counters now */
> -	if (rvpmu_get_ctrinfo(num_counters, &cmask))
> -		goto out_free;
>  
>  	ret = rvpmu_setup_irqs(pmu, pdev);
>  	if (ret < 0) {
> @@ -1599,13 +1658,23 @@ static int __init rvpmu_devinit(void)
>  	int ret;
>  	struct platform_device *pdev;
>  
> -	if (sbi_spec_version < sbi_mk_version(0, 3) ||
> -	    !sbi_probe_extension(SBI_EXT_PMU)) {
> -		return 0;
> -	}
> +	if (sbi_spec_version >= sbi_mk_version(0, 3) &&
> +	    sbi_probe_extension(SBI_EXT_PMU))
> +		static_branch_enable(&riscv_pmu_sbi_available);
>  
>  	if (sbi_spec_version >= sbi_mk_version(2, 0))
>  		sbi_v2_available = true;
> +	/*
> +	 * We need all three extensions to be present to access the counters
> +	 * in S-mode via Supervisor Counter delegation.
> +	 */
> +	if (riscv_isa_extension_available(NULL, SSCCFG) &&
> +	    riscv_isa_extension_available(NULL, SMCDELEG) &&
> +	    riscv_isa_extension_available(NULL, SSCSRIND))
> +		static_branch_enable(&riscv_pmu_cdeleg_available);

Ssccfg is the necessary extension needed here, is it possible to handle the
dependencies in cpufeatures.c so we can only check the Ssccfg here? (I see
we've already made Ssccfg to depend on Smcdeleg there)

> +
> +	if (!(riscv_pmu_sbi_available_boot() || riscv_pmu_cdeleg_available_boot()))
> +		return 0;
>  
>  	if (sbi_spec_version >= sbi_mk_version(3, 0))
>  		sbi_v3_available = true;
> 

this should stay with the SBI PMU probe block above.

Thanks.

