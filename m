Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B21C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lusoos9mJ+o7Q6Ien2qN4J23xv+7JG9gVPPJCCOSYco=; b=CIEhfCAMYgzYotrS97AltmWOar
	1LQuXMsa2QyQLmk44x14xJAV8aOYUgle/g0r6QGfuf0e2Wr3H6KJhn9QX4RTCOh7jtZfS9tfZjYQH
	O70OwaZfpQIP0R7yAnPKar1OpW3zKU/mcRnmbWKF5CzfZTBq1VZYMdl4VNL7gnW0UPBH6pZzM7BWw
	kY6O7tRwGewzGOp8S8d0FbJZbeefZcTezJeuoxrq+CdP+0kiW5msswKlIE8t1CS0fF5LKEh46ViiO
	ASlpjGDpPhRyenzJdm4E8/qcZT3/vyS4me/3uSDsIwOq1walrjj1uutPHgKuqz9gDYzdeMetqMidO
	MkBgView==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhc2-0000000A0zH-2awe;
	Wed, 19 Aug 2026 14:49:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwhbz-0000000A0yH-4A81
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 14:49:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D28D914BF;
	Wed, 19 Aug 2026 07:49:44 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 050593F85F;
	Wed, 19 Aug 2026 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787150988; bh=SRnLSvuzNxe1+g6pPb07setIxD3uzJYN1GHauCxlkks=;
	h=From:To:Cc:Subject:Date:From;
	b=B2HgaHb+WIVl60WKByRSCUqaxyl/DZXhKat0fVLyfzjCg0NH5L/gz3C8o26PzchV2
	 b3YYHGBwscJSKtBKSposrIO15OcAzqDzoXAQI/hJLwXKqTfvdhV9LY0r9PIgiSVuk7
	 ChTUsZTGPF1kMNlOmbT+0pnZEtpsZSnZxnUcqQP4=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	yeoreum.yun@arm.com
Subject: [PATCH] arm64: process: Fix context switching MTE store-only tag check
Date: Wed, 19 Aug 2026 15:48:59 +0100
Message-Id: <20260819144859.5447-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_074952_168478_8946958C 
X-CRM114-Status: GOOD (  10.16  )
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

SCTLR_EL1.TCSO0 is set when user opt-in for MTE store-only tag check
mode. However, it is not part of SCTLR_USER_MASK which imply that on
context switch we never clear SCTLR_EL1.TCSO0, so we are leaking that
setting into another task.

Fix that by including SCTLR_EL1_TCSO0_MASK into SCTLR_USER_MASK

Fixes: 4d51ff5bba00 ("arm64/kernel: Support store-only mte tag check")
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index c2a627f39314..6dfbcacd9ba0 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -264,7 +264,7 @@ static inline void task_set_sve_vl_onexec(struct task_struct *task,
 
 #define SCTLR_USER_MASK                                                        \
 	(SCTLR_ELx_ENIA | SCTLR_ELx_ENIB | SCTLR_ELx_ENDA | SCTLR_ELx_ENDB |   \
-	 SCTLR_EL1_TCF0_MASK)
+	 SCTLR_EL1_TCF0_MASK | SCTLR_EL1_TCSO0_MASK)
 
 static inline void arch_thread_struct_whitelist(unsigned long *offset,
 						unsigned long *size)
-- 
2.34.1


