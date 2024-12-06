Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31F6E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgcmeDZOa8E4pKh8qkoCSM0EnIW5k+WcCNukwL1J2N4=; b=xMzKCEz85K3r7HOyflCu5sQL1E
	x1lhNLKTMS1l3swqiJkzMuMAALoX+BuGud1OH5fWE4Td4AZzykV9XBeXRj6OkoqgQhhdbR/BeN+mO
	SaOpdt46bacBka8j58zjfkbmCMbaUWenX1Vo1CqHfIrLlvPnPw1rLVXw1bWzUmB0jev2MbPzIntik
	8QjxwhMbKu3mfkwEvlCUmdlUd66iWg9U/5TXATDPS90Byuzf9+N2juAvK/ZnujXh8+BHBZlxMzgmA
	JNtQuNUFOysC2oMI2grvG9s3w2lIso6JxegjhOUtR6943UmEnalHJZ9o9SKtioziy/3byfJGdY2HC
	VA2Ugevg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVZ5-00000001HnZ-3yLG;
	Fri, 06 Dec 2024 10:28:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJVLP-00000001DQO-04AY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 10:13:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 901F1176C;
	Fri,  6 Dec 2024 02:14:22 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69F93F71E;
	Fri,  6 Dec 2024 02:13:51 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-hardening@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	jannh@google.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	kees@kernel.org,
	maz@kernel.org,
	pierre.langlois@arm.com,
	qperret@google.com,
	ryan.roberts@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH 13/16] arm64: mm: Reset pkey in __tlb_remove_table()
Date: Fri,  6 Dec 2024 10:11:07 +0000
Message-ID: <20241206101110.1646108-14-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241206101110.1646108-1-kevin.brodsky@arm.com>
References: <20241206101110.1646108-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_021355_093911_08AF4123 
X-CRM114-Status: GOOD (  10.28  )
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

Page table pages are typically freed via tlb_remove_table() and
friends. Ensure that the linear mapping for those pages is reset to
the default pkey when CONFIG_KPKEYS_HARDENED_PGTABLES is enabled.

This patch is a no-op if CONFIG_KPKEYS_HARDENED_PGTABLES is disabled
(default).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/tlb.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index a947c6e784ed..d1611ffa6d91 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -10,10 +10,14 @@
 
 #include <linux/pagemap.h>
 #include <linux/swap.h>
+#include <linux/kpkeys.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct page *page = (struct page *)_table;
+
+	kpkeys_unprotect_pgtable_memory((unsigned long)page_address(page), 1);
+	free_page_and_swap_cache(page);
 }
 
 #define tlb_flush tlb_flush
-- 
2.47.0


