Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C134CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v3G53X7g6bOP0NpyI5i+7EzCeYKLsZM3lQPwaHyXLHE=; b=KgdKKJsyOn9mhbEEXJ6nEjZpBp
	Gy3Ng89lUz5pH62GtN7btbbONWIMX9DDZ+vrdA4Bb8gquq3J7ry9bEY3H6uJIH7RH3UGCkjiGmmCX
	c3SNW+/wNwcOASSLs0Xit0+p1T/QgLQO3FK2zFs6WuJdAI56gmfIkKAyFOzormhMxUMvzI3YQAfTK
	NaKuqDyEp9LGMi9/XusIgrk2bq/aA0um4w1cGAcNhSOPWRlVMm5S8eCyVWuOAOR1O0R8GJtnCW3lZ
	tNclCAgPLVTkoA2rwt1EIqd0uhmLy/izOVXYhzvGH3zG63qb0Li1Ftqw/3zGzj0ledjwVlT+3+VyO
	f+tSgiFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMqE-0000000CtDA-2yLL;
	Mon, 11 May 2026 09:22:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMq8-0000000Ct5W-063B
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 May 2026 09:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=v3G53X7g6bOP0NpyI5i+7EzCeYKLsZM3lQPwaHyXLHE=; b=Lyr8F3s0Q/gUjSpRRK8N3+sMpg
	RIWBKVnoqPYZhZ48xtHg0G09NNMaNcMN7m+ihsra1pgdPEJevbcUtuHgtWvumPwj95nsqojJsHLtV
	3evFOKOcFUSJBkFKq4/2muZ9GyELS8WM35BbUqc2nWOIyu+gqNkC2Z07vL092CcrTAsKrXdV4vwoo
	tdUn3dsweZMGULQZ0NX2xt8URpbFE3DQ5yRumzFCdUDmQf4VIuY756YTyXc/zZ8FlaLrfZrI+RxtR
	fhpJLlCAdFrh/gxSNjE2JUYzFIVZOzH4da0F8Z0Mb/lBq5dnGY5pvA+YD+vKTE8cYe3d8RmkRVbKK
	cPszpipQ==;
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMq3-0000000BA8d-22xV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:22:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=v3G53X7g6bOP0NpyI5i+7EzCeYKLsZM3lQPwaHyXLHE=;
	b=l+XPfAnKKUD989KzwVPluz7Nx0WBno86jubP79mbZt2rt7nZSzHZm2eMUXiOjya0k8WNiLwmW
	dz+faaCpW8CxYVd8CjVLvG1zOZlotxaueQE1mkiA6roAAsRmGeqQOZ6E3Yu67HfxuJXCYkt5PSj
	UNEsJOaqYHk40lL0qmFmLxk=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gDYvW4ks0zLlSL;
	Mon, 11 May 2026 17:14:31 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 15FF2402AB;
	Mon, 11 May 2026 17:22:07 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 May
 2026 17:22:05 +0800
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
Subject: [PATCH v15 11/11] arm64: Inline el0_svc_common()
Date: Mon, 11 May 2026 17:21:03 +0800
Message-ID: <20260511092103.1974980-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511092103.1974980-1-ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_102213_387700_29D74506 
X-CRM114-Status: GOOD (  10.51  )
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

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index f83673e38901..a686b48b245d 100644
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
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 	unsigned long flags = read_thread_flags();
-- 
2.34.1


