Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D7C9C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUABVRK8vkPr+ZnlJEokAN5f4PEBrCtRXbRT40/wO3M=; b=lDfZjv5Ma6uXByWd/pwWmUd3tR
	KzkSsaQt8M4A6jitaip+XyYk/M1bX5ae5XtAZPlGxGJVT1VECgz8XWgQWjOGp0Ecdiei+77XLMOfg
	UMlNdmBgOtoAR6E8id/VTtOvinQJBX2ehzhLWuw4tYJFhfByif79LUuhG+b+rfr+v1GWT+I2TVfay
	lC+H9C1n7TyE+O0fOvYtMznjLBVbUgKIuTaBK4Mo0SxU+Lt/40iOO7B3cVqDn5KJyJ5I05vWruHLX
	FI7ZqYtSLmdNrYm6Hmo/37uDq/cswk9+d7yXXj8LXielG38puqeEU0KSjK8X3beP3kGLS8TNSfnDk
	Y0j64MLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rbj-00000004802-3tYT;
	Tue, 22 Sep 2026 03:55:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rbV-000000047qs-0Ht1
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 03:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=LUABVRK8vkPr+ZnlJEokAN5f4PEBrCtRXbRT40/wO3M=; b=PnJhbouS7a1Kq+rTXURdJZoHE8
	D4kjekSp28Q2pw4G7ouBtPzOAzwwfpsABQBJosKt+OtSszEiZ+tRkESWGCWYTYJrOQriTi5HpA45X
	yhNEAZapUfxKZvnmSTW1wkZe8c1POBpUfaq6aKLfN7JhLHovYvpbrMsEEilp3K6SDM2dmPcN0oFtC
	iLv8ETpVzXD6KRa16lE9SOk8iVoccUMbpNxePdtjWdZhv24OBJr49oOipGvWXCbOZqmgyXC3z8vXa
	q7MWEO4n9WV9cbUvLQHPQ93gWd06Aebsi8Q0okRJ4lJqVUlv6WO41N1a+WO3tlRcx+PfHM6OwECa7
	aHGUChUg==;
Received: from [113.46.200.220] (helo=canpmsgout05.his.huawei.com)
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rbQ-00000006oAA-24VT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:55:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=LUABVRK8vkPr+ZnlJEokAN5f4PEBrCtRXbRT40/wO3M=;
	b=mGl2ljTxJpmXAFa7qXwzV+3WdEwlujjBpT5OyfXQTWumvZ4u6XXwsBd+ivrO2Nfx9YV7yvsqi
	ykof6UmlrzQ4/c83wktZ/8OEvbHCD6IuK+PRoabGsVOZ7deRrY3GohUE4HkXnaCLotqCOGYkoML
	Yg3e4B3j6/EInpxYXgsHAdg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hpmDP0d2vz12LJK;
	Tue, 22 Sep 2026 11:44:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id EBA7440561;
	Tue, 22 Sep 2026 11:55:09 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:55:09 +0800
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
Subject: [PATCH v19 14/14] arm64: Inline el0_svc_common()
Date: Tue, 22 Sep 2026 11:55:10 +0800
Message-ID: <20260922035510.1090299-15-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922035510.1090299-1-ruanjinjie@huawei.com>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_045533_059821_07260E5D 
X-CRM114-Status: GOOD (  11.10  )
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

After converting arm64 to Generic Entry framework, the compiler no longer
inlines el0_svc_common() into its caller do_el0_svc(). This introduces
a small but measurable overhead in the critical system call path.

Manually forcing el0_svc_common() to be inlined restores the
performance. Benchmarking with perf bench syscall basic on
a Kunpeng 920 platform (based on v6.19-rc1) shows a ~1% performance
uplift.

Inlining this function reduces function prologue/epilogue overhead
and allows for better compiler optimization in the hot system call
dispatch path.

| Metric     | W/O this patch | With this patch | Change    |
| ---------- | -------------- | --------------- | --------- |
| Total time | 2.195 [sec]    | 2.171 [sec]     |  ↓1.1%    |
| usecs/op   | 0.219575       | 0.217192        |  ↓1.1%    |
| ops/sec    | 4,554,260      | 4,604,225       |  ↑1.1%    |

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Li Qiang <liqiang01@kylinos.cn>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Can Peng <pengcan@kylinos.cn>
Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 4a13108defb0..2535cae9413d 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -55,8 +55,8 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 	syscall_set_return_value(current, regs, 0, ret);
 }
 
-static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
-			   const syscall_fn_t syscall_table[])
+static __always_inline void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
+					   const syscall_fn_t syscall_table[])
 {
 	unsigned long flags = read_thread_flags();
 	unsigned long work;
-- 
2.34.1


