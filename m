Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07FFD6ACE9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NvBWtev1slrWXhkVcMmhNUJ2tEXO/H0E7EXWBQ0mv08=; b=ER2UtdiRQUsdOKohwitmb7i+Kc
	j2c9X81cUk4H5jxPQ1CqG1+XXAMxiuQMQnx788LO9Yq0ih09JZT30Ep7QT+WD+zCBJmkdjfgIuveF
	tU788nxQWs3gi6d1Qt67TiYxrntKkH5JGqIUtofDA0tD9SzSn/IJPX4Wx+Ek5Ig32COUvqgKaXW86
	tq48De2yDYfClMMDQ6Kr73VNjiufbphWTJeALoQGkks91DlulAADxk1UO4yBX9dNSuT9eDmd0SzNx
	sraOydyPaz+JRcN67FS0jB1buDWvmB0nzVIctXF/6XRnU/xdXQGibZjl/z+ohcua6PlDkQ4xluKg1
	+Pms6SGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJtI-0000000DUzL-1pqs;
	Wed, 27 Nov 2024 15:23:44 +0000
Received: from smtp-fw-80008.amazon.com ([99.78.197.219])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJsJ-0000000DUrb-0c2v;
	Wed, 27 Nov 2024 15:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732720963; x=1764256963;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NvBWtev1slrWXhkVcMmhNUJ2tEXO/H0E7EXWBQ0mv08=;
  b=dfXM2K7W1ann49CDovlt4tmfhJUqOJERZ/2WJhgMnHlaipmYT3HJimaC
   hQGX5e63SnuTArgspf8dcRYN+NTa8mADuUcapq8ZJS9Rxgz+yMhRoGviZ
   Ig5ESzqHpk773g9iwbHQ36/cmC3pcfSjvjUHqQlERUe3USNcgiXqYvB0y
   c=;
X-IronPort-AV: E=Sophos;i="6.12,189,1728950400"; 
   d="scan'208";a="148444442"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-80008.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 15:22:38 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.38.20:4762]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.101:2525] with esmtp (Farcaster)
 id 090d255a-bd4e-4b8c-9604-9659de410a04; Wed, 27 Nov 2024 15:22:38 +0000 (UTC)
X-Farcaster-Flow-ID: 090d255a-bd4e-4b8c-9604-9659de410a04
Received: from EX19D013UWB003.ant.amazon.com (10.13.138.111) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 27 Nov 2024 15:22:37 +0000
Received: from EX19MTAUWC001.ant.amazon.com (10.250.64.145) by
 EX19D013UWB003.ant.amazon.com (10.13.138.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 27 Nov 2024 15:22:37 +0000
Received: from email-imr-corp-prod-iad-all-1a-93a35fb4.us-east-1.amazon.com
 (10.25.36.210) by mail-relay.amazon.com (10.250.64.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Wed, 27 Nov 2024 15:22:37 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com [172.19.116.181])
	by email-imr-corp-prod-iad-all-1a-93a35fb4.us-east-1.amazon.com (Postfix) with ESMTP id C4BC640610;
	Wed, 27 Nov 2024 15:22:36 +0000 (UTC)
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id 7AFF345B; Wed, 27 Nov 2024 15:22:36 +0000 (UTC)
From: Eliav Farber <farbere@amazon.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <maddy@linux.ibm.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <farbere@amazon.com>,
	<hbathini@linux.ibm.com>, <adityag@linux.ibm.com>,
	<songshuaishuai@tinylab.org>, <takakura@valinux.co.jp>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>
CC: <jonnyc@amazon.com>
Subject: [PATCH v2] arm64: kexec: Check if IRQ is already masked before masking
Date: Wed, 27 Nov 2024 15:22:36 +0000
Message-ID: <20241127152236.26122-1-farbere@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_072243_236987_5D321905 
X-CRM114-Status: GOOD (  16.50  )
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
responsible for disabling or masking all interrupts. While the
irq_disable hook ensures that an already-disabled IRQ is not disabled
again, the current implementation unconditionally invokes the irq_mask()
function for every interrupt descriptor, even when the interrupt is
already masked.

A specific issue was observed in the crash kernel flow after unbinding a
device (prior to kexec) that used a GPIO as an IRQ source. The warning
was triggered by the gpiochip_disable_irq() function, which attempted to
clear the FLAG_IRQ_IS_ENABLED flag when FLAG_USED_AS_IRQ was not set:

```
void gpiochip_disable_irq(struct gpio_chip *gc, unsigned int offset)
{
	struct gpio_desc *desc = gpiochip_get_desc(gc, offset);

	if (!IS_ERR(desc) &&
	    !WARN_ON(!test_bit(FLAG_USED_AS_IRQ, &desc->flags)))
		clear_bit(FLAG_IRQ_IS_ENABLED, &desc->flags);
}
```

The issue emerged after commit a8173820f441 ("gpio: gpiolib: Allow GPIO
IRQs to lazy disable"), which introduced lazy disablement for GPIO IRQs
by replacing disable/enable hooks with mask/unmask hooks in some cases.
While irq_disable guarded against redundant operations, the unguarded
irq_mask in machine_kexec_mask_interrupts() led to warnings when invoked
on already-masked IRQs.

When a GPIO-IRQ-using driver is unbound, the IRQ is released, invoking
__irq_disable() and irq_state_set_masked(). A subsequent call to
machine_kexec_mask_interrupts() reinvoked chip->irq_mask(), leading to a
call chain that included gpiochip_irq_mask() and gpiochip_disable_irq().
Because FLAG_USED_AS_IRQ was cleared earlier, a warning was printed.

This patch replaces the direct invocation of the irq_mask() and
irq_disable() hooks with simplified code that leverages the
irq_disable() kernel infrastructure. This higher-level function checks
the interrupt's state to prevent redundant operations. Additionally, the
IRQ_DISABLE_UNLAZY status flag is set to ensure that, for interrupt
chips lacking an irq_disable callback, the disable operation is handled
using the lazy approach.

As part of this change, the irq_disable() declaration was moved from
kernel/irq/internals.h to include/linux/irq.h to make it accessible
outside the kernel/irq/ directory, as the former can only be included
within that directory.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
V1 -> V2:
- Implement an alternative solution by utilizing the kernel's
  irq_disable() infrastructure.
- Apply the fix to additional architectures, including ARM, PowerPC,
  and RISC-V.
---
 arch/arm/kernel/machine_kexec.c   | 7 ++-----
 arch/arm64/kernel/machine_kexec.c | 7 ++-----
 arch/powerpc/kexec/core.c         | 7 ++-----
 arch/riscv/kernel/machine_kexec.c | 7 ++-----
 include/linux/irq.h               | 2 ++
 kernel/irq/internals.h            | 1 -
 6 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/arch/arm/kernel/machine_kexec.c b/arch/arm/kernel/machine_kexec.c
index 80ceb5bd2680..54d0bd1bd449 100644
--- a/arch/arm/kernel/machine_kexec.c
+++ b/arch/arm/kernel/machine_kexec.c
@@ -142,11 +142,8 @@ static void machine_kexec_mask_interrupts(void)
 		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
 			chip->irq_eoi(&desc->irq_data);
 
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
+		irq_set_status_flags(i, IRQ_DISABLE_UNLAZY);
+		irq_disable(desc);
 	}
 }
 
diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index 82e2203d86a3..9b48d952df3e 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -230,11 +230,8 @@ static void machine_kexec_mask_interrupts(void)
 		    chip->irq_eoi)
 			chip->irq_eoi(&desc->irq_data);
 
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
+		irq_set_status_flags(i, IRQ_DISABLE_UNLAZY);
+		irq_disable(desc);
 	}
 }
 
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index b8333a49ea5d..3489e50f5017 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -36,11 +36,8 @@ void machine_kexec_mask_interrupts(void) {
 		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
 			chip->irq_eoi(&desc->irq_data);
 
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
+		irq_set_status_flags(i, IRQ_DISABLE_UNLAZY);
+		irq_disable(desc);
 	}
 }
 
diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 3c830a6f7ef4..a9df80e0602c 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -129,11 +129,8 @@ static void machine_kexec_mask_interrupts(void)
 		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
 			chip->irq_eoi(&desc->irq_data);
 
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
+		irq_set_status_flags(i, IRQ_DISABLE_UNLAZY);
+		irq_disable(desc);
 	}
 }
 
diff --git a/include/linux/irq.h b/include/linux/irq.h
index fa711f80957b..176a7f671409 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -600,6 +600,8 @@ enum {
 
 #define IRQ_DEFAULT_INIT_FLAGS	ARCH_IRQ_INIT_FLAGS
 
+extern void irq_disable(struct irq_desc *desc);
+
 struct irqaction;
 extern int setup_percpu_irq(unsigned int irq, struct irqaction *new);
 extern void remove_percpu_irq(unsigned int irq, struct irqaction *act);
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index fe0272cd84a5..d9104d2b26b4 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -91,7 +91,6 @@ extern int irq_startup(struct irq_desc *desc, bool resend, bool force);
 extern void irq_shutdown(struct irq_desc *desc);
 extern void irq_shutdown_and_deactivate(struct irq_desc *desc);
 extern void irq_enable(struct irq_desc *desc);
-extern void irq_disable(struct irq_desc *desc);
 extern void irq_percpu_enable(struct irq_desc *desc, unsigned int cpu);
 extern void irq_percpu_disable(struct irq_desc *desc, unsigned int cpu);
 extern void mask_irq(struct irq_desc *desc);
-- 
2.40.1


