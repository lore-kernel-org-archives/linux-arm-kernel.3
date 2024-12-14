Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D667E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 02:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vxp4a3HMqRG0JfwdUfdt/aGwYY30yilU+0KNGrOivwc=; b=3s+qHURCGl+TgeEjcruLga8WHr
	cG7BSb+HsTK+otlcnnkkrrR2+E3YcMciPpK7p1hM4q65v3Jy70Gx7ElVQG3EzOWhPz+AiNdWcDXOD
	c/QN8jN2FuZrmylJq4mM5P9gxH8plwA1fryTGp6z95E01RTUVgI+4IA/4Z1lDh6eKy4OTrVDkmiqn
	8UAxARO14H8mfIkbZvFllmlVTs8DoCXFVK1l3RiNLeZLLWF7vn0TAR+YX6/qWB/2+CMNjdN8JXXpW
	12g6ZSYWEPF/BqXMe/MteA3mCP2/P8RyuJr730c35dolCFvYFC6uBnEHmJyTidJzie83EswB8envz
	mYZcYdTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMHfT-00000005Y1r-3FK9;
	Sat, 14 Dec 2024 02:14:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMHeO-00000005Xvn-2KME
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 02:13:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80E7E5C4699;
	Sat, 14 Dec 2024 02:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B882DC4CED0;
	Sat, 14 Dec 2024 02:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734142378;
	bh=HGMMODJ/4nlo7wIgbPxZU9GVyEgpwvnowEiYXVJgTOU=;
	h=From:Date:Subject:To:Cc:From;
	b=R+ywKZsiLntVdaRda3mbQ0XlvaPoK3xKxAbS2zHhjDROxnKAOGRe55SZurvEMUMQC
	 2iyDZA+9MtGgrEz1My8L+peSL9NXiKPAjHGBMuHQq6f/MPRf5bOimC5KL9gR13ioOV
	 jav60AIKR0P1r91Zr0pxkkuCyCQsDOwqWwBUopcwE32GXIlkvv563/qq0pd7O1HxQG
	 fiXQWP+0RWlWGEQqZcLttVmWrnnKs/THaRzGUZtyXg/VdCHdHY+pEIezfb6SyeWGxk
	 BtiY+Oefgj+/1imiwoMmc8PaxsEuS1ZOBbSXt0aeSS4hUlJVO6N/tEeC+an88tdEDh
	 t2JZboWTT4xOw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 14 Dec 2024 02:12:06 +0000
Subject: [PATCH v3] arm64/signal: Silence sparse warning storing GCSPR_EL0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241214-arm64-gcs-signal-sparse-v3-1-5e8d18fffc0c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHbpXGcC/3XNQQ7CIBCF4as0rMWUoaXUlfcwLpACJVbaMIZom
 t5d2rjQRZf/S+abmaCJ3iA5FTOJJnn0Y8jBDwXRvQrOUN/lJlBCxaBsqYoPUVGnkaJ3QQ0UJxX
 R0Jpb1WrVicY2JF9P0Vj/2uTLNXfv8TnG9/YosXX9mqzcNROjjIKQUt50J6xsz3cTgxmOY3RkR
 RP8QmwfggxpAMsbYILx+g9aluUDavljHwgBAAA=
X-Change-ID: 20241209-arm64-gcs-signal-sparse-53fa9cad67f7
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=4782; i=broonie@kernel.org;
 h=from:subject:message-id; bh=HGMMODJ/4nlo7wIgbPxZU9GVyEgpwvnowEiYXVJgTOU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnXOmnSf/g7yV4Pd1f/zm4TEC01cNPgE+Z3TAYQSj5
 zKVtPbKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ1zppwAKCRAk1otyXVSH0FLlB/
 9FcHR+AWBemhXx3X5V06faDm5BD8lWMYHMLzVo6WMb+kVN/TCIe7vhenFKOXLVFGCdBewjePGmCZ1g
 5jMs3YY47iroC5WKyhs3amRx5N2p2x5l2stVPHxzmGEsNcX9ckNpye2VqsvkujTSaR7TwJ2h+1dZo6
 pKWV+7KCZLNIpNJx4ka2wa/vrMPle2Bpscj5C/E+VnEuTndSrVgJSPqavRW2ze2qfer8vzmOETmqA+
 3IKne8JOPfP7ZBx+0M8XdQfCwcIvSfRhpt20pb8Gp93liLajxxkK3A+Pg+uekTVHxuVECiaPEarUHE
 hildLqXuZ1KcyIWdKMSqa/UZWkr0jp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_181300_691653_A045A255 
X-CRM114-Status: GOOD (  17.17  )
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

We are seeing a sparse warning in gcs_restore_signal():

  arch/arm64/kernel/signal.c:1054:9: sparse: sparse: cast removes address space '__user' of expression

when storing the final GCSPR_EL0 value back into the register, caused by
the fact that write_sysreg_s() casts the value it writes to a u64 which
sparse sees as discarding the __userness of the pointer.

Avoid this by treating the address as an integer, casting to a pointer only
when using it to write to userspace.

While we're at it also inline gcs_signal_cap_valid() into it's one user
and make equivalent updates to gcs_signal_entry().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412082005.OBJ0BbWs-lkp@intel.com/
Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v3:
- Switch to working with u64 instead of pointers, adding casts to
  pointers.
- Inline gcs_signal_cap_valid()
- Link to v2: https://lore.kernel.org/r/20241211-arm64-gcs-signal-sparse-v2-1-c22f37216135@kernel.org

Changes in v2:
- Use __force u64 rather than unsigned long.
- Tweak commit message.
- Link to v1: https://lore.kernel.org/r/20241210-arm64-gcs-signal-sparse-v1-1-26888bcd6f89@kernel.org
---
 arch/arm64/kernel/signal.c | 35 +++++++++++++++--------------------
 1 file changed, 15 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 14ac6fdb872b9672e4b16a097f1b577aae8dec50..928bdaa51df19583e77b8480e8b9094fe5563c35 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -36,15 +36,8 @@
 #include <asm/traps.h>
 #include <asm/vdso.h>
 
-#ifdef CONFIG_ARM64_GCS
 #define GCS_SIGNAL_CAP(addr) (((unsigned long)addr) & GCS_CAP_ADDR_MASK)
 
-static bool gcs_signal_cap_valid(u64 addr, u64 val)
-{
-	return val == GCS_SIGNAL_CAP(addr);
-}
-#endif
-
 /*
  * Do a signal return; undo the signal stack. These are aligned to 128-bit.
  */
@@ -1062,8 +1055,7 @@ static int restore_sigframe(struct pt_regs *regs,
 #ifdef CONFIG_ARM64_GCS
 static int gcs_restore_signal(void)
 {
-	unsigned long __user *gcspr_el0;
-	u64 cap;
+	u64 gcspr_el0, cap;
 	int ret;
 
 	if (!system_supports_gcs())
@@ -1072,7 +1064,7 @@ static int gcs_restore_signal(void)
 	if (!(current->thread.gcs_el0_mode & PR_SHADOW_STACK_ENABLE))
 		return 0;
 
-	gcspr_el0 = (unsigned long __user *)read_sysreg_s(SYS_GCSPR_EL0);
+	gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
 
 	/*
 	 * Ensure that any changes to the GCS done via GCS operations
@@ -1087,22 +1079,23 @@ static int gcs_restore_signal(void)
 	 * then faults will be generated on GCS operations - the main
 	 * concern is to protect GCS pages.
 	 */
-	ret = copy_from_user(&cap, gcspr_el0, sizeof(cap));
+	ret = copy_from_user(&cap, (unsigned long __user *)gcspr_el0,
+			     sizeof(cap));
 	if (ret)
 		return -EFAULT;
 
 	/*
 	 * Check that the cap is the actual GCS before replacing it.
 	 */
-	if (!gcs_signal_cap_valid((u64)gcspr_el0, cap))
+	if (cap != GCS_SIGNAL_CAP(gcspr_el0))
 		return -EINVAL;
 
 	/* Invalidate the token to prevent reuse */
-	put_user_gcs(0, (__user void*)gcspr_el0, &ret);
+	put_user_gcs(0, (unsigned long __user *)gcspr_el0, &ret);
 	if (ret != 0)
 		return -EFAULT;
 
-	write_sysreg_s(gcspr_el0 + 1, SYS_GCSPR_EL0);
+	write_sysreg_s(gcspr_el0 + 8, SYS_GCSPR_EL0);
 
 	return 0;
 }
@@ -1421,7 +1414,7 @@ static int get_sigframe(struct rt_sigframe_user_layout *user,
 
 static int gcs_signal_entry(__sigrestore_t sigtramp, struct ksignal *ksig)
 {
-	unsigned long __user *gcspr_el0;
+	u64 gcspr_el0;
 	int ret = 0;
 
 	if (!system_supports_gcs())
@@ -1434,18 +1427,20 @@ static int gcs_signal_entry(__sigrestore_t sigtramp, struct ksignal *ksig)
 	 * We are entering a signal handler, current register state is
 	 * active.
 	 */
-	gcspr_el0 = (unsigned long __user *)read_sysreg_s(SYS_GCSPR_EL0);
+	gcspr_el0 = read_sysreg_s(SYS_GCSPR_EL0);
 
 	/*
 	 * Push a cap and the GCS entry for the trampoline onto the GCS.
 	 */
-	put_user_gcs((unsigned long)sigtramp, gcspr_el0 - 2, &ret);
-	put_user_gcs(GCS_SIGNAL_CAP(gcspr_el0 - 1), gcspr_el0 - 1, &ret);
+	put_user_gcs((unsigned long)sigtramp,
+		     (unsigned long __user *)(gcspr_el0 - 16), &ret);
+	put_user_gcs(GCS_SIGNAL_CAP(gcspr_el0 - 8),
+		     (unsigned long __user *)(gcspr_el0 - 8), &ret);
 	if (ret != 0)
 		return ret;
 
-	gcspr_el0 -= 2;
-	write_sysreg_s((unsigned long)gcspr_el0, SYS_GCSPR_EL0);
+	gcspr_el0 -= 16;
+	write_sysreg_s(gcspr_el0, SYS_GCSPR_EL0);
 
 	return 0;
 }

---
base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
change-id: 20241209-arm64-gcs-signal-sparse-53fa9cad67f7

Best regards,
-- 
Mark Brown <broonie@kernel.org>


