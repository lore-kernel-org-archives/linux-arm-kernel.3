Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FF2C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 04:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7wjyQrFjgWH5pwHDgYr1zL9rMo23mP0z2XKPRK5Uy4=; b=wvCBi1mMW85Fl6udHbqr09sThX
	R+13vJXUXPlCvocl+jQnuor2hYyKuS0VXrBc+bcgJthIkyHGip9ZYmNNKioV67xL7yitf3zNjLiX7
	QzWK+tLAL4v9qBkMweVYH1iC1guiWBdCJhNz7d65R2VMx7DNuYv37Ny6dJjwk/wDy2aytwkY/LNct
	XkZyw2KofHs3OUwqHXDQBj3dWOaKh7Cdu5QRmnUGO/fKSVVXFqJ13c4BEijVacOGRCvzp1Zg19VbY
	NiuxuncsLVGmjXW/Bz0J96doXgnhAtSk6DT7mIsWojmFkd9abtbqytEbtSY6nNBqj7sc27RJIwZZ+
	3QEmqLcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uczUP-0000000DtMO-1BmI;
	Sat, 19 Jul 2025 04:48:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uczKf-0000000DsPx-1bn2
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 04:37:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7600522EE;
	Fri, 18 Jul 2025 21:37:49 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 632693F66E;
	Fri, 18 Jul 2025 21:37:55 -0700 (PDT)
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
Subject: [PATCH v4 3/8] arm64: uaccess: Move existing GCS accessors definitions to gcs.h
Date: Fri, 18 Jul 2025 23:37:35 -0500
Message-ID: <20250719043740.4548-4-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250719043740.4548-1-jeremy.linton@arm.com>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_213757_530745_018C7D1F 
X-CRM114-Status: GOOD (  14.06  )
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
reuse.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 arch/arm64/include/asm/gcs.h     | 35 ++++++++++++++++++++++++++++
 arch/arm64/include/asm/uaccess.h | 40 --------------------------------
 2 files changed, 35 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 5bc432234d3a..e3b360c9dba4 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -81,6 +81,41 @@ static inline int gcs_check_locked(struct task_struct *task,
 	return 0;
 }
 
+static inline int gcssttr(unsigned long __user *addr, unsigned long val)
+{
+	register unsigned long __user *_addr __asm__ ("x0") = addr;
+	register unsigned long _val __asm__ ("x1") = val;
+	int err = 0;
+
+	/* GCSSTTR x1, x0 */
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


