Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E35AC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8fuaCOyRTWXJGQpe+LY3cOq0r0pHJ9P9FMQOSh2CCw=; b=kFul4CTA9T8u9ul1iBU1eglgy2
	DdDy5COWyNmdT8adXPrvZ5lf140yItia705xgMLlnMUbMhwWyNqw0rsOPFfYq+XqGSIi/Zved/7eL
	dWflkxO/NZuWWmt/jTa/IykE+5SAcx9Poef0dPxv1SSm8rta5zywAWEnLs4CCNXL7Rv4UX7pmosN4
	ihcKLHmKwZvwk1XdwobTDCrwu5M0bJGLdfeZBaZ2uwJXgnRG8ULzlPQaXrKRAHdt7L74zpH4m35wu
	KcEdmwm0k/xlr3Z2UhHB+QPOwmVGTfa/M26T5JaMqTUptPzaFS/bzYdXEWKusCBq3LnxueSLSJi5z
	Jdewl2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetdd-0000000F73Y-34Uf;
	Mon, 03 Feb 2025 10:25:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetYb-0000000F5zR-3kIN
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=j8fuaCOyRTWXJGQpe+LY3cOq0r0pHJ9P9FMQOSh2CCw=; b=YVdGykgbGFqNZ4wGWQIl7CkBXj
	W9aZW/wtiVQ6T2Srn1NW4D4mbCNhAsGw/agIuv5077MFq2QXLxlv/FR34/S55SoCYCKiUjWdZYJ19
	2b7/ZvBg/+llGH61KfTAA2y/EKi2IgV+i0CqQEczACPcoCZ6kVEGWqKW5sbn9lbvMJQfNh4DN48F/
	tP1XvPJ3IR8uJ01Dh5wDk59k4+dj0cgEVA2HIpIVy4MDF9ezw3cOUgaWIt8+6oVU86pwi180e5qaj
	JCseX42FVebn0V+MKUlUT6jPa9uuZ3CKFIrjT0QaS/hpVDHF3ucFgAML75wO9kRFTsaX3P5VD1XP4
	mDru9y+Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetYY-0000000G3R3-1GUU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:19:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBC3B1A32;
	Mon,  3 Feb 2025 02:20:17 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 066F33F63F;
	Mon,  3 Feb 2025 02:19:49 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH v3 03/15] arm64: mm: Enable overlays for all EL1 indirect permissions
Date: Mon,  3 Feb 2025 10:18:27 +0000
Message-ID: <20250203101839.1223008-4-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250203101839.1223008-1-kevin.brodsky@arm.com>
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_101955_064024_157B7E21 
X-CRM114-Status: GOOD (  10.77  )
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

In preparation of using POE inside the kernel, enable "Overlay
applied" for all stage 1 base permissions in PIR_EL1. This ensures
that the permissions set in POR_EL1 affect all kernel mappings.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable-prot.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index a95f1f77bb39..7c0c30460900 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -181,13 +181,13 @@ static inline bool __pure lpa2_is_enabled(void)
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_EXECONLY),      PIE_NONE_O) | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY_EXEC), PIE_R)      | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RW)     | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY),      PIE_R)      | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED),        PIE_RW)     | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL_ROX),    PIE_RX)     | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL_EXEC),   PIE_RWX)    | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL_RO),     PIE_R)      | \
-	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL),        PIE_RW))
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY_EXEC), PIE_R_O)    | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RW_O)   | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY),      PIE_R_O)    | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED),        PIE_RW_O)   | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL_ROX),    PIE_RX_O)   | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL_EXEC),   PIE_RWX_O)  | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL_RO),     PIE_R_O)    | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_KERNEL),        PIE_RW_O))
 
 #endif /* __ASM_PGTABLE_PROT_H */
-- 
2.47.0


