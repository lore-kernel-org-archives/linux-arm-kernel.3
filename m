Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8336C02183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 17:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoSyfg0H2xdXV8bVJGF6NwXUo5Fiq0F8nFCklb+ts3Y=; b=2E5amB5+trp8V0rF+dIjayt8Uh
	rjMXAHwgh16lWZAYlQWByfGk3qz4LvHhkMbkXfsIca0fa09aLmr2a6tWU/gMFaq21VHIsjrdgK4Vp
	aM2m76EWmaKlrhKBXwkjdtgp2qhX7Gf6loKap3dY1LHKawuUJjClwsAbaofQNXovkNtLTR/qxYqPL
	sLG485rStYSDvP6jdgQ2lW8sTnUSLmHpz0AcaKVdz3sT4Sff79jLDxS2ys+gGH3JERrXbI9RSKsIX
	fquhFXK4/TsAHslhb77H1lov95g6phUvloQQnSxm9ZnTDuS0ZpcPTT6/yp+n2opCJusUHy+JpQPx2
	W54yEbZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNyS-00000005zvI-25Bw;
	Mon, 13 Jan 2025 17:11:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNty-00000005yuy-1Rcf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jan 2025 17:06:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A2391BB0;
	Mon, 13 Jan 2025 09:07:26 -0800 (PST)
Received: from udebian.localdomain (unknown [10.1.25.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B00D83F673;
	Mon, 13 Jan 2025 09:06:55 -0800 (PST)
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	nd@arm.com,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: [RESEND v4 3/3] selftests/powerpc: Use PKEY_UNRESTRICTED macro
Date: Mon, 13 Jan 2025 17:06:19 +0000
Message-Id: <20250113170619.484698-4-yury.khrustalev@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250113170619.484698-1-yury.khrustalev@arm.com>
References: <20250113170619.484698-1-yury.khrustalev@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_090658_471390_F7ADE85A 
X-CRM114-Status: GOOD (  10.86  )
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

Replace literal 0 with macro PKEY_UNRESTRICTED where pkey_*() functions
are used in mm selftests for memory protection keys for ppc target.

Signed-off-by: Yury Khrustalev <yury.khrustalev@arm.com>
Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

---
Note that I couldn't build these tests so I would appreciate if someone
could check this patch. Thank you!
---
 tools/testing/selftests/powerpc/include/pkeys.h      | 2 +-
 tools/testing/selftests/powerpc/mm/pkey_exec_prot.c  | 2 +-
 tools/testing/selftests/powerpc/mm/pkey_siginfo.c    | 2 +-
 tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 6 +++---
 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 6 +++---
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/pkeys.h b/tools/testing/selftests/powerpc/include/pkeys.h
index 51729d9a7111..430cb4bd7472 100644
--- a/tools/testing/selftests/powerpc/include/pkeys.h
+++ b/tools/testing/selftests/powerpc/include/pkeys.h
@@ -85,7 +85,7 @@ int pkeys_unsupported(void)
 	SKIP_IF(!hash_mmu);
 
 	/* Check if the system call is supported */
-	pkey = sys_pkey_alloc(0, 0);
+	pkey = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	SKIP_IF(pkey < 0);
 	sys_pkey_free(pkey);
 
diff --git a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
index 0af4f02669a1..29b91b7456eb 100644
--- a/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
+++ b/tools/testing/selftests/powerpc/mm/pkey_exec_prot.c
@@ -72,7 +72,7 @@ static void segv_handler(int signum, siginfo_t *sinfo, void *ctx)
 
 		switch (fault_type) {
 		case PKEY_DISABLE_ACCESS:
-			pkey_set_rights(fault_pkey, 0);
+			pkey_set_rights(fault_pkey, PKEY_UNRESTRICTED);
 			break;
 		case PKEY_DISABLE_EXECUTE:
 			/*
diff --git a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
index 2db76e56d4cb..e89a164c686b 100644
--- a/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
+++ b/tools/testing/selftests/powerpc/mm/pkey_siginfo.c
@@ -83,7 +83,7 @@ static void segv_handler(int signum, siginfo_t *sinfo, void *ctx)
 	    mprotect(pgstart, pgsize, PROT_EXEC))
 		_exit(1);
 	else
-		pkey_set_rights(pkey, 0);
+		pkey_set_rights(pkey, PKEY_UNRESTRICTED);
 
 	fault_count++;
 }
diff --git a/tools/testing/selftests/powerpc/ptrace/core-pkey.c b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
index f6da4cb30cd6..64c985445cb7 100644
--- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
@@ -124,16 +124,16 @@ static int child(struct shared_info *info)
 	/* Get some pkeys so that we can change their bits in the AMR. */
 	pkey1 = sys_pkey_alloc(0, PKEY_DISABLE_EXECUTE);
 	if (pkey1 < 0) {
-		pkey1 = sys_pkey_alloc(0, 0);
+		pkey1 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 		FAIL_IF(pkey1 < 0);
 
 		disable_execute = false;
 	}
 
-	pkey2 = sys_pkey_alloc(0, 0);
+	pkey2 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	FAIL_IF(pkey2 < 0);
 
-	pkey3 = sys_pkey_alloc(0, 0);
+	pkey3 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	FAIL_IF(pkey3 < 0);
 
 	info->amr |= 3ul << pkeyshift(pkey1) | 2ul << pkeyshift(pkey2);
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
index d89474377f11..37794f82ed66 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
@@ -81,16 +81,16 @@ static int child(struct shared_info *info)
 	/* Get some pkeys so that we can change their bits in the AMR. */
 	pkey1 = sys_pkey_alloc(0, PKEY_DISABLE_EXECUTE);
 	if (pkey1 < 0) {
-		pkey1 = sys_pkey_alloc(0, 0);
+		pkey1 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 		CHILD_FAIL_IF(pkey1 < 0, &info->child_sync);
 
 		disable_execute = false;
 	}
 
-	pkey2 = sys_pkey_alloc(0, 0);
+	pkey2 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	CHILD_FAIL_IF(pkey2 < 0, &info->child_sync);
 
-	pkey3 = sys_pkey_alloc(0, 0);
+	pkey3 = sys_pkey_alloc(0, PKEY_UNRESTRICTED);
 	CHILD_FAIL_IF(pkey3 < 0, &info->child_sync);
 
 	info->amr1 |= 3ul << pkeyshift(pkey1);
-- 
2.39.5


