Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF368C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hl1CLW9EawYLsWL2sQ6i6jSacYbM+KweN1L2uRVVyBU=; b=0UX4vkw9+vLzQ8razpALytt0Sz
	cUrYUGkCkviZ5xIAvmMtYyy3Ot0hgE4aCFrPMZ4UZ4KrsP9Q+1I5Y67IhqH77LaMnFl8UbNzUgpSl
	2bbseInKOlepI5nsNLR8HBKDmtbEIB2/lmITTG9MYAXlLU97Z3beA10+0OagoKH9FPa5x9AoK7W7B
	uvH4K3wSKZZl82WF4gCEyWPL75tuRQP3Vm25kjLuasQVI39Mr929JvY1AFn0h6W4ATk6b60sf6WJ0
	vK2fpcVR2+iHi4hac66M5R4ce6fUASEOMlUNO3edwEL5P7BYihgS0OvlbTVCAz6I1PizePRvq/EpU
	gS73GgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rcK-000000048Ra-43bj;
	Tue, 22 Sep 2026 03:56:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rc4-000000048Gw-1G6Z
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 03:56:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hl1CLW9EawYLsWL2sQ6i6jSacYbM+KweN1L2uRVVyBU=; b=G0zOuc+ILr7YT/+DJc2afaRwxj
	qCa6ePFwgmAgkHMzxsNV5QK/mPVaPpcK7PPQxak+Ct7vVk/Tlsk9nPxQ0gqSFgxZDcnR9Xpw5+eHo
	hCKLOssBkr93GxpNpASGjMgkQMQ0bcb/IwaYlTCOuTwIEL2qO5LjpgoG24IT+dcAn2sl2WPPQlvC1
	b9nnOuv6TVVK0TIFXMb7xtq4/1aN+EECHmVem4VSPGhPO6iQ6vCO5wkKtmVgbnfGznyoxHmwZdxvP
	NBVMU//0L/QwBW08q/gzke2xItg/zS6rBBnw0k4ZqJpwu7wEHp9v+hjPlWR3LisVZvlf+78xR/IzB
	vwoOYFhg==;
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8rbK-0000000D4by-0mlD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:56:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=hl1CLW9EawYLsWL2sQ6i6jSacYbM+KweN1L2uRVVyBU=;
	b=NYSnIatRnFwGK4SryCn9gfK2i73M8HdwpyiFezEjektd192Ba9f/f9zq57k6kSbsSfrDmKMH6
	SLo8mNui356sjH0GKtXJdVcfRuVZIXOiSasYB/h6LtIlLpHZ40kDnKgMN4mO+d/vbeJMNRUdVFB
	VuZLc1JaaIESyQ26CTMKFso=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4hpmDH55mQz12LHn;
	Tue, 22 Sep 2026 11:43:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8D73F4056E;
	Tue, 22 Sep 2026 11:55:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:55:03 +0800
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
Subject: [PATCH v19 06/14] arm64: syscall: Rework the syscall exit path in el0_svc_common()
Date: Tue, 22 Sep 2026 11:55:02 +0800
Message-ID: <20260922035510.1090299-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260922035510.1090299-1-ruanjinjie@huawei.com>
References: <20260922035510.1090299-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_045550_984032_037E11DB 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: Linus Walleij <linusw@kernel.org>
Cc: Can Peng <pengcan@kylinos.cn>
Cc: Li Qiang <liqiang01@kylinos.cn>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
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


