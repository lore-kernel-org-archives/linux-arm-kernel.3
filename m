Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A741E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 10:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cbBxn5qOQ9J377eYviEtKB0cQDc5LmCO4foK1XGor9k=; b=rnBkP1s99BG3P9AyL/qKaemNC7
	lBrTM8qIJvrTRbaQOT+I+sV8zhHI0byW8xovrdpAB5KYltgwdPCoKaN9x9Lr9u0D50WDs9zRV1isY
	3GqxJ/PBx90vulhvsEakRCAzlSmT8dKBBveZugAqCSi/XCvfEvqCgzGm5XItxfrXHMs+YLHWzg74i
	EsASw+TuxR/rZQnUykbpC8JGTAxtamzlKFSw3i6wqoeyy734ixiz0BJ6UNY+97WQf3s/490tqH9ya
	k63b4K+SnUOW0B5JJHrfHQ1yctKHGmBD85BEk2F1VCfsdzTn4LVgGa/b21G1ruUFDeLgKo9zMbghl
	sNdsQ0aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKahm-00000007Doa-2Prz;
	Mon, 09 Dec 2024 10:09:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaPz-000000079Y7-0yGK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:51:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDC24113E;
	Mon,  9 Dec 2024 01:51:34 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E43033F720;
	Mon,  9 Dec 2024 01:51:04 -0800 (PST)
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
Subject: [PATCH 12/14] selftests/mm: Rename pkey register macro
Date: Mon,  9 Dec 2024 09:50:17 +0000
Message-ID: <20241209095019.1732120-13-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-1-kevin.brodsky@arm.com>
References: <20241209095019.1732120-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015107_316918_DC81EF2D 
X-CRM114-Status: GOOD (  11.79  )
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

PKEY_ALLOW_ALL is meant to represent the pkey register value that
allows all accesses (enables all pkeys). However its current naming
suggests that the value applies to *one* key only (like
PKEY_DISABLE_ACCESS for instance).

Rename PKEY_ALLOW_ALL to PKEY_REG_ALLOW_ALL to avoid such
misunderstanding. This is consistent with the PKEY_REG_ALLOW_NONE
macro introduced by commit 6e182dc9f268 ("selftests/mm: Use generic
pkey register manipulation").

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 tools/testing/selftests/mm/pkey-arm64.h      | 2 +-
 tools/testing/selftests/mm/protection_keys.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/mm/pkey-arm64.h b/tools/testing/selftests/mm/pkey-arm64.h
index 9897e31f16dd..8e9685e03c44 100644
--- a/tools/testing/selftests/mm/pkey-arm64.h
+++ b/tools/testing/selftests/mm/pkey-arm64.h
@@ -30,7 +30,7 @@
 #define NR_PKEYS		8
 #define NR_RESERVED_PKEYS	1 /* pkey-0 */
 
-#define PKEY_ALLOW_ALL		0x77777777
+#define PKEY_REG_ALLOW_ALL	0x77777777
 #define PKEY_REG_ALLOW_NONE	0x0
 
 #define PKEY_BITS_PER_PKEY	4
diff --git a/tools/testing/selftests/mm/protection_keys.c b/tools/testing/selftests/mm/protection_keys.c
index 3688571e6b39..a4683f2476f2 100644
--- a/tools/testing/selftests/mm/protection_keys.c
+++ b/tools/testing/selftests/mm/protection_keys.c
@@ -396,7 +396,7 @@ static void signal_handler(int signum, siginfo_t *si, void *vucontext)
 	/* restore access and let the faulting instruction continue */
 	pkey_access_allow(siginfo_pkey);
 #elif defined(__aarch64__)
-	aarch64_write_signal_pkey(uctxt, PKEY_ALLOW_ALL);
+	aarch64_write_signal_pkey(uctxt, PKEY_REG_ALLOW_ALL);
 #endif /* arch */
 	pkey_faults++;
 	dprintf1("<<<<==================================================\n");
@@ -842,7 +842,7 @@ void expected_pkey_fault(int pkey)
 	 */
 	if (__read_pkey_reg() != 0)
 #elif defined(__aarch64__)
-	if (__read_pkey_reg() != PKEY_ALLOW_ALL)
+	if (__read_pkey_reg() != PKEY_REG_ALLOW_ALL)
 #else
 	if (__read_pkey_reg() != shadow_pkey_reg)
 #endif /* arch */
-- 
2.47.0


