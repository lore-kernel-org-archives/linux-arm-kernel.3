Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E7CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aabiX5NnKb1HgBUNA27QTjCuXgUs5Hva7boPFb+v/xc=; b=3eQTA9o8aZdlBqzAlEhqLb7JoG
	p1I+5BzgMLNdlqEKl4eNLVTg/gEKhzuXW8N3qbTmui+V7ZE9cPe6MVSlIdbTmLHAnbnXQGTR8LLxv
	ERCltqJ+q7bhKrR7jhVnCpLJIHzgoC9d50Y3bO0+5icBgeGudqY3dBifvs+2i/vxbUi6uadtSRzmq
	4kOcbBgsmVsX0ybtKett7IjUyICD3Cg5sktpaf3o+8k9LOznNziRA6luNRzNzFJSrza5F12ey6omQ
	ZHIIdN8aZc8eUrwYHmDJf+IW6autrJX3K0wOWNMIj720RhmPmeByeSYhqwyVQ5hZbv1mPfH/2v/Pv
	p0y5VcnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaYj-00000007BxP-2BDl;
	Mon, 09 Dec 2024 10:00:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPg-000000079Hk-3Tay
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:50:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89FB5113E;
	Mon,  9 Dec 2024 01:51:16 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80A133F720;
	Mon,  9 Dec 2024 01:50:46 -0800 (PST)
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
Subject: [PATCH 04/14] selftests/mm: Fix -Warray-bounds warnings in pkey_sighandler_tests
Date: Mon,  9 Dec 2024 09:50:09 +0000
Message-ID: <20241209095019.1732120-5-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-1-kevin.brodsky@arm.com>
References: <20241209095019.1732120-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015048_910469_21D57C35 
X-CRM114-Status: GOOD (  11.15  )
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

GCC doesn't like dereferencing a pointer set to 0x1 (when building
at -O2):

pkey_sighandler_tests.c:166:9: warning: array subscript 0 is outside array bounds of 'int[0]' [-Warray-bounds=]
  166 |         *(int *) (0x1) = 1;
      |         ^~~~~~~~~~~~~~
cc1: note: source object is likely at address zero

Using NULL instead seems to make it happy. This should make no
difference in practice (SIGSEGV with SEGV_MAPERR will be the outcome
regardless), we just need to update the expected si_addr.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pkey_sighandler_tests.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index c593a426341c..e7b91794f184 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -163,7 +163,7 @@ static void *thread_segv_with_pkey0_disabled(void *ptr)
 	__write_pkey_reg(pkey_reg_restrictive_default());
 
 	/* Segfault (with SEGV_MAPERR) */
-	*(int *) (0x1) = 1;
+	*(int *)NULL = 1;
 	return NULL;
 }
 
@@ -179,7 +179,6 @@ static void *thread_segv_pkuerr_stack(void *ptr)
 static void *thread_segv_maperr_ptr(void *ptr)
 {
 	stack_t *stack = ptr;
-	int *bad = (int *)1;
 	u64 pkey_reg;
 
 	/*
@@ -195,7 +194,7 @@ static void *thread_segv_maperr_ptr(void *ptr)
 	__write_pkey_reg(pkey_reg);
 
 	/* Segfault */
-	*bad = 1;
+	*(int *)NULL = 1;
 	syscall_raw(SYS_exit, 0, 0, 0, 0, 0, 0);
 	return NULL;
 }
@@ -234,7 +233,7 @@ static void test_sigsegv_handler_with_pkey0_disabled(void)
 
 	ksft_test_result(siginfo.si_signo == SIGSEGV &&
 			 siginfo.si_code == SEGV_MAPERR &&
-			 siginfo.si_addr == (void *)1,
+			 siginfo.si_addr == NULL,
 			 "%s\n", __func__);
 }
 
@@ -349,7 +348,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 
 	ksft_test_result(siginfo.si_signo == SIGSEGV &&
 			 siginfo.si_code == SEGV_MAPERR &&
-			 siginfo.si_addr == (void *)1,
+			 siginfo.si_addr == NULL,
 			 "%s\n", __func__);
 }
 
-- 
2.47.0


