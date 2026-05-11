Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C441CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0+aAwFLi92+TRI38jn2hv+CS+CcDbRx2xD0b1Cai4s=; b=ffvk12ZGn5yN3txcyMB8n5c9ih
	TBZA6PRXQUTkWYG6Bv0ojCAjfgKmz2RJu6MzCOEQhInrBPfpacj3+UnvKdeypG/rl5Z7qWMJOB9id
	Jo2djG1RSpwJiVBUoDUJ0OkuUf/I7aTOdIYUFRAmYLsoQBG2Qbjle/OtlO9MfxcdBiTNp7hSuuHVd
	oPhNmKAUkY3Xc2DgEeyDeixlE/H3/35c3otIgXN72yZAgMy8vJm433CrK1HIFLwpcgNFkJw6hwgpM
	O5h94MdXDVXPFHY2s44/Wbg8WsOIvntJV3xv0RQu0RBHNRbLAjvamx+ri62tCORoCAqD7YP5/XwQu
	AULh8FuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMq1-0000000Ct04-2Gwt;
	Mon, 11 May 2026 09:22:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMq0-0000000Csxe-1Ffb
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 09:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=Y0+aAwFLi92+TRI38jn2hv+CS+CcDbRx2xD0b1Cai4s=; b=FKep2QGG+KkZjt1lPMruBTZzKR
	5xWMdBouGQYueLisEe1hBDQAJcglM9ewFh0Hu0ZmO5lSpLH0hQ+SvKFxb7LKMlT+1panJ22h6cngn
	3ISXx2VQR2QkrCNWXvAnVKnwvnYsjAYWMInNZ9eJL+2/Hl8eki0THxw10/pr/KzmQaIDpXx0ah8f3
	cpZMF8ZHXG5b7mM75UR77G7Aval78G8cgWt7Tq64+8Wd0ivfm2os/aoCHCKFbf3mWWYJ0tYIBSR09
	xWSXRsT6cpaKkqvBhOZUZzlcAUDHQ9JvI8Yag/gHqF1/WS2vvvqU0qfJQAd5Bk/XZQsyy02eksBYI
	qwt1QLXg==;
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMpw-0000000BA4x-1mpM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:22:06 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Y0+aAwFLi92+TRI38jn2hv+CS+CcDbRx2xD0b1Cai4s=;
	b=eViMSrSEJO07cHxkhI1BqI/e3Keb8gBPPMBs+Gn2M8eApbLmx8akFffez5pN7JVmT2nCTG7cS
	WO9yu9xHEGNWJuJFPZq54OFFz8y6Ehf0H/1dxni7K1b4N0w2jvchYveg2MyWQ6ymxrAr77Xufsb
	CqKExTrAGaqqG7yi4c6K2kg=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4gDYvL6JDdzRhSh;
	Mon, 11 May 2026 17:14:22 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6B6AB40569;
	Mon, 11 May 2026 17:21:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 May
 2026 17:21:56 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <ruanjinjie@huawei.com>,
	<mark.rutland@arm.com>, <yeoreum.yun@arm.com>, <linusw@kernel.org>,
	<kevin.brodsky@arm.com>, <ldv@strace.io>, <thuth@redhat.com>,
	<james.morse@arm.com>, <song@kernel.org>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <ryan.roberts@arm.com>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v15 05/11] arm64/ptrace: Use syscall_get_arguments() helper for audit
Date: Mon, 11 May 2026 17:20:57 +0800
Message-ID: <20260511092103.1974980-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511092103.1974980-1-ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_102205_170427_37483C26 
X-CRM114-Status: GOOD (  11.02  )
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

Extract syscall_enter_audit() helper and use syscall_get_arguments()
to get syscall arguments, matching the generic entry implementation.

The new code:
- Checks audit_context() first to avoid unnecessary memcpy when audit
  is not active.
- Uses syscall_get_arguments() helper instead of directly accessing
  regs fields.
- Is now exactly equivalent to generic entry's syscall_enter_audit().

No functional changes.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index ba8cb5ec967b..20441e0f6328 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2408,6 +2408,16 @@ static void report_syscall_exit(struct pt_regs *regs)
 	}
 }
 
+static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
+{
+	if (unlikely(audit_context())) {
+		unsigned long args[6];
+
+		syscall_get_arguments(current, regs, args);
+		audit_syscall_entry(syscall, args[0], args[1], args[2], args[3]);
+	}
+}
+
 int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 {
 	long syscall;
@@ -2439,8 +2449,7 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 		 syscall = syscall_get_nr(current, regs);
 	}
 
-	audit_syscall_entry(syscall, regs->orig_x0, regs->regs[1],
-			    regs->regs[2], regs->regs[3]);
+	syscall_enter_audit(regs, syscall);
 
 	return syscall;
 }
-- 
2.34.1


