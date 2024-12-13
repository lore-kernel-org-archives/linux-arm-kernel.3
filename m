Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD95E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VR12zWex+ez+aRvGZ8wwwwpXAJM9owIope3ymheyt2U=; b=fforbIYF5YzpoXwIdPzGmOGl4m
	RygdKEbQFE7abQ6YwNdGi4oV6SX1swqipfSk+kh9EX1Ppk3lMJZVm0wcqC2CdG7aDLVm95WWzrSq5
	WCq03lUOKTipgh2D2OfOQEYh/osL7JCdb1D3KL5KuDirSFy6X+S7HdIMyDj35oGdnzFv2KhKejqbh
	jEPXTxbHEWK4RfpJ8B5+IJVQK83bL35Ic2o58bmfEO9xaSCKXNK2woOvlsmaN5Q3COadbw/4GvIlZ
	BajZrgNnStuR/xXWO8XcCuXsAwHZHhLsjMXZKVjdplQo9JtwmMtQuQvWgW/4pgnCZH06FyIZy+n3z
	J2Bw1hEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM17z-000000036B6-2XhK;
	Fri, 13 Dec 2024 08:34:27 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM16s-000000035uo-0uIy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 08:33:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4361a50e337so10227495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 00:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734078796; x=1734683596; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VR12zWex+ez+aRvGZ8wwwwpXAJM9owIope3ymheyt2U=;
        b=DznkMSWriN4EVhewYB9NgwByEv0JgErjRG58phv9Xg2A9T56Dn5vzz1jGXZC7vCowN
         nI0x9mGGzPt2Sx3f5/e8r9n/EKgSmAIFLR1neWbnJa3KTfy9uUciO/f/sIkiNHvSnToK
         iQf5kygCE03m2YT3hIJHNZ3Y+1933CmVrtqDm2SppGxZ8pVa14yDy+LQ7+zsy5CitWUf
         pakSTisFk/i/ISYZFweIT0Agjp0WctHQZsrlh0jUrgFMfegHxqEKv7VwtBh7JCKau8O4
         yHJyp0i/hAsR7aJ82ZB5kjUWQwSGZiu3wyCuXpXxFfGFocsC3wLKKtlBAxh+y1kbd7iF
         4gEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734078796; x=1734683596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VR12zWex+ez+aRvGZ8wwwwpXAJM9owIope3ymheyt2U=;
        b=GeQKwWl+klI7ATGbEf9+LXHgUXYNmzedpNsNTsboxhTxGCYpCWtznBhnKWp1A+28ZB
         d0tVaQ+UbKd6m+h254Kf4hfqYad8G+hDra/RWRv7cFUdd1GWm8RE+Szr52PPDEOVSS3z
         X9nm7/VQZw/9/pDYDptVREP3AV5V3uoP+pi9Si9AgLiYi3AhvcyClr915sy8vPdi7EmQ
         fQ5ivCl7121h7qMFP19hSPi7pPHuy9Mm2xPbvXoRSIk6fO8SGBZ10tGw9CxPyjq2qfMj
         jJTkN+zjLXiQ9y5q8rlMhvHxHPgTdQpcyogm9S0sgC+HBQuXVIUmXtz3HAwXymdI5aLb
         ycHA==
X-Forwarded-Encrypted: i=1; AJvYcCXOyCDmyTE6aQYKXouECkO9+NHMsjWuiieC2pmsDQIyQITwqgE412lzVBXaI5Gr9xs62Drep6+GAaw+YY42fG2a@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt7BZ9kf8uqxX/gqKOVvN77FHt0+xETmy7qTFHbZuSYZVHO7rW
	oXemEiN1e+RaRHPuNC/N7LbFbwxsyujC6sbLsJq5+p5jvyzMWdGagfPs/66rJXk=
X-Gm-Gg: ASbGncuC2QlOS93yWTUcb31LrPDkwWTF1cBz9pjUubB+Q7UqYU2rfFHWO1U4p6WDA/E
	25SOpH8S7KW+TNB5y0MmAINyN5OaokpXcmAiU5KiCWWRLe3o5G/rQIwV8NjJurnVcNZ8FXwFgGS
	9+g00dKAFEly9NRTLQBaHcLsRa6pugS8iTSiTFV2wVh/F7T3JLdyJRktwdGVnRiQbyca3VrhkEp
	P/KIBkJO341LpYo2knw5M1RQCN43r4QiQ171w09UnNVfzlAHRIc0haDRoZlzF6WuHSPvsI2gDz7
	RGKAhucSoRPxbCesLN/jE7cecQ==
X-Google-Smtp-Source: AGHT+IHU0ZjctogYXliGE2guGflksvLy5LTU0ZFE3Qm1b8MX0qqBRI6P9+kEiOFpadZ9rN6CyJVmxA==
X-Received: by 2002:a05:600c:4f13:b0:434:f5e6:4e2a with SMTP id 5b1f17b1804b1-4362aaa9830mr10104015e9.20.1734078795799;
        Fri, 13 Dec 2024 00:33:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878248f566sm6544705f8f.1.2024.12.13.00.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 00:33:15 -0800 (PST)
Message-ID: <20575689-a129-4295-80f9-0d3d9ec9d59b@rivosinc.com>
Date: Fri, 13 Dec 2024 09:33:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drivers: firmware: add riscv SSE support
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-4-cleger@rivosinc.com> <Z1vALzeks+6Fkf9/@ventana>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Z1vALzeks+6Fkf9/@ventana>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_003318_517003_1D864CE2 
X-CRM114-Status: GOOD (  23.62  )
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



On 13/12/2024 06:03, Himanshu Chauhan wrote:
> Hi Clement,
> 
> On Fri, Dec 06, 2024 at 05:30:59PM +0100, Clément Léger wrote:
>> Add driver level interface to use RISC-V SSE arch support. This interface
>> allows registering SSE handlers, and receive them. This will be used by
>> PMU and GHES driver.
>>
>> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>> Co-developed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> ---
>>  MAINTAINERS                        |  14 +
>>  drivers/firmware/Kconfig           |   1 +
>>  drivers/firmware/Makefile          |   1 +
>>  drivers/firmware/riscv/Kconfig     |  15 +
>>  drivers/firmware/riscv/Makefile    |   3 +
>>  drivers/firmware/riscv/riscv_sse.c | 691 +++++++++++++++++++++++++++++
>>  include/linux/riscv_sse.h          |  56 +++
>>  7 files changed, 781 insertions(+)
>>  create mode 100644 drivers/firmware/riscv/Kconfig
>>  create mode 100644 drivers/firmware/riscv/Makefile
>>  create mode 100644 drivers/firmware/riscv/riscv_sse.c
>>  create mode 100644 include/linux/riscv_sse.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 686109008d8e..a3ddde7fe9fb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20125,6 +20125,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>>  F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>>  F:	drivers/iommu/riscv/
>>  
>> +RISC-V FIRMWARE DRIVERS
>> +M:	Conor Dooley <conor@kernel.org>
>> +L:	linux-riscv@lists.infradead.org
>> +S:	Maintained
>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
>> +F:	drivers/firmware/riscv/*
>> +
>>  RISC-V MICROCHIP FPGA SUPPORT
>>  M:	Conor Dooley <conor.dooley@microchip.com>
>>  M:	Daire McNamara <daire.mcnamara@microchip.com>
>> @@ -20177,6 +20184,13 @@ F:	drivers/perf/riscv_pmu.c
>>  F:	drivers/perf/riscv_pmu_legacy.c
>>  F:	drivers/perf/riscv_pmu_sbi.c
>>  
>> +RISC-V SSE DRIVER
>> +M:	Clément Léger <cleger@rivosinc.com>
>> +L:	linux-riscv@lists.infradead.org
>> +S:	Maintained
>> +F:	drivers/firmware/riscv/riscv_sse.c
>> +F:	include/linux/riscv_sse.h
>> +
> 
> I request you to add me as a reviewer to these SSE files.
> Himanshu Chauhan <himanshu@thechauhan.dev>

Oh yes sure !

Thanks,

Clément

> 
> Thanks
> Regards
> Himanshu
> 
>>  RISC-V THEAD SoC SUPPORT
>>  M:	Drew Fustini <drew@pdp7.com>
>>  M:	Guo Ren <guoren@kernel.org>
>> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
>> index 71d8b26c4103..9e996a1fd511 100644
>> --- a/drivers/firmware/Kconfig
>> +++ b/drivers/firmware/Kconfig
>> @@ -267,6 +267,7 @@ source "drivers/firmware/meson/Kconfig"
>>  source "drivers/firmware/microchip/Kconfig"
>>  source "drivers/firmware/psci/Kconfig"
>>  source "drivers/firmware/qcom/Kconfig"
>> +source "drivers/firmware/riscv/Kconfig"
>>  source "drivers/firmware/smccc/Kconfig"
>>  source "drivers/firmware/tegra/Kconfig"
>>  source "drivers/firmware/xilinx/Kconfig"
>> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
>> index 7a8d486e718f..c0f5009949a8 100644
>> --- a/drivers/firmware/Makefile
>> +++ b/drivers/firmware/Makefile
>> @@ -33,6 +33,7 @@ obj-y				+= efi/
>>  obj-y				+= imx/
>>  obj-y				+= psci/
>>  obj-y				+= qcom/
>> +obj-y				+= riscv/
>>  obj-y				+= smccc/
>>  obj-y				+= tegra/
>>  obj-y				+= xilinx/
>> diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kconfig
>> new file mode 100644
>> index 000000000000..8056ed3262d9
>> --- /dev/null
>> +++ b/drivers/firmware/riscv/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menu "Risc-V Specific firmware drivers"
>> +depends on RISCV
>> +
>> +config RISCV_SSE
>> +	bool "Enable SBI Supervisor Software Events support"
>> +	depends on RISCV_SBI
>> +	default y
>> +	help
>> +	  The Supervisor Software Events support allow the SBI to deliver
>> +	  NMI-like notifications to the supervisor mode software. When enable,
>> +	  this option provides support to register callbacks on specific SSE
>> +	  events.
>> +
>> +endmenu
>> diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Makefile
>> new file mode 100644
>> index 000000000000..4ccfcbbc28ea
>> --- /dev/null
>> +++ b/drivers/firmware/riscv/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_RISCV_SSE)		+= riscv_sse.o
>> diff --git a/drivers/firmware/riscv/riscv_sse.c b/drivers/firmware/riscv/riscv_sse.c
>> new file mode 100644
>> index 000000000000..c165e32cc9a5
>> --- /dev/null
>> +++ b/drivers/firmware/riscv/riscv_sse.c
>> @@ -0,0 +1,691 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2024 Rivos Inc.
>> + */
>> +
>> +#define pr_fmt(fmt) "sse: " fmt
>> +
>> +#include <linux/cpu.h>
>> +#include <linux/cpuhotplug.h>
>> +#include <linux/cpu_pm.h>
>> +#include <linux/hardirq.h>
>> +#include <linux/list.h>
>> +#include <linux/percpu-defs.h>
>> +#include <linux/reboot.h>
>> +#include <linux/riscv_sse.h>
>> +#include <linux/slab.h>
>> +
>> +#include <asm/sbi.h>
>> +#include <asm/sse.h>
>> +
>> +struct sse_event {
>> +	struct list_head list;
>> +	u32 evt;
>> +	u32 priority;
>> +	sse_event_handler *handler;
>> +	void *handler_arg;
>> +	bool is_enabled;
>> +	/* Only valid for global events */
>> +	unsigned int cpu;
>> +
>> +	union {
>> +		struct sse_registered_event *global;
>> +		struct sse_registered_event __percpu *local;
>> +	};
>> +};
>> +
>> +static int sse_hp_state;
>> +static bool sse_available;
>> +static DEFINE_SPINLOCK(events_list_lock);
>> +static LIST_HEAD(events);
>> +static DEFINE_MUTEX(sse_mutex);
>> +
>> +struct sse_registered_event {
>> +	struct sse_event_arch_data arch;
>> +	struct sse_event *evt;
>> +	unsigned long attr_buf;
>> +};
>> +
>> +void sse_handle_event(struct sse_event_arch_data *arch_event,
>> +		      struct pt_regs *regs)
>> +{
>> +	int ret;
>> +	struct sse_registered_event *reg_evt =
>> +		container_of(arch_event, struct sse_registered_event, arch);
>> +	struct sse_event *evt = reg_evt->evt;
>> +
>> +	ret = evt->handler(evt->evt, evt->handler_arg, regs);
>> +	if (ret)
>> +		pr_warn("event %x handler failed with error %d\n", evt->evt,
>> +			ret);
>> +}
>> +
>> +static bool sse_event_is_global(u32 evt)
>> +{
>> +	return !!(evt & SBI_SSE_EVENT_GLOBAL);
>> +}
>> +
>> +static
>> +struct sse_event *sse_event_get(u32 evt)
>> +{
>> +	struct sse_event *sse_evt = NULL, *tmp;
>> +
>> +	scoped_guard(spinlock, &events_list_lock) {
>> +		list_for_each_entry(tmp, &events, list) {
>> +			if (tmp->evt == evt) {
>> +				return sse_evt;
>> +			}
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static phys_addr_t sse_event_get_phys(struct sse_registered_event *reg_evt,
>> +				      void *addr)
>> +{
>> +	phys_addr_t phys;
>> +
>> +	if (sse_event_is_global(reg_evt->evt->evt))
>> +		phys = virt_to_phys(addr);
>> +	else
>> +		phys = per_cpu_ptr_to_phys(addr);
>> +
>> +	return phys;
>> +}
>> +
>> +static int sse_sbi_event_func(struct sse_event *event, unsigned long func)
>> +{
>> +	struct sbiret ret;
>> +	u32 evt = event->evt;
>> +
>> +	ret = sbi_ecall(SBI_EXT_SSE, func, evt, 0, 0, 0, 0, 0);
>> +	if (ret.error)
>> +		pr_debug("Failed to execute func %lx, event %x, error %ld\n",
>> +			 func, evt, ret.error);
>> +
>> +	return sbi_err_map_linux_errno(ret.error);
>> +}
>> +
>> +static int sse_sbi_disable_event(struct sse_event *event)
>> +{
>> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_DISABLE);
>> +}
>> +
>> +static int sse_sbi_enable_event(struct sse_event *event)
>> +{
>> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_ENABLE);
>> +}
>> +
>> +static int sse_event_attr_get_no_lock(struct sse_registered_event *reg_evt,
>> +				      unsigned long attr_id, unsigned long *val)
>> +{
>> +	struct sbiret sret;
>> +	u32 evt = reg_evt->evt->evt;
>> +	unsigned long phys;
>> +
>> +	phys = sse_event_get_phys(reg_evt, &reg_evt->attr_buf);
>> +
>> +	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_READ, evt,
>> +				     attr_id, 1, phys, 0, 0);
>> +	if (sret.error) {
>> +		pr_debug("Failed to get event %x attr %lx, error %ld\n", evt,
>> +			 attr_id, sret.error);
>> +		return sbi_err_map_linux_errno(sret.error);
>> +	}
>> +
>> +	*val = reg_evt->attr_buf;
>> +
>> +	return 0;
>> +}
>> +
>> +static int sse_event_attr_set_nolock(struct sse_registered_event *reg_evt,
>> +				     unsigned long attr_id, unsigned long val)
>> +{
>> +	struct sbiret sret;
>> +	u32 evt = reg_evt->evt->evt;
>> +	unsigned long phys;
>> +
>> +	reg_evt->attr_buf = val;
>> +	phys = sse_event_get_phys(reg_evt, &reg_evt->attr_buf);
>> +
>> +	sret = sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_ATTR_WRITE, evt,
>> +				     attr_id, 1, phys, 0, 0);
>> +	if (sret.error && sret.error != SBI_ERR_INVALID_STATE) {
>> +		pr_debug("Failed to set event %x attr %lx, error %ld\n", evt,
>> +			 attr_id, sret.error);
>> +		return sbi_err_map_linux_errno(sret.error);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int sse_event_set_target_cpu_nolock(struct sse_event *event,
>> +					   unsigned int cpu)
>> +{
>> +	unsigned int hart_id = cpuid_to_hartid_map(cpu);
>> +	struct sse_registered_event *reg_evt = event->global;
>> +	u32 evt = event->evt;
>> +	bool was_enabled;
>> +	int ret;
>> +
>> +	if (!sse_event_is_global(evt))
>> +		return -EINVAL;
>> +
>> +	was_enabled = event->is_enabled;
>> +	if (was_enabled)
>> +		sse_sbi_disable_event(event);
>> +	do {
>> +		ret = sse_event_attr_set_nolock(reg_evt,
>> +						SBI_SSE_ATTR_PREFERRED_HART,
>> +						hart_id);
>> +	} while (ret == -EINVAL);
>> +
>> +	if (ret == 0)
>> +		event->cpu = cpu;
>> +
>> +	if (was_enabled)
>> +		sse_sbi_enable_event(event);
>> +
>> +	return 0;
>> +}
>> +
>> +int sse_event_set_target_cpu(struct sse_event *event, unsigned int cpu)
>> +{
>> +	int ret;
>> +
>> +	scoped_guard(mutex, &sse_mutex) {
>> +		cpus_read_lock();
>> +
>> +		if (!cpu_online(cpu))
>> +			return -EINVAL;
>> +
>> +		ret = sse_event_set_target_cpu_nolock(event, cpu);
>> +
>> +		cpus_read_unlock();
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int sse_event_init_registered(unsigned int cpu,
>> +				     struct sse_registered_event *reg_evt,
>> +				     struct sse_event *event)
>> +{
>> +	reg_evt->evt = event;
>> +	arch_sse_init_event(&reg_evt->arch, event->evt, cpu);
>> +
>> +	return 0;
>> +}
>> +
>> +static void sse_event_free_registered(struct sse_registered_event *reg_evt)
>> +{
>> +	arch_sse_free_event(&reg_evt->arch);
>> +}
>> +
>> +static int sse_event_alloc_global(struct sse_event *event)
>> +{
>> +	int err;
>> +	struct sse_registered_event *reg_evt;
>> +
>> +	reg_evt = kzalloc(sizeof(*reg_evt), GFP_KERNEL);
>> +	if (!reg_evt)
>> +		return -ENOMEM;
>> +
>> +	event->global = reg_evt;
>> +	err = sse_event_init_registered(smp_processor_id(), reg_evt,
>> +					event);
>> +	if (err)
>> +		kfree(reg_evt);
>> +
>> +	return err;
>> +}
>> +
>> +static int sse_event_alloc_local(struct sse_event *event)
>> +{
>> +	int err;
>> +	unsigned int cpu, err_cpu;
>> +	struct sse_registered_event *reg_evt;
>> +	struct sse_registered_event __percpu *reg_evts;
>> +
>> +	reg_evts = alloc_percpu(struct sse_registered_event);
>> +	if (!reg_evts)
>> +		return -ENOMEM;
>> +
>> +	event->local = reg_evts;
>> +
>> +	for_each_possible_cpu(cpu) {
>> +		reg_evt = per_cpu_ptr(reg_evts, cpu);
>> +		err = sse_event_init_registered(cpu, reg_evt, event);
>> +		if (err) {
>> +			err_cpu = cpu;
>> +			goto err_free_per_cpu;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +err_free_per_cpu:
>> +	for_each_possible_cpu(cpu) {
>> +		if (cpu == err_cpu)
>> +			break;
>> +		reg_evt = per_cpu_ptr(reg_evts, cpu);
>> +		sse_event_free_registered(reg_evt);
>> +	}
>> +
>> +	free_percpu(reg_evts);
>> +
>> +	return err;
>> +}
>> +
>> +static struct sse_event *sse_event_alloc(u32 evt,
>> +					 u32 priority,
>> +					 sse_event_handler *handler, void *arg)
>> +{
>> +	int err;
>> +	struct sse_event *event;
>> +
>> +	event = kzalloc(sizeof(*event), GFP_KERNEL);
>> +	if (!event)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	event->evt = evt;
>> +	event->priority = priority;
>> +	event->handler_arg = arg;
>> +	event->handler = handler;
>> +
>> +	if (sse_event_is_global(evt)) {
>> +		err = sse_event_alloc_global(event);
>> +		if (err)
>> +			goto err_alloc_reg_evt;
>> +	} else {
>> +		err = sse_event_alloc_local(event);
>> +		if (err)
>> +			goto err_alloc_reg_evt;
>> +	}
>> +
>> +	return event;
>> +
>> +err_alloc_reg_evt:
>> +	kfree(event);
>> +
>> +	return ERR_PTR(err);
>> +}
>> +
>> +static int sse_sbi_register_event(struct sse_event *event,
>> +				  struct sse_registered_event *reg_evt)
>> +{
>> +	int ret;
>> +
>> +	ret = sse_event_attr_set_nolock(reg_evt, SBI_SSE_ATTR_PRIO,
>> +					event->priority);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return arch_sse_register_event(&reg_evt->arch);
>> +}
>> +
>> +static int sse_event_register_local(struct sse_event *event)
>> +{
>> +	int ret;
>> +	struct sse_registered_event *reg_evt = per_cpu_ptr(event->local,
>> +							   smp_processor_id());
>> +
>> +	ret = sse_sbi_register_event(event, reg_evt);
>> +	if (ret)
>> +		pr_debug("Failed to register event %x: err %d\n", event->evt,
>> +			 ret);
>> +
>> +	return ret;
>> +}
>> +
>> +
>> +static int sse_sbi_unregister_event(struct sse_event *event)
>> +{
>> +	return sse_sbi_event_func(event, SBI_SSE_EVENT_UNREGISTER);
>> +}
>> +
>> +struct sse_per_cpu_evt {
>> +	struct sse_event *event;
>> +	unsigned long func;
>> +	atomic_t error;
>> +};
>> +
>> +static void sse_event_per_cpu_func(void *info)
>> +{
>> +	int ret;
>> +	struct sse_per_cpu_evt *cpu_evt = info;
>> +
>> +	if (cpu_evt->func == SBI_SSE_EVENT_REGISTER)
>> +		ret = sse_event_register_local(cpu_evt->event);
>> +	else
>> +		ret = sse_sbi_event_func(cpu_evt->event, cpu_evt->func);
>> +
>> +	if (ret)
>> +		atomic_set(&cpu_evt->error, ret);
>> +}
>> +
>> +static void sse_event_free(struct sse_event *event)
>> +{
>> +	unsigned int cpu;
>> +	struct sse_registered_event *reg_evt;
>> +
>> +	if (sse_event_is_global(event->evt)) {
>> +		sse_event_free_registered(event->global);
>> +		kfree(event->global);
>> +	} else {
>> +		for_each_possible_cpu(cpu) {
>> +			reg_evt = per_cpu_ptr(event->local, cpu);
>> +			sse_event_free_registered(reg_evt);
>> +		}
>> +		free_percpu(event->local);
>> +	}
>> +
>> +	kfree(event);
>> +}
>> +
>> +int sse_event_enable(struct sse_event *event)
>> +{
>> +	int ret = 0;
>> +	struct sse_per_cpu_evt cpu_evt;
>> +
>> +	scoped_guard(mutex, &sse_mutex) {
>> +		cpus_read_lock();
>> +		if (sse_event_is_global(event->evt)) {
>> +			ret = sse_sbi_enable_event(event);
>> +		} else {
>> +			cpu_evt.event = event;
>> +			atomic_set(&cpu_evt.error, 0);
>> +			cpu_evt.func = SBI_SSE_EVENT_ENABLE;
>> +			on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
>> +			ret = atomic_read(&cpu_evt.error);
>> +			if (ret) {
>> +				cpu_evt.func = SBI_SSE_EVENT_DISABLE;
>> +				on_each_cpu(sse_event_per_cpu_func, &cpu_evt,
>> +					    1);
>> +			}
>> +		}
>> +		cpus_read_unlock();
>> +
>> +		if (ret == 0)
>> +			event->is_enabled = true;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void sse_events_mask(void)
>> +{
>> +	sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_HART_MASK, 0, 0, 0, 0, 0, 0);
>> +}
>> +
>> +static void sse_events_unmask(void)
>> +{
>> +	sbi_ecall(SBI_EXT_SSE, SBI_SSE_EVENT_HART_UNMASK, 0, 0, 0, 0, 0, 0);
>> +}
>> +
>> +static void sse_event_disable_nolock(struct sse_event *event)
>> +{
>> +	struct sse_per_cpu_evt cpu_evt;
>> +
>> +	if (sse_event_is_global(event->evt)) {
>> +		sse_sbi_disable_event(event);
>> +	} else {
>> +		cpu_evt.event = event;
>> +		cpu_evt.func = SBI_SSE_EVENT_DISABLE;
>> +		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
>> +	}
>> +}
>> +
>> +void sse_event_disable(struct sse_event *event)
>> +{
>> +	scoped_guard(mutex, &sse_mutex) {
>> +		cpus_read_lock();
>> +		sse_event_disable_nolock(event);
>> +		event->is_enabled = false;
>> +		cpus_read_unlock();
>> +	}
>> +}
>> +
>> +struct sse_event *sse_event_register(u32 evt, u32 priority,
>> +				     sse_event_handler *handler, void *arg)
>> +{
>> +	struct sse_per_cpu_evt cpu_evt;
>> +	struct sse_event *event;
>> +	int ret = 0;
>> +
>> +	if (!sse_available)
>> +		return ERR_PTR(-EOPNOTSUPP);
>> +
>> +	mutex_lock(&sse_mutex);
>> +	if (sse_event_get(evt)) {
>> +		pr_debug("Event %x already registered\n", evt);
>> +		ret = -EEXIST;
>> +		goto out_unlock;
>> +	}
>> +
>> +	event = sse_event_alloc(evt, priority, handler, arg);
>> +	if (IS_ERR(event)) {
>> +		ret = PTR_ERR(event);
>> +		goto out_unlock;
>> +	}
>> +
>> +	cpus_read_lock();
>> +	if (sse_event_is_global(evt)) {
>> +		unsigned long preferred_hart;
>> +
>> +		ret = sse_event_attr_get_no_lock(event->global,
>> +						 SBI_SSE_ATTR_PREFERRED_HART,
>> +						 &preferred_hart);
>> +		if (ret)
>> +			goto err_event_free;
>> +		event->cpu = riscv_hartid_to_cpuid(preferred_hart);
>> +
>> +		ret = sse_sbi_register_event(event, event->global);
>> +		if (ret)
>> +			goto err_event_free;
>> +
>> +	} else {
>> +		cpu_evt.event = event;
>> +		atomic_set(&cpu_evt.error, 0);
>> +		cpu_evt.func = SBI_SSE_EVENT_REGISTER;
>> +		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
>> +		ret = atomic_read(&cpu_evt.error);
>> +		if (ret) {
>> +			cpu_evt.func = SBI_SSE_EVENT_UNREGISTER;
>> +			on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
>> +			goto err_event_free;
>> +		}
>> +	}
>> +	cpus_read_unlock();
>> +
>> +	scoped_guard(spinlock, &events_list_lock)
>> +		list_add(&event->list, &events);
>> +
>> +	mutex_unlock(&sse_mutex);
>> +
>> +	return event;
>> +
>> +err_event_free:
>> +	cpus_read_unlock();
>> +	sse_event_free(event);
>> +out_unlock:
>> +	mutex_unlock(&sse_mutex);
>> +
>> +	return ERR_PTR(ret);
>> +}
>> +
>> +static void sse_event_unregister_nolock(struct sse_event *event)
>> +{
>> +	struct sse_per_cpu_evt cpu_evt;
>> +
>> +	if (sse_event_is_global(event->evt)) {
>> +		sse_sbi_unregister_event(event);
>> +	} else {
>> +		cpu_evt.event = event;
>> +		cpu_evt.func = SBI_SSE_EVENT_UNREGISTER;
>> +		on_each_cpu(sse_event_per_cpu_func, &cpu_evt, 1);
>> +	}
>> +}
>> +
>> +void sse_event_unregister(struct sse_event *event)
>> +{
>> +	scoped_guard(mutex, &sse_mutex) {
>> +		cpus_read_lock();
>> +		sse_event_unregister_nolock(event);
>> +		cpus_read_unlock();
>> +
>> +		scoped_guard(spinlock, &events_list_lock)
>> +			list_del(&event->list);
>> +
>> +		sse_event_free(event);
>> +	}
>> +}
>> +
>> +static int sse_cpu_online(unsigned int cpu)
>> +{
>> +	struct sse_event *sse_evt;
>> +
>> +	scoped_guard(spinlock, &events_list_lock) {
>> +		list_for_each_entry(sse_evt, &events, list) {
>> +			if (sse_event_is_global(sse_evt->evt))
>> +				continue;
>> +
>> +			sse_event_register_local(sse_evt);
>> +			if (sse_evt->is_enabled)
>> +				sse_sbi_enable_event(sse_evt);
>> +		}
>> +	}
>> +
>> +	/* Ready to handle events. Unmask SSE. */
>> +	sse_events_unmask();
>> +
>> +	return 0;
>> +}
>> +
>> +static int sse_cpu_teardown(unsigned int cpu)
>> +{
>> +	unsigned int next_cpu;
>> +	struct sse_event *sse_evt;
>> +
>> +	/* Mask the sse events */
>> +	sse_events_mask();
>> +
>> +	scoped_guard(spinlock, &events_list_lock) {
>> +		list_for_each_entry(sse_evt, &events, list) {
>> +			if (!sse_event_is_global(sse_evt->evt)) {
>> +
>> +				if (sse_evt->is_enabled)
>> +					sse_sbi_disable_event(sse_evt);
>> +
>> +				sse_sbi_unregister_event(sse_evt);
>> +				continue;
>> +			}
>> +
>> +			if (sse_evt->cpu != smp_processor_id())
>> +				continue;
>> +
>> +			/* Update destination hart for global event */
>> +			next_cpu = cpumask_any_but(cpu_online_mask, cpu);
>> +			sse_event_set_target_cpu_nolock(sse_evt, next_cpu);
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static void sse_reset(void)
>> +{
>> +	struct sse_event *event = NULL;
>> +
>> +	list_for_each_entry(event, &events, list) {
>> +		sse_event_disable_nolock(event);
>> +		sse_event_unregister_nolock(event);
>> +	}
>> +}
>> +
>> +static int sse_pm_notifier(struct notifier_block *nb, unsigned long action,
>> +			   void *data)
>> +{
>> +	WARN_ON_ONCE(preemptible());
>> +
>> +	switch (action) {
>> +	case CPU_PM_ENTER:
>> +		sse_events_mask();
>> +		break;
>> +	case CPU_PM_EXIT:
>> +	case CPU_PM_ENTER_FAILED:
>> +		sse_events_unmask();
>> +		break;
>> +	default:
>> +		return NOTIFY_DONE;
>> +	}
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block sse_pm_nb = {
>> +	.notifier_call = sse_pm_notifier,
>> +};
>> +
>> +/*
>> + * Mask all CPUs and unregister all events on panic, reboot or kexec.
>> + */
>> +static int sse_reboot_notifier(struct notifier_block *nb, unsigned long action,
>> +				void *data)
>> +{
>> +	cpuhp_remove_state(sse_hp_state);
>> +
>> +	sse_reset();
>> +
>> +	return NOTIFY_OK;
>> +}
>> +
>> +static struct notifier_block sse_reboot_nb = {
>> +	.notifier_call = sse_reboot_notifier,
>> +};
>> +
>> +static int __init sse_init(void)
>> +{
>> +	int cpu, ret;
>> +
>> +	if (sbi_probe_extension(SBI_EXT_SSE) <= 0) {
>> +		pr_err("Missing SBI SSE extension\n");
>> +		return -EOPNOTSUPP;
>> +	}
>> +	pr_info("SBI SSE extension detected\n");
>> +
>> +	for_each_possible_cpu(cpu)
>> +		INIT_LIST_HEAD(&events);
>> +
>> +	ret = cpu_pm_register_notifier(&sse_pm_nb);
>> +	if (ret) {
>> +		pr_warn("Failed to register CPU PM notifier...\n");
>> +		return ret;
>> +	}
>> +
>> +	ret = register_reboot_notifier(&sse_reboot_nb);
>> +	if (ret) {
>> +		pr_warn("Failed to register reboot notifier...\n");
>> +		goto remove_cpupm;
>> +	}
>> +
>> +	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/sse:online",
>> +				sse_cpu_online, sse_cpu_teardown);
>> +	if (ret < 0)
>> +		goto remove_reboot;
>> +
>> +	sse_hp_state = ret;
>> +	sse_available = true;
>> +
>> +	return 0;
>> +
>> +remove_reboot:
>> +	unregister_reboot_notifier(&sse_reboot_nb);
>> +
>> +remove_cpupm:
>> +	cpu_pm_unregister_notifier(&sse_pm_nb);
>> +
>> +	return ret;
>> +}
>> +arch_initcall(sse_init);
>> diff --git a/include/linux/riscv_sse.h b/include/linux/riscv_sse.h
>> new file mode 100644
>> index 000000000000..c73184074b8c
>> --- /dev/null
>> +++ b/include/linux/riscv_sse.h
>> @@ -0,0 +1,56 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2024 Rivos Inc.
>> + */
>> +
>> +#ifndef __LINUX_RISCV_SSE_H
>> +#define __LINUX_RISCV_SSE_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/linkage.h>
>> +
>> +struct sse_event;
>> +struct pt_regs;
>> +
>> +typedef int (sse_event_handler)(u32 event_num, void *arg, struct pt_regs *regs);
>> +
>> +#ifdef CONFIG_RISCV_SSE
>> +
>> +struct sse_event *sse_event_register(u32 event_num, u32 priority,
>> +				     sse_event_handler *handler, void *arg);
>> +
>> +void sse_event_unregister(struct sse_event *evt);
>> +
>> +int sse_event_set_target_cpu(struct sse_event *sse_evt, unsigned int cpu);
>> +
>> +int sse_event_enable(struct sse_event *sse_evt);
>> +
>> +void sse_event_disable(struct sse_event *sse_evt);
>> +
>> +#else
>> +static inline struct sse_event *sse_event_register(u32 event_num, u32 priority,
>> +						   sse_event_handler *handler,
>> +						   void *arg)
>> +{
>> +	return ERR_PTR(-EOPNOTSUPP);
>> +}
>> +
>> +static inline void sse_event_unregister(struct sse_event *evt) {}
>> +
>> +static inline int sse_event_set_target_cpu(struct sse_event *sse_evt,
>> +					   unsigned int cpu)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static inline int sse_event_enable(struct sse_event *sse_evt)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +
>> +static inline void sse_event_disable(struct sse_event *sse_evt) {}
>> +
>> +
>> +#endif
>> +
>> +#endif /* __LINUX_RISCV_SSE_H */
>> -- 
>> 2.45.2
>>


