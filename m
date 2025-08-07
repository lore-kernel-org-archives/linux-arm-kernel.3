Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42B8C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 07:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=omDSjtlhj+NatXJKYgK/7aupcVuvuy5UTbCC37aEerA=; b=tJwOc5ujOpj/YXINqk9+1rrt6K
	fMflC/4CutI+RLhI76tl/abFjqmXagN3j//41cvx7MpYo5BRkKTs7ykw7exyBBmyLRmFaLLyUmALl
	P4fX4YaOhBiyildFq/BddYyUpLVXOiqF5MrxSzZ8HbswsMQDTrv5ZB5jicQa4ailbR3yCjMR3kfGh
	gKFcKxyD6/61JoLocnab1QqHOZFuNRpLzdXBOGRznUPjh7UEB6bqHV/vvQ1G7VBYKkC9K10XdYSZ8
	wWiKlUYHmyQjNAgzl6FshD/aquzhnKUwxFNH3wPb+G1O48mwUgOgWMUBTrLqslMht2IaarZKYUDAY
	T85qg/SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuwb-0000000HRxA-3GN9;
	Thu, 07 Aug 2025 07:21:45 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujuu4-0000000HRd2-1g8j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 07:19:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4E290A558DE;
	Thu,  7 Aug 2025 07:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EDEC4CEED;
	Thu,  7 Aug 2025 07:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754551147;
	bh=5W3eN28C5zYIrodwX3zckGt4s9fOCjzucNG8qbTTNnY=;
	h=From:To:Cc:Subject:Date:From;
	b=Lln8OEvtE4EmZaUPkO/SuUQbXKikByck275Nph7310ezAasuJsthP4wwbCIXmWsSY
	 QORYwUisgs47VOjSy7ip510ENuaoknOU6q2van/WF2b/X6BpIA9fC9vSK3ggnqZ4R0
	 A4b50Y4vjMHPuxDiYxE3IKETWDD825uhU08viGVW9cKML7W1E34Blq15pl+jCqFV3d
	 v+wL9QCy97rl9BhLyYCv5SQYajCkIy/Y1hC7DpDEL6aGs5gGPzuUJ6GiMojMwTyi27
	 +AdmxD+rlNdNo04YsgojYRih/wcyeqgzJM2JEq0ocnjf+1UJRKBEOyuxyJm1xdDnEA
	 8NtbdlPW433dQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Li Huafei <lihuafei1@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Waleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: stacktrace: include asm/sections.h in asm/stacktrace.h
Date: Thu,  7 Aug 2025 09:18:58 +0200
Message-Id: <20250807071902.4077714-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_001908_503035_35C363F3 
X-CRM114-Status: GOOD (  11.94  )
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

From: Arnd Bergmann <arnd@arndb.de>

The recent kstack erase changes appear to have uncovered an existing
issue with a missing header inclusion:

In file included from drivers/misc/lkdtm/kstack_erase.c:12:
In file included from include/linux/kstack_erase.h:16:
arch/arm/include/asm/stacktrace.h:48:21: error: call to undeclared function 'in_entry_text'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   48 |                 frame->ex_frame = in_entry_text(frame->pc);
      |                                   ^

Include asm/sections.h here so the compiler can see the in_entry_text()
declaration.

Fixes: 752ec621ef5c ("ARM: 9234/1: stacktrace: Avoid duplicate saving of exception PC value")
Cc: Kees Cook <kees@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/include/asm/stacktrace.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/include/asm/stacktrace.h b/arch/arm/include/asm/stacktrace.h
index f80a85b091d6..ba2f771cca23 100644
--- a/arch/arm/include/asm/stacktrace.h
+++ b/arch/arm/include/asm/stacktrace.h
@@ -2,8 +2,9 @@
 #ifndef __ASM_STACKTRACE_H
 #define __ASM_STACKTRACE_H
 
-#include <asm/ptrace.h>
 #include <linux/llist.h>
+#include <asm/ptrace.h>
+#include <asm/sections.h>
 
 struct stackframe {
 	/*
-- 
2.39.5


