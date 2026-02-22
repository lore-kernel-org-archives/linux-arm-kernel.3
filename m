Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0D3E6817A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 22:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x61JP+etTRQ861pjyF7vVsQLGayevNtjxLjoJXnwvRc=; b=Mn+eEkHXz3qeYoBV+O1x+gwwjL
	vgxtPKUvRb4obHvYmxClDO5BdiZ9cmuHA0jvpPTE2dnjNnrxVjtxDK33AlJBgFkm/ZZVI6b2c1i0a
	CBHTAevKGOnaF0HrpBXgtL18KsITTG+a0ocY6M1v8zvZ+p6LD/i11eWFXKhYhLIGtdCR8gpvQUTfW
	ALxx21v0ulcJF0ps59S5afIBy4EC2lum3VfwsdcjqChSJP4bbM2KLuWZGQaeXhnV7GHafjZ0JyE6V
	BoPLnSneGgJpIlxvyeMcY/Lqwf1Ph7kWsd2nn6fscvMyx5c/bpFPyCpoZCIDrDLKvdlEDqDJCzjoq
	/AZAlL6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuIOc-0000000H289-0U0n;
	Sun, 22 Feb 2026 22:57:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuIOb-0000000H27z-0FXT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Feb 2026 22:57:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C28C6001D;
	Sun, 22 Feb 2026 22:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C6DC116D0;
	Sun, 22 Feb 2026 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771801067;
	bh=fis4ioZILk6YcO2e9aX1BhjpjjEJRJjSqIX9ksTd+PI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PHcE3UBYlVJH0/QQPn+Z3nz7JzCa7yUOXaHtfCJM9mBKSwkidICJuiiKLES+5qk0m
	 LHTaxT2ekSsK9lpRYAMiknXzd1i9tNLGUQH6XkDS0tS/mFEWG4wW48LFb87JpPmeoS
	 HIMExp8CNZhyLqeetuN86TAb5ykg48glOdjY7ZRGjgQ+PIhu57kU5lRcGeSe2OIh9v
	 xuO9l4k9WL/OzqMzt+99Pcw62wedxIO0YexlyOIaYPafoXZKO72jpzxDEC3YJgsU4Y
	 /ISB31GMzBzSViYDCWEXItlJ3/ZE4hxk+GQZhcU1Uq/ISbkCGPNtwWjAJuJ6TcjvJ1
	 JGSwpG5gjtNrQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to
 the msi-parent handling
In-Reply-To: <20260218135203.2267907-4-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
 <20260218135203.2267907-4-maz@kernel.org>
Date: Sun, 22 Feb 2026 23:57:44 +0100
Message-ID: <87seasv11z.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, Feb 18 2026 at 13:52, Marc Zyngier wrote:
> Make the ITS code aware of fsl_mc devices by plumbing the devid
> retrieval primitive.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/irqchip/irq-gic-its-msi-parent.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
> index 12f45228c8674..532c0d626ca04 100644
> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
> @@ -7,6 +7,7 @@
>  #include <linux/acpi_iort.h>
>  #include <linux/of_address.h>
>  #include <linux/pci.h>
> +#include <linux/fsl/mc.h>
>  
>  #include "irq-gic-its-msi-parent.h"
>  #include <linux/irqchip/irq-msi-lib.h>
> @@ -186,9 +187,11 @@ static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
>  {
>  	struct msi_domain_info *msi_info;
>  	u32 dev_id;
> -	int ret;
> +	int ret = 0;
>  
> -	if (dev->of_node)
> +	if (dev_is_fsl_mc(dev))
> +		dev_id = fsl_mc_get_msi_id(dev);
> +	else if (dev->of_node)
>  		ret = of_pmsi_get_msi_info(domain->parent, dev, &dev_id, NULL);
>  	else
>  		ret = iort_pmsi_get_dev_id(dev, &dev_id);

This rejects as you are building against an unmerged change (I assume
it's Lorenzos GIC5 stuff). I can fix it up when applying.

Thanks,

        tglx

