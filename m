Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35868FEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZk4uFbR1NTKSt90CcjBXyNBU2NiCZmzMIIkXYZlYNg=; b=dmEmVu+n5CgbzQ4oriQEvV7bFc
	DtkcfvG2jLgSuTej8D7+oUPyxOyftkNptjgYnbmYWlvqE5GK8Ms6lqQ7EXKXNiTrW7bWGl5hZShUS
	hgNrIlEvI3jQ70et+t/0W9gWhrU3Z/HtuRPirO336RJhj4v8lpsnQwm3pdKNvmZTIt5fUA6cFRSFJ
	WOpQ2Ly8iMJtlZp7RV3OyOB07s+Xv0QzrvOUsvp0M6J5Ymlzh+xCmbwn3ZKBx5W30dQYlO8W3B5ec
	/KhZ0iiZi8ydS4xhrxQl++H+yFEvqvVdFn87KMFHhzX/DZfwqrM75YAPAKFPcdXJ3xfvA9KlviJf/
	BPSyq3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw24m-00000008qi9-0Oz0;
	Fri, 27 Feb 2026 17:56:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw24g-00000008qcq-3UB5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:56:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 783D814BF;
	Fri, 27 Feb 2026 09:56:19 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F0893F73B;
	Fri, 27 Feb 2026 09:56:21 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Maxwell Bland <mbland@motorola.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v6 09/30] arm64: Initialize POR_EL1 register on cpu_resume()
Date: Fri, 27 Feb 2026 17:54:57 +0000
Message-ID: <20260227175518.3728055-10-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227175518.3728055-1-kevin.brodsky@arm.com>
References: <20260227175518.3728055-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_095626_926112_F9C152E2 
X-CRM114-Status: GOOD (  10.80  )
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

From: Yeoreum Yun <yeoreum.yun@arm.com>

The POR_EL1 register is reset to an unknown value after cpu_suspend().
Since POR_EL1 always holds POR_EL1_INIT when entering cpu_suspend(),
initialize POR_EL1 with POR_EL1_INIT before cpu_do_resume().

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/kernel/sleep.S | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/kernel/sleep.S b/arch/arm64/kernel/sleep.S
index f093cdf71be1..e0a6ad85cd24 100644
--- a/arch/arm64/kernel/sleep.S
+++ b/arch/arm64/kernel/sleep.S
@@ -3,6 +3,7 @@
 #include <linux/linkage.h>
 #include <asm/asm-offsets.h>
 #include <asm/assembler.h>
+#include <asm/kpkeys.h>
 #include <asm/smp.h>
 
 	.text
@@ -134,6 +135,17 @@ SYM_FUNC_START(_cpu_resume)
 	/* load sp from context */
 	ldr	x2, [x0, #CPU_CTX_SP]
 	mov	sp, x2
+
+#ifdef CONFIG_ARM64_POE
+alternative_if_not ARM64_HAS_S1POE
+	b	.Lskip_por_set
+alternative_else_nop_endif
+	mov_q	x2, POR_EL1_INIT
+	msr_s	SYS_POR_EL1, x2
+	/* isb can be skipped since cpu_do_resume() will do it. */
+.Lskip_por_set:
+#endif /* CONFIG_ARM64_POE */
+
 	/*
 	 * cpu_do_resume expects x0 to contain context address pointer
 	 */
-- 
2.51.2


