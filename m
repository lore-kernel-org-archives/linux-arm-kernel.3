Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9399CC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrkb1A7umndhy2bYSvMHLof4oRoyd+N2sYYHpptw3ug=; b=zGLH4gHost1+R3Tuz++6fiiAji
	WuHqiQyOSQHg59kIQsMinK5dK50nTaLoARodGIVYY5xRmK91MrygbmELyWzj5AkOgUYrY6GqGo5eA
	scL2gSyl2oQ5qy/stnZdLsEdyKGPe4BDADBhZZ5s3d//K1xd60QGa5Haeq8PSkbVaqKkaGZLVVk3y
	8AtaL8lWTzGpydYIhY9ACan6L68GBGkmLXtmyUjWJ03GS+NCS6TDnPTDjY/uhRPaUCjSshVbA9LW/
	mQl1D/s178+ZfDmURu6hAfy7oaC0LjliM4dq+kBBJuU2fODYvlkcYmj9MRnObFxT9hFOfhI8zYYbb
	9qgQyxZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rb6-000000047iG-31u9;
	Tue, 22 Sep 2026 03:55:12 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rb2-000000047fq-24A7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:55:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nrkb1A7umndhy2bYSvMHLof4oRoyd+N2sYYHpptw3ug=;
	b=Djc5Tq+/LNX071Ft5LP7daTn17aGlAQb1ay4BuEc28LMAjTu+hkLPqzLQKZB3rSisYyPaGBeS
	i0ZNPL6LwKcQkLEqub0LHdGbgFbFP3XcHcDTX0G0cHAAcm1/yxnyXj8NrKGZekrI9osWs/4FY4P
	o1xdULl9KSUC4GD4Ap4b37c=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hpmDJ6WMwznTVd;
	Tue, 22 Sep 2026 11:44:00 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A4ECD40563;
	Tue, 22 Sep 2026 11:55:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:55:01 +0800
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
Subject: [PATCH v19 03/14] arm64: ptrace: Open-code seccomp check in syscall_trace_enter()
Date: Tue, 22 Sep 2026 11:54:59 +0800
Message-ID: <20260922035510.1090299-4-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20260921_205509_160975_4A1E7EF1 
X-CRM114-Status: GOOD (  12.99  )
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

Refactor syscall_trace_enter() by open-coding the seccomp check to
align with the generic entry framework.

The generic entry implementation expands the seccomp check in-place
by testing SYSCALL_WORK_SECCOMP and directly calling the underlying
__seccomp_permit_syscall() function. Moreover, generic entry explicitly
re-reads work flags after ptrace handling to ensure any updates to
seccomp work flags during the ptrace stop are observed.

Bring arm64 in line with this behavior:
- Re-read thread flags after ptrace handling.

- Test the updated flags for _TIF_SECCOMP and call
  __seccomp_permit_syscall().

No functional changes are intended; this change simplifies future
migration to the generic entry framework.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Oleg Nesterov <oleg@redhat.com>
Link: https://lore.kernel.org/all/20260713025712.416366-1-ruanjinjie@huawei.com/
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 573b5770698f..f68de40fd351 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2480,11 +2480,16 @@ int syscall_trace_enter(struct pt_regs *regs)
 		ret = report_syscall_entry(regs);
 		if (ret || (flags & _TIF_SYSCALL_EMU))
 			return NO_SYSCALL;
+
+		/* ptrace might have changed thread flags */
+		flags = read_thread_flags();
 	}
 
 	/* Do the secure computing after ptrace; failures should be fast. */
-	if (!seccomp_permit_syscall())
-		return NO_SYSCALL;
+	if (unlikely(flags & _TIF_SECCOMP)) {
+		if (!__seccomp_permit_syscall())
+			return NO_SYSCALL;
+	}
 
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
 		trace_sys_enter(regs, regs->syscallno);
-- 
2.34.1


