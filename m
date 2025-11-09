Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58AECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WrfTtYu+neBVOo8Yr89kHI5FGemNtiV+gOhT6mwjBDk=; b=RjNmrX5x9yo+7YB/z3tJVO2tZY
	O4cRexHqkzV3Ca8p6s5c2Y7XO2A9WExjwIgkha5j6453hvNtjd9mqUBcbg4bu+kotqmFOaRVLtaPz
	/AktE4lXrGMPwcjSTTeJOzGHCiUqE5H6Q6pBDKP8QIUAA5VvMBtPhGxjoBzh9KLwuiSgkfxrOOZkt
	OTOPqRBlpk+vKOtr5Tr7qJZcsap15R0v3XZua87FR/DZZjsksbt4UrdvZ47/vxgwiUCY/1T40IzRd
	4JUpwwdtwgFPAJ3Goj+526Gxor9p6lNoXMeo4Pw/l/z/Yv1x6jGExWA7EVh8zGYMOY+hiIVGRXmOf
	ZJjujSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI930-00000004Dx9-1pw6;
	Sun, 09 Nov 2025 17:17:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI91s-00000004CFz-2I8f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:16:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F013417CD;
	Sun,  9 Nov 2025 17:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46C7DC116B1;
	Sun,  9 Nov 2025 17:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762708600;
	bh=tjNmKU1meI4A1Tgmx3bRMLobb68RBVy0q+KixZuhdFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S4nvcYCABAOJdsJH918iVn1BdxxNr2lJVDMSFmVz5g8Pb1AYkfVEpDH9bbUc+kVHR
	 YuUm5TWN9ZP03N4MPmsa6ENSE+enE/fAo1OxpSrdNbyqn/OM7xRx8f2Qh8aPuHV96t
	 PU0Ibhk73F1ymaFhQYkmdd29zmRO8ZlUZgxI9nTCxjkpap6cboeh1kQM+4WQTO9xWO
	 a/7YXnnLiRWFpOagrCV/GZUSq2BCDXwFLzqoteV0uCBIGQYXil87BscfhGheibaUyN
	 agJa+OwwUgeLaujLOT4pHug7HuKie2muBjDNW/HmyLS8dSAYkNCkrTGxiKaqjBdemd
	 99cjeIXpxwEZQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vI91q-00000003exw-1VnV;
	Sun, 09 Nov 2025 17:16:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v2 41/45] KVM: arm64: selftests: vgic_irq: Remove LR-bound limitation
Date: Sun,  9 Nov 2025 17:16:15 +0000
Message-ID: <20251109171619.1507205-42-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251109171619.1507205-1-maz@kernel.org>
References: <20251109171619.1507205-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_091640_624037_6E82829F 
X-CRM114-Status: GOOD (  12.26  )
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


