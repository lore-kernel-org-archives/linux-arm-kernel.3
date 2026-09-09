Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F28C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pu21AANy6bk1mlm0NmAgLdaZdlkGyn68YRFNRQ9INwY=; b=tJAdPQp9KlYVawTdderynCJe/W
	YzDgoerLRNFciBFALtZRT+1EMPnGweYZK4f+gDW7wmGuXVeEswApVsCvNAvjAugzWPAnKjxJ5EMm9
	5iCbmEBRUVRoHXYxy2YQP9dLk/tCfMJXZqroQizbDzRwtHzZyKUOjx0qQHdYxpeJmzP84GUT1j8wi
	TekN9uylA9lHQKSdzXIHkPgLMLJmH7sPuAFHiu4+iIBqqLbbBzYI60Rcfz/OAA2gwFI2XrUlGaz2n
	QVOWyPBoPOSGD1oeq+CTxNXu/fiuw04kaebe41EqBmxBWl1K6ez2jEeEGLIouZNfLI9XmwuecdeZ6
	PPQXs3pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1z-0000000BAU8-1Nfc;
	Wed, 09 Sep 2026 08:51:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1j-0000000BAEj-2pi0;
	Wed, 09 Sep 2026 08:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Pu21AANy6bk1mlm0NmAgLdaZdlkGyn68YRFNRQ9INwY=; b=OVlZAnIw+/baqnydri1w0mI2Z0
	7mYNtwDg4iysmN3Yt9Oa3yp71481WiJ+7FaPlcpDyZZCVMohJde4XG32qF6r8o0tA+cYTtflzUuvq
	aOn6ReLJxZlrk4c2esu+NCXT0AzKtvPKE2OykakokeGhl330RD14D/375X8ftRtmRA/Cs9PzLVbfQ
	D1K3vD2fQQwNpTF5oWCagJzLbp/x1mwCRvwWIoFuezMqqChkzuayEpKlUaGpOf48YBYWyeS55s4Zp
	rvAVJzabL1truQ4YoxK6MNlRxngZUhX6E1LUMYETa0M3dWmbScqjNjGec46cOKFRkpPtu8484Kk5P
	D1Xeezfg==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E1g-00000000wHX-3Qef;
	Wed, 09 Sep 2026 08:51:30 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pu21AANy6bk1mlm0NmAgLdaZdlkGyn68YRFNRQ9INwY=;
	b=fY43G6LBWdQkHYdyVBIxlLabTz9sY1wdEwbix3guUJj3EMTAlgttvjyicJzcS1byA/EYdy
	G2GOcuMDfq5geeNDnOjPbvRb7EzsEL1Clk/H8WaN0sddjYKMQS4eG0BqCIjRr0OlvTLJSN
	RN90tB/5INV6w2dlX8afOXI3xFKQezguucJCgLOZTNwjr6RY6fTr4CjhnpG2JJQfq8bTxY
	xQ1o1MTBSTdqjdBasvcUb1G+ogTvTjmpXkvfnYDAWwEY82x7oyBpb3faiydAcgcQB9K5Yj
	qx0k7QtEbJReCwJRQceG/UD512/jPmjWdRPduWsrE9i7v+i6KjtZJ5SCxfdJxQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pu21AANy6bk1mlm0NmAgLdaZdlkGyn68YRFNRQ9INwY=;
	b=fS/qMfZfymFeZyXXZSlfW6pLXpcG8P6cUd3bXFewTMfnuYEoBNdNlxmu56kaFJOQgmnkTU
	azAqtLuPsNDaytDw==
Date: Wed, 09 Sep 2026 10:51:21 +0200
Subject: [PATCH 08/15] s390/vdso: Delete asm/vdso/vsyscall.h inclusions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-8-63ae856cc659@linutronix.de>
References: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
In-Reply-To: <20260909-vdso-asm-generic-vsyscall-h-v1-0-63ae856cc659@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1455;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XEkGmHaO9UQ15JGGo9EFCqoDzN0VZwQacIVpi6I6eho=;
 b=tWx5LzZMM3tFuh6dvop7MXiyaao+GWjDBE8xefvCVu+hYibUJLQsMpisPmgpEGcWAc/Wv8tBg
 BkTPk+qz6khArKF3lgV/FIsobdzvGD8+AIMA3xOqRUfKNBft+tKTA1x
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095129_065315_0E3CF54F 
X-CRM114-Status: UNSURE (   6.72  )
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

The inclusions are unnecessary, remove them.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/s390/include/asm/vdso/getrandom.h | 1 -
 arch/s390/kernel/vdso.c                | 1 -
 arch/s390/kernel/vdso/vdso.lds.S       | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/s390/include/asm/vdso/getrandom.h b/arch/s390/include/asm/vdso/getrandom.h
index 6741a27199f8..ff5882f2fc70 100644
--- a/arch/s390/include/asm/vdso/getrandom.h
+++ b/arch/s390/include/asm/vdso/getrandom.h
@@ -6,7 +6,6 @@
 #ifndef __ASSEMBLER__
 
 #include <vdso/datapage.h>
-#include <asm/vdso/vsyscall.h>
 #include <asm/syscall.h>
 #include <asm/unistd.h>
 #include <asm/page.h>
diff --git a/arch/s390/kernel/vdso.c b/arch/s390/kernel/vdso.c
index 0fe616c49fcc..a905f989f910 100644
--- a/arch/s390/kernel/vdso.c
+++ b/arch/s390/kernel/vdso.c
@@ -18,7 +18,6 @@
 #include <linux/random.h>
 #include <linux/vdso_datastore.h>
 #include <vdso/datapage.h>
-#include <asm/vdso/vsyscall.h>
 #include <asm/alternative.h>
 #include <asm/vdso.h>
 
diff --git a/arch/s390/kernel/vdso/vdso.lds.S b/arch/s390/kernel/vdso/vdso.lds.S
index 841daeec4be2..6bcdb64315f2 100644
--- a/arch/s390/kernel/vdso/vdso.lds.S
+++ b/arch/s390/kernel/vdso/vdso.lds.S
@@ -4,7 +4,6 @@
  * library
  */
 
-#include <asm/vdso/vsyscall.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
 #include <asm-generic/vmlinux.lds.h>

-- 
2.55.0


