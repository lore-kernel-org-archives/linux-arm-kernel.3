Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2A2CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 11:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R8Il8GoAEckBLosEZkgYWjig0PpFZNfPn2uShd+kuQw=; b=GM/oYIFCkLDOdtOqkt6B5qNzWd
	se7zx5dRENUiBoD0lympaO2YnMZ7jTW+1t2Bo50OrsYOWxupL8lD9C8qK/2p6V67N4Wm7IM3T0Ikv
	jwRLvrBQSxfmGv5vBLN5YODwogbwA9KUx8K7Z0h2Tf7PBHmWT2ncJ5ZWoAwxREyU5ujku6gv6wp9g
	+u7OJqj9v4Y/ipmujG7HRkDbhkH2wE7SolEX5EyvdZAMosR3oq1QmtqNC4vVl4SKfwPvSaxe39z+1
	FjM8uWY7ezqCKvtfr9ddOVQ3ObcR2XtYUZe0QsYXNKfNVLlnjn2ncU2UnaMTCwTQVcTPNKiV/8fOR
	k1N5iU2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzmG-0000000AnAm-2UEq;
	Fri, 12 Jun 2026 11:10:20 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXzmD-0000000AnAD-3Hat
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 11:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781262618; x=1812798618;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9qubmuU7CLkrQdKYRxmeV83E7ctcbp//g8biYkjQtpM=;
  b=FNmauhHawTLP62gvilJ+4YPJZMhzgW7svd1QHHb05SGE3BZNEOEZiGkM
   OPOevDqSDd12hfOBa+QsEz3lh7WzNd0ioPo/UiHxozfMUR3jRgiB5lHWa
   QcaSmYuAac/JzxUci/MbFwtaR7jtqhVVjeTu1d8DB5y2yXR1meb/YzKVg
   4lDp0edqu4dwq/q+7QCiH1+JppHhp+no1eW0tlGT+KWzNfG15utDtPlf8
   AWAYhvo/QstJeeodXZ9J2aJj4xmHRtyUcojkPMri4tpTbGUJgO5OKq9/x
   FhP7k+gTxfU7YSpgIC2JqOFOEa97eU7zNhaq4JBEdnpAsIwR1tx8nX49e
   A==;
X-CSE-ConnectionGUID: SSNgpjzPTvaEuAxvxD1DHg==
X-CSE-MsgGUID: cGFyRpvaTZqhKl59iSvtPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="243935541"
X-IronPort-AV: E=Sophos;i="6.24,200,1774278000"; 
   d="scan'208";a="243935541"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 20:10:13 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6981025DFB
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 11:10:13 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 150E41C4DE98
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 11:10:13 +0000 (UTC)
Received: from FCCLS0092175.flets-east.jp (unknown [10.9.54.178])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 817851000A62;
	Fri, 12 Jun 2026 11:10:09 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	Steven Price <steven.price@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Kohei Enju <enju.kohei@fujitsu.com>
Subject: [PATCH v3] virt: arm-cca-guest: use migrate_disable() for attestation token requests
Date: Fri, 12 Jun 2026 20:09:21 +0900
Message-ID: <20260612111007.49434-1-enju.kohei@fujitsu.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_041018_147406_D10C799E 
X-CRM114-Status: GOOD (  30.83  )
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

The RSI attestation token init and continue calls must be issued from
the same CPU. arm_cca_report_new() currently snapshots the CPU number
and uses smp_call_function_single() to issue those calls on that CPU.

With CONFIG_DEBUG_PREEMPT=y, the smp_processor_id() call used for the
snapshot triggers a debug splat [0] because it runs in preemptible
context. The snapshot does not pin the task to that CPU; it is only used
to choose the target CPU for smp_call_function_single(), which can fail
if that CPU is no longer available.

Use migrate_disable() and issue the token init and continue operations
directly, without the smp_call_function_single() callbacks. This keeps
the token request sequence on the same CPU while preserving a sleepable
context for the GFP_KERNEL allocations needed after the init call.

[0]
 BUG: using smp_processor_id() in preemptible [00000000] code: cca-workload-at/264
 caller is debug_smp_processor_id+0x20/0x30
 CPU: 0 UID: 0 PID: 264 Comm: cca-workload-at Not tainted 7.1.0-rc1-00044-g55542ab273f2 #80 PREEMPT(lazy)
 Hardware name: linux,dummy-virt (DT)
 Call trace:
  [...]
  check_preemption_disabled+0xd8/0xf8
  debug_smp_processor_id+0x20/0x30
  arm_cca_report_new+0x48/0x278
  tsm_report_read+0x154/0x1f8
  tsm_report_outblob_read+0x20/0x38
  configfs_bin_read_iter+0x118/0x208
  vfs_read+0x220/0x318
  [...]

Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
Signed-off-by: Kohei Enju <enju.kohei@fujitsu.com>
---
Changes:
v3:
  - Switch to migrate_disable() and call RSI directly, removing
    smp_call_function_single() (Will, Suzuki)
  - Remove arm_cca_attestation_init() helper and unused fields from
    arm_cca_token_info
  - Drop Reviewed-by tags since the approach changed from v2
v2: https://lore.kernel.org/linux-arm-kernel/20260519101217.155740-1-enju.kohei@fujitsu.com/
  - Add comment about why this path doesn't use migrate_disable()
v1: https://lore.kernel.org/linux-arm-kernel/20260518033157.1865498-1-enju.kohei@fujitsu.com/
---
 .../virt/coco/arm-cca-guest/arm-cca-guest.c   | 97 +++++++------------
 1 file changed, 36 insertions(+), 61 deletions(-)

diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
index 66d00b6ceb78..a38df08da6fa 100644
--- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
+++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
@@ -16,54 +16,38 @@
 
 /**
  * struct arm_cca_token_info - a descriptor for the token buffer.
- * @challenge:		Pointer to the challenge data
- * @challenge_size:	Size of the challenge data
  * @granule:		PA of the granule to which the token will be written
  * @offset:		Offset within granule to start of buffer in bytes
- * @result:		result of rsi_attestation_token_continue operation
  */
 struct arm_cca_token_info {
-	void           *challenge;
-	unsigned long   challenge_size;
 	phys_addr_t     granule;
 	unsigned long   offset;
-	unsigned long   result;
 };
 
-static void arm_cca_attestation_init(void *param)
-{
-	struct arm_cca_token_info *info;
-
-	info = (struct arm_cca_token_info *)param;
-
-	info->result = rsi_attestation_token_init(info->challenge,
-						  info->challenge_size);
-}
-
 /**
  * arm_cca_attestation_continue - Retrieve the attestation token data.
  *
- * @param: pointer to the arm_cca_token_info
+ * @info: pointer to the arm_cca_token_info
  *
  * Attestation token generation is a long running operation and therefore
  * the token data may not be retrieved in a single call. Moreover, the
  * token retrieval operation must be requested on the same CPU on which the
  * attestation token generation was initialised.
- * This helper function is therefore scheduled on the same CPU multiple
+ * This helper function must therefore be executed on the same CPU multiple
  * times until the entire token data is retrieved.
  */
-static void arm_cca_attestation_continue(void *param)
+static unsigned long
+arm_cca_attestation_continue(struct arm_cca_token_info *info)
 {
+	unsigned long ret;
 	unsigned long len;
 	unsigned long size;
-	struct arm_cca_token_info *info;
-
-	info = (struct arm_cca_token_info *)param;
 
 	size = RSI_GRANULE_SIZE - info->offset;
-	info->result = rsi_attestation_token_continue(info->granule,
-						      info->offset, size, &len);
+	ret = rsi_attestation_token_continue(info->granule, info->offset, size,
+					     &len);
 	info->offset += len;
+	return ret;
 }
 
 /**
@@ -74,8 +58,8 @@ static void arm_cca_attestation_continue(void *param)
  *
  * Initialise the attestation token generation using the challenge data
  * passed in the TSM descriptor. Allocate memory for the attestation token
- * and schedule calls to retrieve the attestation token on the same CPU
- * on which the attestation token generation was initialised.
+ * and retrieve the attestation token on the same CPU on which the
+ * attestation token generation was initialised.
  *
  * The challenge data must be at least 32 bytes and no more than 64 bytes. If
  * less than 64 bytes are provided it will be zero padded to 64 bytes.
@@ -85,12 +69,11 @@ static void arm_cca_attestation_continue(void *param)
  * * %-EINVAL  - A parameter was not valid.
  * * %-ENOMEM  - Out of memory.
  * * %-EFAULT  - Failed to get IPA for memory page(s).
- * * A negative status code as returned by smp_call_function_single().
  */
 static int arm_cca_report_new(struct tsm_report *report, void *data)
 {
-	int ret;
-	int cpu;
+	int ret = 0;
+	unsigned long rsi_result;
 	long max_size;
 	unsigned long token_size = 0;
 	struct arm_cca_token_info info;
@@ -103,37 +86,33 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
 
 	/*
 	 * The attestation token 'init' and 'continue' calls must be
-	 * performed on the same CPU. smp_call_function_single() is used
-	 * instead of simply calling get_cpu() because of the need to
-	 * allocate outblob based on the returned value from the 'init'
-	 * call and that cannot be done in an atomic context.
+	 * performed on the same CPU, so disable CPU migration around
+	 * those operations.
 	 */
-	cpu = smp_processor_id();
+	migrate_disable();
 
-	info.challenge = desc->inblob;
-	info.challenge_size = desc->inblob_len;
-
-	ret = smp_call_function_single(cpu, arm_cca_attestation_init,
-				       &info, true);
-	if (ret)
-		return ret;
-	max_size = info.result;
-
-	if (max_size <= 0)
-		return -EINVAL;
+	max_size = rsi_attestation_token_init(desc->inblob, desc->inblob_len);
+	if (max_size <= 0) {
+		ret = -EINVAL;
+		goto exit_migrate_enable;
+	}
 
 	/* Allocate outblob */
 	token = kvzalloc(max_size, GFP_KERNEL);
-	if (!token)
-		return -ENOMEM;
+	if (!token) {
+		ret = -ENOMEM;
+		goto exit_migrate_enable;
+	}
 
 	/*
 	 * Since the outblob may not be physically contiguous, use a page
 	 * to bounce the buffer from RMM.
 	 */
 	buf = alloc_pages_exact(RSI_GRANULE_SIZE, GFP_KERNEL);
-	if (!buf)
-		return -ENOMEM;
+	if (!buf) {
+		ret = -ENOMEM;
+		goto exit_migrate_enable;
+	}
 
 	/* Get the PA of the memory page(s) that were allocated */
 	info.granule = (unsigned long)virt_to_phys(buf);
@@ -144,21 +123,15 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
 		info.offset = 0;
 		do {
 			/*
-			 * Schedule a call to retrieve a sub-granule chunk
-			 * of data per loop iteration.
+			 * Retrieve a sub-granule chunk of data per loop
+			 * iteration.
 			 */
-			ret = smp_call_function_single(cpu,
-						       arm_cca_attestation_continue,
-						       (void *)&info, true);
-			if (ret != 0) {
-				token_size = 0;
-				goto exit_free_granule_page;
-			}
-		} while (info.result == RSI_INCOMPLETE &&
+			rsi_result = arm_cca_attestation_continue(&info);
+		} while (rsi_result == RSI_INCOMPLETE &&
 			 info.offset < RSI_GRANULE_SIZE);
 
 		/* Break out in case of failure */
-		if (info.result != RSI_SUCCESS && info.result != RSI_INCOMPLETE) {
+		if (rsi_result != RSI_SUCCESS && rsi_result != RSI_INCOMPLETE) {
 			ret = -ENXIO;
 			token_size = 0;
 			goto exit_free_granule_page;
@@ -173,12 +146,14 @@ static int arm_cca_report_new(struct tsm_report *report, void *data)
 			break;
 		memcpy(&token[token_size], buf, info.offset);
 		token_size += info.offset;
-	} while (info.result == RSI_INCOMPLETE);
+	} while (rsi_result == RSI_INCOMPLETE);
 
 	report->outblob = no_free_ptr(token);
 exit_free_granule_page:
 	report->outblob_len = token_size;
 	free_pages_exact(buf, RSI_GRANULE_SIZE);
+exit_migrate_enable:
+	migrate_enable();
 	return ret;
 }
 
-- 
2.43.0


