Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98A7C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHLvOEpJte+v4ZO1cJMq4vlDDVr7pXlP7ArOasD0uVI=; b=F1wQS5U8fm6d+caARQEOTApbEN
	rW8t4roArcb0pzITPyheKNRC0ZTKZLdoxZtX6xiWyCe55l3rJKs7VsPKPxcYDkorYCW02E2twGwIo
	vv4xwcl2FTWJNrpId8ZDz2dIc/RXyuPrpzJpHEzxvLsrf2nBlsEh+wZCorVqe5iawv3VYdClUPR0o
	s2SXrqmjZ2TPwCfCKYb3gIKbyXWyg1irOdJD5a5lep/JMN3PjKJgko4Z4aoZJlIg5TrlMVLga9p3N
	6yFhR9qHPHHRj7IcsgCRKvzHvOilQgoIYhTbyzD8NjDkKVigipdQX8gy53TwdPfGSKzGIwkz56hQc
	bUO4KP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rcI-000000048Pf-31ET;
	Tue, 22 Sep 2026 03:56:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rbm-0000000482l-27Xb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 03:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tHLvOEpJte+v4ZO1cJMq4vlDDVr7pXlP7ArOasD0uVI=; b=dvEgUORwjae2I/YvK4KoxPMIlK
	Dkq5eunkUrU34yyGP064cC0oUrmIGmn9AgToQT7vxdjI5/Dge1Rte8eUorh9cgj22RYGa8mFbkoAb
	wyPE9Q6t5Mp9Gwrgf9RDUlJlND+3NtdPPM/u0wDpYRxjWhh67lo/GHxLWy+wmJnWUibIG4SnUM7pP
	1xfChNjMQdQH58bUagzbfqftEgR48aCLafEg0+nDFWKrhy1zYjv+9n3GIPwzQkriwys4T/9ojTyzH
	AFjtbkL6SIOSZ0U2Wzqb1EwNFAPuUlAMlf1YLzp1ZGFW3BdL6YAnbHW5AWyQXCCG2Hpgby2jzauJ6
	/lUpDkew==;
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8rbJ-0000000D4bu-337i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:55:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tHLvOEpJte+v4ZO1cJMq4vlDDVr7pXlP7ArOasD0uVI=;
	b=YynlK7q2swGyzTycfM3v9tvCkDDI3gY8vK4dsYYsmtf4Btr624h2j516phda/an5vR7KY3gPO
	BwSh82STuYGinpOaWvEsVbK+GiFKO18a7DzrhnsRIf7FwQ/2v31OBK2IkAzrAznRaEEQSPlakLs
	VCEi0GxehB+dJP0c4RNfSAQ=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hpmDF52hGz1prKW;
	Tue, 22 Sep 2026 11:43:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 35E4F4056D;
	Tue, 22 Sep 2026 11:55:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:55:00 +0800
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
Subject: [PATCH v19 01/14] arm64: ptrace: Fix redundant syscall exit stop for PTRACE_SYSEMU_SINGLESTEP
Date: Tue, 22 Sep 2026 11:54:57 +0800
Message-ID: <20260922035510.1090299-2-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260922_045527_855074_FD56BC62 
X-CRM114-Status: GOOD (  12.89  )
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

PTRACE_SYSEMU_SINGLESTEP sets both _TIF_SYSCALL_EMU and _TIF_SINGLESTEP.
arm64 currently reports a syscall exit stop whenever _TIF_SINGLESTEP is
set, regardless of emulation state.

This violates the ptrace man page (Syscall-stops section):

	"If the tracee was restarted by PTRACE_SYSCALL or PTRACE_SYSEMU,
	the tracee enters syscall-enter-stop just prior to entering any
	system call (which will not be executed if the restart was using
	PTRACE_SYSEMU, regardless of any change made to registers at this
	point or how the tracee is restarted after this stop). ...
	If the tracee is continued using any other method (including
	PTRACE_SYSEMU), no syscall-exit-stop occurs. Note that all mentions
	PTRACE_SYSEMU apply equally to PTRACE_SYSEMU_SINGLESTEP."

Fix by introducing report_single_step(), which returns false when
_TIF_SYSCALL_EMU is set, skipping the redundant exit stop.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Fixes: ac2081cdc4d9 ("arm64: ptrace: Consistently use pseudo-singlestep exceptions")
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index f743cbec1c3a..96462de75d4b 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2482,16 +2482,26 @@ int syscall_trace_enter(struct pt_regs *regs)
 	return regs->syscallno;
 }
 
+static inline bool report_single_step(unsigned long flags)
+{
+	if (flags & _TIF_SYSCALL_EMU)
+		return false;
+
+	return flags & _TIF_SINGLESTEP;
+}
+
 void syscall_trace_exit(struct pt_regs *regs)
 {
 	unsigned long flags = read_thread_flags();
+	bool step;
 
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
 
-	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
+	step = report_single_step(flags);
+	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
 
 	rseq_syscall(regs);
-- 
2.34.1


