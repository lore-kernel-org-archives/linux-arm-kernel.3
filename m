Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E1DCFC518
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Nov 2025 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhOZ5JmIh1oIgeJ6cR9Q76ZGPwtpfzxdsPIXzLPxJEU=; b=sh7QEbbz1TMqXi5dTHjPP0JPjC
	IIorU1ndxcVaGVfc83HH9ANsdCCzE/8d7ls90Ai9XDvMGPFxiguJlN3qrdfqR9tUtwadFrx9vMQr1
	+mag2MCIRQdfsTVBt3K/DxUwlHEUyMm0Nm8xxQjb/RtNo3z76K0Ohpp4jHFlS3ck7bDAaxYHNTTeF
	EGINd9EDy7WxDpxjLlb4QZQaicxZsCm4YBVFfpXtqvcjwY01OFY2H8v4g1ff9rCM+p3gvrCmzCWoX
	EErtb1ugNJVDHJuNU5hOH6Tv526+1W3DdniMGJAq0peVl98+9a0+MhLwYZHcbhTTxlnh2q6MV8Bo4
	ASinZ8rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN7V5-0000000ALwU-0Zql;
	Sun, 23 Nov 2025 10:39:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vN7V4-0000000ALvx-0UKH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Nov 2025 10:39:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2967F6015B;
	Sun, 23 Nov 2025 10:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28D9C113D0;
	Sun, 23 Nov 2025 10:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763894360;
	bh=YyvJJLcgMMvpHfeF0q1qBa27/x+2KwhqR4QjVqfSxuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QLOjAMRn4oRsexQ0IXXNK/QNsLmjPdbucoLA+PmQf3cXfXJer2U1kn6YCExOWKuRQ
	 8o+es1gsKwxrFZwTOvoZd6z49/avshVcf+DE3d85kUkv7T40nKz3E9CYb8EW1CqJSy
	 UUNe4a4nyfnPOTSYBeEdR1s49uHcxxcHmSXf2uOknz72QrjJUALYS3ryM4o4vkhJ7g
	 gDtZcUOQTh0i5WZ2fZ/Xc/Me0p8HO8tg00R/o1DTjPi5Xe9qsuB/RzGqMHAmM6adIc
	 t5L/vcylGTFE6Y9K0A9RJFlduqHR3k51KRhln4gatyUYyEWf/0hTyH14OBE3HEpJg6
	 iv70jt8k4uLQg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vN7V0-00000007cYo-1rzp;
	Sun, 23 Nov 2025 10:39:18 +0000
From: Marc Zyngier <maz@kernel.org>
To: stable@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 6.12.y] KVM: arm64: Make all 32bit ID registers fully writable
Date: Sun, 23 Nov 2025 10:39:09 +0000
Message-ID: <20251123103909.3518993-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2025112021-arrest-chip-7336@gregkh>
References: <2025112021-arrest-chip-7336@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: stable@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, peter.maydell@linaro.org
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

commit 3f9eacf4f0705876a5d6526d7d320ca91d7d7a16 upstream.

32bit ID registers aren't getting much love these days, and are
often missed in updates. One of these updates broke restoring
a GICv2 guest on a GICv3 machine.

Instead of performing a piecemeal fix, just bite the bullet
and make all 32bit ID regs fully writable. KVM itself never
relies on them for anything, and if the VMM wants to mess up
the guest, so be it.

Fixes: 5cb57a1aff755 ("KVM: arm64: Zero ID_AA64PFR0_EL1.GIC when no GICv3 is presented to the guest")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Cc: stable@vger.kernel.org
Reviewed-by: Oliver Upton <oupton@kernel.org>
Link: https://patch.msgid.link/20251030122707.2033690-2-maz@kernel.org
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 61 ++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 42791971f7588..5c09c788aaa61 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2176,22 +2176,26 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 	.val = 0,				\
 }
 
-/* sys_reg_desc initialiser for known cpufeature ID registers */
-#define AA32_ID_SANITISED(name) {		\
+/* sys_reg_desc initialiser for writable ID registers */
+#define ID_WRITABLE(name, mask) {		\
 	ID_DESC(name),				\
 	.set_user = set_id_reg,			\
-	.visibility = aa32_id_visibility,	\
+	.visibility = id_visibility,		\
 	.reset = kvm_read_sanitised_id_reg,	\
-	.val = 0,				\
+	.val = mask,				\
 }
 
-/* sys_reg_desc initialiser for writable ID registers */
-#define ID_WRITABLE(name, mask) {		\
+/*
+ * 32bit ID regs are fully writable when the guest is 32bit
+ * capable. Nothing in the KVM code should rely on 32bit features
+ * anyway, only 64bit, so let the VMM do its worse.
+ */
+#define AA32_ID_WRITABLE(name) {		\
 	ID_DESC(name),				\
 	.set_user = set_id_reg,			\
-	.visibility = id_visibility,		\
+	.visibility = aa32_id_visibility,	\
 	.reset = kvm_read_sanitised_id_reg,	\
-	.val = mask,				\
+	.val = GENMASK(31, 0),			\
 }
 
 /*
@@ -2380,40 +2384,39 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 
 	/* AArch64 mappings of the AArch32 ID registers */
 	/* CRm=1 */
-	AA32_ID_SANITISED(ID_PFR0_EL1),
-	AA32_ID_SANITISED(ID_PFR1_EL1),
+	AA32_ID_WRITABLE(ID_PFR0_EL1),
+	AA32_ID_WRITABLE(ID_PFR1_EL1),
 	{ SYS_DESC(SYS_ID_DFR0_EL1),
 	  .access = access_id_reg,
 	  .get_user = get_id_reg,
 	  .set_user = set_id_dfr0_el1,
 	  .visibility = aa32_id_visibility,
 	  .reset = read_sanitised_id_dfr0_el1,
-	  .val = ID_DFR0_EL1_PerfMon_MASK |
-		 ID_DFR0_EL1_CopDbg_MASK, },
+	  .val = GENMASK(31, 0), },
 	ID_HIDDEN(ID_AFR0_EL1),
-	AA32_ID_SANITISED(ID_MMFR0_EL1),
-	AA32_ID_SANITISED(ID_MMFR1_EL1),
-	AA32_ID_SANITISED(ID_MMFR2_EL1),
-	AA32_ID_SANITISED(ID_MMFR3_EL1),
+	AA32_ID_WRITABLE(ID_MMFR0_EL1),
+	AA32_ID_WRITABLE(ID_MMFR1_EL1),
+	AA32_ID_WRITABLE(ID_MMFR2_EL1),
+	AA32_ID_WRITABLE(ID_MMFR3_EL1),
 
 	/* CRm=2 */
-	AA32_ID_SANITISED(ID_ISAR0_EL1),
-	AA32_ID_SANITISED(ID_ISAR1_EL1),
-	AA32_ID_SANITISED(ID_ISAR2_EL1),
-	AA32_ID_SANITISED(ID_ISAR3_EL1),
-	AA32_ID_SANITISED(ID_ISAR4_EL1),
-	AA32_ID_SANITISED(ID_ISAR5_EL1),
-	AA32_ID_SANITISED(ID_MMFR4_EL1),
-	AA32_ID_SANITISED(ID_ISAR6_EL1),
+	AA32_ID_WRITABLE(ID_ISAR0_EL1),
+	AA32_ID_WRITABLE(ID_ISAR1_EL1),
+	AA32_ID_WRITABLE(ID_ISAR2_EL1),
+	AA32_ID_WRITABLE(ID_ISAR3_EL1),
+	AA32_ID_WRITABLE(ID_ISAR4_EL1),
+	AA32_ID_WRITABLE(ID_ISAR5_EL1),
+	AA32_ID_WRITABLE(ID_MMFR4_EL1),
+	AA32_ID_WRITABLE(ID_ISAR6_EL1),
 
 	/* CRm=3 */
-	AA32_ID_SANITISED(MVFR0_EL1),
-	AA32_ID_SANITISED(MVFR1_EL1),
-	AA32_ID_SANITISED(MVFR2_EL1),
+	AA32_ID_WRITABLE(MVFR0_EL1),
+	AA32_ID_WRITABLE(MVFR1_EL1),
+	AA32_ID_WRITABLE(MVFR2_EL1),
 	ID_UNALLOCATED(3,3),
-	AA32_ID_SANITISED(ID_PFR2_EL1),
+	AA32_ID_WRITABLE(ID_PFR2_EL1),
 	ID_HIDDEN(ID_DFR1_EL1),
-	AA32_ID_SANITISED(ID_MMFR5_EL1),
+	AA32_ID_WRITABLE(ID_MMFR5_EL1),
 	ID_UNALLOCATED(3,7),
 
 	/* AArch64 ID registers */
-- 
2.47.3


