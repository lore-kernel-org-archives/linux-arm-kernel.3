Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E861DC44533
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnYDyjFiAR1AxVoELjeLgtZ0vAqYI3txzE4z19P1pME=; b=RrgbRIW1HNC5r6BVpgvWvBbASq
	aj8pOnPtA5vVYcLGm/LppdPAbIak+P2CrH2/QdNkbrXoEoTXai+fZy6P1b1suK4jC9H3zJ3feXwHR
	0Y5HhPzuJqvaPpEU/U0mPxe0Yqixz5SXICSaKwSJK1pXeHqxrLhP2miOvmlnelSVmGJgc/oh4Y/4A
	Cn85ISPtZpaZeTvkd1MmORLIM00fzn7WnJT2DvdESbteLkHhjzOrpOEvg7LoTDZU6l0KujIKu+HYk
	u8YrBZdolmomCsflh0fkBfwSD2vqmM7DjDIuEj8oGLdoQfitdFA8Y6fQn4teMhftfPqdZBlpL+IEH
	/aWEpelQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5hD-00000008mf9-0YrA;
	Tue, 21 Jul 2026 08:19:23 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm5gz-00000008mUo-2lrY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:19:13 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FnYDyjFiAR1AxVoELjeLgtZ0vAqYI3txzE4z19P1pME=;
	b=41yXRk9x+uMNmX2XAzIa3ZCE1wFWbSR2SARzWYCMks1pllTC5OyA36c05tMWmct10lGVxiIPT
	BGqq/iw6X2JA5sAW4MfYtJXZ01jQsMm9unaFK5sJhiQtUx8487Y2fRt16FZTlGMDSRkrGuSzJFO
	4Xz2DLVpi6473wTEt3aIIw8=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4h49601qJ5z1K9D2;
	Tue, 21 Jul 2026 16:09:44 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 1024040572;
	Tue, 21 Jul 2026 16:19:05 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 21 Jul
 2026 16:19:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <kees@kernel.org>,
	<oleg@redhat.com>, <luto@amacapital.net>, <wad@chromium.org>,
	<thuth@redhat.com>, <peterz@infradead.org>, <mark.rutland@arm.com>,
	<linusw@kernel.org>, <ada.coupriediaz@arm.com>, <kevin.brodsky@arm.com>,
	<yeoreum.yun@arm.com>, <anshuman.khandual@arm.com>, <james.morse@arm.com>,
	<tglx@kernel.org>, <broonie@kernel.org>, <pengcan@kylinos.cn>,
	<ryan.roberts@arm.com>, <liqiang01@kylinos.cn>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v17 06/15] arm64: syscall: Rework the syscall exit path in el0_svc_common()
Date: Tue, 21 Jul 2026 16:18:49 +0800
Message-ID: <20260721081858.1169276-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260721081858.1169276-1-ruanjinjie@huawei.com>
References: <20260721081858.1169276-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_011909_852695_A38E512B 
X-CRM114-Status: GOOD (  10.09  )
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

In preparation for moving arm64 over to the generic entry,
invert the nested conditional flags check within el0_svc_common().

No functional changes.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/syscall.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/syscall.c b/arch/arm64/kernel/syscall.c
index 3e78e159b2a1..b8d7d29a431b 100644
--- a/arch/arm64/kernel/syscall.c
+++ b/arch/arm64/kernel/syscall.c
@@ -127,8 +127,9 @@ static void el0_svc_common(struct pt_regs *regs, int scno, int sc_nr,
 	 */
 	if (!has_syscall_work(flags) && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
 		flags = read_thread_flags();
-		if (!has_syscall_work(flags) && !(flags & _TIF_SINGLESTEP))
-			return;
+		if (has_syscall_work(flags) || flags & _TIF_SINGLESTEP)
+			syscall_trace_exit(regs);
+		return;
 	}
 
 trace_exit:
-- 
2.34.1


