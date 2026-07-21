Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47379C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdc1f7APJXH1A4RlASICiN/qzPLenJiErSnTlc675VE=; b=ZiH1H2CBEphiCKEHfz1pmaCZBv
	3Dsc7kUQBx/XXxe/g9yDIew6LzWt6yXI4gkDDItYFlpxPNqRNxMMg3Kgb1p9/c879GP11SiUh4ee9
	GgNeClYtUTrzXo7mhfpN+ErUAdfjXBTrdea2C7fnQ048J4IftiSffaKCmwqmceTPu+k772h769BNC
	o1Kg7EWMc9WCDf8GUTAj6zD444bi9uEnCHBgGW+gsycsYa5L7zDRZwQ0TZEg1cSFtQZiCV+ZBm/ut
	Mxpfi5hZsCyt+J4YWSZlre1kMjkB4OBf/j1IU647LrgppL2ElCxPTI9Mdh+EiPy/9Qi6barA00k5A
	KcoHpV1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5hD-00000008mfU-0wlx;
	Tue, 21 Jul 2026 08:19:23 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5gy-00000008mUE-18Dy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:19:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=cdc1f7APJXH1A4RlASICiN/qzPLenJiErSnTlc675VE=;
	b=Yoed7e8RXfOGKV5BdhCPVXK/NpNB6mm/UMlPjDUXaQkHY7ucrT8JDQ96VcORif+3a7+Fop22y
	cFDvKhdwhXM41APldPjb8jHhpx+SUKhJ3da18rRw3RmPu3w+dXIpr9au56y+EnCkAnetg3JJ+pw
	XnHVMvusQEhxGFgUiJ4agEk=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4h495y10Zlz1T4Km;
	Tue, 21 Jul 2026 16:09:42 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 387C340537;
	Tue, 21 Jul 2026 16:19:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Jul
 2026 16:18:59 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <kees@kernel.org>,
	<oleg@redhat.com>, <luto@amacapital.net>, <wad@chromium.org>,
	<thuth@redhat.com>, <peterz@infradead.org>, <mark.rutland@arm.com>,
	<linusw@kernel.org>, <ada.coupriediaz@arm.com>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <anshuman.khandual@arm.com>, <james.morse@arm.com>,
	<tglx@kernel.org>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v17 03/15] arm64: ptrace: Open-code seccomp check in syscall_trace_enter()
Date: Tue, 21 Jul 2026 16:18:46 +0800
Message-ID: <20260721081858.1169276-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721081858.1169276-1-ruanjinjie@huawei.com>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_011908_935970_AA845F84 
X-CRM114-Status: GOOD (  12.79  )
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
index 643e63a65734..cd0607ec70ef 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2478,11 +2478,16 @@ int syscall_trace_enter(struct pt_regs *regs)
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


