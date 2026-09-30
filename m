Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4F6CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZSpbO9IcTEwUC97Fm4qSyjltlS7ssuPpR01THv8ukQ=; b=gm+ps/go3VZ2DV3bx3zHRQF5JP
	b5KBqMjfGGGiCbgUD3xROZUxKa3FhyBud2WF2iH+oH6nWNt9y4EIHANXGMI4NuKn2rkC/m6E/pzGU
	5hDalmK/HjdozavbAeNJ3p3IRv+Nv9dzXIz8E2JjEFROch9TUPkT1Mhg3Cw37FK3AtsqZ1uwJfo3k
	0RvbvbUkoEfjg8+AwjK4of9HMccrK53e57BlZtwKJ/2suZOV2aLJSGyUKCZGtDM1yj8Agtgq3P9gI
	VUG/1HJqkDlLnbOG0IZ63G226gSGHx8OgQ2GAnfi8yXRdDZDvVJlJXaHMZWdx+oUC0Wx6hx5kp5kY
	oImI4HlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrNN-00000005iRz-0tsn;
	Wed, 30 Sep 2026 10:17:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrN9-00000005iLk-0WG5
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 10:17:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sZSpbO9IcTEwUC97Fm4qSyjltlS7ssuPpR01THv8ukQ=; b=D3CAUqUsHJ6IXWjVX1LeeXG+96
	cGBFxnmLhkE5bXr6woGwyRN9F+Hole1zfWfFOU94VcqSuNS3lLiWbjAAex534Qq6mx02kTpSvqv4O
	0da655fRmjmSH/PSfbD/zTxzTInZLSVKH4dM3q866rVgTjsT9GjLq7r2qSdq+DWLoe3hyw0OYyybR
	Lwexg+f9nxy/INR5CLTNX+i/PIrOIhWvHkuhLxORiO5/vnflAaggaRRP9aZWOJY3MHOAvCDkzpK96
	c6ok2ku50Kvj941TEXs24cg28uhWNWDjQWobZXremh4MQ3SWvzXqK9oG037VgEXt5q1uVUf0K2wPm
	p2OhmPIg==;
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrN2-00000003dT1-3p0f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:17:09 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sZSpbO9IcTEwUC97Fm4qSyjltlS7ssuPpR01THv8ukQ=;
	b=fDoZGbnV45YDNiTR6zCUOF2t6mzSJS0uWp1qBlqF+4Soik/WqcPB32qWWOHSPtfzJgCfAHXiR
	gQTXDcp1mG8RS95tchNiModcsQvJqxCjPWRd9z4wnkkQNmE8Zl+qXWHWW2BgZfoAhYdmihEdGed
	vGZ5JBVBiYB3iDbIAW+Jcrk=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hvrJC2pclz12LHk;
	Wed, 30 Sep 2026 18:04:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 7EA2640538;
	Wed, 30 Sep 2026 18:17:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 18:17:00 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <shuah@kernel.org>, <kees@kernel.org>,
	<luto@amacapital.net>, <wad@chromium.org>, <peterz@infradead.org>,
	<ada.coupriediaz@arm.com>, <linusw@kernel.org>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <james.morse@arm.com>, <thuth@redhat.com>,
	<tglx@kernel.org>, <vladimir.murzin@arm.com>, <broonie@kernel.org>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v20 08/15] arm64: ptrace: Extract arm64_syscall_exit_to_user_mode_work() helper
Date: Wed, 30 Sep 2026 18:17:58 +0800
Message-ID: <20260930101805.1770358-9-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930101805.1770358-1-ruanjinjie@huawei.com>
References: <20260930101805.1770358-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_111706_258546_E9C0CC7E 
X-CRM114-Status: GOOD (  13.57  )
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

Introduce a helper arm64_syscall_exit_to_user_mode_work() that
encapsulates the re-reading of thread flags and the call to
syscall_trace_exit(). Use it in el0_svc_common() to replace
the open-coded instances, removing the duplicated flags read
and making the control flow simpler.

This aligns the arm64 exit path with the pattern expected by the
generic entry infrastructure, which uses a similar
syscall_exit_to_user_mode_work() callback.

No functional changes intended; this is a preparation step for converting
arm64 to the generic entry infrastructure.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/syscall.h | 7 +++++++
 arch/arm64/kernel/syscall.c      | 9 +++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/syscall.h b/arch/arm64/include/asm/syscall.h
index 696739f5a250..3e4672ab4a4f 100644
--- a/arch/arm64/include/asm/syscall.h
+++ b/arch/arm64/include/asm/syscall.h
@@ -123,4 +123,11 @@ static inline int syscall_get_arch(struct task_struct *task)
 int arm64_syscall_trace_enter(struct pt_regs *regs, unsigned long flags);
 void syscall_trace_exit(struct pt_regs *regs, unsigned long flags);
 
+static __always_inline void arm64_syscall_exit_to_user_mode_work(struct pt_regs *regs)
+{
+	unsigned long flags = read_thread_flags();
+
+	syscall_trace_exit(regs, flags);
+}
+
 #endif	/* __ASM_SYSCALL_H */
diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index e778aac6fab9..0061fc63e7ba 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -127,16 +127,13 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP) {
-			flags = read_thread_flags();
-			syscall_trace_exit(regs, flags);
-		}
+		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+			arm64_syscall_exit_to_user_mode_work(regs);
 		return;
 	}
 
 trace_exit:
-	flags = read_thread_flags();
-	syscall_trace_exit(regs, flags);
+	arm64_syscall_exit_to_user_mode_work(regs);
 }
 
 void do_el0_svc(struct pt_regs *regs)
-- 
2.34.1


