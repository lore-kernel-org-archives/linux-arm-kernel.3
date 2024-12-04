Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9732E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 14:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5mJN0xDsc3RBo9kCI5VpP+8GDP08z7fNPcgv7+CVrqU=; b=1WGQtiBofUk6PH8t8veV6JTwav
	6nRv6/a3UvYtZEtdsE8X5ae0K5OL+YMN8J8PSX1W5d5WutbneJbyjiD6eAsypUZ6qRnLgoeTL9qCU
	zjtokgkfVf8oP/Xl+auSr4yFuaHAY27ucpFPiR79lfpcVl6hJvO66IyIJBSGja3Mr8EHrZejhN3ou
	wdO7RPce/OkDiJEiyMDxOW4R3d15TBY5z0eJEGe20PKosId1JPa9GF9EFVO1XON8+PaF2oTM+L/FB
	DbxgBFZouQLxitJ4c7fCizbWLLeupiEskyLTi3VdvpLHdZHu3D1LpkcumaBDMqgHpnJ1zF2rxkxY/
	o6gNAqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqGj-0000000Cp2H-0NnN;
	Wed, 04 Dec 2024 14:22:21 +0000
Received: from smtp-fw-52004.amazon.com ([52.119.213.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqEi-0000000CoSy-025O;
	Wed, 04 Dec 2024 14:20:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1733322015; x=1764858015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5mJN0xDsc3RBo9kCI5VpP+8GDP08z7fNPcgv7+CVrqU=;
  b=gLCDKbQaSIbwvpWBeuxp3KYgH4U3S1kBFOc3NNU+sCPgT+Tl5GdXr/Fb
   Z6akkhQiJMvwtxNe6doKKdQRRyu5jasdIzAJZwgFSa2S8U6/q7l1wKh3w
   Hzp8FB1tbxSt9H84CCeCx9DzKUM9FFBy0EDMWBKFQ7loiglyOi+yB5afK
   s=;
X-IronPort-AV: E=Sophos;i="6.12,207,1728950400"; 
   d="scan'208";a="252220900"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.124.125.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 14:20:05 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.10.100:35215]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.23.253:2525] with esmtp (Farcaster)
 id 4f701277-230b-4dbe-9bbd-a2fd4c729600; Wed, 4 Dec 2024 14:20:04 +0000 (UTC)
X-Farcaster-Flow-ID: 4f701277-230b-4dbe-9bbd-a2fd4c729600
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 4 Dec 2024 14:20:04 +0000
Received: from EX19MTAUEB002.ant.amazon.com (10.252.135.47) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 4 Dec 2024 14:20:04 +0000
Received: from email-imr-corp-prod-iad-all-1b-1323ce6b.us-east-1.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.135.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Wed, 4 Dec 2024 14:20:04 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com [172.19.116.181])
	by email-imr-corp-prod-iad-all-1b-1323ce6b.us-east-1.amazon.com (Postfix) with ESMTP id E07CC4056B;
	Wed,  4 Dec 2024 14:20:03 +0000 (UTC)
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id A058A7595; Wed,  4 Dec 2024 14:20:03 +0000 (UTC)
From: Eliav Farber <farbere@amazon.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <maddy@linux.ibm.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <farbere@amazon.com>,
	<hbathini@linux.ibm.com>, <sourabhjain@linux.ibm.com>,
	<adityag@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<takakura@valinux.co.jp>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>
CC: <jonnyc@amazon.com>
Subject: [PATCH v6 2/2] kexec: Prevent redundant IRQ masking by checking state before shutdown
Date: Wed, 4 Dec 2024 14:20:03 +0000
Message-ID: <20241204142003.32859-3-farbere@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241204142003.32859-1-farbere@amazon.com>
References: <20241204142003.32859-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_062016_360714_1A3B4745 
X-CRM114-Status: GOOD (  14.90  )
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

During machine kexec, the function machine_kexec_mask_interrupts() is
responsible for disabling or masking all interrupts. While the irq_disable
hook ensures that an already-disabled IRQ is not disabled again, the
current implementation unconditionally invokes the irq_mask() function for
every interrupt descriptor, even when the interrupt is already masked.

A specific issue was observed in the crash kernel flow after unbinding a
device (prior to kexec) that used a GPIO as an IRQ source. The warning was
triggered by the gpiochip_disable_irq() function, which attempted to clear
the FLAG_IRQ_IS_ENABLED flag when FLAG_USED_AS_IRQ was not set:

```
void gpiochip_disable_irq(struct gpio_chip *gc, unsigned int offset)
{
	struct gpio_desc *desc = gpiochip_get_desc(gc, offset);

	if (!IS_ERR(desc) &&
	    !WARN_ON(!test_bit(FLAG_USED_AS_IRQ, &desc->flags)))
		clear_bit(FLAG_IRQ_IS_ENABLED, &desc->flags);
}
```

This issue surfaced after commit a8173820f441 ("gpio: gpiolib: Allow GPIO
IRQs to lazy disable") introduced lazy disablement for GPIO IRQs. It
replaced disable/enable hooks with mask/unmask hooks. Unlike the disable
hook, the mask hook doesn't handle already-masked IRQs.

When a GPIO-IRQ driver is unbound, the IRQ is released, triggering
__irq_disable() and irq_state_set_masked(). A subsequent call to
machine_kexec_mask_interrupts() re-invokes chip->irq_mask(). This results
in a call chain, including gpiochip_irq_mask() and gpiochip_disable_irq().
Since FLAG_USED_AS_IRQ was cleared earlier, a warning occurs.

Replace calls to irq_mask() and irq_disable() hooks with a simplified call
to irq_shutdown(), and check if the interrupt is started (irqd_is_started)
before calling the shutdown.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
V5 -> V6: No changes.

 kernel/irq/kexec.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/kernel/irq/kexec.c b/kernel/irq/kexec.c
index 0f9548c1708d..1a3deffe6b5b 100644
--- a/kernel/irq/kexec.c
+++ b/kernel/irq/kexec.c
@@ -17,7 +17,7 @@ void machine_kexec_mask_interrupts(void)
 		int check_eoi = 1;
 
 		chip = irq_desc_get_chip(desc);
-		if (!chip)
+		if (!chip || !irqd_is_started(&desc->irq_data))
 			continue;
 
 		if (IS_ENABLED(CONFIG_GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD)) {
@@ -31,10 +31,6 @@ void machine_kexec_mask_interrupts(void)
 		if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
 			chip->irq_eoi(&desc->irq_data);
 
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
+		irq_shutdown(desc);
 	}
 }
-- 
2.40.1


