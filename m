Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1E8C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 01:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOGA1zyk42isz35KVIbuLEEchVSWzozYbCYqWY1QrEw=; b=GxgpGo8IW1c2nfHp7QCpGju15L
	1KyxmxAhhdFJQyxb30OtUJhB/Kt96uBPOR70oE/hNMTa+et3Tl37jk2RSfNRLB0551FdN695uNvCG
	wMV2C9MOnyFS6AMhVfsjEBxvgkhCdWfvm1nuX/mfwHl5TuoWQ2znd06MCSvkrnuFSuiIBx4CSuMYS
	G5pY2uaFIwU0Qo1+akT+58Se6qXP4YNKJ9EFrND96qN2DTwMT8V/GldOhcK0R7vAISiDVZit2gtIP
	BuZGxtQovFrXrMh+Rt+UIDMPl4ZjWN7PCzJS6s2rx0vMlvCA1phjwvYMWDHUCwOEEZbV7SwG4YqLq
	IgyryOeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNM9o-0000000Guma-2BlB;
	Fri, 06 Jun 2025 01:46:08 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNM7d-0000000GuZu-3ZuR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 01:43:55 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4bD3yp4Ph6z27hxW;
	Fri,  6 Jun 2025 09:44:34 +0800 (CST)
Received: from kwepemg200012.china.huawei.com (unknown [7.202.181.63])
	by mail.maildlp.com (Postfix) with ESMTPS id 073221A016C;
	Fri,  6 Jun 2025 09:43:43 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemg200012.china.huawei.com (7.202.181.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 6 Jun 2025 09:43:42 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <rmk+kernel@armlinux.org.uk>, <kees@kernel.org>,
	<yangyj.ee@gmail.com>, <ardb@kernel.org>, <tony@atomide.com>,
	<xieyuanbin1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<will@kernel.org>, <nixiaoming@huawei.com>, <liaohua4@huawei.com>,
	<wangbing6@huawei.com>, <lilinjie8@huawei.com>, <wangfangpeng1@huawei.com>
Subject: [RFC RESEND PATCH] ARM: spectre-v2: fix the spectre operation that may be bypassed
Date: Fri, 6 Jun 2025 09:43:35 +0800
Message-ID: <20250606014335.1772-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424100437.27477-1-xieyuanbin1@huawei.com>
References: <20250424100437.27477-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.108.232]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemg200012.china.huawei.com (7.202.181.63)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_184354_044672_7A7F9855 
X-CRM114-Status: GOOD (  17.76  )
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

As discussed before, to completely fix this problem, we must do
the spectre operation after the user mode is trapped in the kernel
and before the interrupt is enabled.

I have tried to add a hook function and it in fsr_info to avoid
performance deterioration (The preceding example will trigger
"level 2 permission fault", which is cold code in normal cases).
However, this does not work. I find that the user program can
also trigger "translation fault" or "access flag fault"
when accessing a kernel address.

Therefore, extra performance overhead is inevitable.
(An if branch needs to be added before the interrupt is enabled.)

I have tried to reduce the impact on performance.
If the page fault comes from the user mode,
the interrupt must be enabled. In this case,
a judgment can be reduced.

Fixes: f5fe12b1eaee ("ARM: spectre-v2: harden user aborts in kernel space")

Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 arch/arm/mm/fault.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index ab01b51de559..3425a12a8f52 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -272,25 +272,35 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 
 	if (kprobe_page_fault(regs, fsr))
 		return 0;
 
 
 	/* Enable interrupts if they were enabled in the parent context. */
-	if (interrupts_enabled(regs))
-		local_irq_enable();
+	if (likely(user_mode(regs))) {
+		if (IS_ENABLED(CONFIG_PREEMPT) &&
+		    IS_ENABLED(CONFIG_HARDEN_BRANCH_PREDICTOR) &&
+		    unlikely(addr >= TASK_SIZE)) {
+
+			__do_user_fault(addr, fsr, SIGSEGV, SEGV_MAPERR, regs);
+			return 0;
+		}
+
+		flags |= FAULT_FLAG_USER;
+	} else if (!interrupts_enabled(regs))
+		goto irq_disabled;
+
+	local_irq_enable();
+irq_disabled:
 
 	/*
 	 * If we're in an interrupt or have no user
 	 * context, we must not take the fault..
 	 */
 	if (faulthandler_disabled() || !mm)
 		goto no_context;
 
-	if (user_mode(regs))
-		flags |= FAULT_FLAG_USER;
-
 	if (is_write_fault(fsr)) {
 		flags |= FAULT_FLAG_WRITE;
 		vm_flags = VM_WRITE;
 	}
 
 	if (fsr & FSR_LNX_PF) {
-- 
2.48.1


