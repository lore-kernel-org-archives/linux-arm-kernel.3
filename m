Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA7CCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xT01jm8M2HeKEr0vFkYwW8UybjwRjhTlEwa6HqPfnso=; b=e9HdPIlF1gU4y891tRajKCjMUy
	CndNndZ9UQ8wIlRD4FNb0rEuHnSF7gwMgNRiWXo0TUF/Yabe5ktqpmHYq2Ato5cmKWxMy1IGICTRO
	3Uv/fdIANBEzWXH44cJUGVlr8tHSA4aozAzPqaodkGLnuLnpFsxSDMvdlqUn7gtNEStQG1pGIOTzl
	fNIdX/o/tAoHUELvsNaTe79WekiesOYmCgiYhRWqVaG0+p8VyZqF62m/OTe27Sor80LbabiSpHXzm
	ZGbDoPB+EoDDG+rgI1+TGgXRztbpgrOyJvpAK/MGya8F8HuFRC3bsZcB3rOBFNboB4ThGkaWhlDtS
	djv6idww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8SY-0000000GSoh-3MSk;
	Thu, 18 Sep 2025 06:49:38 +0000
Received: from wxsgout04.xfusion.com ([36.139.87.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz8SV-0000000GSlD-3wzd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 06:49:37 +0000
Received: from wuxpheds03048.xfusion.com (unknown [10.32.143.30])
	by wxsgout04.xfusion.com (SkyGuard) with ESMTPS id 4cS5mf5HH7zB72Kv;
	Thu, 18 Sep 2025 14:47:46 +0800 (CST)
Received: from DESKTOP-Q8I2N5U.xfusion.com (10.82.130.100) by
 wuxpheds03048.xfusion.com (10.32.143.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20;
 Thu, 18 Sep 2025 14:49:16 +0800
From: shechenglong <shechenglong@xfusion.com>
To: <catalin.marinas@arm.com>
CC: <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stone.xulei@xfusion.com>,
	<chenjialong@xfusion.com>, <yuxiating@xfusion.com>, shechenglong
	<shechenglong@xfusion.com>
Subject: [PATCH] cpu: fix hard lockup triggered during stress-ng stress testing.
Date: Thu, 18 Sep 2025 14:49:07 +0800
Message-ID: <20250918064907.1832-1-shechenglong@xfusion.com>
X-Mailer: git-send-email 2.38.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.82.130.100]
X-ClientProxiedBy: wuxpheds03045.xfusion.com (10.32.131.99) To
 wuxpheds03048.xfusion.com (10.32.143.30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_234936_180800_160CACC5 
X-CRM114-Status: GOOD (  11.06  )
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

Context of the Issue:
In an ARM64 environment, the following steps were performed:

1. Repeatedly ran stress-ng to stress the CPU, memory, and I/O.
2. Cyclically executed test case pty06 from the LTP test suite.
3. Added mitigations=off to the GRUB parameters.

After 1–2 hours of stress testing, a hardlockup occurred,
causing a system crash.

Root Cause of the Hardlockup:
Each time stress-ng starts, it invokes the /sys/kernel/debug/clear_warn_once
interface, which clears the values in the memory section from __start_once
to __end_once. This caused functions like pr_info_once() — originally
designed to print only once — to print again every time stress-ng was called.
If the pty06 test case happened to be using the serial module at that same
moment, it would sleep in waiter.list within the __down_common function.

After pr_info_once() completed its output using the serial module,
it invoked the semaphore up() function to wake up the process waiting
in waiter.list. This sequence triggered an A-A deadlock, ultimately
leading to a hardlockup and system crash.

To prevent this, a local variable should be used to control and ensure
the print operation occurs only once.

Hard lockup call stack:

_raw_spin_lock_nested+168
ttwu_queue+180 （rq_lock(rq, &rf); 2nd acquiring the rq->__lock）
try_to_wake_up+548
wake_up_process+32
__up+88
up+100
__up_console_sem+96
console_unlock+696
vprintk_emit+428
vprintk_default+64
vprintk_func+220
printk+104
spectre_v4_enable_task_mitigation+344
__switch_to+100
__schedule+1028 (rq_lock(rq, &rf); 1st acquiring the rq->__lock)
schedule_idle+48
do_idle+388
cpu_startup_entry+44
secondary_start_kernel+352

Signed-off-by: shechenglong <shechenglong@xfusion.com>
---
 arch/arm64/kernel/proton-pack.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index edf1783ffc81..f8663157e041 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -424,8 +424,10 @@ static bool spectre_v4_mitigations_off(void)
 	bool ret = cpu_mitigations_off() ||
 		   __spectre_v4_policy == SPECTRE_V4_POLICY_MITIGATION_DISABLED;
 
-	if (ret)
-		pr_info_once("spectre-v4 mitigation disabled by command-line option\n");
+	static atomic_t __printk_once = ATOMIC_INIT(0);
+
+	if (ret && !atomic_cmpxchg(&__printk_once, 0, 1))
+		pr_info("spectre-v4 mitigation disabled by command-line option\n");
 
 	return ret;
 }
-- 
2.33.0


