Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90182C678DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mWR64TO/o9bpzRbX4eOXu/CUfhNPY4/5PNdqAcHxiYA=; b=1oO5MYPKU7WPvvbfMOvIVRZg8E
	h4G39hYhDrgPF9hNFQ/c1VIdHaUK2ngztpzhAAPZmwasKfPYKuApEo8cNodyrFQDxUX3HbwUZnnbF
	99B7CrdCV8UjmlbsHsJWDon6vZbMn/JosW024h6iWg2R4gs2BjmK7gl1KkimYJR3Ay8NKGS63lUrI
	T7Da6B1zkcXDDxgjN7UYHFAOKfztrVkIooNlr7J4YeO+cIOkq62QndskDySF/cLybvL2+7iagKt6w
	yo3tMFvntT20Pofu4VO5W3ir7gnuWhVgMj4rNpaQR3NDf8eEAj/e/1WMgrMuRUl2rnM5CYnf/muo4
	YPFxrbSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMlR-0000000AAYS-40Xh;
	Wed, 11 Jun 2025 14:49:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHxX-00000009VZG-1D0t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:41:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F5E826AC;
	Wed, 11 Jun 2025 02:41:07 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A1D1F3F59E;
	Wed, 11 Jun 2025 02:41:24 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v6 6/9] kselftest/arm64/mte: add address tag related macro and function
Date: Wed, 11 Jun 2025 10:41:04 +0100
Message-Id: <20250611094107.928457-7-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611094107.928457-1-yeoreum.yun@arm.com>
References: <20250611094107.928457-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_024127_412909_3CAEA0A7 
X-CRM114-Status: UNSURE (   9.71  )
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

Add address tag related macro and function to test MTE_FAR feature.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 .../testing/selftests/arm64/mte/mte_common_util.c  | 14 ++++++++++++++
 .../testing/selftests/arm64/mte/mte_common_util.h  |  2 ++
 tools/testing/selftests/arm64/mte/mte_def.h        |  8 ++++++++
 3 files changed, 24 insertions(+)

diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index 048b8a507b70..c21f86143a6f 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -131,6 +131,20 @@ void mte_clear_tags(void *ptr, size_t size)
 	mte_clear_tag_address_range(ptr, size);
 }
 
+void *mte_insert_atag(void *ptr)
+{
+	unsigned char atag;
+
+	srandom(time(NULL));
+	atag =  mtefar_support ? (random() % MT_ATAG_MASK) + 1 : 0;
+	return (void *)MT_SET_ATAG((unsigned long)ptr, atag);
+}
+
+void *mte_clear_atag(void *ptr)
+{
+	return (void *)MT_CLEAR_ATAG((unsigned long)ptr);
+}
+
 static void *__mte_allocate_memory_range(size_t size, int mem_type, int mapping,
 					 size_t range_before, size_t range_after,
 					 bool tags, int fd)
diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.h b/tools/testing/selftests/arm64/mte/mte_common_util.h
index 4e1dd959df9b..045e4ad2f018 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.h
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.h
@@ -56,6 +56,8 @@ void mte_free_memory_tag_range(void *ptr, size_t size, int mem_type,
 			       size_t range_before, size_t range_after);
 void *mte_insert_tags(void *ptr, size_t size);
 void mte_clear_tags(void *ptr, size_t size);
+void *mte_insert_atag(void *ptr);
+void *mte_clear_atag(void *ptr);
 int mte_default_setup(void);
 void mte_restore_setup(void);
 int mte_switch_mode(int mte_option, unsigned long incl_mask);
diff --git a/tools/testing/selftests/arm64/mte/mte_def.h b/tools/testing/selftests/arm64/mte/mte_def.h
index 9b188254b61a..6ad22f07c9b8 100644
--- a/tools/testing/selftests/arm64/mte/mte_def.h
+++ b/tools/testing/selftests/arm64/mte/mte_def.h
@@ -42,6 +42,8 @@
 #define MT_TAG_COUNT		16
 #define MT_INCLUDE_TAG_MASK	0xFFFF
 #define MT_EXCLUDE_TAG_MASK	0x0
+#define MT_ATAG_SHIFT		60
+#define MT_ATAG_MASK		0xFUL
 
 #define MT_ALIGN_GRANULE	(MT_GRANULE_SIZE - 1)
 #define MT_CLEAR_TAG(x)		((x) & ~(MT_TAG_MASK << MT_TAG_SHIFT))
@@ -49,6 +51,12 @@
 #define MT_FETCH_TAG(x)		((x >> MT_TAG_SHIFT) & (MT_TAG_MASK))
 #define MT_ALIGN_UP(x)		((x + MT_ALIGN_GRANULE) & ~(MT_ALIGN_GRANULE))
 
+#define MT_CLEAR_ATAG(x)	((x) & ~(MT_TAG_MASK << MT_ATAG_SHIFT))
+#define MT_SET_ATAG(x, y)	((x) | (((y) & MT_ATAG_MASK) << MT_ATAG_SHIFT))
+#define MT_FETCH_ATAG(x)	((x >> MT_ATAG_SHIFT) & (MT_ATAG_MASK))
+
+#define MT_CLEAR_TAGS(x) 	(MT_CLEAR_ATAG(MT_CLEAR_TAG(x)))
+
 #define MT_PSTATE_TCO_SHIFT	25
 #define MT_PSTATE_TCO_MASK	~(0x1 << MT_PSTATE_TCO_SHIFT)
 #define MT_PSTATE_TCO_EN	1
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


