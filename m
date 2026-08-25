Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5823FC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 11:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REoieQBuJDbEHvzi2YeH6ersKEj0BCtB2GfQCWON1YI=; b=2lcR7wWKR+EReDD6OqW+TVo02s
	KZyUaI3v/54Licx29ChMHXhiAUjIuHq5T6S8vUx3pAFUNIhH9SDkCKG3YNjjuWCA6N1szBePT4YqZ
	dJ9iajXndbeEr3/Ygs81QBYw4WGtlYacUT+fYbjWvAJao5kExINFwX7fJu/PG92XLN0qs6Skal04T
	qDIal6ac1fDqRUV/ovJF8LS6xW/+gb8AX4l5VWNzBf/hXbr+hHpwz5j+nQn4ZHwNve/Aw3nkHcaRf
	y/6E9icmYMc5exWwuLamDi1WQHJ52YE3BwfX0UzeCaYWcgZaGiJ4806y5uu6+6diDAR+l44FYuLHZ
	wTmBL1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypC2-00000000fyJ-1d0m;
	Tue, 25 Aug 2026 11:19:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypBt-00000000fss-0jz7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 11:19:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5A8B153B;
	Tue, 25 Aug 2026 04:19:36 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0584E3F66F;
	Tue, 25 Aug 2026 04:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787656780; bh=I/697pWPhGzz8TSkJo0AiC5j0ACcBqX/vSOHckSPgog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yv+4Tgm+wvMu866KPep5l3UKAREe66Bn7QwXjXk9va4PeSxP7YT4Tx1cuI/mC7eOy
	 R4C/ORpy9zabfy2P0hBZjV9tXJX145JsD2CJFtnWxM98SnwelpwsbutSck9JDB5k8M
	 s4pWhoui5DwjsO31ua13S9aYR33r2Dt7b/UM+JSs=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v3 4/4] selftests/arm64: Add MTE test config fragment
Date: Tue, 25 Aug 2026 12:18:37 +0100
Message-ID: <20260825111929.2882324-5-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825111929.2882324-1-usama.anjum@arm.com>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_041941_256340_7E82D682 
X-CRM114-Status: GOOD (  11.41  )
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

Reviewed-by: Mark Brown <broonie@kernel.org>
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


