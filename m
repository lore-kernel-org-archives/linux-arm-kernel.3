Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E63C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 09:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZDGAXyTX7LfQdlsko5D9x0y+vsnSqTD/XMbMExp4VM=; b=qU0/29+7SOgl6YGQMidZCr578/
	M/Gbf5Jn/YHPWuMzTmBHg8uvXxqELGrmAX1LK6tH/tnppRDvjW1RzrX82chVcHe5BBhSeDrYQsPXk
	iJFKkPNQPXvKb7KpKIMS4mD+0ddKc8K7wm76Jebx6m2p5lYqnL/30Em/aHkD0GcgE89Q96QColKqm
	9Ihz/Vfn/ALnWZCR6vQyfXo0t2juDoqMhPHil+tPk6EZ/ZjWsQF/MCrvjj/70fNCToClQ6o+Z3qUx
	wHs4QMMADmsVZC30E0oijVc+vpxcjADTJTAF0SuIcXv4mJrS3M7Ln76MxTaPP/ys1ItBJy9iJPwbv
	etxZg7Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3S4-000000073Ot-2HdH;
	Sun, 11 May 2025 09:58:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE3M6-000000072fr-3yfJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 09:52:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FC211BF7;
	Sun, 11 May 2025 02:52:09 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CA8D83F5A1;
	Sun, 11 May 2025 02:52:19 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	mark.rutland@arm.com
Subject: [BOOT-WRAPPER PATCH 1/3] aarch64: shuffle ID_AA64PFR{0,1}_EL1 definitions
Date: Sun, 11 May 2025 10:52:09 +0100
Message-Id: <20250511095211.1638852-2-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250511095211.1638852-1-mark.rutland@arm.com>
References: <20250511095211.1638852-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_025223_023608_B53360C1 
X-CRM114-Status: UNSURE (   7.80  )
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

Usually the ID register definitions are sorted alphanumerically, but for
historical reasons the ID_AA64PFR0_* definitions are placed before the
ID_AA64PFR1_* definitions. Reorder these for consistency.

There should be no functional change as a result of this patch.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/aarch64/include/asm/cpu.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index b04bf71..22d6cbf 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -116,15 +116,15 @@
 #define ID_AA64MMFR3_EL1_S2POE		BITS(23, 20)
 #define ID_AA64MMFR3_EL1_D128		BITS(35, 32)
 
+#define ID_AA64PFR0_EL1_RAS		BITS(31, 28)
+#define ID_AA64PFR0_EL1_SVE		BITS(35, 32)
+#define ID_AA64PFR0_EL1_CSV2		BITS(59, 56)
+
 #define ID_AA64PFR1_EL1_MTE		BITS(11, 8)
 #define ID_AA64PFR1_EL1_SME		BITS(27, 24)
 #define ID_AA64PFR1_EL1_CSV2_frac	BITS(35, 32)
 #define ID_AA64PFR1_EL1_THE		BITS(51, 48)
 
-#define ID_AA64PFR0_EL1_RAS		BITS(31, 28)
-#define ID_AA64PFR0_EL1_SVE		BITS(35, 32)
-#define ID_AA64PFR0_EL1_CSV2		BITS(59, 56)
-
 #define ID_AA64SMFR0_EL1		s3_0_c0_c4_5
 #define ID_AA64SMFR0_EL1_FA64		BIT(63)
 
-- 
2.30.2


