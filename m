Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025CDCCA470
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 06:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TSKdaizxrwGwWb0mgdmG0HgstCpMtkvbzpGWk45LP3M=; b=EJS5krgIfThmj/gbx1ZsT4WnRR
	ikI46VWXOFi/ejRdsC2ALoZl0tzBgFzN47XAoKpV/QhKE7f5MxzE1aW5Y+dyDrOheDZgEjxTULxB7
	UgsPYwvGDpJQ72ZKc/INpHI4d92zHmAOIGMStMv4i3bNfgPfRyBmUD2Fi/k1iyyPz1myXx9mC3MQt
	T7nciR9NNn4Jeswe8h6iDHuSyfOKpCwFuaWCeufdh8fq6jTZkHiAGCy56kXgw9bHXiJ1m+SiKqO3A
	mZ4KisF7Srb3pQe+PZdKr803qjVanwhL+LsKz7rrLN34+XfmyoEa7aexpycjH8bA+gs07qBZTAJaE
	EDOoSLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5eww-0000000H2Dd-2dMW;
	Mon, 06 Oct 2025 06:43:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5ewt-0000000H2Cs-1FTo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 06:43:57 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so51295555e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Oct 2025 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1759733033; x=1760337833; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TSKdaizxrwGwWb0mgdmG0HgstCpMtkvbzpGWk45LP3M=;
        b=TcgWWmcd8pk3OM7HphxqUVYw1Ty8+mulz559bhVPKlBlYWSbV0pHlvVIH+9rlBIK3+
         FEDaXxbXbuMdpBNc0gtydre8FVRQyEJCGQALywLxmEqZSGMpgZaoew3ni7eHqgYKDMqy
         r1sc3OaUtWK5KhHysJ5JRVVPbDZSWnwuwpave+2iX3IlWMPy81VO8N3rjbKyO8nzNDbL
         VzmWO38CYGkIGUVyWEcFyWxrL2nL/Di7n5VPsv2iw2/qYrKxTzp0G/7O5qV6F75uZ9nn
         mCkcNAEAAGNSM3CwupobdCbqkHogRYALK7CgIK8/BfzYNaE3iIOI6FUQBM2yXOhNBfuI
         DlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759733033; x=1760337833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TSKdaizxrwGwWb0mgdmG0HgstCpMtkvbzpGWk45LP3M=;
        b=eRX9cJ11jJPgt6p3yMCfp0QjdsoQUjICpjuNjNBMBiyRpzt/C0+ptTFcXATprv0MoZ
         w4lsUbkUGGogZ9Ql5F5b4n4RpppcdwSOOxwqH8Ezn1exJY2YarckYsgDaIqVga+3Mhz1
         BeaUic76T9JcCkccoYAAkJXPJLrm1edLp3buYcvzwsTk4zMISO6xS9TWFDfixM0jzEoM
         6BTGAZ/RCTqFCXNULXQG2L8nVYRqmrdvAyeS/J2vkcMiGk+5WdSRxnQ2jF+4/iwQtRZl
         XZ/dFetgf/GjH06qVlMq+JvB17IEyeHMCPNYuAkI7QSffq3g3UvR6mbMEQFGTxL7T++5
         uQhw==
X-Forwarded-Encrypted: i=1; AJvYcCVTyzaB/L33Kvo4np2n2bhQOfY3jwyATDGrNOBUMIbwQUsVEWTTSPaUdShJ+Tmx3gvHA+vPG8o4BHZJHJ+0qKD1@lists.infradead.org
X-Gm-Message-State: AOJu0YyVCQrAxpdMhs7J+A2UKSVjJg2S8XFPQZfCh/QZnCbULqiadMYy
	U0nqRCZPk2X8Z/rm3fI/x1I6sukdkCiaMEzqOkQIwYoV8wNxXCeZn6JmGwESCG9Snrg=
X-Gm-Gg: ASbGncsvt97lLDp78pOyaXeSjz9XZJzZQsxJDZJH32NzeYXzeku/uAu4MwrjJq0y4k2
	O0IVHgx3yqNXVFVqITGrb+Ebl6UG2nrwEf6JeMKXsVtB+T66fhjy7zf52AsioL9/56q0iklAj1g
	T2rUuoyUiiwvDT31jXnUzO/D0EdZfw4l5YMfW4F6xRXrqxuAXuHAgAvKsNNgsgv7kxGj3fNTwsQ
	glN9MJPm2PTTE2HXWI/uW0TR0qo/V/Dj/tTDO+HpYzkD74cZqK/K1Y8IsvedZFeYpN7m4KskVUV
	bpDkw8lt0r7GPp/2O7VkDRwTeNFL6gz++se9NPwUmi9M6eU2JmbamOxNBH7gcNjfLGexYUc7dyz
	nbJrvKSLpjza80P9TchRIW17GpFu0TqBt0Jb4s/9w16lFTO9bOq+/28n3CNtPiW+nkMqI7ITZBk
	6g0R9+vODHOmaT8ls=
X-Google-Smtp-Source: AGHT+IHHPocl07TDjCmmnnWB338xsYMRj+F6fDeyS7IBZh5D64Aw6QpHDiyk/ffxyRjyi2YE9I+aMQ==
X-Received: by 2002:a05:600c:1987:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-46e71146083mr71143455e9.26.1759733032715;
        Sun, 05 Oct 2025 23:43:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a4161bsm253473805e9.16.2025.10.05.23.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Oct 2025 23:43:51 -0700 (PDT)
Message-ID: <f42de04a-f6ed-475f-8e49-c7fad5c2d5b9@rivosinc.com>
Date: Mon, 6 Oct 2025 08:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/5] drivers: firmware: add riscv SSE support
To: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Himanshu Chauhan <hchauhan@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Xu Lu <luxu.kernel@bytedance.com>,
 Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Yunhui Cui <cuiyunhui@bytedance.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250908181717.1997461-1-cleger@rivosinc.com>
 <20250908181717.1997461-4-cleger@rivosinc.com>
 <CAAhSdy3fwEZ+SQ3Cgc=GbisshRVQsvUPv23kzDFDd45ic=GObg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAAhSdy3fwEZ+SQ3Cgc=GbisshRVQsvUPv23kzDFDd45ic=GObg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251005_234355_526429_D1CA0CF8 
X-CRM114-Status: GOOD (  20.74  )
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



On 06/10/2025 07:38, Anup Patel wrote:
> On Mon, Sep 8, 2025 at 11:50 PM Clément Léger <cleger@rivosinc.com> wrote:
>>
>> Add driver level interface to use RISC-V SSE arch support. This interface
>> allows registering SSE handlers, and receive them. This will be used by
>> PMU and GHES driver.
>>
>> Co-developed-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
>> Signed-off-by: Clément Léger <cleger@rivosinc.com>
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  MAINTAINERS                            |  15 +
>>  drivers/firmware/Kconfig               |   1 +
>>  drivers/firmware/Makefile              |   1 +
>>  drivers/firmware/riscv/Kconfig         |  15 +
>>  drivers/firmware/riscv/Makefile        |   3 +
>>  drivers/firmware/riscv/riscv_sbi_sse.c | 701 +++++++++++++++++++++++++
>>  include/linux/riscv_sbi_sse.h          |  57 ++
>>  7 files changed, 793 insertions(+)
>>  create mode 100644 drivers/firmware/riscv/Kconfig
>>  create mode 100644 drivers/firmware/riscv/Makefile
>>  create mode 100644 drivers/firmware/riscv/riscv_sbi_sse.c
>>  create mode 100644 include/linux/riscv_sbi_sse.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fe168477caa4..684d23f852c3 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -21648,6 +21648,13 @@ T:     git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
>>  F:     Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
>>  F:     drivers/iommu/riscv/
>>
>> +RISC-V FIRMWARE DRIVERS
>> +M:     Conor Dooley <conor@kernel.org>
>> +L:     linux-riscv@lists.infradead.org
>> +S:     Maintained
>> +T:     git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
>> +F:     drivers/firmware/riscv/*
>> +
>>  RISC-V MICROCHIP FPGA SUPPORT
>>  M:     Conor Dooley <conor.dooley@microchip.com>
>>  M:     Daire McNamara <daire.mcnamara@microchip.com>
>> @@ -21712,6 +21719,14 @@ F:     arch/riscv/boot/dts/spacemit/
>>  N:     spacemit
>>  K:     spacemit
>>
>> +RISC-V SSE DRIVER
>> +M:     Clément Léger <cleger@rivosinc.com>
>> +R:     Himanshu Chauhan <himanshu@thechauhan.dev>
>> +L:     linux-riscv@lists.infradead.org
>> +S:     Maintained
>> +F:     drivers/firmware/riscv/riscv_sse.c
>> +F:     include/linux/riscv_sse.h
>> +
>>  RISC-V THEAD SoC SUPPORT
>>  M:     Drew Fustini <fustini@kernel.org>
>>  M:     Guo Ren <guoren@kernel.org>
>> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
>> index bbd2155d8483..1894df87b08e 100644
>> --- a/drivers/firmware/Kconfig
>> +++ b/drivers/firmware/Kconfig
>> @@ -294,6 +294,7 @@ source "drivers/firmware/meson/Kconfig"
>>  source "drivers/firmware/microchip/Kconfig"
>>  source "drivers/firmware/psci/Kconfig"
>>  source "drivers/firmware/qcom/Kconfig"
>> +source "drivers/firmware/riscv/Kconfig"
>>  source "drivers/firmware/samsung/Kconfig"
>>  source "drivers/firmware/smccc/Kconfig"
>>  source "drivers/firmware/tegra/Kconfig"
>> diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
>> index 4ddec2820c96..6cdd84570ea7 100644
>> --- a/drivers/firmware/Makefile
>> +++ b/drivers/firmware/Makefile
>> @@ -34,6 +34,7 @@ obj-y                         += efi/
>>  obj-y                          += imx/
>>  obj-y                          += psci/
>>  obj-y                          += qcom/
>> +obj-y                          += riscv/
>>  obj-y                          += samsung/
>>  obj-y                          += smccc/
>>  obj-y                          += tegra/
>> diff --git a/drivers/firmware/riscv/Kconfig b/drivers/firmware/riscv/Kconfig
>> new file mode 100644
>> index 000000000000..ed5b663ac5f9
>> --- /dev/null
>> +++ b/drivers/firmware/riscv/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +menu "Risc-V Specific firmware drivers"
>> +depends on RISCV
>> +
>> +config RISCV_SBI_SSE
>> +       bool "Enable SBI Supervisor Software Events support"
>> +       depends on RISCV_SBI
>> +       default y
>> +       help
>> +         The Supervisor Software Events support allows the SBI to deliver
>> +         NMI-like notifications to the supervisor mode software. When enabled,
>> +         this option provides support to register callbacks on specific SSE
>> +         events.
>> +
>> +endmenu
>> diff --git a/drivers/firmware/riscv/Makefile b/drivers/firmware/riscv/Makefile
>> new file mode 100644
>> index 000000000000..c8795d4bbb2e
>> --- /dev/null
>> +++ b/drivers/firmware/riscv/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +obj-$(CONFIG_RISCV_SBI_SSE)            += riscv_sbi_sse.o
>> diff --git a/drivers/firmware/riscv/riscv_sbi_sse.c b/drivers/firmware/riscv/riscv_sbi_sse.c
>> new file mode 100644
>> index 000000000000..57b6dad92482
>> --- /dev/null
>> +++ b/drivers/firmware/riscv/riscv_sbi_sse.c
>> @@ -0,0 +1,701 @@
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
>> +#include <linux/riscv_sbi_sse.h>
>> +#include <linux/slab.h>
>> +
>> +#include <asm/sbi.h>
>> +#include <asm/sse.h>
>> +
>> +struct sse_event {
>> +       struct list_head list;
>> +       u32 evt_id;
>> +       u32 priority;
>> +       sse_event_handler_fn *handler;
>> +       void *handler_arg;
>> +       /* Only valid for global events */
>> +       unsigned int cpu;
>> +
>> +       union {
>> +               struct sse_registered_event *global;
>> +               struct sse_registered_event __percpu *local;
>> +       };
>> +};
>> +
>> +static int sse_hp_state;
>> +static bool sse_available __ro_after_init;
>> +static DEFINE_SPINLOCK(events_list_lock);
>> +static LIST_HEAD(events);
>> +static DEFINE_MUTEX(sse_mutex);
>> +
>> +struct sse_registered_event {
>> +       struct sse_event_arch_data arch;
>> +       struct sse_event *event;
>> +       unsigned long attr;
>> +       bool is_enabled;
>> +};
>> +
> 
> <snip>
> 
>> +
>> +static int __init sse_init(void)
>> +{
>> +       int ret;
>> +
>> +       if (sbi_probe_extension(SBI_EXT_SSE) <= 0) {
>> +               pr_err("Missing SBI SSE extension\n");
> 
> We might have older firmware which implements an older
> SBI spec version so we should not throw errors over here.
> Please change this to pr_info().

Yeah indeed, that might confuse the end-user.

Thanks,

Clément

> 
> Regards,
> Anup


