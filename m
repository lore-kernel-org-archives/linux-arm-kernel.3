Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82C5CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yqkoXHNh1TnGR7/oWjW8HjeGpQZBhmw0ro3M+AoE5o=; b=YQMfmG8/ox7Adc0LIoQWgdJ01w
	fQEn7S8CXTfPs5+FFqTk0jkvVFhyaSAr+eOuwqU0Lo90JW+va53EAP49seI0pGH5WP5uVsh8ZvfAA
	Q0NaSHczL4tGKhBX2hgC/07/a4wm4VHXbo13R662DEJb/plcwAXRZwdoCMbLLuRXFFiHyYpx2fch2
	IVoRjy2HsZX/bkgZn/pWLaj2FIoyzpje7sOEE5JX7QyyuNz1nJ/MtrxN5eAQ0eBycCBGJGTjV9Yib
	jkEgk4XMVxsCAEhNabLA63knvI0p+Jg0a+zn8sl0ShEWpbaQXxKISUYiUn0oFP2/EqOsQH8IvzCF6
	y3V6UgqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozY6-0000000G4kK-21m3;
	Thu, 21 Aug 2025 07:17:26 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozAe-0000000G0wm-3gph
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:53:14 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c6v8K6Wbdz2gLPM;
	Thu, 21 Aug 2025 14:50:09 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 6859A1400DA;
	Thu, 21 Aug 2025 14:53:03 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 14:53:02 +0800
Subject: Re: [PATCH] irqchip/gic-v5: Fix kmemleak L2 IST table entries false
 positives
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
References: <20250811135001.1333684-1-lpieralisi@kernel.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <82bac373-21d6-7aab-0b3d-509b5bce25db@huawei.com>
Date: Thu, 21 Aug 2025 14:53:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20250811135001.1333684-1-lpieralisi@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_235313_337237_6A150F62 
X-CRM114-Status: GOOD (  17.81  )
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

On 2025/8/11 21:50, Lorenzo Pieralisi wrote:
> L2 IST table entries are allocated with the kmalloc interface
> and their physical addresses are programmed in the GIC (either
> IST base address register or L1 IST table entries) but their
> virtual addresses are not stored in any kernel data structure
> because they are not needed at runtime - the L2 IST table entries
> are managed through system instructions but never dereferenced
> directly by the driver.
> 
> This triggers kmemleak false positive reports:
> 
> unreferenced object 0xffff00080039a000 (size 4096):
>   comm "swapper/0", pid 0, jiffies 4294892296
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace (crc 0):
>     kmemleak_alloc+0x34/0x40
>     __kmalloc_noprof+0x320/0x464
>     gicv5_irs_iste_alloc+0x1a4/0x484
>     gicv5_irq_lpi_domain_alloc+0xe4/0x194
>     irq_domain_alloc_irqs_parent+0x78/0xd8
>     gicv5_irq_ipi_domain_alloc+0x180/0x238
>     irq_domain_alloc_irqs_locked+0x238/0x7d4
>     __irq_domain_alloc_irqs+0x88/0x114
>     gicv5_of_init+0x284/0x37c
>     of_irq_init+0x3b8/0xb18
>     irqchip_init+0x18/0x40
>     init_IRQ+0x104/0x164
>     start_kernel+0x1a4/0x3d4
>     __primary_switched+0x8c/0x94
> 
> Instruct kmemleak to ignore L2 IST table memory allocation
> virtual addresses to prevent these false positive reports.
> 
> Reported-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Closes: https://lore.kernel.org/lkml/cc611dda-d1e4-4793-9bb2-0eaa47277584@huawei.com/
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/irqchip/irq-gic-v5-irs.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> index ad1435a858a4..e8a576f66366 100644
> --- a/drivers/irqchip/irq-gic-v5-irs.c
> +++ b/drivers/irqchip/irq-gic-v5-irs.c
> @@ -5,6 +5,7 @@
>  
>  #define pr_fmt(fmt)	"GICv5 IRS: " fmt
>  
> +#include <linux/kmemleak.h>
>  #include <linux/log2.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> @@ -117,6 +118,7 @@ static int __init gicv5_irs_init_ist_linear(struct gicv5_irs_chip_data *irs_data
>  		kfree(ist);
>  		return ret;
>  	}
> +	kmemleak_ignore(ist);
>  
>  	return 0;
>  }
> @@ -232,6 +234,7 @@ int gicv5_irs_iste_alloc(const u32 lpi)
>  		kfree(l2ist);
>  		return ret;
>  	}
> +	kmemleak_ignore(l2ist);

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>

Thanks,
Zenghui

