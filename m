Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF76D3B7E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MwrU1jtyrEQXuzRKmPBYK/ewbvYCyRQ82h6VmU9YXU=; b=yhujBRXke16tAz+ZKNcuFPbrF9
	C20pVmyNfSQN1TLeNXosJBmBQCuYl0MwqCZZ0Cfo1HmiDzW7BRZ5A2PiIKnHil8NPRLxeeQZ27hmq
	FEdMA+MQByed6iVOGsynH9BLk/yU4KJtVujijZ6rV3bMJZVw69e8v1gHCU3OQifL9KykeZONWcdA9
	CwTMlUqcphmEA3VbitfU4b8u6g5RJW9AcWbqFGnhhfNreKsqvZf/6aFfw6zLHF+VMscwNwzmPgPOm
	v/5QCaDS+zeH7qTQ6Ww9YWLRY2dv0SR7nwzZjcdkQO0oMIS2MKgQIw86ss/tyY6rT+iVCWX/TElmt
	imxAwGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRxX7-0000000B9G8-3tNK;
	Sat, 06 Dec 2025 19:01:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRxX4-0000000B9Em-44Mg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 19:01:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1262F432B5;
	Sat,  6 Dec 2025 19:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A2EC116D0;
	Sat,  6 Dec 2025 19:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765047684;
	bh=RK1Hc4AiJMLd66pIpInJZ/WqsPC5FZ2b1h4T0MicAYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0LgAxSXZscP4/VQn33waV7mcnDh0N3Z4p5hmI2CDdBOW/Gk4LXky10rjiA1YmtOY
	 TnIgnv/uChJoo9njaEgfJ8Mp+cc8MKJz+Pd3mI6fR+FYTk6tLxatLi7okW9nTF/zAa
	 KYpwGM2ZxcI6++DaTTDj4IcjFdubs8Cw2twrs2gKP3Bpup1Cw11xZqGGlRDENbrmQr
	 k8G6z90jKs2kkqoaZvQQnUBwe537UocCDpnTdydwL2tYZXMq8xyTUBUoEmm2WhqK8F
	 Qa32j0YkOZJzv6nv12wpts0o6OjcH6KxzdYfJKs5c95Xo8eGvx05EH3HBKFnGiQ+15
	 ebp08BB4dDZig==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH v2 1/2] lkdtm/bugs: Add cases for BUG and PANIC occurring in hardirq context
Date: Sat,  6 Dec 2025 20:01:16 +0100
Message-ID: <20251206190114.892262-5-ardb@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251206190114.892262-4-ardb@kernel.org>
References: <20251206190114.892262-4-ardb@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2909; i=ardb@kernel.org; h=from:subject; bh=RK1Hc4AiJMLd66pIpInJZ/WqsPC5FZ2b1h4T0MicAYU=; b=owGbwMvMwCVmkMcZplerG8N4Wi2JIdOktmYWY93WkoV3jjNMrz6wZGtMV/jjAzaiV56smDCJO 1Ygo+12RykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIg9+MDA83f/vEd25h8crI /rBjx6covu2a5fBQZJ/pC+MzzLPm29UzMpzlfHOd963I5zbhD0a10ZUPpd/wT5S2sz5mP+lEZol kBzcA
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_110127_071084_8D844B5C 
X-CRM114-Status: GOOD (  10.79  )
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

Add lkdtm cases to trigger a BUG() or panic() from hardirq context. This
is useful for testing pstore behavior being invoked from such contexts.

Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/misc/lkdtm/bugs.c               | 53 ++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  2 +
 2 files changed, 55 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 376047beea3d..fa05d77acb55 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -8,6 +8,7 @@
 #include "lkdtm.h"
 #include <linux/cpu.h>
 #include <linux/list.h>
+#include <linux/hrtimer.h>
 #include <linux/sched.h>
 #include <linux/sched/signal.h>
 #include <linux/sched/task_stack.h>
@@ -100,11 +101,61 @@ static void lkdtm_PANIC_STOP_IRQOFF(void)
 	stop_machine(panic_stop_irqoff_fn, &v, cpu_online_mask);
 }
 
+static bool wait_for_panic;
+
+static enum hrtimer_restart panic_in_hardirq(struct hrtimer *timer)
+{
+	panic("from hard IRQ context");
+
+	wait_for_panic = false;
+	return HRTIMER_NORESTART;
+}
+
+static void lkdtm_PANIC_IN_HARDIRQ(void)
+{
+	struct hrtimer timer;
+
+	wait_for_panic = true;
+	hrtimer_setup_on_stack(&timer, panic_in_hardirq,
+			       CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
+	hrtimer_start(&timer, us_to_ktime(100), HRTIMER_MODE_REL_HARD);
+
+	while (wait_for_panic)
+		;
+
+	hrtimer_cancel(&timer);
+}
+
 static void lkdtm_BUG(void)
 {
 	BUG();
 }
 
+static bool wait_for_bug;
+
+static enum hrtimer_restart bug_in_hardirq(struct hrtimer *timer)
+{
+	BUG();
+
+	wait_for_bug = false;
+	return HRTIMER_NORESTART;
+}
+
+static void lkdtm_BUG_IN_HARDIRQ(void)
+{
+	struct hrtimer timer;
+
+	wait_for_bug = true;
+	hrtimer_setup_on_stack(&timer, bug_in_hardirq,
+			       CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
+	hrtimer_start(&timer, us_to_ktime(100), HRTIMER_MODE_REL_HARD);
+
+	while (wait_for_bug)
+		;
+
+	hrtimer_cancel(&timer);
+}
+
 static int warn_counter;
 
 static void lkdtm_WARNING(void)
@@ -696,7 +747,9 @@ static noinline void lkdtm_CORRUPT_PAC(void)
 static struct crashtype crashtypes[] = {
 	CRASHTYPE(PANIC),
 	CRASHTYPE(PANIC_STOP_IRQOFF),
+	CRASHTYPE(PANIC_IN_HARDIRQ),
 	CRASHTYPE(BUG),
+	CRASHTYPE(BUG_IN_HARDIRQ),
 	CRASHTYPE(WARNING),
 	CRASHTYPE(WARNING_MESSAGE),
 	CRASHTYPE(EXCEPTION),
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index cff124c1eddd..67cd53715d93 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -1,6 +1,8 @@
 #PANIC
 #PANIC_STOP_IRQOFF Crashes entire system
+#PANIC_IN_HARDIRQ Crashes entire system
 BUG kernel BUG at
+#BUG_IN_HARDIRQ Crashes entire system
 WARNING WARNING:
 WARNING_MESSAGE message trigger
 EXCEPTION
-- 
2.47.3


