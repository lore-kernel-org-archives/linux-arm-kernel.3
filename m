Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC71CCAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 02:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=adiBphAPScR6QQjh2KwjN5aarvz+PskpFpyHr3Y87gs=; b=oSFt8Gssz7HSwArLyrKccZJ+U9
	SkfZHbN4zm47PI/8ONKffRDJpBJ8//jcwdn9+/bIz7F7moujH760LH+cjL/0DZN89sVQJCrsySQaS
	wW7I8cf6OLOCqd50lhbpjswN9qytAPKAAjivKd/bnXNpkmwFMastej12491KvYQ7bE+FU7WUzjoyI
	4Bwi2apwjWS2E6MGGxb91ffg7OFMYiZw0DKc8ADqt2FvpRsuhae1dZKHRXbOMlOSC6dwSGzcmL1qv
	8tV85ktJVqebx9teLTaFMYxKXPQFI9TrWnAyNj3mr1TEFrlUBSsmpMFDCqFXkLsDzsECjVr/Qk8m7
	E7DIc2Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bPn-00000005GC7-3LhY;
	Thu, 25 Sep 2025 02:08:59 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bPk-00000005GBG-0XZH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 02:08:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=ad
	iBphAPScR6QQjh2KwjN5aarvz+PskpFpyHr3Y87gs=; b=WjzIx70LpoyMNUwCIh
	ePB4aB07F7rsQrRR/e9WPkjqZgFTnVXn+ilrjtG3btzPXzxyt4Bw3Bch3tRw3RgX
	G8/lxsmodMkMGGdq8UqCKLDF6EtEsIXwhwzs2JtslgNJ4+d7EEX5x48n62Gq/osK
	wYuql/ibaoeh7FrMobRX80/gI=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnEQkXpNRowQcHEQ--.9650S2;
	Thu, 25 Sep 2025 10:08:24 +0800 (CST)
From: Feng Yang <yangfeng59949@163.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	revest@chromium.org,
	alexei.starovoitov@gmail.com,
	olsajiri@gmail.com,
	andrii@kernel.org,
	ast@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org
Subject: [PATCH] tracing: Fix the bug where bpf_get_stackid returns -EFAULT on the ARM64
Date: Thu, 25 Sep 2025 10:08:22 +0800
Message-Id: <20250925020822.119302-1-yangfeng59949@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgDnEQkXpNRowQcHEQ--.9650S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFyxur1kWF4xJrW8tr4xZwb_yoW8XFWkp3
	9F9rykGFWDWFs0kw47WrsxXr15Cws3ArWrCry8Cw1akF4DZFyUCr9FkFWjkF1xA34Du3yx
	uF1avry5Cws8ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jjuWLUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: p1dqww5hqjkmqzuzqiywtou0bp/1tbiVhrSeGjUYEjeAQABss
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_190856_583323_1C0D2528 
X-CRM114-Status: GOOD (  12.73  )
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

From: Feng Yang <yangfeng@kylinos.cn>

When using bpf_program__attach_kprobe_multi_opts on ARM64 to hook a BPF program
that contains the bpf_get_stackid function, the BPF program fails
to obtain the stack trace and returns -EFAULT.

This is because ftrace_partial_regs omits the configuration of the pstate register,
leaving pstate at the default value of 0. When get_perf_callchain executes,
it uses user_mode(regs) to determine whether it is in kernel mode.
This leads to a misjudgment that the code is in user mode,
so perf_callchain_kernel is not executed and the function returns directly.
As a result, trace->nr becomes 0, and finally -EFAULT is returned.

Therefore, the assignment of the pstate register is added here.

Fixes: b9b55c8912ce ("tracing: Add ftrace_partial_regs() for converting ftrace_regs to pt_regs")
Closes: https://lore.kernel.org/bpf/20250919071902.554223-1-yangfeng59949@163.com/
Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
---
 arch/arm64/include/asm/ftrace.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
index bfe3ce9df197..ba7cf7fec5e9 100644
--- a/arch/arm64/include/asm/ftrace.h
+++ b/arch/arm64/include/asm/ftrace.h
@@ -153,6 +153,7 @@ ftrace_partial_regs(const struct ftrace_regs *fregs, struct pt_regs *regs)
 	regs->pc = afregs->pc;
 	regs->regs[29] = afregs->fp;
 	regs->regs[30] = afregs->lr;
+	regs->pstate = PSR_MODE_EL1h;
 	return regs;
 }
 
-- 
2.25.1


