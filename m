Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977BFE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Rdh1UtV0ISLWgljmUYN+jVRg7/e+nyofo+nzkzNMog=; b=knBUIMdmTgG/Y+8CLe2fXvtcwI
	Z1hMOU3rErmFPrEph6D6UfELGwVPj3cNN+MptVkaZugVUfvrA+LQ1W9MP+/r9wYGnj9KNGzRfAelc
	KklcdO1RPjf3/r70OHVILX8D29+NRG74DP/pyQW3gFojzpAQCVxBirUYHFkv7Y1hdT8tqnJQUOgmQ
	Ie5NllfGrG80NqOiQIZgCPxPYWSAChZM4ZscVS1knTsNAGF23zoW6T9EL44TrdCDQJ34y7hiQdF6l
	gD62suYKkhBWAwmGJEJurxO4H151wjEON498X1d/eDY9tB97zmj8mBJhkljPhoAZkus78urnfvSmZ
	eLXFpaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOqU-0000000FILO-1Suy;
	Wed, 11 Dec 2024 15:41:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOpP-0000000FHyc-3ICa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D904B5C62D8;
	Wed, 11 Dec 2024 15:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B4DC4CED7;
	Wed, 11 Dec 2024 15:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733931643;
	bh=0P3cw1hR9bRTtfA3GkNVPSqmTI3laEGRCvS0ucnfa+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zqquj51mU338XBIQhAtjN6dMBAJikxw/sXbeTopvXNY9c9eY9QrPmJzy2wyH8JIy2
	 TBk/XHvHPTaHzTu/N2BiWP4ZMY0A9oVBIMui4N6VcCMvQAn6CxCon7TTOnVotNhg2B
	 ArLaMZPYufYgmUVfIEg1s/CDIAh7GTlMgK9oex82rT4YAhcwcdPQem1ycZEfYvWxEF
	 mfNwpX8jCoff9vPIneBmKlZkizg0VH2gz174MXFCzhZM1knuSQSgR+9jKe7P/iUuQu
	 owPe3QVOXpnQaWWlpQbeNP1PTSm8lov8lyxOoKXbmzPF0SP2P0LpZ6ihOsvTz5tLWj
	 gPuh01jZhEOHg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dave Martin <Dave.Martin@arm.com>,
	Nicolas Pitre <nico@fluxnic.net>
Subject: [PATCH 01/19] arm/bL_switcher: Use kthread_run_on_cpu()
Date: Wed, 11 Dec 2024 16:40:14 +0100
Message-ID: <20241211154035.75565-2-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241211154035.75565-1-frederic@kernel.org>
References: <20241211154035.75565-1-frederic@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_074043_864191_6C6B7854 
X-CRM114-Status: GOOD (  12.04  )
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

Use the proper API instead of open coding it.

Reviewed-by: Dave Martin <Dave.Martin@arm.com>
Acked-by: Nicolas Pitre <nico@fluxnic.net>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 arch/arm/common/bL_switcher.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm/common/bL_switcher.c b/arch/arm/common/bL_switcher.c
index 9a9aa53547a6..d1e82a318e3b 100644
--- a/arch/arm/common/bL_switcher.c
+++ b/arch/arm/common/bL_switcher.c
@@ -307,13 +307,11 @@ static struct task_struct *bL_switcher_thread_create(int cpu, void *arg)
 {
 	struct task_struct *task;
 
-	task = kthread_create_on_node(bL_switcher_thread, arg,
-				      cpu_to_node(cpu), "kswitcher_%d", cpu);
-	if (!IS_ERR(task)) {
-		kthread_bind(task, cpu);
-		wake_up_process(task);
-	} else
+	task = kthread_run_on_cpu(bL_switcher_thread, arg,
+				  cpu, "kswitcher_%d");
+	if (IS_ERR(task))
 		pr_err("%s failed for CPU %d\n", __func__, cpu);
+
 	return task;
 }
 
-- 
2.46.0


