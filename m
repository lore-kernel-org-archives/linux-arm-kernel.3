Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60357C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lhvJ8Eik80LP8a8sp3r1jlq/XIlZIGTy2Q7808FitFE=; b=y53FXLM/fOhHDqBA65GTg2ODBJ
	Fn63R34iA84u6sl3uVF6OQS+vJMPoj9jdnjHjE/nZcsT6CcwviqU3fw6X9aMqXRjbBcTkDX98by0O
	p0qk+iqRFTete1bvgThMKT9SHGk0IKK+JOicLce13rd87tA1Am4cSEGIAt5BFaba6yrUWOSyim+wH
	qPvkoJK1j9ZNSnNVz4x4VbphvSfHNqZAlPjEhYmXW8sRLizAxDSyBF22ukh/52aMbK7lNvsUuKE/L
	p36YMAG4vDghN7rMgr0YK7iHH6f7HTdGU4tftYNFSLdXXWyKcaAxs5r8BfywSMJpVLHxDkkstbokj
	spGSavFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zI-0000000FhT7-2FTT;
	Wed, 12 Aug 2026 09:11:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zE-0000000FhRs-1Vu4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:11:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 75BB360A85;
	Wed, 12 Aug 2026 09:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66151F00A3A;
	Wed, 12 Aug 2026 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786525859;
	bh=lhvJ8Eik80LP8a8sp3r1jlq/XIlZIGTy2Q7808FitFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BQbiAfF0bwsuIUbKdsqDjpMVxLrUMFiD0H3KYfJYvNRSd8UuMErUIb6zHeqJZCfIY
	 nkwEGj6s30WfLU3wEn+1g6aQXlabLRjx0riU+Zl7a8ZKtIyhMFuxi++w8YlwUIrNMj
	 xiUL/C1f2A3LF4BceJo2Q34BsTay2dtjsZ9HigK/DSPPJ8VB+QvfON83O7e471WHwO
	 a+vuJxfMU/e+x0XO4p5hiSoOcNeaahzmCMEYAJoq0+QYIAaRZBoAI0wSAh5RJ6bNjT
	 U+HF3kiAjTJvgEamm4gItFSwJTmpifJCP7jWSUOKCHayvJWe4y+KtMTeMAv9t2EqdF
	 2PB6S4EVNGGQQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 12 Aug 2026 11:10:29 +0200
Subject: [PATCH 1/7] irqchip/gic-v5: Check get_logical_index() return value
 in MADT IAFFID parsing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-gicv5-7-2-fixes-v1-1-3743e82c69a4@kernel.org>
References: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
In-Reply-To: <20260812-gicv5-7-2-fixes-v1-0-3743e82c69a4@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Jonathan Cameron <jic23@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>
Cc: Sascha Bischoff <Sascha.Bischoff@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15.2
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

In gic_acpi_parse_iaffid() a given MADT GICC entry might not correspond
to a logical cpu recognized by the kernel, resulting in the cpu variable
initialization to an error value.

Currently, the get_logical_index() return value is not checked for failure,
which might result in out-of-bounds memory corruption while trying to
index a per_cpu variable array.

Add a check to evaluate get_logical_index() return value.

Fixes: 35866efa52fe ("irqchip/gic-v5: Add ACPI IRS probing")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Link: https://sashiko.dev/#/message/20260810104747.E5CE71F000E9%40smtp.kernel.org
---
 drivers/irqchip/irq-gic-v5-irs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
index 3028a8bbbf68..0bd9ae9ae12e 100644
--- a/drivers/irqchip/irq-gic-v5-irs.c
+++ b/drivers/irqchip/irq-gic-v5-irs.c
@@ -874,6 +874,8 @@ static int __init gic_acpi_parse_iaffid(union acpi_subtable_headers *header,
 		return 0;
 
 	cpu = get_logical_index(gicc->arm_mpidr);
+	if (cpu < 0)
+		return 0;
 
 	if (gicc->iaffid & ~GENMASK(current_iaffid_bits - 1, 0)) {
 		pr_warn("CPU %d iaffid 0x%x exceeds IRS iaffid bits\n", cpu, gicc->iaffid);

-- 
2.53.0


