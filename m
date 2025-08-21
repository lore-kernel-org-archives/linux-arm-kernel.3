Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0D4CA0FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jesj1c21AL+5bALAfYutNIGsocE9Xey0dhMYQZCMcTE=; b=cq7UA+hht4ZI96tSsywn25M5H8
	XFoJtLzV0GoD3IGB0YMZxEBeBdmBAQajAIuYHWVjzM7ZF9AZWF5wcDzAb1bk4pa3Ul0JjJvgQSuNs
	7VgJZxwAii21cPEHDDm/5E5iMgu5zAFHdAltTNRDnfBDxICIJfDnXupakMZ+3Vqopg4VtJ7MmrYS8
	JrIrexTODxz+yopRkcvtHcnykSRBNJxoXEOvLXRastOXIXnhxaPiAOFrk6lglxwX0DvARsc+y6rWy
	pS+MDz6TsPPmdFGPnejyAwn/r4yVwtVJjx1z5szZS7V5pwob352SKqU7BGasbgt0Q/gD85ujL2MTB
	B4z7gUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1ll-0000000GQBq-0WUu;
	Thu, 21 Aug 2025 09:39:41 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozSf-0000000G3xu-3oAZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:11:51 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4c6vX559whz2Cg8n;
	Thu, 21 Aug 2025 15:07:17 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DE6A41401F2;
	Thu, 21 Aug 2025 15:11:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 15:11:40 +0800
Message-ID: <aaf975a9-db4a-5b61-4e07-5d667db47172@huawei.com>
Date: Thu, 21 Aug 2025 15:11:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] irqchip/gic-v5: Fix kmemleak L2 IST table entries false
 positives
Content-Language: en-US
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, <linux-kernel@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, Thomas Gleixner
	<tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
References: <20250811135001.1333684-1-lpieralisi@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20250811135001.1333684-1-lpieralisi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_001150_115961_5946E2AE 
X-CRM114-Status: GOOD (  14.63  )
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

[...]

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

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  
>  	/*
>  	 * Make sure we invalidate the cache line pulled before the IRS

