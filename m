Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7249AE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxMeFEEwvQrLCtlm4d4OLd7dbIl6+CStb/w25wOHCtY=; b=GmZ7Z7DeQyQGSBvTn5sW4tdFSc
	y5cQe5TIYXTUE+0RqRu51LiYjdrdjl7KYDGLVDZ6ukftOiMsqbo79gxiOpkAh9fwU3VbJ98G2No3G
	pLt5g2wiWNRG+OC+mymYvFwUyOtQNaaE2Qvt1MCthehrw2tqpPWjA+Sq40SmyjeOQJY8kPAUynpvu
	uzX7Pz/1gfABmHyWgBti1x1bnjaot9aYrR7l+fznLE57NbYAa/1Z0NEKCvcXlAeRQZixLQy2udS+P
	l+znZlMw610ba10t+d1GVamsdeZJAMlOBKyDKam8H15hC3woPFEwxvcMoSLN6Pwkxx3f6c0IMb2MS
	NbDm8iKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAwC-0000000FwKE-0N0g;
	Thu, 05 Dec 2024 12:26:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAn9-0000000Fuoy-3Cea
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:17:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B214169E;
	Thu,  5 Dec 2024 04:17:39 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 947FB3F5A1;
	Thu,  5 Dec 2024 04:17:10 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	joey.gouly@arm.com,
	mark.rutland@arm.com,
	will@kernel.org
Subject: [PATCH 4/4] arm64: ptrace: fix partial SETREGSET for NT_ARM_GCS
Date: Thu,  5 Dec 2024 12:16:55 +0000
Message-Id: <20241205121655.1824269-5-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20241205121655.1824269-1-mark.rutland@arm.com>
References: <20241205121655.1824269-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_041711_887567_9DFA6DC8 
X-CRM114-Status: GOOD (  17.80  )
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

Currently gcs_set() doesn't initialize the temporary 'user_gcs'
variable, and a SETREGSET call with a length of 0, 8, or 16 will leave
some portion of this uninitialized. Consequently some arbitrary
uninitialized values may be written back to the relevant fields in task
struct, potentially leaking up to 192 bits of memory from the kernel
stack. The read is limited to a specific slot on the stack, and the
issue does not provide a write mechanism.

As gcs_set() rejects cases where user_gcs::features_enabled has bits set
other than PR_SHADOW_STACK_SUPPORTED_STATUS_MASK, a SETREGSET call with
a length of zero will randomly succeed or fail depending on the value of
the uninitialized value, it isn't possible to leak the full 192 bits.
With a length of 8 or 16, user_gcs::features_enabled can be initialized
to an accepted value, making it practical to leak 128 or 64 bits.

Fix this by initializing the temporary value before copying the regset
from userspace, as for other regsets (e.g. NT_PRSTATUS, NT_PRFPREG,
NT_ARM_SYSTEM_CALL). In the case of a zero-length or partial write, the
existing contents of the fields which are not written to will be
retained.

To ensure that the extraction and insertion of fields is consistent
across the GETREGSET and SETREGSET calls, new task_gcs_to_user() and
task_gcs_from_user() helpers are added, matching the style of
pac_address_keys_to_user() and pac_address_keys_from_user().

Before this patch:

| # ./gcs-test
| Attempting to write NT_ARM_GCS::user_gcs = {
|     .features_enabled = 0x0000000000000000,
|     .features_locked  = 0x0000000000000000,
|     .gcspr_el0        = 0x900d900d900d900d,
| }
| SETREGSET(nt=0x410, len=24) wrote 24 bytes
|
| Attempting to read NT_ARM_GCS::user_gcs
| GETREGSET(nt=0x410, len=24) read 24 bytes
| Read NT_ARM_GCS::user_gcs = {
|     .features_enabled = 0x0000000000000000,
|     .features_locked  = 0x0000000000000000,
|     .gcspr_el0        = 0x900d900d900d900d,
| }
|
| Attempting partial write NT_ARM_GCS::user_gcs = {
|     .features_enabled = 0x0000000000000000,
|     .features_locked  = 0x1de7ec7edbadc0de,
|     .gcspr_el0        = 0x1de7ec7edbadc0de,
| }
| SETREGSET(nt=0x410, len=8) wrote 8 bytes
|
| Attempting to read NT_ARM_GCS::user_gcs
| GETREGSET(nt=0x410, len=24) read 24 bytes
| Read NT_ARM_GCS::user_gcs = {
|     .features_enabled = 0x0000000000000000,
|     .features_locked  = 0x000000000093e780,
|     .gcspr_el0        = 0xffff800083a63d50,
| }

After this patch:

| # ./gcs-test
| Attempting to write NT_ARM_GCS::user_gcs = {
|     .features_enabled = 0x0000000000000000,
|     .features_locked  = 0x0000000000000000,
|     .gcspr_el0        = 0x900d900d900d900d,
| }
| SETREGSET(nt=0x410, len=24) wrote 24 bytes
|
| Attempting to read NT_ARM_GCS::user_gcs
| GETREGSET(nt=0x410, len=24) read 24 bytes
| Read NT_ARM_GCS::user_gcs = {
|     .features_enabled = 0x0000000000000000,
|     .features_locked  = 0x0000000000000000,
|     .gcspr_el0        = 0x900d900d900d900d,
| }
|
| Attempting partial write NT_ARM_GCS::user_gcs = {
|     .features_enabled = 0x0000000000000000,
|     .features_locked  = 0x1de7ec7edbadc0de,
|     .gcspr_el0        = 0x1de7ec7edbadc0de,
| }
| SETREGSET(nt=0x410, len=8) wrote 8 bytes
|
| Attempting to read NT_ARM_GCS::user_gcs
| GETREGSET(nt=0x410, len=24) read 24 bytes
| Read NT_ARM_GCS::user_gcs = {
|     .features_enabled = 0x0000000000000000,
|     .features_locked  = 0x0000000000000000,
|     .gcspr_el0        = 0x900d900d900d900d,
| }

Fixes: 7ec3b57cb29f8371 ("arm64/ptrace: Expose GCS via ptrace and core files")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kernel/ptrace.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f17810030fa05..f79b0d5f71ac9 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -1491,6 +1491,22 @@ static int poe_set(struct task_struct *target, const struct
 #endif
 
 #ifdef CONFIG_ARM64_GCS
+static void task_gcs_to_user(struct user_gcs *user_gcs,
+			     const struct task_struct *target)
+{
+	user_gcs->features_enabled = target->thread.gcs_el0_mode;
+	user_gcs->features_locked = target->thread.gcs_el0_locked;
+	user_gcs->gcspr_el0 = target->thread.gcspr_el0;
+}
+
+static void task_gcs_from_user(struct task_struct *target,
+			       const struct user_gcs *user_gcs)
+{
+	target->thread.gcs_el0_mode = user_gcs->features_enabled;
+	target->thread.gcs_el0_locked = user_gcs->features_locked;
+	target->thread.gcspr_el0 = user_gcs->gcspr_el0;
+}
+
 static int gcs_get(struct task_struct *target,
 		   const struct user_regset *regset,
 		   struct membuf to)
@@ -1503,9 +1519,7 @@ static int gcs_get(struct task_struct *target,
 	if (target == current)
 		gcs_preserve_current_state();
 
-	user_gcs.features_enabled = target->thread.gcs_el0_mode;
-	user_gcs.features_locked = target->thread.gcs_el0_locked;
-	user_gcs.gcspr_el0 = target->thread.gcspr_el0;
+	task_gcs_to_user(&user_gcs, target);
 
 	return membuf_write(&to, &user_gcs, sizeof(user_gcs));
 }
@@ -1521,6 +1535,8 @@ static int gcs_set(struct task_struct *target, const struct
 	if (!system_supports_gcs())
 		return -EINVAL;
 
+	task_gcs_to_user(&user_gcs, target);
+
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &user_gcs, 0, -1);
 	if (ret)
 		return ret;
@@ -1528,9 +1544,7 @@ static int gcs_set(struct task_struct *target, const struct
 	if (user_gcs.features_enabled & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
 		return -EINVAL;
 
-	target->thread.gcs_el0_mode = user_gcs.features_enabled;
-	target->thread.gcs_el0_locked = user_gcs.features_locked;
-	target->thread.gcspr_el0 = user_gcs.gcspr_el0;
+	task_gcs_from_user(target, &user_gcs);
 
 	return 0;
 }
-- 
2.30.2


