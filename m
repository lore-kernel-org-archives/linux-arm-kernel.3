Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6BCD116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxUwcTasWefvx6WMBH8kfJ6j8Vy+jYr1BCP+24RtJxo=; b=Az9+gsIKXFTcd8NX4qa3RRCBtO
	pFZ+RpLSs2xmi6+Uj2Wt/oPKnTnh8t982xXIXx4YtY21jshWNHNdFWLQ3FRljBNrSSnvR2UWBNDXH
	w2fEcuc1A8NhaDiYJHTxh8cli05IRFBGwY3Ybw5eBTme/PDvzelb2v/O21HJreu8To7MoM6BBFr1+
	LcdzyDdVGsp8XaSm6vzMqUfljB3qfu3xRJgBjojwhtj5su0/VSfyaXZ6FwteEoyU6XOd/XPvV8b+9
	X6mSQeLuJgBeS6paVYmXNXfVCuzmx9wf7nOBeYTJTwuuy6kVKEEDrL+x+7rK1zbPNSmvrH2TSHFms
	aTMKyWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2gE-00000003Vwh-1Ph7;
	Mon, 01 Dec 2025 12:06:58 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2gB-00000003Vvj-09Su
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:06:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QxUwcTasWefvx6WMBH8kfJ6j8Vy+jYr1BCP+24RtJxo=;
	b=5fuseUddg0mzdGN146s6tHbZhdSFutetc77lchrjUzNzDT2Q0nFwfVe15PVY5aeNr/XAAQX46
	caVkmAd1/SC92RF+fXBgWqVUiL9h2t96W35Kpcq1b1eY0FdbhFTe8qlngiyIgIu/Gj1Pu2hCPIa
	Ef/JIC5NGKA7pRUslRtxuF4=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4dKjJR5lzszKm6D;
	Mon,  1 Dec 2025 20:04:55 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 710221A0188;
	Mon,  1 Dec 2025 20:06:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 1 Dec
 2025 20:06:46 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chris@zankel.net>, <jcmvbkbc@gmail.com>, <ldv@strace.io>,
	<charlie@rivosinc.com>, <deller@gmx.de>, <macro@orcam.me.uk>,
	<akpm@linux-foundation.org>, <mark.rutland@arm.com>, <rostedt@goodmis.org>,
	<tglx@linutronix.de>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v2 1/2] syscall.h: Remove unused SYSCALL_MAX_ARGS
Date: Mon, 1 Dec 2025 20:06:32 +0800
Message-ID: <20251201120633.1193122-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201120633.1193122-1-ruanjinjie@huawei.com>
References: <20251201120633.1193122-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_040655_565545_813E4853 
X-CRM114-Status: UNSURE (   8.30  )
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


