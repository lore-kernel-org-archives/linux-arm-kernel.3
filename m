Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FCFCD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2DB9iKATiyvYk4hxQYhscWmchCYGPN8xroMo1JG8fAw=; b=n3req3S2vBDFmof6Af/wKGZM+H
	Q6+BnZ+wX1P5dGvEwASb2338kajSXh2WIKFebAg532KyXZBGNqcbH4agoRqO6SBhYUH2wexh3ZZ8d
	EMo/QCp3VtiA4zzstWotRFmE/RDnkWa2KsIitDgUoYOPCxFs7TX8rSXj+8HHOF3HdG+k9UJIUlKVQ
	qSF0JtZgyqaC4zPG868ihEU2a4fKOohEvnqsDpt7Nkvm8PTGZEN4JLHFZCzX0w1aM3lam/7gEd/OL
	72Ph31SDnJc2ncL71LpyKFGgAgnOhyBvloLRKxUMjSl9B34XAJOs6AWmpXMT/z245IlMk2iv2YapN
	/71uHnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfM5-00000009Vmi-1KE3;
	Thu, 11 Jun 2026 13:21:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfM4-00000009VmX-0Ggz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:21:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B44643A12;
	Thu, 11 Jun 2026 13:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7574F1F00893;
	Thu, 11 Jun 2026 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781184115;
	bh=2DB9iKATiyvYk4hxQYhscWmchCYGPN8xroMo1JG8fAw=;
	h=From:To:Cc:Subject:Date;
	b=X0jF4PlgxCc+tMNzB12Xb63SkD5MVtyucDU2/m4jQfotlfaqtiQci1UfdDw8Ekwki
	 cxHHFu16ELRYkHb/EbrzMLnklfUXdBmL1DoJgAqxRe5FtiA9qGW5VxPFe91QIDKbU6
	 1ICCC5HZu0cUWgnr5GI6BJVPs+PafdSdcoPiWSA8f/Vgz5kR9tW8NNCUjgHXppfW8u
	 k/icw5dw289Q6p5UXmqlwYmi3ht2VhzLQJb+49aRjEJ7xxZWT8KZel49R+Djlsufwg
	 qvLr1ngO4TKkpIRXRNlI2pqT0b1G4ANYntNPU3IFDsJX2Jng3pGV+VmnmaNJRqBuYo
	 /cTwXhIr1X2Xw==
From: Arnd Bergmann <arnd@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: static_call: include asm/insns.h
Date: Thu, 11 Jun 2026 15:21:44 +0200
Message-Id: <20260611132149.40873-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I came a cross a missing declaration in a randconfig build:

arch/arm64/kernel/static_call.c:16:5: error: call to undeclared function 'aarch64_insn_adrp_get_offset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   16 |                   aarch64_insn_adrp_get_offset(le32_to_cpup(tramp + 4)) +
      |                   ^

Include the header that contains this definition explicitly,
rather than relying on it to come indirectly through another
header.

Fixes: 54ac9ff8f119 ("arm64: Use static call trampolines when kCFI is enabled")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/kernel/static_call.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/static_call.c b/arch/arm64/kernel/static_call.c
index 8b3a19e10871..c126edced022 100644
--- a/arch/arm64/kernel/static_call.c
+++ b/arch/arm64/kernel/static_call.c
@@ -2,6 +2,7 @@
 #include <linux/static_call.h>
 #include <linux/memory.h>
 #include <asm/text-patching.h>
+#include <asm/insn.h>
 
 void arch_static_call_transform(void *site, void *tramp, void *func, bool tail)
 {
-- 
2.39.5


