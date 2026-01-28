Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC28D35669
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 03:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dlgiv5vHJeVQfqQO8YenRF15VrNmzNgTu7a/urQEomA=; b=1fxrXW5z4byJBnPxxbjZFemvOI
	zAXv8+164QptgBANxerkVDDX3SnumjIvLfsz+0DeMFv+vpTjNOepp62MoOww3IDf7REszBAIknnqr
	lcj+uFJfCuntREjw4g7zIwqH5676tDYIsjqt1FxeuR/ARwdlWlpVIbsXvNkULp8uTJ30v/cUWhTl+
	+agEc7/MCCIdmRLEZuCx96kNsqzZ8juDsG4dT1EBVbxboXWUeNQ3Z4pHfLTXnlxDENe+VPc604DY8
	rTk+qGVLeeNWKkEXWL+35Sncq9xaVjQGnHiBSY+EP28Lo46dNpCg5OvBBE8sCB83IWbGt5JnZ9K4P
	M4hEFGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkw5x-0000000FM8O-0A1a;
	Wed, 28 Jan 2026 03:19:53 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkw5s-0000000FM6B-2G2q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 03:19:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Dlgiv5vHJeVQfqQO8YenRF15VrNmzNgTu7a/urQEomA=;
	b=f8+YI6ZNmONGPD5Cq7a0UKIdbtF1h6Vx+W1Sfv+OgwyYXLWbRWO9PlE4mTEhBXdqnaEsk2Zev
	BBr31SSrfvCwTD8/2jp0DWz2QteHffff/nh12ThgOdWJpt2pL1Fl5CrJUb3eTO7MrQYFfAAN7pB
	GO5403Sza+W2nfoC2kN9QVc=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4f16q76XVCznTVF;
	Wed, 28 Jan 2026 11:15:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id F05C440363;
	Wed, 28 Jan 2026 11:19:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 28 Jan
 2026 11:19:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<kevin.brodsky@arm.com>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <mark.rutland@arm.com>,
	<anshuman.khandual@arm.com>, <song@kernel.org>, <ryan.roberts@arm.com>,
	<thuth@redhat.com>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v11 01/14] entry: Remove unused syscall in syscall_trace_enter()
Date: Wed, 28 Jan 2026 11:19:21 +0800
Message-ID: <20260128031934.3906955-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260128031934.3906955-1-ruanjinjie@huawei.com>
References: <20260128031934.3906955-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_191949_196227_A79ADD15 
X-CRM114-Status: GOOD (  10.53  )
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

The 'syscall' argument in syscall_trace_enter() is immediately overwritten
before any real use and serves only as a local variable, so drop
the parameter.

No functional change intended.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/entry-common.h  | 4 ++--
 kernel/entry/syscall-common.c | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 87efb38b7081..e4a8287af822 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -45,7 +45,7 @@
 				 SYSCALL_WORK_SYSCALL_EXIT_TRAP	|	\
 				 ARCH_SYSCALL_WORK_EXIT)
 
-long syscall_trace_enter(struct pt_regs *regs, long syscall, unsigned long work);
+long syscall_trace_enter(struct pt_regs *regs, unsigned long work);
 
 /**
  * syscall_enter_from_user_mode_work - Check and handle work before invoking
@@ -75,7 +75,7 @@ static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *re
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 
 	if (work & SYSCALL_WORK_ENTER)
-		syscall = syscall_trace_enter(regs, syscall, work);
+		syscall = syscall_trace_enter(regs, work);
 
 	return syscall;
 }
diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
index 940a597ded40..e6237b536d8b 100644
--- a/kernel/entry/syscall-common.c
+++ b/kernel/entry/syscall-common.c
@@ -17,10 +17,9 @@ static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
 	}
 }
 
-long syscall_trace_enter(struct pt_regs *regs, long syscall,
-				unsigned long work)
+long syscall_trace_enter(struct pt_regs *regs, unsigned long work)
 {
-	long ret = 0;
+	long syscall, ret = 0;
 
 	/*
 	 * Handle Syscall User Dispatch.  This must comes first, since
-- 
2.34.1


