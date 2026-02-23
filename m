Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8623CEA4FBC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 13:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8bNnw4n0yRZCqrV5DD7E0brTxIXyWYVqVFXtX6Tk2s=; b=UgRizk0LbdcXbT2FJ7a3B2QrUY
	lLIL17Al3n4OU/L1bgcWPQfCB3fgog79Jd4V/QLzcGI4hKnij2J6AHw85topCedz6LehYcgEed4le
	nhgwd0AHbW2KFv97yfxuzFot9HJp+9T1NLUiqkGfU6z8FUymMUlRNFvohU2Dn1+erVxdMpwRg67Rn
	/vlsxN2l26DgtCV4yj96JQORX+AzTKVWEw4uqYoOTK2RD/fqKilIjKKA0qJsUyoeXMQyTxur2crAS
	henzODtlxC7zidzF0xeWOoSwnsbdJI+glYeGlLvs2Fce1ytvwTNcmmTDW98Fd/olK8JVn1FKO5MxR
	KkScYidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVaT-00000000KAH-0kOV;
	Mon, 23 Feb 2026 13:02:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVaR-00000000K93-0isf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 13:02:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E596B43BC3;
	Mon, 23 Feb 2026 13:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC47C19424;
	Mon, 23 Feb 2026 13:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771851773;
	bh=iZBlwQliLKOaK+xvvX3FOn/PA3LT6MHuwUPt+gChPDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EACiBWriChy1jxD1pIwPsXwtgGcD9o364heVNUAxRBZ1sQkq+GJjO13PgypgojArv
	 +q3mxYpshrSqNHLUgfb8A2e5btCOVZs8KrKs/USVUB/GT97HWBgkwSNPGj/vwbLlge
	 CMX2UxlRJW+P7yxlkx+v8cnIEKQ+f25YYcsFho4wincbwYzmtGLFxgIfvd75uFSMdT
	 zSlUFnKsnPA72515URXnT7URdo00dBNZWh7eWWBfRyRtc0Pyca3knsGhf2aRTzLlVP
	 DFlEQ5BtDf9kMAv/DpHEmmk8soywcgeHB86IrDhR4OkzbMDsopTUbzbZEqpOOuU/si
	 vr8QCRbyNJryQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to
 the msi-parent handling
In-Reply-To: <86qzqbal69.wl-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
 <20260218135203.2267907-4-maz@kernel.org> <87seasv11z.ffs@tglx>
 <86qzqbal69.wl-maz@kernel.org>
Date: Mon, 23 Feb 2026 14:02:50 +0100
Message-ID: <87pl5vvchx.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_050255_243279_F91CE314 
X-CRM114-Status: GOOD (  13.28  )
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

On Mon, Feb 23 2026 at 09:01, Marc Zyngier wrote:
> On Sun, 22 Feb 2026 22:57:44 +0000,
> Thomas Gleixner <tglx@kernel.org> wrote:
>> This rejects as you are building against an unmerged change (I assume
>> it's Lorenzos GIC5 stuff). I can fix it up when applying.
>
> That was against vanilla 6.19. I'll rebase on -rc1 to satisfy myself
> that this is still doing the right thing after the ACPI crap fest, and
> repost the result.

Ah. The other way round :)

My resolution is simple and it looks about right. Please note the
cosmetic changes I did on the way :)

Thanks,

        tglx
---
--- a/drivers/irqchip/irq-gic-its-msi-parent.c
+++ b/drivers/irqchip/irq-gic-its-msi-parent.c
@@ -5,6 +5,7 @@
 // Copyright (C) 2022 Intel
 
 #include <linux/acpi_iort.h>
+#include <linux/fsl/mc.h>
 #include <linux/of_address.h>
 #include <linux/pci.h>
 
@@ -186,10 +187,12 @@ static int its_pmsi_prepare(struct irq_d
 			    int nvec, msi_alloc_info_t *info)
 {
 	struct msi_domain_info *msi_info;
+	int ret = 0;
 	u32 dev_id;
-	int ret;
 
-	if (dev->of_node)
+	if (dev_is_fsl_mc(dev))
+		dev_id = fsl_mc_get_msi_id(dev);
+	else if (dev->of_node)
 		ret = of_pmsi_get_msi_info(domain->parent, dev, &dev_id, NULL);
 	else
 		ret = iort_pmsi_get_msi_info(dev, &dev_id, NULL);

