Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5F1CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 03:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3epTZx2zpHoYrx+jIp0GJ9YwCcHXRSIhQj1q5UTgzLA=; b=soMXuTE7NCi67A0Ym16qD+nqUJ
	WwKV3TzOwnzItvLctePhjrPU2JqVtMjKNxn1XzL3WAyPWcTCup/ZuQNVm2mv/1SAgKaovyNwhh7uE
	s2Gm93sSWovFX2sRES2lPY9eEVDxzX3iKfXQVg9d0lSJvJ2Nts2vyxDGRPKL2q8JAMoLc5BNmq08R
	6iRsRuczpi/jN/Zp/I7qzJVgRPAY4y/Ta+n/hBJdE7YXLRNqXLmR+R2AIe2UMpmXZFvE08/VpGKLl
	swbSd8fOrB/OeaTk/RYdJpDxFQMHHz4OJqMUfMsb+UMeJpep0ZpMwHGsE00Yyu67qJDexPIFLX8F9
	koMI2m9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqO4f-00000006ph5-1Bj3;
	Mon, 25 Aug 2025 03:40:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNyb-00000006ogj-2C1S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 03:34:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B7822A6B;
	Sun, 24 Aug 2025 20:34:24 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A1703F63F;
	Sun, 24 Aug 2025 20:34:31 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-trace-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	mingo@redhat.com,
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
Subject: [PATCH v7 2/7] arm64: uaccess: Move existing GCS accessors definitions to gcs.h
Date: Sun, 24 Aug 2025 22:34:16 -0500
Message-ID: <20250825033421.463669-3-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825033421.463669-1-jeremy.linton@arm.com>
References: <20250825033421.463669-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_203433_707031_46EC0C98 
X-CRM114-Status: GOOD (  13.78  )
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

We are going to add some additional GCS access helpers to gcs.h in
order to avoid some forward reference problems with uaccess.

In preparation for that, lets move the existing gcssttr() and
put_user_gcs() routines into gcs.h where it makes sense to keep all
the accessors together. Further, the code which uses them already
includes gcs.h and there is an existing CONFIG_ARM64_GCS check we can
reuse. The GCSSTTR instruction description comment is corrected during
the move.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h     | 37 ++++++++++++++++++++++++++++-
 arch/arm64/include/asm/uaccess.h | 40 --------------------------------
 2 files changed, 36 insertions(+), 41 deletions(-)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 5bc432234d3a..10c68d3e6e30 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -21,7 +21,7 @@ static inline void gcsstr(u64 *addr, u64 val)
 	register u64 *_addr __asm__ ("x0") = addr;
 	register long _val __asm__ ("x1") = val;
 
-	/* GCSSTTR x1, x0 */
+	/* GCSSTTR x1, [x0] */
 	asm volatile(
 		".inst 0xd91f1c01\n"
 		:
@@ -81,6 +81,41 @@ static inline int gcs_check_locked(struct task_struct *task,
 	return 0;
 }
 
+static inline int gcssttr(unsigned long __user *addr, unsigned long val)
+{
+	register unsigned long __user *_addr __asm__ ("x0") = addr;
+	register unsigned long _val __asm__ ("x1") = val;
+	int err = 0;
+
+	/* GCSSTTR x1, [x0] */
+	asm volatile(
+		"1: .inst 0xd91f1c01\n"
+		"2: \n"
+		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)
+		: "+r" (err)
+		: "rZ" (_val), "r" (_addr)
+		: "memory");
+
+	return err;
+}
+
+static inline void put_user_gcs(unsigned long val, unsigned long __user *addr,
+				int *err)
+{
+	int ret;
+
+	if (!access_ok((char __user *)addr, sizeof(u64))) {
+		*err = -EFAULT;
+		return;
+	}
+
+	uaccess_ttbr0_enable();
+	ret = gcssttr(addr, val);
+	if (ret != 0)
+		*err = ret;
+	uaccess_ttbr0_disable();
+}
+
 #else
 
 static inline bool task_gcs_el0_enabled(struct task_struct *task)
diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
index 5b91803201ef..1aa4ecb73429 100644
--- a/arch/arm64/include/asm/uaccess.h
+++ b/arch/arm64/include/asm/uaccess.h
@@ -502,44 +502,4 @@ static inline size_t probe_subpage_writeable(const char __user *uaddr,
 
 #endif /* CONFIG_ARCH_HAS_SUBPAGE_FAULTS */
 
-#ifdef CONFIG_ARM64_GCS
-
-static inline int gcssttr(unsigned long __user *addr, unsigned long val)
-{
-	register unsigned long __user *_addr __asm__ ("x0") = addr;
-	register unsigned long _val __asm__ ("x1") = val;
-	int err = 0;
-
-	/* GCSSTTR x1, x0 */
-	asm volatile(
-		"1: .inst 0xd91f1c01\n"
-		"2: \n"
-		_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)
-		: "+r" (err)
-		: "rZ" (_val), "r" (_addr)
-		: "memory");
-
-	return err;
-}
-
-static inline void put_user_gcs(unsigned long val, unsigned long __user *addr,
-				int *err)
-{
-	int ret;
-
-	if (!access_ok((char __user *)addr, sizeof(u64))) {
-		*err = -EFAULT;
-		return;
-	}
-
-	uaccess_ttbr0_enable();
-	ret = gcssttr(addr, val);
-	if (ret != 0)
-		*err = ret;
-	uaccess_ttbr0_disable();
-}
-
-
-#endif /* CONFIG_ARM64_GCS */
-
 #endif /* __ASM_UACCESS_H */
-- 
2.50.1


