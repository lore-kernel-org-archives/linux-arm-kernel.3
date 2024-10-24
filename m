Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44AB2D0BB5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 03:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nHXuG3aFa+d6TCtrZwLzTxjmFpwYU9VWIzOsovd1Ltk=; b=B64JfYHuONOc46kgJBMEkG8pi/
	GfALhKVhEr12ausgeFJUj0wrqAKbbvzT+kqQoiIC5+JiHYrI4sqi+SmiiYHFXg/hkjqHsektXZPlc
	jS42daFQYcNvT6ZCzmODc+GBftscwPzpTDRQzAiyb6pglnDHjZM+uv/Vfc3AQKPLREpPoa49gN0WI
	2FlXjWnJNSRmtwLEzhgrlftVOFOi44gxOBeISaCjSBtvZmcev0fZ3xO1TTlwvY0zMoAHLjTegwVcz
	DB6C+gN4PmmBDHrdrBE5UuOHSi8RmIf5KnsmnMTe+gwI3R7B55H2YMk3fmdRIEN0riaPl1mIIxMPk
	ACI3ac+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ov1-0000000Gexc-3z6A;
	Thu, 24 Oct 2024 03:53:51 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3otU-0000000GekW-0xah
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 03:52:17 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4XYsQ833hyz1SDKg;
	Thu, 24 Oct 2024 11:50:40 +0800 (CST)
Received: from kwepemd200013.china.huawei.com (unknown [7.221.188.133])
	by mail.maildlp.com (Postfix) with ESMTPS id 189C41400CA;
	Thu, 24 Oct 2024 11:52:05 +0800 (CST)
Received: from huawei.com (10.67.174.28) by kwepemd200013.china.huawei.com
 (7.221.188.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 24 Oct
 2024 11:52:04 +0800
From: Liao Chang <liaochang1@huawei.com>
To: <mark.rutland@arm.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<oliver.upton@linux.dev>, <kristina.martsenko@arm.com>, <ptosi@google.com>,
	<liaochang1@huawei.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: Return early when break handler is found on linked-list
Date: Thu, 24 Oct 2024 03:41:20 +0000
Message-ID: <20241024034120.3814224-1-liaochang1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.28]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200013.china.huawei.com (7.221.188.133)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_205216_451603_24D94F3A 
X-CRM114-Status: UNSURE (   9.84  )
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

The search for breakpoint handlers iterate through the entire
linked list. Given that all registered hook has a valid fn field, and no
registered hooks share the same mask and imm. This commit optimize the
efficiency slightly by returning early as a matching handler is found.

v2->v1:
Remove all WARN_ON(!hook->fn) in v1 as Will suggested.

Signed-off-by: Liao Chang <liaochang1@huawei.com>
---
 arch/arm64/kernel/debug-monitors.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index c60a4a90c6a5..58f047de3e1c 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -303,7 +303,6 @@ static int call_break_hook(struct pt_regs *regs, unsigned long esr)
 {
 	struct break_hook *hook;
 	struct list_head *list;
-	int (*fn)(struct pt_regs *regs, unsigned long esr) = NULL;
 
 	list = user_mode(regs) ? &user_break_hook : &kernel_break_hook;
 
@@ -313,10 +312,10 @@ static int call_break_hook(struct pt_regs *regs, unsigned long esr)
 	 */
 	list_for_each_entry_rcu(hook, list, node) {
 		if ((esr_brk_comment(esr) & ~hook->mask) == hook->imm)
-			fn = hook->fn;
+			return hook->fn(regs, esr);
 	}
 
-	return fn ? fn(regs, esr) : DBG_HOOK_ERROR;
+	return DBG_HOOK_ERROR;
 }
 NOKPROBE_SYMBOL(call_break_hook);
 
-- 
2.34.1


