Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5796CCFD377
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6vak7hUnY/mgENvQk9VnnCYTDjzSaDicqFjgbOl/hZ0=; b=3xapcrbymt0Qk+YocHke6EscSK
	JHzm41e2ojJkm3ZBQzbhif6xfO9/3Q2bbXbLG2Y4bVcEqAfjlYoosu0qGE6DkFIZsgGnHh0rDDseS
	2KjXWd7hNCat2i1MNV8ok+u5tHU0wo75OmU9rZ56/hf367KLb0+l/C22ggodMkLWoB+wtYIQ4p6TJ
	nkRbNLcpmwKQKzuUe6TvLny652bDqZgffSOfIi+Mqn9CotUgoX7LbcqXZQBxr+q8X6jdbc9xMUGGL
	LGvVa7wQYZtEmSEUp0hevRAY3FeDICBAm4lgSew7btFaM7xKq5fEq07LG8z57OjeWgrKW5Aop8C4T
	DY3UR6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqGz-0000000D7uM-3aXt;
	Tue, 25 Nov 2025 10:27:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqGx-0000000D7tt-1TZU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 10:27:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A38114BF;
	Tue, 25 Nov 2025 02:27:38 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75C643F86F;
	Tue, 25 Nov 2025 02:27:44 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v1] arm64/sysreg: Remove unused define ARM64_FEATURE_FIELD_BITS
Date: Tue, 25 Nov 2025 10:27:32 +0000
Message-ID: <20251125102732.1494863-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_022747_435696_10BECED2 
X-CRM114-Status: UNSURE (   9.53  )
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

The define ARM64_FEATURE_FIELD_BITS is now unused and feature id
fields don't always have 4 bits. Remove it.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
It is still used in tools/testing/selftests/kvm/arm64/set_id_regs.c
but this uses the define in tools/arch/arm64/include/asm/sysreg.h.
I have submitted a separate patch to remove it from these as well:

https://lore.kernel.org/kvmarm/20251125101207.1492580-2-ben.horgan@arm.com/

Based on Linux 6.18-rc4
---
 arch/arm64/include/asm/sysreg.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index c231d2a3e515..1f3303d09a27 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1129,8 +1129,6 @@
 #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
 #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
 
-#define ARM64_FEATURE_FIELD_BITS	4
-
 #ifdef __ASSEMBLY__
 
 	.macro	mrs_s, rt, sreg
-- 
2.43.0


