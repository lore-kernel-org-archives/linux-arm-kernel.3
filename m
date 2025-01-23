Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CE9C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 10:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zbLSIIHNmc2/5paJ/T+ROepXjbQg9K+2rkqB7ZoIh4=; b=32ITXiLg8xszx7pE4RJiX3sxRx
	ucq/j/3Mh4Bi2oxZU3WXUdJscVhfrWFERPxFPvqZPnmokj9XoWoRGxAz4h1j7ByRMsEA/JqWFkXvv
	b7aTDHkqhLV8zx86UE3dDKwhHptDt799+ZPWblNTr6U6qETQ79ziXgW8SKtq/MPwDry6AuFr7WDgs
	48M7hsgyw2kf/ifeeYCVOSwfZgBii2TD3t1Gm2a9ca/nlzmrpx2Lzp2k0xSyHJZu3HAFh+omwnTQN
	DRDM5IajSMptv9NiAqpWcyIUutCXsX6ZnfA3XJWZ/Xl2A4vHQKruT2lGfxVQ5ohS89+tmFDa4IouT
	WFyNUgBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tauqU-0000000CGDx-3W0u;
	Thu, 23 Jan 2025 10:53:58 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taupC-0000000CG6m-3kyZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 10:52:40 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-385deda28b3so482455f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 02:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1737629557; x=1738234357; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2zbLSIIHNmc2/5paJ/T+ROepXjbQg9K+2rkqB7ZoIh4=;
        b=JVFIVaX2bbUTZnc6IKZPXTpFkynls4OsD0g21d4bYyqLkBND1ezDO4fUW35Jn1DxyW
         C7v6sJmGwPpt2zv8xKRVfusCjuAAVtvuexLlsx5Z84uPpzTfXgKy0H8KBx5jEiMLJ9xd
         mnalWETCfseXkkqUyN1MbhLrRYBb7qlcsarGLfIw9xFO1oy0tqVergHs8BiVgYJUyQ9m
         TRDwkJHtpHmXAirUC42AiIAIYufxR0WxOLC1i6ySwKF4bS61kpTbFQFDYiny/iw4gmlY
         fzfE7zkKIevRDsaLVxVh6xn3unova/AycUMBlBRz9zie0yU9NHaeMxpxUfPVjGKfJNKf
         9p8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737629557; x=1738234357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2zbLSIIHNmc2/5paJ/T+ROepXjbQg9K+2rkqB7ZoIh4=;
        b=OjoN3jUkQ5E4wOD+iFu5bY5Un7FGEccFjsi4nw0bjZ0gXh2OycRLBc/lYVN+OomZdm
         /5ubY+Y+7sWT4lbt63t/v/u8FU5cObIfiQeuV/SIx1P8N7mVxmi87KiXLP/qDMYPdI8W
         ZLSuWW/5LPkadHyasfvtbs65UWZEd3V6Pg5cQz/XX+1GBvP9JeZlzUT8Sf50PA4Xfvra
         fcVQijlqauiZ/sIckXOh4DTeimsXgQ74AIK6Stzp/X4lVFgkea2koGWKsHcbzKB4YaK3
         cg4/7srEl6logUg3blxmlktFBMhsYX2Z/EpZ1EDeB1VpCp2Ou4ziP2nwWIHsVBS0nxPR
         hUfg==
X-Forwarded-Encrypted: i=1; AJvYcCU4qe4qC5QPDDLqgs5CY70LA7ft+6C5WJYtKs1Sf2XofCDl2BBkcXwmzU/ryEiUDE6QB4FeYW833YfsPtJ8sh0n@lists.infradead.org
X-Gm-Message-State: AOJu0YxqDyOwa9z9XxN+PAT9QaeKOxyhuPLpB3+ymNOWmrrE8S5ISz0X
	L4ihExFYVijtAxzbu5kU1/Z7PBJiXqKKBFmIWQQeQcLDGHbS+9XpdmEPrpk4toI=
X-Gm-Gg: ASbGncvSYv4e0N+dgAHqZiWWHyyHmNYaFkR/NRA3jIX99BQuFMUAsynxfOBLFhYZBkX
	Aa2NhBRnPuaTRbdwKTWPiFSOxeKkwsem+KxOpSEhe9E7N0NWdAKar/xe/Deg4mJkl9M8Vqerbe8
	eyp/naSHhUt3UmEMgPpBH/UesP/3PyxHgfhkq1WlQpXC+FhWNLeJjcZ/hJ6ILr4IpsB+F+aTABI
	jSeHk+UFQDCZSwCp0CdgyIK/to9eByRpHaDfrKUHargGbGjba0zATeNiMxqVhINzuKIK0Cba2rU
	JrvLepGfEmwyioIzy09OyUDQdGahCcIXGeMFqZgiE68W0dAZmQ==
X-Google-Smtp-Source: AGHT+IGqZEsD0TF/f/2jU/5SeErgTpFPsogfxqzzGyFVzZgDVagpZdH+5pphNBPOVll5P80YafO2QA==
X-Received: by 2002:a5d:59ab:0:b0:38a:9c1b:df5c with SMTP id ffacd0b85a97d-38bf57bfdd8mr23163787f8f.50.1737629556993;
        Thu, 23 Jan 2025 02:52:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf322aa0asm19184557f8f.50.2025.01.23.02.52.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:52:36 -0800 (PST)
Message-ID: <ae912564-60b7-4733-ab46-15fbba16ed94@rivosinc.com>
Date: Thu, 23 Jan 2025 11:52:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] drivers: firmware: add riscv SSE support
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>
References: <20241206163102.843505-1-cleger@rivosinc.com>
 <20241206163102.843505-4-cleger@rivosinc.com>
 <20250116-boxy-handoff-2f2790b5388e@spud>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250116-boxy-handoff-2f2790b5388e@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_025238_936475_D7782A94 
X-CRM114-Status: GOOD (  28.96  )
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



On 16/01/2025 14:58, Conor Dooley wrote:
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
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> (got some, mostly minor, comments below)
> 
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
> 
> Is it possible to get here with a null handler? Or will !registered
> events not lead to the handler getting called?

Hi Conor,

Basically yes, if we receive an event, it means it was registered and
enabled. Since when we register an event, we associate it with an
handler, it can not be NULL.

> 
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
> 
> nit: Could you shift this into one line?

Yeah sure.

> 
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
> 
> Why's this only at a debug level?

That's only really meaningful for debugging, this error is often
reported to the upper level and ends up to the final caller. I don't
think we should be too verbose for such drivers, but rather propagate
the error. If one wants to debug, then, just enable DEBUG.

But that's only my opinion, if you'd prefer all pr_debug to be either
removed or changed to pr_err(), I'll do it.

> 
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
> 
> Why's the invalid state error not treated as an error?

Nice catch. That's a leftover of a previous implementation. That needs
to be removed.

> 
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
> 
> Same here I guess, why's a registration failure only a debug print?

Same reason than before, this should be used for debug purposes.

> 
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
> 
> nit: this should fit on one line, no?

the trailing ; is above 80 characters. But if you are ok with 100 char,
I can go for it.

Thanks !

Clément

> 
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
> 
>> 2.45.2
>>


