Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3835C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 04:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyjyBhl9Ra6ZeoiHL3Wdo4LqGUcnCy5KIMKWQr8svk4=; b=BsNHJlsERGTPTbbxmxPel+LBSN
	41scdpMck1x3xivlfG7aQfkRO8qF0qfzlaU0yDMgrFSUHGr62Oj3syZKZMbmhtg1RtqNFzEAUJzO/
	rGy2gvPQ2GpWjegVkvtUazDx2CGYtoYDMu3M6c3i61iHtXPmycNvi2czJuXuKwqd6aW1i1j5hpaBl
	8bs9dmW0s2aFE5eRteanmFFz3FPtcoTlFFL7Ni5BkObPcBngbl4ljKMAoobY1NRorDWJgMCGkRBCs
	Sg/NwPU/ODWQWB7BIRNlCaoN3gvoHBGqQs3EFfvJ7ysd8KVpZkb1hl/3sjcLvca5zuLFR7X6oKmA7
	f11ZEzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uczWr-0000000DtUd-0G79;
	Sat, 19 Jul 2025 04:50:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uczKg-0000000DsPg-38MA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 04:37:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E24C2437;
	Fri, 18 Jul 2025 21:37:51 -0700 (PDT)
Received: from u200865.usa.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 374973F66E;
	Fri, 18 Jul 2025 21:37:57 -0700 (PDT)
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
Subject: [PATCH v4 4/8] arm64: uaccess: Add additional userspace GCS accessors
Date: Fri, 18 Jul 2025 23:37:36 -0500
Message-ID: <20250719043740.4548-5-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250719043740.4548-1-jeremy.linton@arm.com>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_213758_902432_41ED2837 
X-CRM114-Status: GOOD (  12.55  )
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
 arch/arm64/include/asm/gcs.h | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index e3b360c9dba4..f2fc8173fee3 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -116,6 +116,45 @@ static inline void put_user_gcs(unsigned long val, unsigned long __user *addr,
 	uaccess_ttbr0_disable();
 }
 
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
+
 #else
 
 static inline bool task_gcs_el0_enabled(struct task_struct *task)
@@ -126,6 +165,10 @@ static inline bool task_gcs_el0_enabled(struct task_struct *task)
 static inline void gcs_set_el0_mode(struct task_struct *task) { }
 static inline void gcs_free(struct task_struct *task) { }
 static inline void gcs_preserve_current_state(void) { }
+static inline void put_user_gcs(unsigned long val, unsigned long __user *addr,
+				int *err) { }
+static inline void push_user_gcs(unsigned long val, int *err) { }
+
 static inline unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 						   const struct kernel_clone_args *args)
 {
@@ -136,6 +179,15 @@ static inline int gcs_check_locked(struct task_struct *task,
 {
 	return 0;
 }
+static inline u64 load_user_gcs(unsigned long __user *addr, int *err)
+{
+	*err = -EFAULT;
+	return 0;
+}
+static inline u64 pop_user_gcs(int *err)
+{
+	return 0;
+}
 
 #endif
 
-- 
2.50.1


