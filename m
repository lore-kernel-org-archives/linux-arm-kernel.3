Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4625CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmFSGXNg0MSZohWP7YtFKB7EUmCmD7qHsh+06I3nSqU=; b=XWNF7pMxU4XzpaSGPmuLpfb7EG
	VRXzH4xC5LGxo+PMTSKOraTNtTI9iIK8TtfuuY9X2bkSl4zyK8j++nGQHkk5dTsl+/jnjtURlgA8q
	0HM7v/jMml0296GHUXloEQ8Q/cpPy0nLJk3rNraq8P9PMbc8iqvj3szh5HnwO4T7LnfJETn1BYumA
	4ZIXkQYRqS5f0umbncjuNHuDsmtzXA5ep1ox/VNZ+mO3BpIkfBRrd/+Sg52DKCQmqHWkdI6Xv4aRG
	/U7n9maEYc+oPJcaqtogIF70pPI9bxyrTTI7k7Nn0w1DUzGW7sm/gcwPS0M0vf0kVY4odegU/11V6
	x6why6pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpnL-00000001khD-2p3E;
	Tue, 26 May 2026 11:17:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRpnC-00000001kZY-3lVN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 11:17:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8770216F2;
	Tue, 26 May 2026 04:17:44 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B76F83F7D8;
	Tue, 26 May 2026 04:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779794269; bh=BIW+ZJvi1P4EeD5UF9lAJp1G+q4h4naKio10It8LHdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CXUQBxWnRCwDZIJbyDjOv6buZ/ZHuWq3lv1+SZZ95PXYVPCEok99psIDLKCiBWr5j
	 nA46PFCbUIyYPmEnNSZNNxgOyaOoM5r+Fcgw/ImgQsqrmq4Tf1ySVD6Y18ZCcHBaGz
	 hyxkxF/1qpwM0AL+laviTWnjvM9ARiQxBMPY1G3w=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Tue, 26 May 2026 12:15:59 +0100
Subject: [PATCH RFC v8 10/24] memblock: Move INIT_MEMBLOCK_* macros to
 header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-kpkeys-v8-10-eaaacdacc67c@arm.com>
References: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
In-Reply-To: <20260526-kpkeys-v8-0-eaaacdacc67c@arm.com>
To: linux-hardening@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Andy Lutomirski <luto@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 Ira Weiny <ira.weiny@intel.com>, Jann Horn <jannh@google.com>, 
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>, 
 Kees Cook <kees@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>, Maxwell Bland <mbland@motorola.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, 
 Pierre Langlois <pierre.langlois@arm.com>, 
 Quentin Perret <qperret@google.com>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, Yang Shi <yang@os.amperecomputing.com>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-mm@kvack.org, x86@kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779794212; l=1850;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=BIW+ZJvi1P4EeD5UF9lAJp1G+q4h4naKio10It8LHdc=;
 b=k/6tYCVgqofYCAapYqWsSvaOAxLzZMkQtTrrGWimL0nEfK5dP+LdOGyVEW4bM+EHz7GaZ5JbC
 m/SoVteI4iJDZnNe5lK94c2vsiiFUy8vWgghfokYtQqib4li3mjDGUK
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_041751_046511_74B58A91 
X-CRM114-Status: GOOD (  11.67  )
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

The upcoming page table allocator for the kpkeys_hardened_pgtables
feature will need to know the maximum number of memblock regions.
Move the corresponding macros to <linux/memblock.h> to allow that.

INIT_MEMBLOCK_{RESERVED,MEMORY}_REGIONS may be overridden, but this
should be fine as only arm64 and loong currently do that and the
relevant header is already (indirectly) included by
<linux/memblock.h>.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/memblock.h | 11 +++++++++++
 mm/memblock.c            | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index b0f750d22a7b..e58b2c859b95 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -24,6 +24,17 @@ extern unsigned long max_pfn;
  */
 extern unsigned long long max_possible_pfn;
 
+#define INIT_MEMBLOCK_REGIONS			128
+#define INIT_PHYSMEM_REGIONS			4
+
+#ifndef INIT_MEMBLOCK_RESERVED_REGIONS
+#define INIT_MEMBLOCK_RESERVED_REGIONS		INIT_MEMBLOCK_REGIONS
+#endif
+
+#ifndef INIT_MEMBLOCK_MEMORY_REGIONS
+#define INIT_MEMBLOCK_MEMORY_REGIONS		INIT_MEMBLOCK_REGIONS
+#endif
+
 /**
  * enum memblock_flags - definition of memory region attributes
  * @MEMBLOCK_NONE: no special request
diff --git a/mm/memblock.c b/mm/memblock.c
index a6a1c91e276d..e64ad9c72dc3 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -30,17 +30,6 @@
 
 #include "internal.h"
 
-#define INIT_MEMBLOCK_REGIONS			128
-#define INIT_PHYSMEM_REGIONS			4
-
-#ifndef INIT_MEMBLOCK_RESERVED_REGIONS
-# define INIT_MEMBLOCK_RESERVED_REGIONS		INIT_MEMBLOCK_REGIONS
-#endif
-
-#ifndef INIT_MEMBLOCK_MEMORY_REGIONS
-#define INIT_MEMBLOCK_MEMORY_REGIONS		INIT_MEMBLOCK_REGIONS
-#endif
-
 /**
  * DOC: memblock overview
  *

-- 
2.51.2


