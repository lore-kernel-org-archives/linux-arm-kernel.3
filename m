Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F20D69113
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=te52pKtJOuw6ylrVJ9zAt3R7QCmFkdIfneNtXY3U6Pw=; b=IPd+f2jzAsM2GdbP3+w3Z5JklZ
	Dvt2iGMtDiUF42YsiYKVtN834aBVqUzaKA9dAXjgOSoLGCR3cGc6ahRqa8XNz8mwASy144pUI9ydK
	+HOP9Z4H5whn2cLbBvzbm5F5640B9hE8HkkiLhUgynLOaLQVOHdqhltf3M4RVFEnoYYhinYze4TMP
	Hs84GFL9COmX/4hVat0hhgvcRGL+JNIGnLwjjLpAWt7bvro0h98C6iv6rUnwRpokjvXKljGm6gf+3
	FSFxqDfhdGc6d1u/N8fhHYLrv2q/qEurUy+in7Ge2uMUlKeF4+x0SmdlkBXiW6iXwIigJxeg29fA1
	RD4Z6uuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGg1U-0000000Fose-3bD1;
	Thu, 28 Nov 2024 15:01:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGg0V-0000000Fon9-1R6B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:00:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E84CC1474;
	Thu, 28 Nov 2024 07:01:04 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F3CB3F66E;
	Thu, 28 Nov 2024 07:00:33 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [PATCH] arm64: Fix sve_vl() for build errors
Date: Thu, 28 Nov 2024 15:00:02 +0000
Message-Id: <20241128150002.2424523-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_070039_428704_85FE940F 
X-CRM114-Status: GOOD (  10.43  )
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

commit 5b9895f8a5d9 ("arm: Fix clang error in sve_vl()") breaks the build
with the following compiler version, as the "rdvl" expects a 64bit register.

/tmp/ccGJYtuC.s: Assembler messages:
/tmp/ccGJYtuC.s:2165: Error: operand mismatch -- `rdvl w3,#8'
/tmp/ccGJYtuC.s:2165: Info:    did you mean this?
/tmp/ccGJYtuC.s:2165: Info:     rdvl x3, #8
make: *** [<builtin>: arm/selftest.o] Error 1
make: *** Waiting for unfinished jobs....

$ aarch64-none-elf-gcc --version
aarch64-none-elf-gcc (GNU Toolchain for the A-profile Architecture 10.2-2020.11 (arm-10.16)) 10.2.1 20201103

Fix this by switching to use "unsigned long" variable and restoring the 64bit
register for the instruction

Fixes: 5b9895f8a5d9 ("arm: Fix clang error in sve_vl()")
Cc: Raghavendra Rao Ananta <rananta@google.com>
Cc: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 lib/arm64/asm/processor.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/arm64/asm/processor.h b/lib/arm64/asm/processor.h
index e261e74d..e5b0ad10 100644
--- a/lib/arm64/asm/processor.h
+++ b/lib/arm64/asm/processor.h
@@ -154,12 +154,12 @@ static inline bool system_supports_sve(void)
 	return ((get_id_aa64pfr0_el1() >> ID_AA64PFR0_EL1_SVE_SHIFT) & 0xf) != 0;
 }
 
-static inline int sve_vl(void)
+static inline unsigned long sve_vl(void)
 {
-	int vl;
+	unsigned long vl;
 
 	asm volatile(".arch_extension sve\n"
-		     "rdvl %w0, #8"
+		     "rdvl %x0, #8"
 		     : "=r" (vl));
 
 	return vl;
-- 
2.34.1


