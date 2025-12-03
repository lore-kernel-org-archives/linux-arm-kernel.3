Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35499D1268E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 01:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sIempqaM8kOBJ+y/E9PeRjl6HxUaDOYzGfVfS5fH348=; b=qrTgYhiVWrje6YNownwUsWHMy0
	tjsz1CjRf+0DY1GbTKBHkNq9i8tWZC3mx2KmGgmzkYrLzwsd/3B7T6T4Qj0MxBotAfe6TD3Zki8VV
	mEvxW5S0+CKg22iW0hRcmFZS2KrEGIK8XLcXJ54I+RuFOA/NNXAuRU51Ssj6MGBNC54Ep51W9dHn+
	bKmVCocn8xk7hrx7afPyghk848RPSTCTqw7UtoyMpDhM8qpOkQdVoGESDwkineDghDu8vW1QFQhM0
	k/bQfHwFLMhTLNm2fj38LKNq/yadYyTpDOyA1QaelYf0YzhOK1r2+zZtIgOuVWu6AdUHmHHNPGoxq
	Zw9mIHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbyj-000000060vA-2PBs;
	Wed, 03 Dec 2025 01:48:25 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQbyg-000000060uY-2TYX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 01:48:24 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sIempqaM8kOBJ+y/E9PeRjl6HxUaDOYzGfVfS5fH348=;
	b=2a92kw6vO7F3z660yI8YgpbKmYdDLdJLg/naZks2OKUbRKu8aEOtlsTu+5Qrwp57FyGJtT5aT
	Ad9FbZcuy328yLSaj8FoyvIZ/Izm2J46vkLNzBoF2w5xoarhGS1Zz0TrPCxZI53Fj2LCvWHZoNg
	Dlp9fm2qJPZ37hTiDEglcvI=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dLgTq2tFZz1prKT;
	Wed,  3 Dec 2025 09:46:23 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E082180409;
	Wed,  3 Dec 2025 09:48:16 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 3 Dec 2025 09:48:15 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <torvalds@linux-foundation.org>, <linux@armlinux.org.uk>
CC: <akpm@linux-foundation.org>, <brauner@kernel.org>,
	<catalin.marinas@arm.com>, <hch@lst.de>, <jack@suse.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-fsdevel@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<pangliyuan1@huawei.com>, <wangkefeng.wang@huawei.com>, <will@kernel.org>,
	<wozizhi@huaweicloud.com>, <xieyuanbin1@huawei.com>, <yangerkun@huawei.com>
Subject: [Bug report] hash_name() may cross page boundary and trigger sleep in RCU context
Date: Wed, 3 Dec 2025 09:48:00 +0800
Message-ID: <20251203014800.4988-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAHk-=wg4ZnsfpgXYL5qhjYDYo1Gnssz+VxnKZzHXMEmE7qrnQQ@mail.gmail.com>
References: <CAHk-=wg4ZnsfpgXYL5qhjYDYo1Gnssz+VxnKZzHXMEmE7qrnQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_174823_222762_48AA8BEA 
X-CRM114-Status: GOOD (  19.35  )
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

On Tue, 2 Dec 2025 14:07:25 -0800, Linus Torvalds wrote:
> On Tue, 2 Dec 2025 at 04:43, Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
>>
>> What I'm thinking is to address both of these by handling kernel space
>> page faults (which will be permission or PTE-not-present) separately
>> (not even build tested):
>
> That patch looks sane to me.
>
> But I also didn't build test it, just scanned it visually ;)

That patch removes harden_branch_predictor() from __do_user_fault(), and
moves it to do_page_fault()->do_kernel_address_page_fault(). 
This resolves previously mentioned kernel warning issue. However,
__do_user_fault() is not only called by do_page_fault(), it is
alse called by do_bad_area(), do_sect_fault() and do_translation_fault().

So I think that some harden_branch_predictor() is missing on other paths.
According to my tests, when CONFIG_ARM_LPAE=n, harden_branch_predictor()
will never be called anymore, even if a user program trys to access the
kernel address.

Or perhaps I've misunderstood something, could you please point it out?
Thank you very much.

What about something like this (The patch has been tested):
```patch
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 2bc828a1940c..af86198631c5 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -183,9 +183,11 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 {
 	struct task_struct *tsk = current;

-	if (addr > TASK_SIZE)
+	if (addr >= TASK_SIZE)
 		harden_branch_predictor();

+	local_irq_enable();
+
 #ifdef CONFIG_DEBUG_USER
 	if (((user_debug & UDBG_SEGV) && (sig == SIGSEGV)) ||
 	    ((user_debug & UDBG_BUS)  && (sig == SIGBUS))) {
@@ -272,6 +274,24 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 	if (kprobe_page_fault(regs, fsr))
 		return 0;

+	if (unlikely(addr >= TASK_SIZE)) {
+		/*
+		 * Fault from user mode for a kernel space address. User mode
+		 * should not be faulting in kernel space, which includes the
+		 * vector/khelper page. Handle the Spectre issues while
+		 * interrupts are still disabled, then send a SIGSEGV. Note
+		 * that __do_user_fault() will enable interrupts.
+		 *
+		 * Fault from kernel mode. Jump to __do_kernel_fault()->
+		 * fixup_exception() directly, without getting mm lock and
+		 * finding vma. The interrupts are not enabled but it will be
+		 * good, just like what do_translation_fault() and
+		 * do_bad_area() does.
+		 */
+		fault = 0;
+		code = SEGV_MAPERR;
+		goto bad_area;
+	}

 	/* Enable interrupts if they were enabled in the parent context. */
 	if (interrupts_enabled(regs))

```

Thanks very much!

