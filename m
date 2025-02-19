Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B729BC021B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uFWxq8ZSa5OHHFyTatt2D7cLS56H8zhevO7PsDXlQ2M=; b=X7KAL+vbbeea0eazjP2sB5fuJ1
	GMs3GyPSwOhI3b0KuM48aJRy0m49iKS3nW/whkeExjXzR+1e6lBuV8UDLLnyJIfqnO5y7mVKXJtyI
	266OqGyxEQYmnA1hpH7CI2E896bsdNl3JoqFLyIlMvhdzSVBAC5CopI2MdBXWOFX7SKWJ6YvEN7/7
	hV6zgt6/oT8AjXXtOvR5M4sMOrtsUTG2nYePnpIXuP2qZki6fZk+Z7s4PQ7gnqyTvoXlpWKfyNix0
	SD5L+AUnh4XONR2DVviGn2Gvqq51Ck928pk7PKrIioFDN2J8dEimqH3u4fbkN9CHXhvUQtDs2nAjV
	hu+o8AQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkn9w-0000000DtMN-1oQ1;
	Wed, 19 Feb 2025 16:42:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkn8Q-0000000DsSE-2xOw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 16:41:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C605D202C;
	Wed, 19 Feb 2025 08:41:36 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 605163F6A8;
	Wed, 19 Feb 2025 08:41:17 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 2/3] arm64/sysreg: Rename POE_RXW to POE_RWX
Date: Wed, 19 Feb 2025 16:40:28 +0000
Message-ID: <20250219164029.2309119-3-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250219164029.2309119-1-kevin.brodsky@arm.com>
References: <20250219164029.2309119-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_084118_871127_AD56964D 
X-CRM114-Status: GOOD (  15.19  )
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

It is customary to list R, W, X permissions in that order. In fact
this is already the case for PIE constants (PIE_RWX). Rename POE_RXW
accordingly, as well as POE_XW (currently unused).

While at it also swap the W/X lines in
compute_s1_overlay_permissions() to follow the R, W, X order.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/sysreg.h | 6 +++---
 arch/arm64/kernel/signal.c      | 2 +-
 arch/arm64/kvm/at.c             | 8 ++++----
 arch/arm64/mm/mmu.c             | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index c9ce4ce5131c..034e0576de5a 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1077,8 +1077,8 @@
 #define POE_RX		UL(0x3)
 #define POE_W		UL(0x4)
 #define POE_RW		UL(0x5)
-#define POE_XW		UL(0x6)
-#define POE_RXW		UL(0x7)
+#define POE_WX		UL(0x6)
+#define POE_RWX		UL(0x7)
 #define POE_MASK	UL(0xf)
 
 #define POR_ELx_BITS_PER_IDX		4
@@ -1087,7 +1087,7 @@
 #define POR_ELx_PERM_PREP(idx, perm)	(((perm) & POE_MASK) << POR_ELx_PERM_SHIFT(idx))
 
 /* Initial value for Permission Overlay Extension for EL0 */
-#define POR_EL0_INIT	POE_RXW
+#define POR_EL0_INIT	POE_RWX
 
 /*
  * Definitions for Guarded Control Stack
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index bf6226256549..a7c37afb4ebe 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -91,7 +91,7 @@ static void save_reset_user_access_state(struct user_access_state *ua_state)
 		u64 por_enable_all = 0;
 
 		for (int pkey = 0; pkey < arch_max_pkey(); pkey++)
-			por_enable_all |= POR_ELx_PERM_PREP(pkey, POE_RXW);
+			por_enable_all |= POR_ELx_PERM_PREP(pkey, POE_RWX);
 
 		ua_state->por_el0 = read_sysreg_s(SYS_POR_EL0);
 		write_sysreg_s(por_enable_all, SYS_POR_EL0);
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 3a96c96816e9..f74a66ce3064 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1090,22 +1090,22 @@ static void compute_s1_overlay_permissions(struct kvm_vcpu *vcpu,
 		break;
 	}
 
-	if (pov_perms & ~POE_RXW)
+	if (pov_perms & ~POE_RWX)
 		pov_perms = POE_NONE;
 
 	if (wi->poe && wr->pov) {
 		wr->pr &= pov_perms & POE_R;
-		wr->px &= pov_perms & POE_X;
 		wr->pw &= pov_perms & POE_W;
+		wr->px &= pov_perms & POE_X;
 	}
 
-	if (uov_perms & ~POE_RXW)
+	if (uov_perms & ~POE_RWX)
 		uov_perms = POE_NONE;
 
 	if (wi->e0poe && wr->uov) {
 		wr->ur &= uov_perms & POE_R;
-		wr->ux &= uov_perms & POE_X;
 		wr->uw &= uov_perms & POE_W;
+		wr->ux &= uov_perms & POE_X;
 	}
 }
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 69a83a77ccce..3c54dea1303f 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1555,7 +1555,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
 #ifdef CONFIG_ARCH_HAS_PKEYS
 int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long init_val)
 {
-	u64 new_por = POE_RXW;
+	u64 new_por;
 	u64 old_por;
 
 	if (!system_supports_poe())
@@ -1570,7 +1570,7 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey, unsigned long i
 		return -EINVAL;
 
 	/* Set the bits we need in POR:  */
-	new_por = POE_RXW;
+	new_por = POE_RWX;
 	if (init_val & PKEY_DISABLE_WRITE)
 		new_por &= ~POE_W;
 	if (init_val & PKEY_DISABLE_ACCESS)
-- 
2.47.0


