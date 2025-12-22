Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EB0E6749A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2pfG2FGkeqdKtN9RNd7Vzxcgb13kzm9Ua4HpZFnxrFA=; b=dRpITxxlhys7E3x53mql9vLRDL
	zXcAjP0GTmvgj+hMhklkXedCqckXxmRfo2t8VAPZ2TuhBiFHfUHsE6KgNO+XfEenO3dWGCGZ29PWu
	N8iIx8zzajGC9EJ8DKIUmRdH58K+SN0xbJ6OIceb7p+uYdgLMwx96Gz2oopQtRuaooaKphB0r8HHR
	HtysmLq2khs3uP1d5NwE9GlGeI5I7/e82vsgVd00Ebpu4s3R726F+cp+xorR791ChkZVhPNOMsIHW
	AjDL6i1Zm8pJS/LteY/AubJO8rjgPiXFeS9XR1ZiurI+znvIRkOQp92am+1EOsuQz31tEyCDz3BYX
	EtWvYZ/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeP1-0000000Dgbk-0wQd;
	Mon, 22 Dec 2025 11:48:39 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeOi-0000000DgSz-1mMN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 11:48:22 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=2pfG2FGkeqdKtN9RNd7Vzxcgb13kzm9Ua4HpZFnxrFA=;
	b=gk87i4ggW79ZggPR8oBheys6SvdF7hYLha1MT6VPKCAPQJ+TRHjXBDLKaAIZXxgVtSlejhfSU
	R6ETfk4CROePgxZT3vmKHzg5eEqPEYIblrxgLmvfIhtM/OV7CDzs1cREKjzkP2Fo1oHHKJaNQKa
	a0KIQkMCcY6SDj/sd3BxOik=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dZbsy2C2mzcZxm;
	Mon, 22 Dec 2025 19:45:10 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 15A5F201E8;
	Mon, 22 Dec 2025 19:48:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 22 Dec
 2025 19:48:11 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<ruanjinjie@huawei.com>, <kevin.brodsky@arm.com>, <macro@orcam.me.uk>,
	<charlie@rivosinc.com>, <akpm@linux-foundation.org>, <ldv@strace.io>,
	<anshuman.khandual@arm.com>, <mark.rutland@arm.com>, <thuth@redhat.com>,
	<song@kernel.org>, <ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<broonie@kernel.org>, <liqiang01@kylinos.cn>, <pengcan@kylinos.cn>,
	<kmal@cock.li>, <dvyukov@google.com>, <richard.weiyang@gmail.com>,
	<reddybalavignesh9979@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [PATCH v10 01/16] arm64: Remove unused _TIF_WORK_MASK
Date: Mon, 22 Dec 2025 19:47:22 +0800
Message-ID: <20251222114737.1334364-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222114737.1334364-1-ruanjinjie@huawei.com>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_034820_873634_D4019BCA 
X-CRM114-Status: UNSURE (   7.47  )
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

Since commit b3cf07851b6c ("arm64: entry: Switch to generic IRQ
entry"), _TIF_WORK_MASK is never used, so remove it.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/thread_info.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index a803b887b0b4..24fcd6adaa33 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -106,12 +106,6 @@ void arch_setup_new_exec(void);
 #define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
 #define _TIF_TSC_SIGSEGV	(1 << TIF_TSC_SIGSEGV)
 
-#define _TIF_WORK_MASK		(_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY | \
-				 _TIF_NOTIFY_RESUME | _TIF_FOREIGN_FPSTATE | \
-				 _TIF_UPROBE | _TIF_MTE_ASYNC_FAULT | \
-				 _TIF_NOTIFY_SIGNAL | _TIF_SIGPENDING | \
-				 _TIF_PATCH_PENDING)
-
 #define _TIF_SYSCALL_WORK	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
 				 _TIF_SYSCALL_TRACEPOINT | _TIF_SECCOMP | \
 				 _TIF_SYSCALL_EMU)
-- 
2.34.1


