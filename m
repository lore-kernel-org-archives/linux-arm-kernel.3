Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A18E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fD+1ahQubNsrFJcIZy6nYonMd+lwfObdutf43AaVl4o=; b=HHSOfjtwmmF8nHKrCKTfNEz0kR
	cMjoPODo9x2hf5MED2qD5Y4m4YRMP/QxXAlI7tJojrxrBFwvPy5FbKIHlxABNNigsaBP0B3r8buGx
	cuUIAgDKAaZ1QgGzikoWYpPF1+DfHp6vzELALeXuD4AIDoBznkaYjuf9yFCtm15GiIHimBenzuuHt
	KWbaLDyMuz0zkwc9a92AzxeAWzUM3OvALi8QVnaeFtEyAf3SMu3RLauIzQdCTI+e4YQiyQ0hPhjJ4
	jvmgJTW728EfoN6RQJi4GolRok42NOD1kDxkACuReKq3wlLe2kDp6FgdTpemepyUZ48BZtTBMO+1B
	M56u5ouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKajm-00000007EAM-3XJ1;
	Mon, 09 Dec 2024 10:11:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaQ3-000000079bB-3NH4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:51:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84549113E;
	Mon,  9 Dec 2024 01:51:39 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7ADDE3F720;
	Mon,  9 Dec 2024 01:51:09 -0800 (PST)
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
Subject: [PATCH 14/14] selftests/mm: Remove X permission from sigaltstack mapping
Date: Mon,  9 Dec 2024 09:50:19 +0000
Message-ID: <20241209095019.1732120-15-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-1-kevin.brodsky@arm.com>
References: <20241209095019.1732120-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015111_886357_AD617804 
X-CRM114-Status: UNSURE (   8.98  )
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

There is no reason why the alternate signal stack should be mapped
as RWX. Map it as RW instead.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pkey_sighandler_tests.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey_sighandler_tests.c b/tools/testing/selftests/mm/pkey_sighandler_tests.c
index 449ec5acec75..17bbfcd552c6 100644
--- a/tools/testing/selftests/mm/pkey_sighandler_tests.c
+++ b/tools/testing/selftests/mm/pkey_sighandler_tests.c
@@ -315,7 +315,7 @@ static void test_sigsegv_handler_with_different_pkey_for_stack(void)
 	sys_mprotect_pkey(stack, STACK_SIZE, PROT_READ | PROT_WRITE, pkey);
 
 	/* Set up alternate signal stack that will use the default MPK */
-	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE | PROT_EXEC,
+	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
 			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 	sigstack.ss_flags = 0;
 	sigstack.ss_size = STACK_SIZE;
@@ -488,7 +488,7 @@ static void test_pkru_sigreturn(void)
 	sys_mprotect_pkey(stack, STACK_SIZE, PROT_READ | PROT_WRITE, pkey);
 
 	/* Set up alternate signal stack that will use the default MPK */
-	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE | PROT_EXEC,
+	sigstack.ss_sp = mmap(0, STACK_SIZE, PROT_READ | PROT_WRITE,
 			      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
 	sigstack.ss_flags = 0;
 	sigstack.ss_size = STACK_SIZE;
-- 
2.47.0


