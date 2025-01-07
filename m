Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8873BE77199
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WIQSm31L3qWF7KxMnUtriHv7VQfsIQtYimBOd2epMA=; b=QbI7yzn6m6k7vuEiM/E609u3K6
	A2gFa2v1MIRbQlp0x0YskWvRZ75WJFdvU1CD3gCVVq3jrvSidH1tNQpviNPfn+vUKZ4U49WimDZbP
	M8YrfqEBe5zdDvigoDEHGSpwxchmYkgwSPxALPvx4xHWxWB2HuZ+W2GrNMn9E320bIjQc5zrkqqVz
	sXU/84pe//W69E9YUekHeexNGIRQIuX3rj4r7h58MffgfCdl2nL20hTxGgKthWnWivbmdpnk4ZLed
	tG3xKIiaMeP3RxluIGAq8AKZFo+KqqGBgwk9tNntaTeddmmoNqr7F3UqXgOFKeANf9H19ytDn4eSV
	dHUoAfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDFI-00000005pws-2nGd;
	Tue, 07 Jan 2025 17:20:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVCxH-00000005kO7-1QUV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:01:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53D5B1424;
	Tue,  7 Jan 2025 09:01:48 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AD3A3F59E;
	Tue,  7 Jan 2025 09:01:17 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	aruna.ramakrishna@oracle.com,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH] selftests/mm: silence unused-result warnings
Date: Tue,  7 Jan 2025 17:01:10 +0000
Message-ID: <20250107170110.2819685-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209095019.1732120-6-kevin.brodsky@arm.com>
References: <20241209095019.1732120-6-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_090123_423203_2A16EC62 
X-CRM114-Status: UNSURE (   9.91  )
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

Switching to -O2 when building the mm tests has the unexpected side
effect of triggering many unused-result warnings on certain distros
like Ubuntu, where GCC is configured so that -O2 implies
-D_FORTIFY_SOURCE.

Explicitly disable FORTIFY_SOURCE to avoid those warnings. This has
no effect on upstream toolchains where FORTIFY_SOURCE is not
implicitly enabled.

Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---

Hi Andrew,

Could you please take this fixup patch for "selftests/mm: Build with
-O2" in mm-unstable? Ryan found that building the mm kselftests on
Ubuntu yields a bunch of warnings, this patch suppresses them.

Cheers,
- Kevin

Cc: aruna.ramakrishna@oracle.com
Cc: catalin.marinas@arm.com
Cc: dave.hansen@linux.intel.com
Cc: joey.gouly@arm.com
Cc: keith.lucas@oracle.com
Cc: shuah@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: x86@kernel.org
---
 tools/testing/selftests/mm/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/mm/Makefile b/tools/testing/selftests/mm/Makefile
index fce194a92cad..d633d6b6a6e1 100644
--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -36,6 +36,13 @@ MAKEFLAGS += --no-builtin-rules
 CFLAGS = -Wall -O2 -I $(top_srcdir) $(EXTRA_CFLAGS) $(KHDR_INCLUDES) $(TOOLS_INCLUDES)
 LDLIBS = -lrt -lpthread -lm
 
+# Some distributions (such as Ubuntu) configure GCC so that _FORTIFY_SOURCE is
+# automatically enabled at -O1 or above. This triggers various unused-result
+# warnings where functions such as read() or write() are called and their
+# return value is not checked. Disable _FORTIFY_SOURCE to silence those
+# warnings.
+CFLAGS += -U_FORTIFY_SOURCE
+
 KDIR ?= /lib/modules/$(shell uname -r)/build
 ifneq (,$(wildcard $(KDIR)/Module.symvers))
 ifneq (,$(wildcard $(KDIR)/include/linux/page_frag_cache.h))
-- 
2.47.0


