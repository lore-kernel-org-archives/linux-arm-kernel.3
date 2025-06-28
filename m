Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BA1C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RHtjSB09fvOHtzsz9lQI94wiYSLeTL08tUum2gnaoM=; b=Ydfe6ds6j08DatkoJk8wkEQ86d
	I3+3Mlt0Ahgt3HzzHJZPbGPIp+K6laWu3X4Ph2672ZMkI8y10dhhatS1bzqtvqXPAyFRzylhrW1Ny
	1imZBs+3HmTH8wm2ORLVvnCEXtn48RUI6tFS5qF7OEsfnC/0Cw2AX3K2Vx3h3pevKJDKsa9DtjCMd
	CFxkg/H6zVDox1mvfhjDngjQ85X/axa/6i39gRXYU6+ICtbKwN1fxUvx7NDMwTHXOBRABYbTKTBZd
	eaRX+7BC8qlM+8n9njh7yD/GNlPDjLvrhnrRbxWY1b572yDyb2xJPUKctBZkFesJ3hlVOuFLUloip
	ho5cmoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZZK-0000000H921-3Qu6;
	Sat, 28 Jun 2025 17:42:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVZNl-0000000H7Ta-12S1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 17:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 132F3A4CE4D;
	Sat, 28 Jun 2025 17:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3888C4CEEA;
	Sat, 28 Jun 2025 17:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751131827;
	bh=LTJgQeXifMFvhewXq1QziXQmUhfSC8Gh4RQFCzcAmcc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pyAcDTzCLnxhbBnq6ie4dvRqywD9yApCSndQJcRyr2M7f7vU64foxquEIZGNmvRFY
	 1iM8GgjF9k14Vf5nl6LvqUU2/LrjArPqX9l+9lB8f82/jtZSHno//oO6dbeE0hBPzZ
	 euMhMhzxyJXndom80z1ca+tr8u0yAjbfVb4aoS/9nJVKhKT0ekyH79ByX12SujhmE1
	 3akMbafBNQesEg4lSiEvdbPneLk3PlckhCyj5zItEKSnxh+O7uB7FHrL9kdh88fFH1
	 +Qf5rUnathXrF6IBi4+0oywzE1ecG59FMv9UASYUipWSE9wMZv6MqxNmssN6Vcqocn
	 cwK8FaMbbLtMw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uVZNh-00AqZC-Pf;
	Sat, 28 Jun 2025 18:30:25 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 01/12] genirq: Teach handle_simple_irq() to resend an in-progress interrupt
Date: Sat, 28 Jun 2025 18:29:54 +0100
Message-Id: <20250628173005.445013-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250628173005.445013-1-maz@kernel.org>
References: <20250628173005.445013-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, toan@os.amperecomputing.com, lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, tglx@linutronix.de
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_103029_351757_F4380163 
X-CRM114-Status: GOOD (  12.54  )
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

It appears that the defect outlined in 9c15eeb5362c4 ("genirq: Allow
fasteoi handler to resend interrupts on concurrent handling") also
affects some other less stellar MSI controllers, this time using
the handle_simple_irq() flow.

Teach this flow about irqd_needs_resend_when_in_progress(). Given
the invasive nature of this workaround, only this flow is updated.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 kernel/irq/chip.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 2b274007e8bab..6e789035919f7 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -559,7 +559,13 @@ void handle_simple_irq(struct irq_desc *desc)
 {
 	guard(raw_spinlock)(&desc->lock);
 
-	if (!irq_can_handle(desc))
+	if (!irq_can_handle_pm(desc)) {
+		if (irqd_needs_resend_when_in_progress(&desc->irq_data))
+			desc->istate |= IRQS_PENDING;
+		return;
+	}
+
+	if (!irq_can_handle_actions(desc))
 		return;
 
 	kstat_incr_irqs_this_cpu(desc);
-- 
2.39.2


