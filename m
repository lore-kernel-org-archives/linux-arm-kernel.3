Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14CC7C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7G6wtywXBL6Oe+BNpE1IC0BYK1ju486mfyAnAvrnvno=; b=0ARUAjeFiOvvJHdABvL8RNem5N
	34YdyWT0ByGNzIf+V+Bg6vh3wTDPsfUlfajCZxjp+mlNr/FAteANpfJzLOF0jIXTtfkkSD17HaJRR
	H1/dxIZHLuPIST0lVDWS7f3Xj+01lAVot+ZoOUq4yG7HdKkig4tUk+pWHTbaIvRKlilwfZc9kiJxr
	lnd03OcX2ovdj+Jc9fnB7VUtommeXo3uF52qylumvhUe1i3CoKoJtnFRgfNlMUjsR0ogyYZiWALGn
	dPNWp1erYNF4khIv2rTLJpvQfe5JIuo/X6J76SZUw6i23/oPkep4snsVGgK6D9X/1rAt5ew3sToqQ
	1rzoYbbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RVj-0000000CgaZ-0IHE;
	Tue, 01 Sep 2026 16:38:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RVh-0000000CgaE-2k5e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:38:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C65F1601F9;
	Tue,  1 Sep 2026 16:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5229C1F000E9;
	Tue,  1 Sep 2026 16:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788280736;
	bh=7G6wtywXBL6Oe+BNpE1IC0BYK1ju486mfyAnAvrnvno=;
	h=From:Date:Subject:To:Cc;
	b=VwXcytPBB3xq01bgtsYzDRiy8R9ma/O5g0JxY2fteVEoAZn5d6M81G1w+LWVqFhO/
	 +54vsJX8If+o6KLQ4wehshD3MsopiGGohqOOOCQZygcKvnlUPT8ua32vwfM7P4ojLB
	 FI47pDgyRt2wWceVY/x1zLRO3X8IICDcgM/hTvlvl84CpOQP8XXjKOEaGb1jmd6E6m
	 rUKCb2wr1l78w5N/eDwR4IGCWYh+1qMkg5I65L/5g1nNOZVnELSgIqrRTl6tY10L07
	 AydEQF56bUzzz8ZZk74QOdZjp4DKVoxLkeqsab7thqH5zlIbqC65FIniiom5yK3pF2
	 Ac6SH7vmRdmKQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 17:38:43 +0100
Subject: [PATCH v2] arm64/sme: Disable TIF_SME when loading state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-disable-sme-v2-1-b53fa3c41840@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJL/lmoC/22Nyw6CMBBFf4XM2pq2Qgmu/A/Doo8BqjzMDBIN4
 d8FdOnyJOeeOwMjRWQ4JzMQTpHj0K+gDwn4xvY1ihhWBi21kbkshKXOpCJEtq5FwR0Kn9mTUVa
 hCw7W3YOwiq+9eS2/zE93Qz9uoc1oIo8DvffTSW3er6/kn/6khBJVmrtMF8F4l17uSD22x4FqK
 Jdl+QCmnLurxQAAAA==
X-Change-ID: 20260709-arm64-disable-sme-c5a361a1ebdb
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2866; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9p9dH37muB7+UwwMmHjZ+w8JlyYEwAjypEeoPgnqW84=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlv+cDu4KNad0WZZfZwBx6SYcoRxPCMu+ARkss
 bjBZUoq3gqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapb/nAAKCRAk1otyXVSH
 0ImDB/9CGl6Gpq2QFkcuqAtS9+1TA601ekhIHBwvSsEdzUYspG/kjGl3huPGLpHNNav3S0Ib1kh
 F4HGzujyWQn5yehp+6zpTkzZ3sba+RZ4M/Iax1CwLdNkcsguoSXSz3yGQMQ01KH6+7Rf+lcGUZJ
 nmoZBLTSTg59YPDQBN6dLjSy29oIQoHNezsdytckjAybwmGLZIbXqbXJjjrohvYFeDqowGRsu6n
 4uWJ1oNRY1PekrWbyD8J9/AyUHcfKjP86xCZYXGDYumUjjPlZXETVEnX8oCB2eMrjoHrAZyttb/
 +vK7BwhEHYVq+exjcXJEa9DTpKK42k6zpZaSnRPfFhTdjlcT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Normally once we have enabled SME access for a userspace task there is no
real overhead from leaving it on, unless userspace has enabled either
streaming mode or ZA there is no additional state to load and save beyond
SVCR. For systems affected by Arm erratum #4193714 this is not the case,
we must issue additional IPIs to CPUs running tasks using SME to ensure
visibility of memory accesses.

Mitigate this by disabling TIF_SME when we load the floating point state
for a task that does not have streaming mode or ZA enabled. These tasks
will then run with SME traps enabled until the next time that they
attempt to use SME or we load SME state via signal return or ptrace,
allowing them to avoid the overhead of enabling the erratum workaround.
CPUs are only added to the set of CPUs that require IPIs while in user
mode so will not be in it while the floating point state is being
loaded.

I have not directly verified the performance impact of this on affected
systems with practical workloads, hopefully users with such systems can
assess the impact and confirm if there is any benefit or not. Tasks that
use SME intermittently will experience additional SME access traps but
will not cause additional IPIs while SME has been disabled.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Rebase onto v7.3-rc1.
- Link to v1: https://patch.msgid.link/20260710-arm64-disable-sme-v1-1-f47b529d6cb4@kernel.org
---
 arch/arm64/kernel/fpsimd.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e7f1682a3059..a9a09ac3923d 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -204,6 +204,10 @@ static inline void sme_free(struct task_struct *t) { }
 
 #endif
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+static cpumask_t sme_dvmsync_cpus;
+#endif
+
 static void fpsimd_bind_task_to_cpu(void);
 
 /*
@@ -404,6 +408,13 @@ static void task_fpsimd_load(void)
 	if (system_supports_sme()) {
 		unsigned long sme_vl = task_get_sme_vl(current);
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+		if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
+		    cpumask_test_cpu(smp_processor_id(), &sme_dvmsync_cpus) &&
+		    current->thread.svcr == 0)
+			clear_thread_flag(TIF_SME);
+#endif
+
 		/* Ensure VL is set up for restoring data */
 		if (test_thread_flag(TIF_SME)) {
 			unsigned long vq = sve_vq_from_vl(sme_vl);
@@ -1354,7 +1365,6 @@ void do_sve_acc(unsigned long esr, struct pt_regs *regs)
 /*
  * SME/CME erratum handling.
  */
-static cpumask_t sme_dvmsync_cpus;
 cpumask_t sme_active_cpus;
 
 /*

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260709-arm64-disable-sme-c5a361a1ebdb

Best regards,
--  
Mark Brown <broonie@kernel.org>


