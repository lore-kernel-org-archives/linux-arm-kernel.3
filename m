Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FDACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 11:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dr8q0/1hMR1pb3wh+uXWlet+zkGdwpA6OKpP0yl/7E=; b=YFnzk6wQETNffD9W2SJ/KD1VP+
	BUbPhQIWmznI75CzRDen4OCLJ/k/9xlRqmuWQ1Hmi/WN0MsrkpAJQHwRzqEZM9TUm4x07dLuob+HL
	R6hmk1wX5Z4IpYIDOQWfh1d+M7VSiZ/DXNeJXxrLITOJeQihPh21+dWPy6uOfwOWu8wTCMXLmwPPk
	PW0NdJ0+bi9YLlAtp3HykrscpeniT/g2WSqPNaeepaZnoq1EOqmhCsHipmTQGCPqUysiSi40dl82k
	5gYXeg0sqocEOBl5p5X/Q7ZMj5i3L9uKRVjNm5TJxePLsMi8tsAXCnfUJwzZXwDb+6vd/Pe3JYRP8
	iOI0j2SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umsSC-00000002JiZ-2pvq;
	Fri, 15 Aug 2025 11:18:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqIZ-00000001xsH-2P5N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:00:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A53D2C42;
	Fri, 15 Aug 2025 02:00:23 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D78FF3F63F;
	Fri, 15 Aug 2025 02:00:26 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Howells <dhowells@redhat.com>,
	"Eric W. Biederman" <ebiederm@xmission.com>,
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
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [RFC PATCH v2 5/8] mm: kpkeys: Introduce cred pkey/level
Date: Fri, 15 Aug 2025 09:59:57 +0100
Message-ID: <20250815090000.2182450-6-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250815090000.2182450-1-kevin.brodsky@arm.com>
References: <20250815090000.2182450-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020031_728558_D059900B 
X-CRM114-Status: GOOD (  12.63  )
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

We will need a separate pkey to protect struct cred. Allocate one as
well as a new kpkeys level that grants write access to that pkey.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/kpkeys.h | 7 ++++++-
 include/asm-generic/kpkeys.h    | 4 ++++
 include/linux/kpkeys.h          | 3 ++-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kpkeys.h b/arch/arm64/include/asm/kpkeys.h
index ded5d6e988dc..ffb7622391c3 100644
--- a/arch/arm64/include/asm/kpkeys.h
+++ b/arch/arm64/include/asm/kpkeys.h
@@ -13,7 +13,8 @@
  * used in assembly.
  */
 #define POR_EL1_INIT	(POR_ELx_PERM_PREP(KPKEYS_PKEY_DEFAULT, POE_RWX) | \
-			 POR_ELx_PERM_PREP(KPKEYS_PKEY_PGTABLES, POE_R))
+			 POR_ELx_PERM_PREP(KPKEYS_PKEY_PGTABLES, POE_R) | \
+			 POR_ELx_PERM_PREP(KPKEYS_PKEY_CRED, POE_R))
 
 #ifndef __ASSEMBLY__
 
@@ -31,6 +32,10 @@ static inline u64 por_set_kpkeys_level(u64 por, int level)
 				     level == KPKEYS_LVL_PGTABLES ||
 				     level == KPKEYS_LVL_UNRESTRICTED
 				     ? POE_RW : POE_R);
+	por = por_elx_set_pkey_perms(por, KPKEYS_PKEY_CRED,
+				     level == KPKEYS_LVL_CRED ||
+				     level == KPKEYS_LVL_UNRESTRICTED
+				     ? POE_RW : POE_R);
 
 	return por;
 }
diff --git a/include/asm-generic/kpkeys.h b/include/asm-generic/kpkeys.h
index cec92334a9f3..56a2fc9fe4a6 100644
--- a/include/asm-generic/kpkeys.h
+++ b/include/asm-generic/kpkeys.h
@@ -2,6 +2,10 @@
 #ifndef __ASM_GENERIC_KPKEYS_H
 #define __ASM_GENERIC_KPKEYS_H
 
+#ifndef KPKEYS_PKEY_CRED
+#define KPKEYS_PKEY_CRED	2
+#endif
+
 #ifndef KPKEYS_PKEY_PGTABLES
 #define KPKEYS_PKEY_PGTABLES	1
 #endif
diff --git a/include/linux/kpkeys.h b/include/linux/kpkeys.h
index 48f240bea8e1..0e555b505b33 100644
--- a/include/linux/kpkeys.h
+++ b/include/linux/kpkeys.h
@@ -10,7 +10,8 @@ struct folio;
 
 #define KPKEYS_LVL_DEFAULT	0
 #define KPKEYS_LVL_PGTABLES	1
-#define KPKEYS_LVL_UNRESTRICTED	2
+#define KPKEYS_LVL_CRED		2
+#define KPKEYS_LVL_UNRESTRICTED	3
 
 #define KPKEYS_LVL_MIN		KPKEYS_LVL_DEFAULT
 #define KPKEYS_LVL_MAX		KPKEYS_LVL_UNRESTRICTED
-- 
2.47.0


