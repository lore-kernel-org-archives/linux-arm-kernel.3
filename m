Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45945C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PcEitUQ7aBgp23U4uLLQhI5MWC7RTaqbg7d+dJwBmfA=; b=EK+09cAU1Col51
	Ah8HG2/aCa3pF3mZqg1QzSkxikEHg+NLhtbKzqKuVACgyblH7vh6G3Pftulcx2qWwDfaLGdX42Qw7
	EaIxr7rkKy8A0BI6TCgaOlnN+MP8Ysh3zSoavlusfPTferCP0/c31yaK9qgACUCj98o1wFF/q11yL
	+Gkn/BarJ4UFB2gHprP3xkNKFgI5XjOSwqzF3gk22x0yDJYPpq+9S5+GhPH2WSjBy6JmBFv/zhVhv
	dpnrIeA9Wuv9HsYOMCdJ9WC5lNEsz90AEJNWYfPqHpUbDTRFlZwYI1hrd0xgNEtP82gIOula/cWWq
	IVtLArfVhmFhidaK9vUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneP-00000002LQ7-41d6;
	Thu, 09 Jul 2026 12:14:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whneB-00000002L2t-0r1E
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 12:14:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D0ED1476;
	Thu,  9 Jul 2026 05:14:26 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 198473F66F;
	Thu,  9 Jul 2026 05:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783599270; bh=PfMzUp8Ln9LlpEiUiLTk6yFc58iA5EoxyYS31nwn9Z8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mF9d61aULYPfStKUkCdzKcY+Dp88fXlHMIzxJYjMPPQwQBFlTYvqkVpHRPv5gIfu8
	 5no8W/AoaIbo2DBzDhzhnA9maoFxolmqp6dVlHZrMaMib7VrdKFfWvo8WIFcvfTUnV
	 8QqD6COUAJ6xMhBtqoJGWHL1Ea10e5DFS4PkneQ4=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 25/36] arm64: sysreg: Add definitions for immediate versions of MSR ALLINT
Date: Thu,  9 Jul 2026 13:13:22 +0100
Message-Id: <20260709121333.23507-26-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260709121333.23507-1-vladimir.murzin@arm.com>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_051431_293657_4855BF24 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, maz@kernel.org, ruanjinjie@huawei.com, Mark Brown <broonie@kernel.org>, catalin.marinas@arm.com, will@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Mark Brown <broonie@kernel.org>

Encodings are provided for ALLINT which allow setting of ALLINT.ALLINT
using an immediate rather than requiring that a register be loaded with
the value to write. Since these don't currently fit within the scheme we
have for sysreg generation add manual encodings like we currently do for
other similar registers such as SVCR.

Since it is required that these immediate versions be encoded with xzr
as the source register, provide asm wrappers which ensure this is the
case.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/interrupts/common_flags.h | 16 ++++++++++++++++
 arch/arm64/include/asm/sysreg.h                  |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
index 6ce60d1519e8..72ed6e75d146 100644
--- a/arch/arm64/include/asm/interrupts/common_flags.h
+++ b/arch/arm64/include/asm/interrupts/common_flags.h
@@ -44,6 +44,22 @@ typedef enum arm64_exc_context {
 	CRITICAL_CONTEXT,
 } arm64_exc_context_t;
 
+
+#ifdef CONFIG_ARM64_NMI
+static __always_inline void _allint_clear(void)
+{
+	asm volatile(__msr_s(SYS_ALLINT_CLR, "xzr"));
+}
+
+static __always_inline void _allint_set(void)
+{
+	asm volatile(__msr_s(SYS_ALLINT_SET, "xzr"));
+}
+#else
+static __always_inline void _allint_clear(void) {}
+static __always_inline void _allint_set(void) {}
+#endif /* CONFIG_ARM64_NMI */
+
 static __always_inline
 arm64_exc_hwstate_t __arm64_exc_hwstate_of_process_context(void)
 {
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 7aa08d59d494..6d2c6bc1b985 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -179,6 +179,8 @@
  * System registers, organised loosely by encoding but grouped together
  * where the architected name contains an index. e.g. ID_MMFR<n>_EL1.
  */
+#define SYS_ALLINT_CLR			sys_reg(0, 1, 4, 0, 0)
+#define SYS_ALLINT_SET			sys_reg(0, 1, 4, 1, 0)
 #define SYS_SVCR_SMSTOP_SM_EL0		sys_reg(0, 3, 4, 2, 3)
 #define SYS_SVCR_SMSTART_SM_EL0		sys_reg(0, 3, 4, 3, 3)
 #define SYS_SVCR_SMSTOP_SMZA_EL0	sys_reg(0, 3, 4, 6, 3)
-- 
2.34.1


