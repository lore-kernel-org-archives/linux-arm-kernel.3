Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C850D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxUwcTasWefvx6WMBH8kfJ6j8Vy+jYr1BCP+24RtJxo=; b=zYLD0NVo5du3qh+o/Ok3zpPq9u
	v9fiNmlpzlRaHXwK7Dn4tZh9ddbmwPj4mHoiaygyb9ASlfW5f+WuUMWHhXOZ3mHltEHlG0P3azwp7
	j8o9sDI9Tq/G898ozD3gg1oGMf9bzxEJh7ny5ZxtqPSD+FXzxtNSzR8VziPZ/e2St73Ehvwv3mZNH
	icYaoqAZk9faWrJf51woW5ylBdfUlOoJrNExW/x+SEV8I+4y3nzaTZKVhykDMDsEO0+GpsNDfGRIx
	eCBHr+PvqBrJMXp49CDyr5pWwNQ69lu+D1o82ArBxs2d+Sq/+OsjP6EGICwS5JsXflRv6e7Gk1tCI
	XuJlhsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObEu-0000000GZNf-41Dh;
	Thu, 27 Nov 2025 12:36:48 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObEr-0000000GZMR-2kwc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:36:47 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QxUwcTasWefvx6WMBH8kfJ6j8Vy+jYr1BCP+24RtJxo=;
	b=5fuseUddg0mzdGN146s6tHbZhdSFutetc77lchrjUzNzDT2Q0nFwfVe15PVY5aeNr/XAAQX46
	caVkmAd1/SC92RF+fXBgWqVUiL9h2t96W35Kpcq1b1eY0FdbhFTe8qlngiyIgIu/Gj1Pu2hCPIa
	Ef/JIC5NGKA7pRUslRtxuF4=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dHG9F4KGDznTY0;
	Thu, 27 Nov 2025 20:35:13 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 8F8DD180043;
	Thu, 27 Nov 2025 20:36:36 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 27 Nov
 2025 20:36:35 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chris@zankel.net>, <jcmvbkbc@gmail.com>, <akpm@linux-foundation.org>,
	<macro@orcam.me.uk>, <charlie@rivosinc.com>, <deller@gmx.de>,
	<ldv@strace.io>, <rostedt@goodmis.org>, <tglx@linutronix.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH 1/2] syscall.h: Remove unused SYSCALL_MAX_ARGS
Date: Thu, 27 Nov 2025 20:36:29 +0800
Message-ID: <20251127123630.4149828-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251127123630.4149828-1-ruanjinjie@huawei.com>
References: <20251127123630.4149828-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_043646_150571_229778AC 
X-CRM114-Status: UNSURE (   8.26  )
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

The "SYSCALL_MAX_ARGS" appears to have been unused since
commit 32d92586629a ("syscalls: Remove start and number from
syscall_set_arguments() args"), so remove it.

Fixes: 32d92586629a ("syscalls: Remove start and number from syscall_set_arguments() args")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm/include/asm/syscall.h    | 2 --
 arch/arm64/include/asm/syscall.h  | 2 --
 arch/xtensa/include/asm/syscall.h | 1 -
 3 files changed, 5 deletions(-)

diff --git a/arch/arm/include/asm/syscall.h b/arch/arm/include/asm/syscall.h
index 18b102a30741..574bbcc55382 100644
--- a/arch/arm/include/asm/syscall.h
+++ b/arch/arm/include/asm/syscall.h
@@ -92,8 +92,6 @@ static inline void syscall_set_nr(struct task_struct *task,
 		(nr & __NR_SYSCALL_MASK);
 }
 
-#define SYSCALL_MAX_ARGS 7
-
 static inline void syscall_get_arguments(struct task_struct *task,
 					 struct pt_regs *regs,
 					 unsigned long *args)
diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 712daa90e643..f3853047c28e 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -77,8 +77,6 @@ static inline void syscall_set_nr(struct task_struct *task,
 	}
 }
 
-#define SYSCALL_MAX_ARGS 6
-
 static inline void syscall_get_arguments(struct task_struct *task,
 					 struct pt_regs *regs,
 					 unsigned long *args)
diff --git a/arch/xtensa/include/asm/syscall.h b/arch/xtensa/include/asm/syscall.h
index 7db3b489c8ad..bab7cdd96cbe 100644
--- a/arch/xtensa/include/asm/syscall.h
+++ b/arch/xtensa/include/asm/syscall.h
@@ -61,7 +61,6 @@ static inline void syscall_set_return_value(struct task_struct *task,
 	regs->areg[2] = (long) error ? error : val;
 }
 
-#define SYSCALL_MAX_ARGS 6
 #define XTENSA_SYSCALL_ARGUMENT_REGS {6, 3, 4, 5, 8, 9}
 
 static inline void syscall_get_arguments(struct task_struct *task,
-- 
2.34.1


