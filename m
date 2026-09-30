Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD9CCA5FBA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XTrqrTmhjmmRwv09h9oZokZmfmkV6AACDkBxFvTlyY=; b=JM2yxN+z//er+QgyHRWj5ZRCJc
	qrcadZbFKMgpgLe4HKCHmnKAQMDoGj5pWvYyUXhGxW03zz+Vdskx+LF3/xndoTsRSo42kaB00paUb
	qlomQHXj7meQazJlgawscZZ9uYy8V4+RhmJFBLyYpZYbmIKxOG6+3Tlr4Qp3RCKwf4xRCX/BVaAm+
	zMG/XpNi+8I6LbyicBe5ygMNufb5/ayeXN2zoC39sDbV1BTNb+LpNS5vzhuQiKVQOCnZJkbeKGvi6
	AhqPNoJ8tOmdDHU+Qg6FSWKFgKZrwJiMIxMYPDovaWGoIx83xjddA64EWuHoA3wWS+PGpyepTnBJO
	FV/MuSyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrNN-00000005iTv-3YmX;
	Wed, 30 Sep 2026 10:17:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrNF-00000005iOJ-01jE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 10:17:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=6XTrqrTmhjmmRwv09h9oZokZmfmkV6AACDkBxFvTlyY=; b=knYj3S7ZULsNiJn27PnBk6d6GW
	VHLZZvoLuwBDKvanzpxpNbz+WSNFtTU7YM8deagFaqyACZY5nCxavYCvR0AKv2cGPvT3MOv1y4W8B
	EcMaWMelYgXmF6CObD3ZhwjM2d0RyJrywdst8+8iQ9EmWQ/YPLb3HyW4hB5zLxL10WYv4pl2OGSsc
	TbXND1hu2rvT8z6zCxVLVgwZuAzxSKahup1FQ3IMmXMtUetlXvIeGoDqgXtJzBpyn+S7SWTqeOFFz
	4KPC1AUTM+zsW3C1K1zmJyqf9iz6KqTD1VNBN3CaFbpcDKjay//A+CqmckrsLk+iYaN2ABgy2qq+6
	l0ySvWlw==;
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrN5-0000000CUTW-1RcM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:17:15 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=6XTrqrTmhjmmRwv09h9oZokZmfmkV6AACDkBxFvTlyY=;
	b=H04kjZjj/yzZFnWJDfmGL+pacj/GYrh3KjJZBGJJ2UOCUjE0NyL73R25YU2gsDHAX4LbPafR5
	ldCmFAizL7lPssldKzdsYUtscSWhbhVp27KESDU7hIl9gkL45mNv7Ivko++PkVg8ut5VhLgr7Uy
	n8kzTjuEubnYkEWF2mosgaA=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJ85NWwzRhTs;
	Wed, 30 Sep 2026 18:04:56 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D62784057D;
	Wed, 30 Sep 2026 18:17:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:17:01 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<tglx@kernel.org>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v20 10/15] arm64: syscall: Use exit-specific flags check in el0_svc_common()
Date: Wed, 30 Sep 2026 18:18:00 +0800
Message-ID: <20260930101805.1770358-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930101805.1770358-1-ruanjinjie@huawei.com>
References: <20260930101805.1770358-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_111708_279905_CAFC9388 
X-CRM114-Status: GOOD (  11.45  )
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


