Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803F6CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 02:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTZjyfw+Xgeed69jhy5PrzVKjkTsZcfK7eV+J3iJrzI=; b=roaBT4zPZbPeQ76urWWIj8A8Er
	HWHY3is/OsLnavaBe8BKVnkNBH8hWCBu96SpK+r+aLGZdgznKIJ5MHPgBMD9E3rAtNTmomBdrbhKu
	vyxxuTkUOAFcHp+Ia1e5ydMxUw8tdC1v8oUSp3qnpDrMF7cogX8gMGKHETiTf9e6VsqQOPfvc+m5h
	oVmAyHFcvzP91nPPJNgalKcGKew9ezK+hxrauZvprj220XoOAMdIx/UGqMY0hh42z88orROB2Uw35
	bl4e21IFCLMZxpwYFIK2mTRZh5Ti7VogUmgkVaJeU7opR3fH6u9yu3n12+k+SF4+OY1knBxrqGkEQ
	crXTOaeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDw8e-0000000H05A-1rVK;
	Wed, 29 Oct 2025 02:42:16 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDw8Z-0000000H04V-3R9E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 02:42:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FTZjyfw+Xgeed69jhy5PrzVKjkTsZcfK7eV+J3iJrzI=;
	b=Aui1rmRQGwtpzaZP4CDWOuHR1qNAPte2+RlcUSnoIYcf56zoatQeM6z9V6wkti3EPR0s9R1tj
	uzzCcgJXtdjJEcM9+fc7AbbZknSHvt0+rsHgNvJGQF9WSCCkWdqR8Utfmynr9hXZQKN2mDktowX
	hKih1QtHOmdRXsEH1kqQTbc=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4cxBMM6jl5z12LJn;
	Wed, 29 Oct 2025 10:41:19 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 518FD180B4A;
	Wed, 29 Oct 2025 10:41:57 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 29 Oct 2025 10:41:56 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <bigeasy@linutronix.de>
CC: <akpm@linux-foundation.org>, <arnd@arndb.de>, <brauner@kernel.org>,
	<kuninori.morimoto.gx@renesas.com>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux@armlinux.org.uk>,
	<lorenzo.stoakes@oracle.com>, <marc.zyngier@arm.com>, <pfalcato@suse.de>,
	<punitagrawal@gmail.com>, <rjw@rjwysocki.net>, <rmk+kernel@armlinux.org.uk>,
	<rppt@kernel.org>, <tony@atomide.com>, <vbabka@suse.cz>, <will@kernel.org>,
	<xieyuanbin1@huawei.com>
Subject: Re: [PATCH v2 RESEND 1/2] ARM: spectre-v2: Fix potential missing mitigations
Date: Wed, 29 Oct 2025 10:41:51 +0800
Message-ID: <20251029024151.6005-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028182052.nrRad87D@linutronix.de>
References: <20251028182052.nrRad87D@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_194212_561884_6C38ED96 
X-CRM114-Status: GOOD (  17.98  )
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

On Tue, 28 Oct 2025 17:20:05 +0100, Sebastian Andrzej Siewior wrote:
> If I apply both patches (of yours) then it sends a
> signal with disabled interrupts which breaks my PREEMPT_RT case.

I am not familiar with PREEMPT_RT yet and do not know that signals cannot
be sent with disabled interrupts and PREEMPT_RT=y.
I apologize for this.

On Tue, 28 Oct 2025 19:20:52 +0100, Sebastian Andrzej Siewior wrote:
> !LPAE does do_bad_area() -> __do_user_fault() and does not trigger the
> warning in harden_branch_predictor() because the interrupts are off.
> On PREEMPT_RT this leads to an error due to accessing spinlock_t from
> force_sig_fault() with disabled interrupts.

This seems to be a more serious bug, and may require another patch to
fix it. Not only !LPAE is affected, but LAPE=y is also affected:
do_translation_fault() -> do_bad_area() -> __do_user_fault()
This code path seems very easy to trigger.

> I guess the requirement is to invoke harden_branch_predictor() on the
> same CPU that triggered the page_fault, right? Couldn't we then move
> harden_branch_predictor() a little bit earlier, invoke it in the >=
> TASK_SIZE case and then enable interrupts if they were enabled?
>
> That would make me happy ;)

This seems to only fix the warning in harden_branch_predictor, but cannot
fix the issue of sending signals with disabled interrupts mentioned above.

What about adding:

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 09dde89a88ed..b9c9c80db109 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -182,6 +182,12 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 		int code, struct pt_regs *regs)
 {
 	struct task_struct *tsk = current;
+	const bool save_irqs_disabled = irqs_disabled();
+
+	if (save_irqs_disabled) {
+		preempt_disable();
+		local_irq_enable();
+	}

 	if (addr > TASK_SIZE)
 		harden_branch_predictor();
@@ -207,6 +213,11 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 	tsk->thread.error_code = fsr;
 	tsk->thread.trap_no = 14;
 	force_sig_fault(sig, code, (void __user *)addr);
+
+	if (save_irqs_disabled) {
+		local_irq_disable();
+		preempt_enable_no_resched();
+	}
 }

and the modification of patch 1 is still retained.

Xie Yuanbin

