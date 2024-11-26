Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934E3D5A6E2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 05:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c7R+vWL53xvofYvfpDqK5DRpBmVSfvfqf+hQEMqLgFI=; b=bLHO2Aftejv6IGJ51mzrVqpx+A
	8Ynotg8E3epfSrYoT9DyLEz38hh/Rrd99MXpno9u3ALR4WUDTU23KrCtw11062X56dE0weGUxnFSn
	d5GhAl6v8nPbvfubn3zcIKQx6/gOqREm6APtttcHKbRuI/yLL21mB6gBh3g1NdBwVQMw6kDgle1ap
	z/dEHrFDNWbM5YpDT4cgnRE0QpaJ5klmlAurLFUk9EVaj05MvoHDeACp7erqLZTUiRxCzo64ig/BC
	IKwHIfHFtD4Ds8o1qEiJFu+39tOy6b8PehMtJP9ALl50hPnKRsKeLjrtrfDhYp2WSMztu9OWkUMD2
	tQvF2OIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFnmD-00000009eGB-1iVF;
	Tue, 26 Nov 2024 05:06:17 +0000
Received: from smtp-fw-6002.amazon.com ([52.95.49.90])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFnlF-00000009eBl-1o4c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 05:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732597517; x=1764133517;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c7R+vWL53xvofYvfpDqK5DRpBmVSfvfqf+hQEMqLgFI=;
  b=LYvEpF2uRpIeAKfEDEOULIybqYD9pIUsou67IhNCS+iOQmejrS+5RzmN
   am2NHLjli8ReX0Y3aUnhO8BCl8/6a4kKpmvExotGfxR0diBK9k9Ewgfni
   KqPNp/hhACGiboKks6w36+jI3g0+FiP7JO4GV0AU0hCWqWx7vUiLXvhrR
   0=;
X-IronPort-AV: E=Sophos;i="6.12,184,1728950400"; 
   d="scan'208";a="451326400"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.124.125.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 05:05:11 +0000
Received: from EX19MTAEUB001.ant.amazon.com [10.0.17.79:19913]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.26.13:2525] with esmtp (Farcaster)
 id 6618a5e3-144f-4fe0-b3c3-0bb52f1575eb; Tue, 26 Nov 2024 05:05:10 +0000 (UTC)
X-Farcaster-Flow-ID: 6618a5e3-144f-4fe0-b3c3-0bb52f1575eb
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUB001.ant.amazon.com (10.252.51.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 26 Nov 2024 05:05:10 +0000
Received: from EX19MTAUEA001.ant.amazon.com (10.252.134.203) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 26 Nov 2024 05:05:10 +0000
Received: from email-imr-corp-prod-pdx-1box-2b-8c2c6aed.us-west-2.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.134.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Tue, 26 Nov 2024 05:05:10 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com [172.19.116.181])
	by email-imr-corp-prod-pdx-1box-2b-8c2c6aed.us-west-2.amazon.com (Postfix) with ESMTP id 8C296A00CB;
	Tue, 26 Nov 2024 05:05:09 +0000 (UTC)
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id 221E53412; Tue, 26 Nov 2024 05:05:09 +0000 (UTC)
From: Eliav Farber <farbere@amazon.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <farbere@amazon.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <jonnyc@amazon.com>
Subject: [PATCH] arm64: kexec: Check if IRQ is already masked before masking
Date: Tue, 26 Nov 2024 05:05:09 +0000
Message-ID: <20241126050509.4426-1-farbere@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_210517_860626_78FE376B 
X-CRM114-Status: GOOD (  17.24  )
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
responsible for masking all interrupts. However, the current
implementation unconditionally calls the irq_mask() function for each
interrupt descriptor, even if the interrupt is already masked.

This commit adds a check to verify if the interrupt is not already
masked before calling the irq_mask() function. This change avoids
redundant masking operations and potential issues that might arise from
attempting to mask an already masked interrupt.

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

This issue began after commit a8173820f441 ("gpio: gpiolib: Allow GPIO
IRQs to lazy disable"), which replaced IRQ disable/enable hooks with
mask/unmask hooks in some cases. The irq_disable hook was protected
against disabling an already disabled IRQ, but the irq_mask hook in
machine_kexec_mask_interrupts() was not.

When a driver that uses a GPIO-irq is unbound, the corresponding IRQ is
released, invoking __irq_disable() and irq_state_set_masked().
Subsequently, machine_kexec_mask_interrupts() attempts to call the
chip->irq_mask() function again. This invokes gpiochip_irq_mask() and
gpiochip_disable_irq(), and since FLAG_USED_AS_IRQ has already been
cleared, this results in a warning being printed.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 arch/arm64/kernel/machine_kexec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index 82e2203d86a3..6f56ec676844 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -230,7 +230,7 @@ static void machine_kexec_mask_interrupts(void)
 		    chip->irq_eoi)
 			chip->irq_eoi(&desc->irq_data);
 
-		if (chip->irq_mask)
+		if (chip->irq_mask && !irqd_irq_masked(&desc->irq_data))
 			chip->irq_mask(&desc->irq_data);
 
 		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-- 
2.40.1


