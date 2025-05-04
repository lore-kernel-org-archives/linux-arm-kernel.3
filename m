Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801B2C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 23:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpvRBpGYEnwpfwDmSNpDyV1CEuLroQggbPFTJqL06A0=; b=3buQVGKCOaOifIk/9sgf7iIyd5
	uvR3XSJYrPJpPg2oZsW41OXIfSZg6h5RkOa9CilPoWQg1L5fBnJYC6kAE1ZgRsoq/AgSAw41jGd3L
	iGEL/YDBhKzuzJGEoRDm9ulgQVjHcoD/UoUj14B383Pe+zJhSyDcxpdfE7UK2pL0Pd+O1rwbpk3jU
	+B8qQ5yEpQt4k9HAbFTrKT7cA52QT1nlJdMxvsiS6tKuWlOqh8QdmW4BZWhfMCVxu/+kbJDPS/Hlf
	ffLdTHY7LxhSpLfUIXXodnlaKT4dIiYwbsZDA2KM7Ihqke4RU6NY3TpBXNrJldWHDFgoIA3pbOIex
	haO4MjVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBiuS-000000068Oo-0asu;
	Sun, 04 May 2025 23:38:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBiol-000000067h9-3Dya
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 May 2025 23:32:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DF2E1BC0;
	Sun,  4 May 2025 16:32:09 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51E533F58B;
	Sun,  4 May 2025 16:32:18 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	thiago.bauermann@linaro.org,
	broonie@kernel.org,
	yury.khrustalev@arm.com,
	kristina.martsenko@arm.com,
	liaochang1@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [PATCH v3 3/7] arm64: uaccess: Add additional userspace GCS accessors
Date: Sun,  4 May 2025 18:31:59 -0500
Message-ID: <20250504233203.616587-4-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504233203.616587-1-jeremy.linton@arm.com>
References: <20250504233203.616587-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_163219_851162_7E38BEDE 
X-CRM114-Status: GOOD (  12.83  )
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

Uprobes need more advanced read, push, and pop userspace GCS
functionality. Implement those features using the existing gcsstr()
and copy_from_user().

Its important to note that GCS pages can be read by normal
instructions, but the hardware validates that pages used by GCS
specific operations, have a GCS privilege set. We aren't validating this
in load_user_gcs because it requires stabilizing the VMA over the read
which may fault.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 arch/arm64/include/asm/uaccess.h | 42 ++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 5b91803201ef..34a8b2cc8935 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -20,6 +20,7 @@
 
 #include <asm/asm-extable.h>
 #include <asm/cpufeature.h>
+#include <asm/gcs.h>
 #include <asm/mmu.h>
 #include <asm/mte.h>
 #include <asm/ptrace.h>
@@ -539,6 +540,47 @@ static inline void put_user_gcs(unsigned long val, unsigned long __user *addr,
 	uaccess_ttbr0_disable();
 }
 
+static __always_inline unsigned long __must_check
+copy_from_user(void *to, const void __user *from, unsigned long n);
+
+/*
+ * Unlike put_user_gcs() above, the use of copy_from_user() may provide
+ * an opening for non GCS pages to be used to source data. Therefore this
+ * should only be used in contexts where that is acceptable.
+ */
+static inline u64 load_user_gcs(unsigned long __user *addr, int *err)
+{
+	unsigned long ret;
+	u64 load = 0;
+
+	gcsb_dsync();
+	ret = copy_from_user(&load, addr, sizeof(load));
+	if (ret != 0)
+		*err = ret;
+	return load;
+}
+
+static inline void push_user_gcs(unsigned long val, int *err)
+{
+	u64 gcspr = read_sysreg_s(SYS_GCSPR_EL0);
+
+	gcspr -= sizeof(u64);
+	put_user_gcs(val, (unsigned long __user *)gcspr, err);
+	if (!*err)
+		write_sysreg_s(gcspr, SYS_GCSPR_EL0);
+}
+
+static inline u64 pop_user_gcs(int *err)
+{
+	u64 gcspr = read_sysreg_s(SYS_GCSPR_EL0);
+	u64 read_val;
+
+	read_val = load_user_gcs((unsigned long __user *)gcspr, err);
+	if (!*err)
+		write_sysreg_s(gcspr + sizeof(u64), SYS_GCSPR_EL0);
+
+	return read_val;
+}
 
 #endif /* CONFIG_ARM64_GCS */
 
-- 
2.49.0


