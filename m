Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCACE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfgH/xHLCW0nyrATLYlYPNlcx7mYw3lH5wjltUMjs+I=; b=cRC1SuQyNJ7vBWOAkQpwa5fMvg
	fuHutOii03RIrm7mWyFo6mR1vBuJzpzvtDVq25uASb3cT06NMnIEQmWQ2hl2jpHAD74DaFlet9kFL
	+f/4tfWI1AC3EwqVF4nGZMYqkrYa+Lz5bijyd/ZsosqfjwBAIaOHCj56W659ee7kXiAaiQpd++zZ/
	/lNmAYyoV2nlMGm0H1Uo9xLGEzjvcEo09elpTxKiXUOrL1a4yAk0sH2e99B1LrLu7zPd6EUo/E9v+
	eNUkF3/q5wCDoTHS4QmVqx4BKRFVvW+KZrO5Jam9ElMvDk3kpAfGy/I5t7axxfxhRlz5E/x4qu/om
	zkcmekbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7RT-00000009XsU-3Ur0;
	Mon, 16 Dec 2024 09:31:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN7Pi-00000009XZ4-12sM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 09:29:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46E1A113E;
	Mon, 16 Dec 2024 01:29:43 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E73313F720;
	Mon, 16 Dec 2024 01:29:12 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	aruna.ramakrishna@oracle.com,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	ryan.roberts@arm.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org,
	linux-s390@vger.kernel.org
Subject: [PATCH] selftests/mm: fix dependency on pkey_util.c
Date: Mon, 16 Dec 2024 09:28:49 +0000
Message-ID: <20241216092849.2140850-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <Z19Tl30BuKTfL629@tuxmaker.boeblingen.de.ibm.com>
References: <Z19Tl30BuKTfL629@tuxmaker.boeblingen.de.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_012918_328919_6F69E312 
X-CRM114-Status: GOOD (  13.46  )
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

The pkey* files can only be built on architectures that support
pkeys (pkey-helpers.h #error's otherwise). Adding pkey_util.c as
dependency to all $(TEST_GEN_FILES) is therefore a bad idea. Make it
a dependency of the pkeys tests only.

Those tests are built in 32/64-bit variants on x86_64 so we need to
add an explicit dependency there as well.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---

Hi Alexander,

Thank you for the bug report, that patch indeed breaks all
architectures that don't support pkeys, I should have realised that!
This patch should fix it.

Andrew, it would make sense to squash this patch into the original
("selftests/mm: Use sys_pkey helpers consistently").

Cheers,
- Kevin

Cc: akpm@linux-foundation.org
Cc: aruna.ramakrishna@oracle.com
Cc: catalin.marinas@arm.com
Cc: dave.hansen@linux.intel.com
Cc: joey.gouly@arm.com
Cc: keith.lucas@oracle.com
Cc: ryan.roberts@arm.com
Cc: shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: x86@kernel.org
Cc: linux-s390@vger.kernel.org
---
 tools/testing/selftests/mm/Makefile | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index 1f0743d9459d..18041de1aebf 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -147,16 +147,20 @@ TEST_FILES += write_hugetlb_memory.sh
 
 include ../lib.mk
 
-$(TEST_GEN_PROGS): vm_util.c thp_settings.c pkey_util.c
-$(TEST_GEN_FILES): vm_util.c thp_settings.c pkey_util.c
+$(TEST_GEN_PROGS): vm_util.c thp_settings.c
+$(TEST_GEN_FILES): vm_util.c thp_settings.c
 
 $(OUTPUT)/uffd-stress: uffd-common.c
 $(OUTPUT)/uffd-unit-tests: uffd-common.c
+$(OUTPUT)/protection_keys: pkey_util.c
+$(OUTPUT)/pkey_sighandler_tests: pkey_util.c
 
 ifeq ($(ARCH),x86_64)
 BINARIES_32 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_32))
 BINARIES_64 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_64))
 
+$(BINARIES_32) $(BINARIES_64): pkey_util.c
+
 define gen-target-rule-32
 $(1) $(1)_32: $(OUTPUT)/$(1)_32
 .PHONY: $(1) $(1)_32
-- 
2.47.0


