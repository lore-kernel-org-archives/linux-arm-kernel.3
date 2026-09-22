Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740EFC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NYXPJThiERDr7PsLUNJoyQcRNDGxahI6/GYa+UXA/8=; b=GkfpAaOoeycbCVqQ1UGlXDAAW0
	pKg6h26GLJa5whj7h0o/rTyoX4tQkQP0ofTyK2ShEz72j4V5JM9ij0UWnCVDgwNLtvghQgNw9hglc
	/7tr25J0s60V0jdvzeU00U6FRGFuc0naPBFPdwcX2DmTV5o7YtDwL4M3U4P8ewsO0iLotFQ8/c0cO
	B8cNIqNyRaBWFQvMteSghx/zhdS0h/FNGjPMM1zXz7OJ2m+76QgFgfUI8o8I1wijfrJGQHgKTq6bb
	LRFaGKmg8kfLEW1EbdDxXOTLwZW+aO3mav2CegYmCy/Vk5AuUrvS4jbujB6lW8Pkt6UyFJ1TCpYvU
	oN3ePnDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rbL-000000047mH-3uQ4;
	Tue, 22 Sep 2026 03:55:27 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rb3-000000047gC-49Ae
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:55:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=1NYXPJThiERDr7PsLUNJoyQcRNDGxahI6/GYa+UXA/8=;
	b=OiHrvaoNwvj5QCJINxMcT+hVAiXxIQHG+7FEY1iT/t3Exve8t6aohY/nnbfJIxEX6Cv6e2npi
	27wBfk3J61pBbwgc0jJQW2K341U+/jN29brmyfsii0TMwja6AOPVJiJJI0YmrzHZMQf8JZl8Q2R
	Sp6anRlQQaCTnk4dsuEnjB4=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hpmDN6Nnsz1K9Ck;
	Tue, 22 Sep 2026 11:44:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 4A3CA40572;
	Tue, 22 Sep 2026 11:55:07 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:55:06 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <peterz@infradead.org>, <ada.coupriediaz@arm.com>,
	<linusw@kernel.org>, <yeoreum.yun@arm.com>, <kevin.brodsky@arm.com>,
	<anshuman.khandual@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<vladimir.murzin@arm.com>, <tglx@kernel.org>, <broonie@kernel.org>,
	<liqiang01@kylinos.cn>, <ryan.roberts@arm.com>, <pengcan@kylinos.cn>,
	<kmehltretter@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v19 10/14] arm64: syscall: Use exit-specific flags check in el0_svc_common()
Date: Tue, 22 Sep 2026 11:55:06 +0800
Message-ID: <20260922035510.1090299-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922035510.1090299-1-ruanjinjie@huawei.com>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_205510_202853_8EE280D5 
X-CRM114-Status: GOOD (  12.03  )
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

The syscall exit path in el0_svc_common() re-evaluates all
_TIF_SYSCALL_WORK flags, but this mask contains flags that only
matter on entry:

- _TIF_SECCOMP: seccomp filtering is entry-only
- _TIF_SYSCALL_EMU: PTRACE_SYSEMU skips the syscall on entry

Re-checking them on exit is unnecessary and may trigger redundant work.

Switch to _TIF_SYSCALL_EXIT_WORK for the exit-path re-check to evaluate
only exit-relevant flags (_TIF_SYSCALL_TRACE, _TIF_SYSCALL_AUDIT, and
_TIF_SYSCALL_TRACEPOINT).

No functional change intended.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Can Peng <pengcan@kylinos.cn>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Li Qiang <liqiang01@kylinos.cn>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 0061fc63e7ba..f1f0b6f3e32b 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -127,7 +127,7 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+		if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SINGLESTEP)
 			arm64_syscall_exit_to_user_mode_work(regs);
 		return;
 	}
-- 
2.34.1


