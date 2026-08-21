Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8D1C5DF89
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6nvRVTfawWXJgW9zS2ZFauA3QcKJM1clnqXTZQzhD8=; b=enZdjgmK0ervoTSWojLUljy+Cs
	MURIxaS+JpN63RvHEg01uGDRXNDjgjb9VjzSg+5msy/KwI03WYcHq2UZytZqothHoNdDpUnNbHgPr
	3oFirwyUWsMdkZeLQi6okqQShdWzyEZ4S0IieAwlzhN1f2crypZyGj/1sdVgBmaiYQV7zKcoxgC/w
	eFZwJXIYO4JAnPcz9pIhWrcd/idQKZbg2igXn5zHsz9sXF847GOt8OANn4Hf7cU0B1NMmQNvpsuMG
	g95y9nbI0PVC1XQcGXRQYpsUBRnF+G1gUF5Syr7WYSD4elYVCwrxZReXyMtauEQbGNdiS8hdRWO7x
	Uj2fH2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQ2l-0000000DWeG-27XK;
	Fri, 21 Aug 2026 14:16:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQ2Y-0000000DWWG-04hu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:16:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E26722C8;
	Fri, 21 Aug 2026 07:16:09 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A6AB3F85F;
	Fri, 21 Aug 2026 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787321773; bh=kcTQsC3Bd3GhdslHTEcBTgJQu7xoquii4VHYMzHe8WU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TiDhLsfBJqhxlr3u4mRBOJlkF66QtntY7nKg+yOcy8hQ9C76tifjdB3FsHt+m/64E
	 qiZN5uLaZni5qtGRrbJkn3h9QxTmQPmqCeh+HRJudd4icu5UqtIa5F10BGC/Jd3Z+m
	 PgSG44rqDCWo3iwd21rl0Btipjc/Zhc2yT9L8Jgs=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v2 5/5] selftests/arm64: Add MTE test config fragment
Date: Fri, 21 Aug 2026 15:15:53 +0100
Message-ID: <20260821141556.4065894-6-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260821141556.4065894-1-usama.anjum@arm.com>
References: <20260821141556.4065894-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_071614_103971_01C346DE 
X-CRM114-Status: GOOD (  10.98  )
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

The arm64 selftest collection has no Kconfig fragment, so kernels built
with the selftest requirements are not guaranteed to provide the support
used by these tests.

Add a fragment covering all tests in arm64.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
Changes since v1:
- Move the config fragment to the arm64 directory.
- Add requirements shared by other arm64 selftests.
- Use the selftests/arm64 subject prefix.
---
 tools/testing/selftests/arm64/config | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 tools/testing/selftests/arm64/config

diff --git a/tools/testing/selftests/arm64/config b/tools/testing/selftests/arm64/config
new file mode 100644
index 0000000000000..0fa9755853924
--- /dev/null
+++ b/tools/testing/selftests/arm64/config
@@ -0,0 +1,17 @@
+CONFIG_ARM64_BTI=y
+CONFIG_ARM64_GCS=y
+CONFIG_ARM64_MTE=y
+CONFIG_ARM64_POE=y
+CONFIG_ARM64_PTR_AUTH=y
+CONFIG_ARM64_SME=y
+CONFIG_ARM64_SVE=y
+CONFIG_ARM64_TAGGED_ADDR_ABI=y
+CONFIG_HUGETLBFS=y
+CONFIG_KSM=y
+CONFIG_PROC_FS=y
+CONFIG_SECCOMP=y
+CONFIG_SECCOMP_FILTER=y
+CONFIG_SHMEM=y
+CONFIG_SYSCTL=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
-- 
2.47.3


