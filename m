Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52720E8782A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 13:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erWUjRao2Zx1+i5q8wSy3eoXEKihQXOYvBUj5KhjsUw=; b=UnVDp4QXKjuKej7esmlPwVHpTc
	yQq7yg6bqjnCt4KayacecnmmW2JvUXjpe9JSDq0DmQtROxpRtU9LQpYsrjFeddMQAO6jcl8rnwJua
	ja0jJ+Z/EFLdoU5IfDqXK8XhISl5JncSLR+YESbnUTWyEvYaVXSdGBpJ5r6BgVVvR5BLq7qYt8tZQ
	+I3CsrrIa8DiSBYWJ8HTBWkhDOm06YeefJ+PxdBehdjT3+57W20vmiAGVxr85v+LgiqHz5CzQSlUg
	BazvyY0RFa7HR1UD4vPscZDdykPKXOEDoj8+7lxq0jpaQAbcLYlI1sP5unmb9Ez0WPXYzDsExGcms
	sko5bc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGbL-00000006gcR-488z;
	Tue, 03 Feb 2026 13:37:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGbK-00000006gaa-2PiY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Feb 2026 13:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=erWUjRao2Zx1+i5q8wSy3eoXEKihQXOYvBUj5KhjsUw=; b=bmN/wXRqCeO5wHIZGDAr1eQXje
	O+JmqJvgonxFX8bkK631/rwcC5NmqH0m+E/bsuc0wQNv/QA3mBNA1YEbCYjt44M4PNdmx5341kbUE
	q50wfLvQeli6ZiMXz04aYSAm7ylRf6MP/kYWr2htCUV+1odwzWhv0VrWTfK3te25FMI1dpsILHmH+
	nxjtEuq0i8zWDX/wNFSPKJMp5CEzM9OEKI1HN6UiOb5YSS8D7HWKrX/1yUV5wtPOrYHq9mElReekT
	FL1HQCoIDN4tdsPO8f26TFj0WA082pu/zjiiG9JrVuwDm+RF4SsokhXtoeqjaVxutkoRP/SgGuZIH
	QXNErAEA==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGbF-0000000GKM1-1Sor
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 13:37:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=erWUjRao2Zx1+i5q8wSy3eoXEKihQXOYvBUj5KhjsUw=;
	b=xk66DhOLN81nQjlEgWG43Ir5X/TRRy3x05MfEPUryObaxDJxIG6GQUOA5nkuEJR0UWdw9Eg6L
	MmCMDfpdpL7jLlL3Cqeuw7P37VmMzs5UE3XzZOxLGC8abtF+WTKO9YpG2/ruXPbPNKIaAMVuDcE
	ozpT6xBaNaff10HikiHPZ60=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f54Jk2BMTz1BG48
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Feb 2026 21:36:38 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=erWUjRao2Zx1+i5q8wSy3eoXEKihQXOYvBUj5KhjsUw=;
	b=xk66DhOLN81nQjlEgWG43Ir5X/TRRy3x05MfEPUryObaxDJxIG6GQUOA5nkuEJR0UWdw9Eg6L
	MmCMDfpdpL7jLlL3Cqeuw7P37VmMzs5UE3XzZOxLGC8abtF+WTKO9YpG2/ruXPbPNKIaAMVuDcE
	ozpT6xBaNaff10HikiHPZ60=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f54DN2zxrz1T4jY;
	Tue,  3 Feb 2026 21:32:52 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9EC7F4036C;
	Tue,  3 Feb 2026 21:37:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Feb
 2026 21:37:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<shuah@kernel.org>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <kevin.brodsky@arm.com>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <anshuman.khandual@arm.com>,
	<mark.rutland@arm.com>, <ryan.roberts@arm.com>, <thuth@redhat.com>,
	<song@kernel.org>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<tglx@kernel.org>, <dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 06/13] arm64/ptrace: Use syscall_get_arguments() helper
Date: Tue, 3 Feb 2026 21:37:21 +0800
Message-ID: <20260203133728.848283-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203133728.848283-1-ruanjinjie@huawei.com>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_133750_357883_79634D25 
X-CRM114-Status: GOOD (  13.12  )
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

The generic entry check audit context first and use
syscall_get_arguments() helper.

In order to switch to the generic entry for arm64,

- Also use syscall_get_arguments() to get audit_syscall_entry()'s
  last four parameters.

- Extract the syscall_enter_audit() helper to make it clear.

- Check audit context first, which saves an unnecessary memcpy when
  current process's audit_context is NULL.

Overall these changes make syscall_enter_audit() exactly equivalent
to the generic one.

No functional changes.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index 5a7e97e94358..e3dcadf13e99 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2407,6 +2407,16 @@ static void report_syscall_exit(struct pt_regs *regs)
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
@@ -2438,8 +2448,7 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 		 syscall = syscall_get_nr(current, regs);
 	}
 
-	audit_syscall_entry(syscall, regs->orig_x0, regs->regs[1],
-			    regs->regs[2], regs->regs[3]);
+	syscall_enter_audit(regs, syscall);
 
 	return ret ? : syscall;
 }
-- 
2.34.1


