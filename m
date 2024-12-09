Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113C6E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2y+Dg42mIu9JWvjXkfAniTHPccqNpvaYDKwTs4BPKw=; b=FVNE4S1x1k42e6pBrwuc0oMCJ+
	F9WvGSKvMVBeduoz12GHsgt1b9Uu8xIyRIPuoV8ML5oyM/bOBMidGyAy2u8hgAMln3zJ8EhdTlW+i
	PuTnRENoVsdWQUSDqRWNc03aifwR4PFCfERY5TJ6ggwsJasj7+3RH4jRyOXNn6/Qbip2cEThwRrPV
	wibhqHNXzeYd35wlIemFmDgaXT9l36fOisRHx+Q8VvsSStPBLX2dWssp2Iu+D9OAGhyqoc3MSL10i
	xl6FSdW1zz6qffiPydQG91acYrUKVSA8VHtRXb0yT7SXVYTVkwPc2xl9bqX1qrIAg+MQhyasJv0UH
	Zy0bBkXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKael-00000007DBb-3JXs;
	Mon, 09 Dec 2024 10:06:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPs-000000079SI-1rny
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:51:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0FA0143D;
	Mon,  9 Dec 2024 01:51:27 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7F5E3F720;
	Mon,  9 Dec 2024 01:50:57 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	aruna.ramakrishna@oracle.com,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 09/14] selftests/mm: Remove empty pkey helper definition
Date: Mon,  9 Dec 2024 09:50:14 +0000
Message-ID: <20241209095019.1732120-10-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-1-kevin.brodsky@arm.com>
References: <20241209095019.1732120-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015100_534989_FA8CF9D4 
X-CRM114-Status: GOOD (  10.74  )
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

Some of the functions declared in pkey-helpers.h are actually
defined in protections_keys.c, meaning they can only be called from
protections_keys.c. This is less than ideal, but it is hard to avoid
as these helpers are themselves called from inline functions in
pkey-<arch>.h. Let's at least add a comment clarifying that. We can
also remove the empty definition in pkey_sighandler_tests.c:
expected_pkey_fault() is not meant to be called from there.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pkey-helpers.h          | 6 ++++--
 tools/testing/selftests/mm/pkey_sighandler_tests.c | 2 --
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey-helpers.h b/tools/testing/selftests/mm/pkey-helpers.h
index bc81275a89d9..7604cc66ef0e 100644
--- a/tools/testing/selftests/mm/pkey-helpers.h
+++ b/tools/testing/selftests/mm/pkey-helpers.h
@@ -84,10 +84,12 @@ extern void abort_hooks(void);
 # define noinline __attribute__((noinline))
 #endif
 
-noinline int read_ptr(int *ptr);
-void expected_pkey_fault(int pkey);
 int sys_pkey_alloc(unsigned long flags, unsigned long init_val);
 int sys_pkey_free(unsigned long pkey);
+
+/* For functions called from protection_keys.c only */
+noinline int read_ptr(int *ptr);
+void expected_pkey_fault(int pkey);
 int mprotect_pkey(void *ptr, size_t size, unsigned long orig_prot,
 		unsigned long pkey);
 void record_pkey_malloc(void *ptr, long size, int prot);
diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index e7b91794f184..d18e38b19792 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -32,8 +32,6 @@
 
 #define STACK_SIZE PTHREAD_STACK_MIN
 
-void expected_pkey_fault(int pkey) {}
-
 pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
 pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
 siginfo_t siginfo = {0};
-- 
2.47.0


