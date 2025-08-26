Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4127CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 19:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgZYscyVbacE3FEOdMycVAtdYmhk/G00sFJPM14Sy6U=; b=yp2WM1dDkB2JO+Ccz82w6S+77y
	0rRC4w0RLvDVKYGb3/cg8Lh7e2d399QQHf2r3wX8P3M4F2jTxtlqBZWDRyf/O/w80DenJ0WJH7zRg
	a/KJLjQ9fJTMc6QXxcobvuBJfdo5Oyo3jZMmnp0uMq7f9s6NbohiJSJzP1tIeQJRSyV9w/JEa11YT
	CDyCDvaWjsFA1fmTjLL3R7ayo9PUKtf9khi2SjMQo7BA3x/LNKcHWjIyG2DzqTbUC6gvza1UEJWv5
	BweQJ0c55+64nE4hKs0lQkLVr1aqltsEAJEHsAtLEyOXoL4ARBWlJyqg7/lZr6sN9iW5y2WynxKSY
	Zvbm7tQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzeo-0000000D2L3-3oCA;
	Tue, 26 Aug 2025 19:48:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqzR4-0000000D0ES-2TDT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 19:34:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50E03404CA;
	Tue, 26 Aug 2025 19:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0ACC4CEF1;
	Tue, 26 Aug 2025 19:34:24 +0000 (UTC)
Date: Tue, 26 Aug 2025 20:34:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] irqchip/gic-v5: Fix kmemleak L2 IST table entries false
 positives
Message-ID: <aK4MQ3dur0cyluGl@arm.com>
References: <20250811135001.1333684-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250811135001.1333684-1-lpieralisi@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_123426_657998_75884AFF 
X-CRM114-Status: GOOD (  13.60  )
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

On Mon, Aug 11, 2025 at 03:50:01PM +0200, Lorenzo Pieralisi wrote:
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

Nit: if you ever respin, please add a short comment on why this is a
false positive (easier to see it in the code than the git logs).

>  
>  	return 0;
>  }
> @@ -232,6 +234,7 @@ int gicv5_irs_iste_alloc(const u32 lpi)
>  		kfree(l2ist);
>  		return ret;
>  	}
> +	kmemleak_ignore(l2ist);

Same here.

-- 
Catalin

