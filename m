Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9DBC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M5sGTGijkijKquhsZpeteo9Z+KqHf8edhKrasj8jgT8=; b=OXZTGCdYRi3P+dGcAD1/hGxEaD
	Xez1AvAvLKHVfNako8dlaS5DO1GLxcLBWZKXDGR/1IxQoLfT4q+dVGSGMhwUMx9WbE5zEUd6ZpRWM
	+KSmnh7o7ABqh0hVLDmzSxUABUEH6/MF3xDtMWh9B8fY1BZvoJo17ggwbfXdaLMCfEDLGGMkOpaLM
	RTE/SZOazGL1gLlV/pSGtsz6i4ReRvPLR71hVe5NcBb8+oJcnx8PLTUPfXn2mHOPShuoRDxH3gzqF
	tdi678McVtKOiAZecxfwoMabqS01tzY6uBoenoNaD8/G2iSSl5pgavFFP05qDTTMOkWGJJiQVlyRw
	9LwaZ9MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYwG-0000000B6BB-27My;
	Thu, 13 Feb 2025 13:07:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYqq-0000000B517-233I
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 13:01:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=M5sGTGijkijKquhsZpeteo9Z+KqHf8edhKrasj8jgT8=; b=l62kukB+8NSl0k9XolIIYvYIVp
	5kzpQQeC5whtjgf7TUEHEx47Ay3VHr9lANn034gRLFXFK4IBC50PeI8rEvqnKKXSYftjer5Gki2a7
	cPnobm3Su+hrZGBiMiVdCYukKJxfEAj9TIJ2HaX0A1vsFhz4uAw9p67PQIDbqlmqi60dCTv/0YVi0
	uL4wyiN32gQt4G1MmEhHhd5vMohtGPSDIU8yp1Dh42xgDX49bCRKZ8xaKilS9vcsxJdZTLP8kpKPX
	DE01B2OCtp529YVO6StwxE5oa8deYHXiRhG8bu8xkRCpBMBSONvlt3UbjEJ62OHT91FZJUTIICAz3
	2W4DOnvQ==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYqm-00000000zkq-3IFo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:01:55 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4YtwLn4XMqz20p2K;
	Thu, 13 Feb 2025 21:02:09 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id EBBFC1400D2;
	Thu, 13 Feb 2025 21:01:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 13 Feb
 2025 21:01:38 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<sstabellini@kernel.org>, <tglx@linutronix.de>, <peterz@infradead.org>,
	<luto@kernel.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <kees@kernel.org>, <aliceryhl@google.com>,
	<ojeda@kernel.org>, <samitolvanen@google.com>, <masahiroy@kernel.org>,
	<rppt@kernel.org>, <xur@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<mark.rutland@arm.com>, <puranjay@kernel.org>, <broonie@kernel.org>,
	<mbenes@suse.cz>, <sudeep.holla@arm.com>, <guohanjun@huawei.com>,
	<prarit@redhat.com>, <liuwei09@cestc.cn>, <Jonathan.Cameron@huawei.com>,
	<dwmw@amazon.co.uk>, <kristina.martsenko@arm.com>, <liaochang1@huawei.com>,
	<ptosi@google.com>, <thiago.bauermann@linaro.org>, <kevin.brodsky@arm.com>,
	<Dave.Martin@arm.com>, <joey.gouly@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <xen-devel@lists.xenproject.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v6 5/8] arm64: entry: Use preempt_count() and need_resched() helper
Date: Thu, 13 Feb 2025 21:00:04 +0800
Message-ID: <20250213130007.1418890-6-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250213130007.1418890-1-ruanjinjie@huawei.com>
References: <20250213130007.1418890-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemg200008.china.huawei.com (7.202.181.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_130153_705920_93D7FE3E 
X-CRM114-Status: GOOD (  13.55  )
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

The generic entry code uses preempt_count() and need_resched() helpers to
check if it should do preempt_schedule_irq(). Currently, arm64 use its own
check logic, that is "READ_ONCE(current_thread_info()->preempt_count == 0",
which is equivalent to "preempt_count() == 0 && need_resched()".

In preparation for moving arm64 over to the generic entry code, use
these helpers to replace arm64's own code and move it ahead.

No functional changes.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v6:
- Update the commit message.
- Move this ahead before we change the preemption logic to
  preempt non-IRQ exceptions.
---
 arch/arm64/kernel/entry-common.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index 94e4132213ce..dceef4cb140b 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -294,14 +294,6 @@ static inline bool arm64_preempt_schedule_irq(void)
 	if (!need_irq_preemption())
 		return false;
 
-	/*
-	 * Note: thread_info::preempt_count includes both thread_info::count
-	 * and thread_info::need_resched, and is not equivalent to
-	 * preempt_count().
-	 */
-	if (READ_ONCE(current_thread_info()->preempt_count) != 0)
-		return false;
-
 	/*
 	 * DAIF.DA are cleared at the start of IRQ/FIQ handling, and when GIC
 	 * priority masking is used the GIC irqchip driver will clear DAIF.IF
@@ -593,8 +585,10 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
 
-	if (arm64_preempt_schedule_irq())
-		preempt_schedule_irq();
+	if (!preempt_count() && need_resched()) {
+		if (arm64_preempt_schedule_irq())
+			preempt_schedule_irq();
+	}
 
 	exit_to_kernel_mode(regs, state);
 }
-- 
2.34.1


