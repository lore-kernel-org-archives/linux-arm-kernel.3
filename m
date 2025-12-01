Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4895D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EO2I2CgTkYzQR5rgGKdTPMwTkcFuwC49Z6d2zKMlEXE=; b=ARavXTmkLLqrzB4n3XHfLcRBxc
	k2SsIvFoGv3EwNzUPlHwVKB3YjR0KUaAPimT6vekK3KTAzeR0rgaBAaNluez7/uvKvbZ57rYu0N8b
	uoc1ZUnK1P3qC/c6FwvckPYeNDBPXQa40ADKNK+r2QROOge0eT5XSQtZL5WeB6UTr3eZfyizicJ8Q
	C/8p9OE2Cagvb5tZE/voPsDvER+8zQlreVD/4MeB117Mp0axaLCtYFp0Br9Q2QWkBXJBSIQisgjb9
	ynh+lCs6UfKOj369aUpxjh8jbexvP5OhiNzXPwuExfBk2NUlz+LoVfkg06kwmkTUkN8KepiC0VcPt
	W4fgG0cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2gE-00000003Vwl-3baQ;
	Mon, 01 Dec 2025 12:06:58 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2gB-00000003Vvk-0B40
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:06:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=EO2I2CgTkYzQR5rgGKdTPMwTkcFuwC49Z6d2zKMlEXE=;
	b=UMVO+8O/QfFb46tf9tN3Y06oaTvPWAjYlQ9CaazqyXFzP3mOa+yUaBsJ7BZN2uRN1vhNxpkXY
	jgAtjAM+lShds+57BjmG91MfwMgRMIWOXUR/+2kHRF94pw73tez0IxdI+biqzLvLkqlDAYYloUu
	EPn8i+C/92kteC7usJWx8Vc=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dKjJT1SszzmV73;
	Mon,  1 Dec 2025 20:04:57 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 608CC1A016C;
	Mon,  1 Dec 2025 20:06:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Dec
 2025 20:06:47 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chris@zankel.net>, <jcmvbkbc@gmail.com>, <ldv@strace.io>,
	<charlie@rivosinc.com>, <deller@gmx.de>, <macro@orcam.me.uk>,
	<akpm@linux-foundation.org>, <mark.rutland@arm.com>, <rostedt@goodmis.org>,
	<tglx@linutronix.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 2/2] arm64: Avoid memcpy() for syscall_get_arguments()
Date: Mon, 1 Dec 2025 20:06:33 +0800
Message-ID: <20251201120633.1193122-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201120633.1193122-1-ruanjinjie@huawei.com>
References: <20251201120633.1193122-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_040655_567791_C0219302 
X-CRM114-Status: GOOD (  10.05  )
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

Do not use memcpy() to extract syscall arguments from struct pt_regs
but rather just perform direct assignments.

Update syscall_set_arguments() too to keep syscall_get_arguments()
and syscall_set_arguments() in sync.

With Generic Entry patch[1] and turn on audit, the performance
benchmarks from perf bench basic syscall on kunpeng920 gives roughly
a 1% performance uplift.

| Metric     | W/O this patch | With this patch | Change    |
| ---------- | -------------- | --------------- | --------- |
| Total time | 2.241 [sec]    | 2.211 [sec]     |  ↓1.36%   |
| usecs/op   | 0.224157       | 0.221146        |  ↓1.36%   |
| ops/sec    | 4,461,157      | 4,501,409       |  ↑0.9%    |

Disassembly shows that using direct assignment causes
syscall_set_arguments() to be inlined and cuts the instruction count by
five or six compared to memcpy(). Because __audit_syscall_entry() only
uses four syscall arguments, the compiler has also elided the copy of
regs->regs[4] and regs->regs[5].

Before:
<syscall_get_arguments.constprop.0>:
       aa0103e2        mov     x2, x1
       91002003        add     x3, x0, #0x8
       f9408804        ldr     x4, [x0, #272]
       f8008444        str     x4, [x2], #8
       a9409404        ldp     x4, x5, [x0, #8]
       a9009424        stp     x4, x5, [x1, #8]
       a9418400        ldp     x0, x1, [x0, #24]
       a9010440        stp     x0, x1, [x2, #16]
       f9401060        ldr     x0, [x3, #32]
       f9001040        str     x0, [x2, #32]
       d65f03c0        ret
       d503201f        nop

After:
       a9408e82        ldp     x2, x3, [x20, #8]
       2a1603e0        mov     w0, w22
       f9400e84        ldr     x4, [x20, #24]
       f9408a81        ldr     x1, [x20, #272]
       9401c4ba        bl      ffff800080215ca8 <__audit_syscall_entry>

This also aligns the implementation with x86 and RISC-V.

[1]: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Also update syscall_set_arguments().
- Udpate the commit message.
---
 arch/arm64/include/asm/syscall.h | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index f3853047c28e..5e4c7fc44f73 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -82,16 +82,24 @@ static inline void syscall_get_arguments(struct task_struct *task,
 					 unsigned long *args)
 {
 	args[0] = regs->orig_x0;
-	args++;
-
-	memcpy(args, &regs->regs[1], 5 * sizeof(args[0]));
+	args[1] = regs->regs[1];
+	args[2] = regs->regs[2];
+	args[3] = regs->regs[3];
+	args[4] = regs->regs[4];
+	args[5] = regs->regs[5];
 }
 
 static inline void syscall_set_arguments(struct task_struct *task,
 					 struct pt_regs *regs,
 					 const unsigned long *args)
 {
-	memcpy(&regs->regs[0], args, 6 * sizeof(args[0]));
+	regs->regs[0] = args[0];
+	regs->regs[1] = args[1];
+	regs->regs[2] = args[2];
+	regs->regs[3] = args[3];
+	regs->regs[4] = args[4];
+	regs->regs[5] = args[5];
+
 	/*
 	 * Also copy the first argument into orig_x0
 	 * so that syscall_get_arguments() would return it
-- 
2.34.1


