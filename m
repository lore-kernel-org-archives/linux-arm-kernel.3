Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E1DCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRSVLKptSRRw/sy8rzso6dMlmKWzw0RGSpQw1DtZTyA=; b=j+vxM1TZEq5Bz4tmIX4SNeoYWy
	uQMXXEifxsko/T6CaX+RuFmb7rNE5tXShMlc0xmqyBCVeonLrMW/VSBG98+jiyq5HBcSi8QZ0frRQ
	qyJw0CfRgvQIt8OpzJ06uk6+NqdXI0A8c7RAPpDFnYgQ/F3KUNsSIFD83VIkhuiesz+R7Gb6QfIqy
	5Rtfw32A8kKIqddUYuTSweCrriP1E9EUDRnV0lelJB+j7sJd06KMVm7ZQqi3S+vZf7I8mnpdEgpea
	vAzBe7G8bVovE78vW6vyjMiE/73TeIJk6W/gfyYjOR2LatBn/oKXVxTT+iuh6pqV4Rt5p5BA7UmnE
	OZnK8ONQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR0t-00000007B9i-1F58;
	Tue, 16 Sep 2025 08:26:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR0i-00000007Az1-20TN
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 16 Sep 2025 08:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pRSVLKptSRRw/sy8rzso6dMlmKWzw0RGSpQw1DtZTyA=; b=F9r7miRIfyu+3auFW6O+8vDe3B
	zoqRD7yy/Ci4nGaiFasUMUtKVRgDZ2LmdA1pwO4ZAx0ekr2HuTd0cRwjMhvefpkpGDBHNttzlkzvl
	GUsEwviRnn6ckIz6PWBvGDmh8Ap1IKTrLxfrOEbbrH59r34V4WdkXYwxmpFZg9f32wybI88rY3TJI
	wC+wV9x6SOl5OXJUGSifW8rWCLDw4QThZwQYD57WArsSeJ9h/T4c/eV9FfkduHWTYPfOfwMzsxxh8
	4R5dmgA54o4gYa1Okaj/cA6cfxoM2qaerhiUM9MbqWobh8wb0QvNTbaXt3sQmLvNbzwiQO76c2jjr
	UZBhEOxQ==;
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR0f-00000007AL5-1ZJ1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 08:25:59 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4cQw2J1yF9z14MvJ;
	Tue, 16 Sep 2025 16:25:28 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 372FD1402E9;
	Tue, 16 Sep 2025 16:25:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 16 Sep
 2025 16:25:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <charlie@rivosinc.com>,
	<macro@orcam.me.uk>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<ldv@strace.io>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v6 09/10] entry: Add has_syscall_work() helper
Date: Tue, 16 Sep 2025 16:26:10 +0800
Message-ID: <20250916082611.2972008-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916082611.2972008-1-ruanjinjie@huawei.com>
References: <20250916082611.2972008-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_092557_907372_783D6183 
X-CRM114-Status: UNSURE (   9.36  )
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

Add has_syscall_work() helper to facilitate reuse
of this function in other places.

No functional changes.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/entry-common.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index cd6dacb2d8bf..e0f94e937e84 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -44,6 +44,11 @@
 				 SYSCALL_WORK_SYSCALL_EXIT_TRAP	|	\
 				 ARCH_SYSCALL_WORK_EXIT)
 
+static inline bool has_syscall_work(unsigned long work)
+{
+	return unlikely(work & SYSCALL_WORK_ENTER);
+}
+
 /**
  * syscall_enter_from_user_mode_prepare - Establish state and enable interrupts
  * @regs:	Pointer to currents pt_regs
@@ -91,7 +96,7 @@ static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *re
 {
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 
-	if (work & SYSCALL_WORK_ENTER)
+	if (has_syscall_work(work))
 		syscall = syscall_trace_enter(regs, syscall, work);
 
 	return syscall;
-- 
2.34.1


