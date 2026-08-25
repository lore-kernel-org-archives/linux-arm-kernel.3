Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF52C61DCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 20:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsilY3pcpndhM3GC4RwYhLVg2Hao2DERRjYOE6c8cGs=; b=XWI8Nppsiqk0gFIGL5o3fu1IPy
	helOMk8GWZR/L4tXJ9VfOJf/eQpUlIqJxs4tUx/576pPGjJWQsbgHCYBJ3l3s3GrypiJ9Yk7MAPE+
	yfwP4ddlDhS0uTjc0S17IPDgmpXNYGvDaw9ZkIu6UoVL9KJwVYT++RrRd1WRI2eQJ2H8/yec4ZtCG
	Dp3HSeowWyI/trTAGTbODNGzf8q2dAibryFjk8sv82l++IhdEY6l+dqvGb6fbRuZHRGgR8CaOepIK
	v7i3p3BLohcBiXevb0Sn8oBBTJLNsuOxpYHQPc7j+p25ejyxWxk83/IUVz2wyUI4Z1nFAmVJedrN2
	J5qOCwBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyET-00000001SuP-01vs;
	Tue, 25 Aug 2026 20:58:57 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyyEO-00000001Sqi-2jcV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 20:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691521; bh=lsilY3pcpndhM3GC4RwYhLV
	g2Hao2DERRjYOE6c8cGs=; b=M/MJ/HBJQ+4UZ1l2RmvSWPYWAdLvK1ycEm6DJFK77zBV+/S4HJ
	qDILleprP2JdyH30UwU9m8coRmGG4XSBHeXVY1hhp61z0HryRse029NvNgD7+3VX1xaVkQ4PN3e
	k0NhCq+taS+LjWUAXdqtFzuqe0LTucSqHGUknu8WSkn3CZRotJ7EgNyZXdHq4cywUYpFBJtab9y
	6sSHak8wAU37OGY4CInzGRs5o3s/MfbwlZGAmha53EHwm0FoMfSMkeIk5Z/vJN1zKw4u1wsBmU8
	2DdQNy7rHg/0JvlRHYvhui6oEnAw1K5zyHZ4IQbz6YCAServ0sOm/mMSMohp9e9xPVQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1787691521; bh=lsilY3pcpndhM3GC4RwYhLV
	g2Hao2DERRjYOE6c8cGs=; b=N72sBd+3MF91/FwudEKpSBdcsaleaQ35HTU+sLGJkMxythNVye
	aiDzIDzeuURnn0PYqGf944r5kwDc9OKiFLDQ==;
From: Bradley Morgan <brads@mainlining.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	brads@mainlining.org
Subject: [PATCH 2/7] arm64: head: correct comment for init_kernel_el()
Date: Tue, 25 Aug 2026 20:58:34 +0000
Message-ID: <20260825205839.14571-3-brads@mainlining.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825205839.14571-1-brads@mainlining.org>
References: <20260825205839.14571-1-brads@mainlining.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_135852_849299_93764331 
X-CRM114-Status: GOOD (  13.33  )
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

The comment above init_kernel_el() still says the function configures
the CPU to execute at the highest reachable EL, but that stopped being
true a while back. Ever since commit ae4b7e38e9a94798 ("arm64: Allow
sticky E2H when entering EL1"), init_kernel_el() always drops to EL1,
and it is finalise_el2() that brings us back up to EL2 when we want it.

Update the comment to match what the code actually does.

Signed-off-by: Bradley Morgan <brads@mainlining.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/head.S | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index 87a822e5c4ca..c6301557eee1 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -254,9 +254,9 @@ SYM_FUNC_END(__primary_switched)
 	.section ".idmap.text","a"
 
 /*
- * Starting from EL2 or EL1, configure the CPU to execute at the highest
- * reachable EL supported by the kernel in a chosen default state. If dropping
- * from EL2 to EL1, configure EL2 before configuring EL1.
+ * Starting from EL2 or EL1, configure the CPU to execute at EL1.
+ * If dropping from EL2 to EL1, configure EL2 before configuring EL1.
+ * To use VHE we'll upgrade back to EL2 later in finalise_el2().
  *
  * Since we cannot always rely on ERET synchronizing writes to sysregs (e.g. if
  * SCTLR_ELx.EOS is clear), we place an ISB prior to ERET.
-- 
2.47.3

