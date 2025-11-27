Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C718FD11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdym5IeHw7I5kk48d6CR/tnfKDpc0G1zl2j3QUelC4I=; b=2p9U0fkSH9TqLJTl8KtN7bTltK
	UsBbzjYJ6dtBNhCl1/11i9EGoT3aDRLKxU7kiY020rfH9oYOAaYwfT9aj48Z6Mb0847QP8s07YxnQ
	cihn16s/QqUh5bAWei4gbbOQf/ro/34GmaXIkWxoMol9l7xXmSiDRmIPxqB3FL9m9SqbiTuDaeSBe
	JkGrKX/w1fw7ene6G3Q2AaNxn+Ej2lCVI5yZyRf03jM7u/ZllpbUC6APNG8F41jEvfqdWbCM/cABB
	67x/GD/4HU7uWrHwuY+8arquSz7oJQuo6eRHKPHP7fwhYeBi0SdBZVuC979yyUp4ZXaOfgb+SlqGK
	QQ3EY8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObEv-0000000GZNl-19jb;
	Thu, 27 Nov 2025 12:36:49 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObEr-0000000GZMS-3jaa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:36:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qdym5IeHw7I5kk48d6CR/tnfKDpc0G1zl2j3QUelC4I=;
	b=QzrpXeDrGTUrKvr5L5/THoSnpQJB8zN9E7g6xw1FMoNBrxPc5+TgaRkPn2wctIyjdoLEHlT03
	J1bf3lSmUGUCz/Q9HlekRDJaV0/5YTHZdr6EEUu4sda617GVsF/CF5IQop2fCNeQgkPTOu3jTNY
	abuLSHKw9mPnrvVv5ue8sQc=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dHG8m1CrkzKm4J;
	Thu, 27 Nov 2025 20:34:48 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A7991A0188;
	Thu, 27 Nov 2025 20:36:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 27 Nov
 2025 20:36:36 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chris@zankel.net>, <jcmvbkbc@gmail.com>, <akpm@linux-foundation.org>,
	<macro@orcam.me.uk>, <charlie@rivosinc.com>, <deller@gmx.de>,
	<ldv@strace.io>, <rostedt@goodmis.org>, <tglx@linutronix.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 2/2] arm64: Avoid memcpy() for syscall_get_arguments()
Date: Thu, 27 Nov 2025 20:36:30 +0800
Message-ID: <20251127123630.4149828-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251127123630.4149828-1-ruanjinjie@huawei.com>
References: <20251127123630.4149828-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_043646_234515_A6DBB625 
X-CRM114-Status: UNSURE (   8.92  )
X-CRM114-Notice: Please train this message.
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

The performance benchmarks with Generic Entry patch[1] with audit on
from perf bench basic syscall on kunpeng920 gives roughly a 1%
performance uplift and also aligns the implementation with
x86 and RISC-V.

| Metric     | W/O this patch | With this patch | Change    |
| ---------- | -------------- | --------------- | --------- |
| Total time | 2.241 [sec]    | 2.211 [sec]     |  ↓1.36%   |
| usecs/op   | 0.224157       | 0.221146        |  ↓1.36%   |
| ops/sec    | 4,461,157      | 4,501,409       |  ↑0.9%    |

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

[1]: https://lore.kernel.org/all/20251126071446.3234218-1-ruanjinjie@huawei.com/
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index f3853047c28e..f3564ba97f7e 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -82,9 +82,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
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
-- 
2.34.1


