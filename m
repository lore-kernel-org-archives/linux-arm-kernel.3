Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5E9C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=svw/SqQj9Qh8xvwOQM7ADRh0bm3zQyfOKJqnKqDafDM=; b=F9vrvq5HI7dGCrN+c2ChdDrrqQ
	CASVn1zXaOvpw++T3A+sgMCoXCJ1I72eugivzLhDnp4zYl8DeptdBI/3Cl0HbSushfk/XwEJ1rdsO
	I2RYvGxagoAOBXtQ5c2xQvq9ohwfaagjWdgoiUau+JCBUPAI2vOI9D4WEWSjYtvpI0DO8xQkpggcJ
	zBbWJx8loXnACBqInn5i8jQFp5Nd8X20VSBMhUl9R2+AUzINbTfhnwRLBJwQYnUV07qMF7hs7PmuN
	Ecwy9lg0lkelzkBa4k9Gbw6ksRQ5MGaGgetsStwC4YOtEyYep4bgHAUGVmREoz+o5qAC1YJCd8xK0
	+I6ehFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uG2-0000000DlwP-02tU;
	Thu, 24 Apr 2025 10:56:42 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tS1-0000000Dbbj-2jS2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:05:03 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Zjs6n1JNbz27hVD;
	Thu, 24 Apr 2025 18:05:37 +0800 (CST)
Received: from kwepemg200012.china.huawei.com (unknown [7.202.181.63])
	by mail.maildlp.com (Postfix) with ESMTPS id BA44118005F;
	Thu, 24 Apr 2025 18:04:53 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.108.232) by
 kwepemg200012.china.huawei.com (7.202.181.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Apr 2025 18:04:53 +0800
From: xieyuanbin1 <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <sfr@canb.auug.org.au>,
	<rmk+kernel@armlinux.org.uk>, <xieyuanbin1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<will@kernel.org>, <nixiaoming@huawei.com>, <liaohua4@huawei.com>,
	<wangbing6@huawei.com>, <lincheng8@huawei.com>, <wangfangpeng1@huawei.com>
Subject: [PATCH] ARM: spectre-v2: fix unstable cpu get
Date: Thu, 24 Apr 2025 18:04:37 +0800
Message-ID: <20250424100437.27477-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.108.232]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemg200012.china.huawei.com (7.202.181.63)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_030502_031668_B4E96803 
X-CRM114-Status: GOOD (  13.93  )
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

From: Xie Yuanbin <xieyuanbin1@huawei.com>

When a user program accesses the kernel address,
a segment fault will be triggered.
For the latest kernel, with arm's multi_v7_defconfig, and set
CONFIG_PREEMPT=y, CONFIG_DEBUG_PREEMPT=y, CONFIG_ARM_LPAE=y,
if a user program try to accesses a valid kernel address, for example:
```c
static void han(int x)
{
	while (1);
}

int main(void)
{
	signal(SIGSEGV, han);
	/* 0xc0331fd4 is just a kernel address in kernel .text section */
	__asm__ volatile (""::"r"(*(int *)(uintptr_t)0xc0331fd4):"memory");
	while (1);
	return 0;
}
```

, the following WARN will be triggered:

[    1.089103] BUG: using smp_processor_id() in preemptible [00000000] code: init/1
[    1.093367] caller is __do_user_fault+0x20/0x6c
[    1.094355] CPU: 0 UID: 0 PID: 1 Comm: init Not tainted 6.14.3 #7
[    1.094585] Hardware name: Generic DT based system
[    1.094706] Call trace:
[    1.095211]  unwind_backtrace from show_stack+0x10/0x14
[    1.095329]  show_stack from dump_stack_lvl+0x50/0x5c
[    1.095352]  dump_stack_lvl from check_preemption_disabled+0x104/0x108
[    1.095448]  check_preemption_disabled from __do_user_fault+0x20/0x6c
[    1.095459]  __do_user_fault from do_page_fault+0x334/0x3dc
[    1.095505]  do_page_fault from do_DataAbort+0x30/0xa8
[    1.095528]  do_DataAbort from __dabt_usr+0x54/0x60
[    1.095570] Exception stack(0xf0825fb0 to 0xf0825ff8)
[    1.095706] 5fa0:                                     00000000 befe9c64 00000000 c0331000
[    1.095737] 5fc0: 00000002 0006dd68 00000001 befe9f04 befe9f0c 00070010 00000002 00073770
[    1.095746] 5fe0: befe9d94 befe9da8 00010953 00010250 600d0030 ffffffff

In this case, the hook func in do_DataAbort `inf->fn` is `do_page_fault`,
`do_page_fault` enables the irq, so it is preemptible here.

Inside `harden_branch_predictor`, if we just obtains the hook function `fn`
of this CPU, then the task is scheduled to another CPU.
The previous function is still executed, which is dangerous.

Use get_cpu() and put_cpu() to fix it.

Fixes: f5fe12b1eaee ("ARM: spectre-v2: harden user aborts in kernel space")

Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 arch/arm/include/asm/system_misc.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/system_misc.h b/arch/arm/include/asm/system_misc.h
index 98b373403..93cad3d50 100644
--- a/arch/arm/include/asm/system_misc.h
+++ b/arch/arm/include/asm/system_misc.h
@@ -18,15 +18,16 @@ extern void (*arm_pm_idle)(void);
 #ifdef CONFIG_HARDEN_BRANCH_PREDICTOR
 typedef void (*harden_branch_predictor_fn_t)(void);
 DECLARE_PER_CPU(harden_branch_predictor_fn_t, harden_branch_predictor_fn);
 static inline void harden_branch_predictor(void)
 {
 	harden_branch_predictor_fn_t fn = per_cpu(harden_branch_predictor_fn,
-						  smp_processor_id());
+						  get_cpu());
 	if (fn)
 		fn();
+	put_cpu();
 }
 #else
 #define harden_branch_predictor() do { } while (0)
 #endif
 
 #define UDBG_UNDEFINED	(1 << 0)
-- 
2.48.1


