Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AABC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovxHcPr2c6qanD+Vv3eKyELWdpdHqRNDhl0m5BC+0cE=; b=mWcruUCz+WF0V2kXN6QZdpDxQ7
	OaoLGhDnJ/Gsq1ab9C/6nkUJRbU7LMkH8EpaWy05a6nLSZ037e61Lf6XDFgjo5bImBjhDxb2rGWo5
	Rm+eSNVa//CRRrhB5Lno/P6L7zxWXXXWwsltJSLpCQowAz4nP7yxRsKN9Z9zrZTCBiK3yyyjtoH6w
	fzr/WvMuuP4191oOhYFmT6eNjdAXUXjWrHoCP2ZjlqiB87pTdYpX4sddjYcpt4B0ne+bgGaA1cLmw
	WG1x6/OzSKYeSKwCRPPsrWt8APRAZ6rVpAZdknOY/aHjav6IMVD9grglDnqEL+sx/VqjIwEm3GMAT
	LplplDww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hgV-0000000EHCE-1GHm;
	Wed, 02 Sep 2026 09:55:11 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hgQ-0000000EH5r-0fDE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 09:55:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ovxHcPr2c6qanD+Vv3eKyELWdpdHqRNDhl0m5BC+0cE=;
	b=gQ5LofUWtwwzCJDR9K4hm1xONWWwK4FEs2aisKnph0rkzaUkvrrZzfS9+qXv3WTbEkH0zd/aJ
	kKlB5R+nWOabsSrRuJCOYxkPUnAV0JSZ7Ep4M/EimPS9bDvcl25PZZiuQjo1YO23nhc6e0lQuW0
	GbOwrljIhC9Anqr7mQZIUQQ=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4hZd9731vkz1prm2;
	Wed,  2 Sep 2026 17:44:11 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D3644057D;
	Wed,  2 Sep 2026 17:55:03 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 2 Sep
 2026 17:55:01 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<oleg@redhat.com>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <peterz@infradead.org>, <ada.coupriediaz@arm.com>,
	<linusw@kernel.org>, <kevin.brodsky@arm.com>, <yeoreum.yun@arm.com>,
	<thuth@redhat.com>, <james.morse@arm.com>, <vladimir.murzin@arm.com>,
	<broonie@kernel.org>, <pengcan@kylinos.cn>, <liqiang01@kylinos.cn>,
	<ryan.roberts@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v18 06/14] arm64: syscall: Rework the syscall exit path in el0_svc_common()
Date: Wed, 2 Sep 2026 17:55:29 +0800
Message-ID: <20260902095537.602517-7-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260902095537.602517-1-ruanjinjie@huawei.com>
References: <20260902095537.602517-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_025506_367670_DFCD51FB 
X-CRM114-Status: GOOD (  10.66  )
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


