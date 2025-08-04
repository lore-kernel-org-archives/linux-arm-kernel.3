Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6B8C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 12:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=geYI5r4g90DV9rYt+OxQy3vXhiwacoRfngbL0KKChek=; b=f+oh42eUR3r/e01wcFU7MWTghb
	x8v3JR76uF/aPh8DL2lAMRFA9CTDZqvs4YdC/aM8H/gNxEKAqecyZoHwl6eq6m4I6EP3dmR/xLTJs
	VD+sie9EVGfN0hnaLIQKKQAzJQ51f+BIOAyJ/Q1CKH16EK0h+OEYD3R9t0BNoy0HTNRiz2ak/YQt1
	lNQgmKttdBGri07i4O4iemPqJbjJFFS8RyCEEd3iQ1kZxtqq8A5RWg9PpjM/C82SZrxtuW1QhZCNa
	4c7pvcbjhaGd5k4KCFdhplNAvfQQHdLepq3yYEj0Qf+9DMIkcx0S4aW+W1XJDMdMcrHbNwS8hxHHi
	jKm+Y+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiuZZ-0000000APl4-2kzE;
	Mon, 04 Aug 2025 12:45:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiu8i-0000000ALrm-3u0e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 12:18:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91355150C;
	Mon,  4 Aug 2025 05:17:53 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E987D3F738;
	Mon,  4 Aug 2025 05:17:57 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	broonie@kernel.org,
	oliver.upton@linux.dev,
	anshuman.khandual@arm.com,
	robh@kernel.org,
	james.morse@arm.com,
	mark.rutland@arm.com,
	joey.gouly@arm.com,
	ry111@xry111.site,
	Dave.Martin@arm.com,
	ahmed.genidi@arm.com,
	kevin.brodsky@arm.com,
	scott@os.amperecomputing.com,
	mbenes@suse.cz,
	james.clark@linaro.org,
	frederic@kernel.org,
	rafael@kernel.org,
	pavel@kernel.org,
	ryan.roberts@arm.com,
	suzuki.poulose@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 08/11] KVM: arm64: initialise SCTLR2_EL1 at __kvm_host_psci_cpu_entry()
Date: Mon,  4 Aug 2025 13:17:21 +0100
Message-Id: <20250804121724.3681531-9-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804121724.3681531-1-yeoreum.yun@arm.com>
References: <20250804121724.3681531-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_051805_016688_69B40A1E 
X-CRM114-Status: UNSURE (   7.99  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

initialise SCTLR2_EL1 at __kvm_host_psci_cpu_entry().

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kvm/hyp/nvhe/psci-relay.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index c3e196fb8b18..4ed4b7fa57c2 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -4,6 +4,7 @@
  * Author: David Brazdil <dbrazdil@google.com>
  */

+#include <asm/alternative.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
@@ -219,6 +220,8 @@ asmlinkage void __noreturn __kvm_host_psci_cpu_entry(bool is_cpu_on)
 		release_boot_args(boot_args);

 	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
+	if (alternative_has_cap_unlikely(ARM64_HAS_SCTLR2))
+		write_sysreg_el1(INIT_SCTLR2_EL1, SYS_SCTLR2);
 	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);

 	__host_enter(host_ctxt);
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


