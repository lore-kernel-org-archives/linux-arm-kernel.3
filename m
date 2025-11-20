Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CF7CF9C51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4c9YjEsdZFz1nUEJOv8OIeiWdYz9vwGhWThZBNSRfI=; b=azJy3HalttFMDJCCaEDMOhQ1xI
	+nvkk1LXiUxVyVbP4GEuB1e4ADP29U0vVDY/VVScyVANTHy/MDNekwwLlwHw42RU5fvMlxo5CJz1z
	kIJM0J0MVoiPw54yuAgGkQCmzEg4f6Fz54srHC0Ku8AIjLcQwulLbrZf1YaQ9beu2RfDNtc1u6aYF
	EPbvijuNvDMZpIKUAbXsYMvn4XWEJgMyQKRf+ItvAhIz4F7D0+N3UdpnZ9t/9LXxrqLPTt48iWWPx
	ffL6fDDVPGtuE/s7lmpTFSJZmVP2M79yAjcnyLti/LSq9zZQFylN746uw2PKAkM8Q1KgOzZ4cYPa8
	3ukdyGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Qc-000000076kO-3fLI;
	Thu, 20 Nov 2025 17:26:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q4-000000075is-06B4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 17:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74D8060216;
	Thu, 20 Nov 2025 17:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5B7C116C6;
	Thu, 20 Nov 2025 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659567;
	bh=jCvnrPftqEsyiN8DzIt9mFf2b52ipWjvxmhQO/3Ya7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WG+chxVVuHYkoRKjfub2O11OUQjMEwtg/bBlsKDOc6o/oGqwb6VkP39uGeMJcjVot
	 bMDttdKRMsCu/xXc3SC2+ueuA6WmN6FzK8noP/zGiLPwN6oBewEztjMmUZjvEHbYEM
	 6lsK9Gof6/0oYFexienEzveargf9GLgzMjdJxNpL4w0C5XGIU719FiPNGSK6deZaG1
	 CYocKgLCOybRcY2DjJsPD7zALlU1I8dD9YxBIqMZgEUGqPNGOtcbtrSt+BsSBmsuMO
	 tLdqzM/BmjXfxJjUBgrBT4kkdAvTe0mR1br+5ACnNtFSKUNh8OIHkYab3WTV8afGJY
	 w1RV/zAYxAgGQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Q1-00000006y6g-1ZVw;
	Thu, 20 Nov 2025 17:26:05 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 45/49] KVM: arm64: selftests: vgic_irq: Remove LR-bound limitation
Date: Thu, 20 Nov 2025 17:25:35 +0000
Message-ID: <20251120172540.2267180-46-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Good news: our GIC emulation is not completely broken, and we can
activate as many interrupts as we want.

Bump the test to cover all the SGIs, all the allowed PPIs, and
31 SPIs. Yes, 31, because we have 31 available priorities, and the
test is not happy with having two interrupts with the same priority.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index b0415bdb89524..9d4761f1a3204 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -449,12 +449,6 @@ static void test_injection_failure(struct test_args *args,
 
 static void test_preemption(struct test_args *args, struct kvm_inject_desc *f)
 {
-	/*
-	 * Test up to 4 levels of preemption. The reason is that KVM doesn't
-	 * currently implement the ability to have more than the number-of-LRs
-	 * number of concurrently active IRQs. The number of LRs implemented is
-	 * IMPLEMENTATION DEFINED, however, it seems that most implement 4.
-	 */
 	/* Timer PPIs cannot be injected from userspace */
 	static const unsigned long ppi_exclude = (BIT(27 - MIN_PPI) |
 						  BIT(30 - MIN_PPI) |
@@ -462,26 +456,25 @@ static void test_preemption(struct test_args *args, struct kvm_inject_desc *f)
 						  BIT(26 - MIN_PPI));
 
 	if (f->sgi)
-		test_inject_preemption(args, MIN_SGI, 4, NULL, f->cmd);
+		test_inject_preemption(args, MIN_SGI, 16, NULL, f->cmd);
 
 	if (f->ppi)
-		test_inject_preemption(args, MIN_PPI, 4, &ppi_exclude, f->cmd);
+		test_inject_preemption(args, MIN_PPI, 16, &ppi_exclude, f->cmd);
 
 	if (f->spi)
-		test_inject_preemption(args, MIN_SPI, 4, NULL, f->cmd);
+		test_inject_preemption(args, MIN_SPI, 31, NULL, f->cmd);
 }
 
 static void test_restore_active(struct test_args *args, struct kvm_inject_desc *f)
 {
-	/* Test up to 4 active IRQs. Same reason as in test_preemption. */
 	if (f->sgi)
-		guest_restore_active(args, MIN_SGI, 4, f->cmd);
+		guest_restore_active(args, MIN_SGI, 16, f->cmd);
 
 	if (f->ppi)
-		guest_restore_active(args, MIN_PPI, 4, f->cmd);
+		guest_restore_active(args, MIN_PPI, 16, f->cmd);
 
 	if (f->spi)
-		guest_restore_active(args, MIN_SPI, 4, f->cmd);
+		guest_restore_active(args, MIN_SPI, 31, f->cmd);
 }
 
 static void guest_code(struct test_args *args)
-- 
2.47.3


