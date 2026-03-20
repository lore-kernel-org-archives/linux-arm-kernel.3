Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C521A108B8EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 10:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o3amCnqGL3UCrs+cmHDxRE8MJ72N5dXsUoPyh/ahnH8=; b=lwSYx/zxMorE35nfwwKp50qjo0
	gIV/QzkV6dUm7yLU/afAwJMlxyrLF/KT4S7bsvEc3B+KApSh9Huup3NsXfiGL6A8cwbd01EMVpzYB
	YheGRCSh9VnEx2BN1LkEUyCTRE+5GbK4uWIje7JteGY6q7wsjiGEDnZVYxDbW7M1I7RcuT8HeUDQ/
	pej9Ag48bX63i9XQHQlVJOzU1CmQN6Pjry9tKK5owNn0ZxlzOvtJ8Odbix8lm5zrZrviI926CsUah
	XfyoTHjvMTRPIif6fh5DLj9qmmcTJmUqGU0yQAN/Tr+mm6PtztqxltVnfp6U8KzvwzkKrOhyZ4syT
	CowkrH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X3C-0000000CaQh-3xIM;
	Fri, 20 Mar 2026 10:25:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X32-0000000CaKE-0zTE
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 10:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=o3amCnqGL3UCrs+cmHDxRE8MJ72N5dXsUoPyh/ahnH8=; b=TH3zj2q1SNlr+hpakVVM00ObbK
	ygJy2a/MQ7zuKFPpDNXnHwgoXoOx8sUD25SKdfYNj/S1oB334i2a7zHJuB3cAY1Mnq6MOvvmPGC/x
	EO9C63KIfdWNtBZLC9VkXKKY9rFZ9Y9dC6xAU9wP3cnNT98iJRT4g7XUct4l5W1JP5xCJjaaj178/
	/Mnnkmqg0eLc98Yqd3KAn2VdgZrMpmKi3jB4HlpUVIfhopavVHOOfKUbEL/Ak1gu/8UoU4dLQ2Fir
	tNnNzCXfuf57lnqwj5lVd23XXU9AQUsBITxW3LjjdY2wcvWAO+SDA2y2glC7t+1HfmpDog+IASmDz
	Tk1dIL2A==;
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3X2y-0000000FJpC-1FXP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 10:25:42 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=o3amCnqGL3UCrs+cmHDxRE8MJ72N5dXsUoPyh/ahnH8=;
	b=BMmKPxcqHeUPTZosMDoK/qs8oC/iPGkGy8KUoKQNjTFLKOnrIuAvkouyApwv1enWYPeNGa9Fl
	i7lBWcFwX7trqHfd9v3nbyTjgCpyVyR+ibQrtYK9QbsTX4T8JnWtf6pDVNu2xjaflbxzi53G0Gx
	NY+5K9tpBdm6Em3oSeVpDJM=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fcdqF1fllz1T4H8;
	Fri, 20 Mar 2026 18:20:09 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 54D9E40567;
	Fri, 20 Mar 2026 18:25:33 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 20 Mar
 2026 18:25:31 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@kernel.org>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <ruanjinjie@huawei.com>,
	<linusw@kernel.org>, <kevin.brodsky@arm.com>, <yeoreum.yun@arm.com>,
	<ldv@strace.io>, <song@kernel.org>, <thuth@redhat.com>,
	<ryan.roberts@arm.com>, <mark.rutland@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <liqiang01@kylinos.cn>,
	<pengcan@kylinos.cn>, <mathieu.desnoyers@efficios.com>, <mingo@kernel.org>,
	<edumazet@google.com>, <arnd@arndb.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v14 10/10] arm64: Inline el0_svc_common()
Date: Fri, 20 Mar 2026 18:26:20 +0800
Message-ID: <20260320102620.1336796-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260320102620.1336796-1-ruanjinjie@huawei.com>
References: <20260320102620.1336796-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_102541_282247_023FF6D2 
X-CRM114-Status: UNSURE (   9.91  )
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

After converting arm64 to Generic Entry framework, the compiler no longer
inlines el0_svc_common() into its caller do_el0_svc(). This introduces
a small but measurable overhead in the critical system call path.

Manually forcing el0_svc_common() to be inlined restores the
performance. Benchmarking with perf bench syscall basic on a
Kunpeng 920 platform (based on v6.19-rc1) shows a ~1% performance
uplift.

Inlining this function reduces function prologue/epilogue overhead
and allows for better compiler optimization in the hot system call
dispatch path.

| Metric     | W/O this patch | With this patch | Change    |
| ---------- | -------------- | --------------- | --------- |
| Total time | 2.195 [sec]    | 2.171 [sec]     |  ↓1.1%   |
| usecs/op   | 0.219575       | 0.217192        |  ↓1.1%   |
| ops/sec    | 4,554,260      | 4,604,225       |  ↑1.1%    |

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 77d00a5cf0e9..6fcd97c46716 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -66,8 +66,8 @@ static void invoke_syscall(struct pt_regs *regs, unsigned int scno,
 	choose_random_kstack_offset(get_random_u16());
 }
 
-static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
-			   const syscall_fn_t syscall_table[])
+static __always_inline void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
+					   const syscall_fn_t syscall_table[])
 {
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 	unsigned long flags = read_thread_flags();
-- 
2.34.1


