Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47CFCD37B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 09:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjBehfNor6u2s7YFH6hquSqXuXzybcRErtfl/WoMw+I=; b=p1bC8+cREVG/9nny9AMpOlDKsl
	LHXv/yZ3jg36mcv4NKFxmXt//JKeqV7dxwzhR1W9zrFmeqUfd6mdoT6OcPAMSpOyUif/DJgeyikaK
	PsStlJJnx5oahsBSN1o0UsHmMdFKxTDoetNGHT/w/iIy7g4RgoIrs7kzQo8gplkxxIArzEqI4vF/O
	JRBRytAk4tQ7j0hsbHB6Zb6y2qeX4755RKt8kiok4UZDbNVh9g/kJFxFMo2yh3y5g77IRRQKeckRF
	t2PVdXq7SUgwayCxoRHfGBvje0S6gpUlvnL8IwyOSma1MpsB0zbeDjobsCHsEd+eCeAXXrrvbYsCn
	/u8CVy6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMpx-0000000CswW-39Jo;
	Mon, 11 May 2026 09:22:05 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMpq-0000000CstF-0oh4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 09:22:04 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=xjBehfNor6u2s7YFH6hquSqXuXzybcRErtfl/WoMw+I=;
	b=AyPE2M62vLQo6cfUp8QhEeQPIPp5alpjMGXaOPKiS2E5fYl3GfOFb0MFjnCpmoGJzQ0jrA2Yv
	ciNmugvE/zxkeZp4+9ZbjVTRNcLlz0kFd0N1YNNO3VX5JTQdoSOMRW2t27tzBwbVCfH2JBN/OjI
	QjLzYBR8zI/PDmZ08gFYHBg=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gDYvB2lfMzKm8x;
	Mon, 11 May 2026 17:14:14 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A31CD4056C;
	Mon, 11 May 2026 17:21:52 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 11 May
 2026 17:21:51 +0800
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
Subject: [PATCH v15 01/11] entry: Fix potential syscall truncation in syscall_trace_enter()
Date: Mon, 11 May 2026 17:20:53 +0800
Message-ID: <20260511092103.1974980-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511092103.1974980-1-ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_022158_728477_89AA4A4D 
X-CRM114-Status: GOOD (  12.96  )
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

In syscall_trace_enter(), the current logic returns "ret ? : syscall".
While __secure_computing() currently only returns 0 (allow) or -1 (kill),
this "ret ? : syscall" pattern is conceptually flawed.

If __secure_computing() were to return a non-zero value that isn't -1, it
would unintentionally override the actual system call number. This logic
is redundant because if seccomp denies the syscall, the execution path
should already be handled by the caller based on the error return, rather
than conflating the return code with the syscall number.

Fix it by explicitly returning the syscall number. This ensures
the syscall register remains untainted by the trace return values and
aligns with the expectation that seccomp-related interceptions are
handled via the -1 return status.

Cc: Thomas Gleixner <tglx@kernel.org>
Fixes: 142781e108b1 ("entry: Provide generic syscall entry functionality")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/entry-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 416a3352261f..462a51fc044d 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -113,7 +113,7 @@ static __always_inline long syscall_trace_enter(struct pt_regs *regs, unsigned l
 
 	syscall_enter_audit(regs, syscall);
 
-	return ret ? : syscall;
+	return syscall;
 }
 
 /**
-- 
2.34.1


