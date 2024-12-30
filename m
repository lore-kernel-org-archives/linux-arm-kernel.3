Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBBFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=owVTKHB8kipu7woU/ieGXOWqB6uxgQm/ITw6hnvhEyE=; b=DoWb2mqQIiEPC1LJkJmM0ldFQU
	Xmv6wAR5RANRpAYCGCr6oepf8bF8fzhO76ZclQwQcXwa4U9Qyt9vNFKwTRbNpC7iopQDwZCwcw9XN
	CP1wNa0KkfrqQgA4Cmj1Xh/jgVKbP2J4orJoGN5vRu1Z02zuXQf7hqRR3OcSevNPT0ELuCcrVdHo6
	9HId5ZuNsjTy1aWE/LXXNZ9ZOaz1DdZSfq6aLaVhfVgjQmsSGm/zbyPDxi0RLPbWEuxHCOSsJUajT
	dokPvAnCSt+q7ePh8w4fU5HZ/2cSpyveikdqB60OQHrD016/7WadjeMcxC3kwDlFSY1LWbwIeZlQ5
	9p602RHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSHP6-00000005PoC-16BZ;
	Mon, 30 Dec 2024 15:10:00 +0000
Received: from smtp-fw-80006.amazon.com ([99.78.197.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSHNt-00000005PiC-0iMc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 15:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1735571184; x=1767107184;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=owVTKHB8kipu7woU/ieGXOWqB6uxgQm/ITw6hnvhEyE=;
  b=Lazn8RSUIUjoQGt85o//2ZljM5eJrQdiCvOTUIjGDFNg3FOs3SiSGOzv
   aeb+FX4z967LXMpfWjpUDwvw4VZ7fZ7NBFiAawPIUqaXa3K148S94IP4B
   FVBKp3g+xnwJlvNknubCLuB3KSgWUsm0y7trgCv1g8i6Emtfc4N2xTxC6
   0=;
X-IronPort-AV: E=Sophos;i="6.12,276,1728950400"; 
   d="scan'208";a="10801241"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80006.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 15:06:19 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.43.254:58068]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.45.187:2525] with esmtp (Farcaster)
 id 60cdf5fc-d20e-4e87-a70d-74071fd860d6; Mon, 30 Dec 2024 15:08:38 +0000 (UTC)
X-Farcaster-Flow-ID: 60cdf5fc-d20e-4e87-a70d-74071fd860d6
Received: from EX19D030EUB001.ant.amazon.com (10.252.61.82) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Mon, 30 Dec 2024 15:08:34 +0000
Received: from EX19MTAUWB002.ant.amazon.com (10.250.64.231) by
 EX19D030EUB001.ant.amazon.com (10.252.61.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Mon, 30 Dec 2024 15:08:34 +0000
Received: from email-imr-corp-prod-iad-all-1a-6ea42a62.us-east-1.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.228) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Mon, 30 Dec 2024 15:08:33 +0000
Received: from dev-dsk-krckatom-1b-7b393aa4.eu-west-1.amazon.com (dev-dsk-krckatom-1b-7b393aa4.eu-west-1.amazon.com [10.13.225.85])
	by email-imr-corp-prod-iad-all-1a-6ea42a62.us-east-1.amazon.com (Postfix) with ESMTPS id C08C440303;
	Mon, 30 Dec 2024 15:08:32 +0000 (UTC)
From: Tomas Krcka <krckatom@amazon.de>
To: <linux-arm-kernel@lists.infradead.org>
CC: <nh-open-source@amazon.com>, Tomas Krcka <krckatom@amazon.de>, "Marc
 Zyngier" <maz@kernel.org>, <stable@vger.kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Hagar Hemdan <hagarhem@amazon.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] irqchip/gic-v3-its: fix raw_local_irq_restore() called with IRQs enabled
Date: Mon, 30 Dec 2024 15:08:25 +0000
Message-ID: <20241230150825.62894-1-krckatom@amazon.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_070845_272556_487215D1 
X-CRM114-Status: GOOD (  14.12  )
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

The following call-chain leads to misuse of spinlock_irq
when spinlock_irqsave was hold.

irq_set_vcpu_affinity
  -> irq_get_desc_lock (spinlock_irqsave)
   -> its_irq_set_vcpu_affinity
    -> guard(raw_spin_lock_irq) <--- this enables interrupts
  -> irq_put_desc_unlock // <--- WARN IRQs enabled

Fix the issue by using guard(raw_spinlock), since the function is
already called with irqsave and raw_spin_lock was used before the commit
b97e8a2f7130 ("irqchip/gic-v3-its: Fix potential race condition in its_vlpi_prop_update()")
introducing the guard as well.

This was discovered through the lock debugging, and the corresponding
log is as follows:

raw_local_irq_restore() called with IRQs enabled
WARNING: CPU: 38 PID: 444 at kernel/locking/irqflag-debug.c:10 warn_bogus_irq_restore+0x2c/0x38
 Call trace:
  warn_bogus_irq_restore+0x2c/0x38
   _raw_spin_unlock_irqrestore+0x68/0x88
   __irq_put_desc_unlock+0x1c/0x48
   irq_set_vcpu_affinity+0x74/0xc0
   its_map_vlpi+0x44/0x88
   kvm_vgic_v4_set_forwarding+0x148/0x230
   kvm_arch_irq_bypass_add_producer+0x20/0x28
   __connect+0x98/0xb8
   irq_bypass_register_consumer+0x150/0x178
   kvm_irqfd+0x6dc/0x744
   kvm_vm_ioctl+0xe44/0x16b0

Fixes: b97e8a2f7130 ("irqchip/gic-v3-its: Fix potential race condition in its_vlpi_prop_update()")
Signed-off-by: Tomas Krcka <krckatom@amazon.de>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-gic-v3-its.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 92244cfa0464..8c3ec5734f1e 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2045,7 +2045,7 @@ static int its_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu_info)
 	if (!is_v4(its_dev->its))
 		return -EINVAL;
 
-	guard(raw_spinlock_irq)(&its_dev->event_map.vlpi_lock);
+	guard(raw_spinlock)(&its_dev->event_map.vlpi_lock);
 
 	/* Unmap request? */
 	if (!info)
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


