Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7C9FEFB5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxTrrE0E3UoXrwEHziSM2Npiy7n4rR0xwwZ0iUDxyw0=; b=m4ACbpxvnaffhwmaWFifogcRak
	dbBPcNLOADOUX7875/2tgjltI2J+AhqWoUMV1nXfwzczVYeuFlNRMjnAjaJ/Y/EcUvjNGtC5ZjgCz
	6iU3Ws2FsyYoHXH5mJLpTzvt6ph3jTs/Cde71FhNbyc24iFWcjrFDXaTjXcljnqZfQrgmMQB2+Lmj
	vVpWNXzgFMjXFjsYWGYAiE0y7etp0yETXpt90gR4fFU2hhRsYO5a8K5LAYmY3upd6mCW9ItDPCrO8
	TOBX7XdEKi8o/m+n0godDKNi7RN6cIju7JQ55kwH8K3gsksEfPbTtf6UrZlNI0MDG3cE+4pPUQizt
	E0o9oJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzbW-00000008aBo-3JUM;
	Fri, 27 Feb 2026 15:18:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzbK-00000008a1a-3jWX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:17:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 318A01516;
	Fri, 27 Feb 2026 07:17:52 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F4933F73B;
	Fri, 27 Feb 2026 07:17:55 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oupton@kernel.org,
	miko.lenczewski@arm.com,
	kevin.brodsky@arm.com,
	broonie@kernel.org,
	ardb@kernel.org,
	suzuki.poulose@arm.com,
	lpieralisi@kernel.org,
	joey.gouly@arm.com,
	yuzenghui@huawei.com,
	yeoreum.yun@arm.com
Subject: [PATCH v15 7/8] KVM: arm64: use CAST instruction for swapping guest descriptor
Date: Fri, 27 Feb 2026 15:17:04 +0000
Message-Id: <20260227151705.1275328-8-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227151705.1275328-1-yeoreum.yun@arm.com>
References: <20260227151705.1275328-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_071758_963220_0AADF17C 
X-CRM114-Status: GOOD (  11.87  )
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

Use the CAST instruction to swap the guest descriptor when FEAT_LSUI
is enabled, avoiding the need to clear the PAN bit.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kvm/at.c | 42 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 885bd5bb2f41..e49d2742a3ab 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -9,6 +9,7 @@
 #include <asm/esr.h>
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
+#include <asm/lsui.h>
 
 static void fail_s1_walk(struct s1_walk_result *wr, u8 fst, bool s1ptw)
 {
@@ -1704,6 +1705,43 @@ int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
 	}
 }
 
+static int __lsui_swap_desc(u64 __user *ptep, u64 old, u64 new)
+{
+	u64 tmp = old;
+	int ret = 0;
+
+	/*
+	 * FEAT_LSUI is supported since Armv9.6, where FEAT_PAN is mandatory.
+	 * However, this assumption may not always hold:
+	 *
+	 *   - Some CPUs advertise FEAT_LSUI but lack FEAT_PAN.
+	 *   - Virtualisation or ID register overrides may expose invalid
+	 *     feature combinations.
+	 *
+	 * Rather than disabling FEAT_LSUI when FEAT_PAN is absent, wrap LSUI
+	 * instructions with uaccess_ttbr0_enable()/disable() when
+	 * ARM64_SW_TTBR0_PAN is enabled.
+	 */
+	uaccess_ttbr0_enable();
+
+	asm volatile(__LSUI_PREAMBLE
+		     "1: cast	%[old], %[new], %[addr]\n"
+		     "2:\n"
+		     _ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w[ret])
+		     : [old] "+r" (old), [addr] "+Q" (*ptep), [ret] "+r" (ret)
+		     : [new] "r" (new)
+		     : "memory");
+
+	uaccess_ttbr0_disable();
+
+	if (ret)
+		return ret;
+	if (tmp != old)
+		return -EAGAIN;
+
+	return ret;
+}
+
 static int __lse_swap_desc(u64 __user *ptep, u64 old, u64 new)
 {
 	u64 tmp = old;
@@ -1779,7 +1817,9 @@ int __kvm_at_swap_desc(struct kvm *kvm, gpa_t ipa, u64 old, u64 new)
 		return -EPERM;
 
 	ptep = (u64 __user *)hva + offset;
-	if (cpus_have_final_cap(ARM64_HAS_LSE_ATOMICS))
+	if (cpus_have_final_cap(ARM64_HAS_LSUI))
+		r = __lsui_swap_desc(ptep, old, new);
+	else if (cpus_have_final_cap(ARM64_HAS_LSE_ATOMICS))
 		r = __lse_swap_desc(ptep, old, new);
 	else
 		r = __llsc_swap_desc(ptep, old, new);
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


