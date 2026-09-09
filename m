Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39ED3C79FB8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2Fb4eCjj+zAUQPiYalGdgIWLIgi0C9tMG4Wk6//rL0=; b=3MaQcTwZ8CHx3EV+c11+r9xqoa
	RUpMQ1thsAcRJSaXNRa86x816DjkV7C3P4Q6XN8DOYJ1JgSRV95r2DOQtE8aTsw8cLlCBrHjUSZys
	/gbqDwSqhsMrnCMeoCMfeJGMy1jgjomzkIC3lRFCI4ygSGeFVoYWh9+W6qN8aOmKIMYkhct+f9PBh
	dPawh9f/YOcdSmWoSdWiKVp4Ngle/3ezSBuunZwEYwk46e+ry4kjjuabEkXYpno84A1OFskcNggEa
	zqJthMAm/vzEmJ3tvYQo3hjAMHDd/6tInqF68t/dSTcVtfuBe+NHleFA7visETjnMlL9Y74CQO7Ci
	rOxh0b3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1y-0000000BASW-1xOY;
	Wed, 09 Sep 2026 08:51:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1h-0000000BACN-0kdq;
	Wed, 09 Sep 2026 08:51:30 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2Fb4eCjj+zAUQPiYalGdgIWLIgi0C9tMG4Wk6//rL0=;
	b=eqP8ughIWhO/zWHJqIcpnE1zH5Z6Uff68ylB3fNburq8lG10nepXJX4mazfWoFN07g/dX7
	5wWpfbwXq9syptiaqVr3s9+qB4IaIQrVCTAykoJ3QyyS89SBjIELA0HirxAHeEao/1LMrn
	mYJ99pvmZ+Cf8lKwtDGgAIK2wgT6AyFSHcC68XUyJBj3+gzEtXFKKntUgyQqG8N1vRRiPb
	DHx18kQ5moP+Qf8QI/7uM00WxhtbVuhIFqEZJMDAJy9seLj+k7Uvfcn2IZ5FrBhRjdrWpp
	6RfkROg5QYm6c7U22E17G5cR6V1fJGvzVdEn0cSjxT4h2w+oBW9Z6HQZd5kfkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2Fb4eCjj+zAUQPiYalGdgIWLIgi0C9tMG4Wk6//rL0=;
	b=jVX4AN8Oo8E9jDY7LdgbDqTks4Y9ztR5jIkatGeWIeYHKeeAd8NyDi0CnbjzwTRgsKH/kz
	dZEpI1oJQvAAeWCQ==
Date: Wed, 09 Sep 2026 10:51:19 +0200
Subject: [PATCH 06/15] x86/vdso: Move vDSO page definitions to asm/vdso.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-6-63ae856cc659@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1480;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=9yrup1COiXMcfGgNW5FQUG/LXYB+NuTSGZ1TprnDeUQ=;
 b=8lsoI5rYTpgQdz12XqHek0bQOa8lDAtlAIBJKnJGQxBA5RZp/X59vjJa3XzdUUOBGktVHG8Xt
 hROTC4EoOEOABpAp1sl+WEhhmKISJWSG/lG/6la5vX3KZWy9RTginJR
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015129_369171_C55331F9 
X-CRM114-Status: UNSURE (   6.58  )
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

Most architectures define the vDSO page macros in asm/vdso.h.

Align the x86 headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/include/asm/vdso.h          | 7 +++++++
 arch/x86/include/asm/vdso/vsyscall.h | 7 -------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/include/asm/vdso.h b/arch/x86/include/asm/vdso.h
index 4e735158c1b2..071e4a262b50 100644
--- a/arch/x86/include/asm/vdso.h
+++ b/arch/x86/include/asm/vdso.h
@@ -6,6 +6,13 @@
 #include <linux/linkage.h>
 #include <linux/init.h>
 
+#define __VDSO_PAGES	6
+
+#define VDSO_NR_VCLOCK_PAGES	2
+#define VDSO_VCLOCK_PAGES_START(_b)	((_b) + (__VDSO_PAGES - VDSO_NR_VCLOCK_PAGES) * PAGE_SIZE)
+#define VDSO_PAGE_PVCLOCK_OFFSET	0
+#define VDSO_PAGE_HVCLOCK_OFFSET	1
+
 #ifndef __ASSEMBLER__
 
 #include <linux/mm_types.h>
diff --git a/arch/x86/include/asm/vdso/vsyscall.h b/arch/x86/include/asm/vdso/vsyscall.h
index 57598db8763b..65d10f4cc718 100644
--- a/arch/x86/include/asm/vdso/vsyscall.h
+++ b/arch/x86/include/asm/vdso/vsyscall.h
@@ -2,13 +2,6 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
 
-#define __VDSO_PAGES	6
-
-#define VDSO_NR_VCLOCK_PAGES	2
-#define VDSO_VCLOCK_PAGES_START(_b)	((_b) + (__VDSO_PAGES - VDSO_NR_VCLOCK_PAGES) * PAGE_SIZE)
-#define VDSO_PAGE_PVCLOCK_OFFSET	0
-#define VDSO_PAGE_HVCLOCK_OFFSET	1
-
 #ifndef __ASSEMBLER__
 
 #include <vdso/datapage.h>

-- 
2.55.0


