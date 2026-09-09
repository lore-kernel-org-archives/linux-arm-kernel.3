Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A586BC79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2FjQtlKuBRuzu4eO4IKv/TzmPoMG616xBuEpp/c8bc=; b=wmw/YU+uqD6cikvjg3cuQ2p1Nt
	U7cwZGc5vEXQhArVQh5mImU1M0x4bNdWhrlHBUhDxBnFm5u+rmjF886/ORhvU+XRqgkN0SgEggZuH
	rkSUSnEg7R7b8BpZMO7lzVbmc9wwJSWxhmVEa1095wV2jJ9LOxV9RyErxvlHOTec9BDHC72hmhGoi
	v/p9Hjkd71niFaUws81ZSXXhJDefbqbHB7gn5nBtpY3alEH/GMWaVGPd2v6yOeDdMOS/trJ0MUotL
	jfo2/rybG0aDr4ZklzTZPlfqg9Nx0UOtE0fl+Bqkvsu/6TTOfK+JElkEFBVv8DoQ/wmSownI7OpPb
	iREoAWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E24-0000000BAgM-3ppO;
	Wed, 09 Sep 2026 08:51:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E1k-0000000BAEc-1642;
	Wed, 09 Sep 2026 08:51:33 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788943889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2FjQtlKuBRuzu4eO4IKv/TzmPoMG616xBuEpp/c8bc=;
	b=n2EgP00AGy2SQ4LhsPxtPFcrw12hi7WXrNw754S6JRZX1HFzsFe/pseBtP/fjyxUDKlDOn
	/Fr8WjmdlV9A0IGs3lUqPsFYY90n0IUQO5Hj6p21mT64kGEeGvGWuuTZPU5n496dF5M7Ms
	bcj2yDheQqOg+7JhGM0FJ/PojVqBQlQW3GT/MdnO6PBZU8yiPKLKbUCbTSyjQaawwkWvOc
	ntK+a7n4xZNVoAH7QQ2Ttqq2cchue1vDh0sAmhWeszDfCSPhAGfnZTc/nOs1yEvWMAnfNq
	/wvAMUyqxwWoNSKxuUocyo7gSfJX3HzwHWhwoB/5kRRfZSdUz+uRcSaJSayGqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788943889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M2FjQtlKuBRuzu4eO4IKv/TzmPoMG616xBuEpp/c8bc=;
	b=xg6fz2OaJ/Xk4FVyNOThVXZ9GzDXOqKv0ZM2svim1anJaDd8tHxGt6Dcu201EiLHS+ELJL
	/Qm97XTr0L3JARCQ==
Date: Wed, 09 Sep 2026 10:51:28 +0200
Subject: [PATCH 15/15] vdso: Remove __ASSEMBLER__ guards from vsyscall.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260909-vdso-asm-generic-vsyscall-h-v1-15-63ae856cc659@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788943875; l=1972;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=C6Fh+EQTCyl+s4g26T56GGCWX2U0MtHr/51cTDgzY94=;
 b=/pF3AoTQzmD4pEP7pZqPjpk1T5eSdh8cNjifxUmXeKgAF4pL9mdehQYC/Qro0bgZ/bG3BCQbX
 AwbkyNhcCofDs37bRkBnMPJkPmAKCpz/Hs/RJAXHs0uvQGQmO5ufIiW
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_015132_477531_0648843D 
X-CRM114-Status: UNSURE (   7.07  )
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

These headers are only used from regular C code.

Remove the unnecessary guards.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/vdso/vsyscall.h   | 4 ----
 arch/arm64/include/asm/vdso/vsyscall.h | 4 ----
 include/vdso/vsyscall.h                | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/arch/arm/include/asm/vdso/vsyscall.h b/arch/arm/include/asm/vdso/vsyscall.h
index 14f2ea9d8640..b97dda100e52 100644
--- a/arch/arm/include/asm/vdso/vsyscall.h
+++ b/arch/arm/include/asm/vdso/vsyscall.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
 
-#ifndef __ASSEMBLY__
-
 #include <vdso/datapage.h>
 #include <asm/cacheflush.h>
 
@@ -14,6 +12,4 @@ void __arch_sync_vdso_time_data(struct vdso_time_data *vdata)
 }
 #define __arch_sync_vdso_time_data __arch_sync_vdso_time_data
 
-#endif /* !__ASSEMBLY__ */
-
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/arm64/include/asm/vdso/vsyscall.h b/arch/arm64/include/asm/vdso/vsyscall.h
index 7d9d6bdd58b2..7c46c37fd36f 100644
--- a/arch/arm64/include/asm/vdso/vsyscall.h
+++ b/arch/arm64/include/asm/vdso/vsyscall.h
@@ -2,8 +2,6 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
 
-#ifndef __ASSEMBLER__
-
 #include <vdso/datapage.h>
 
 #define VDSO_PRECISION_MASK	~(0xFF00ULL<<48)
@@ -19,6 +17,4 @@ void __arch_update_vdso_clock(struct vdso_clock *vc)
 }
 #define __arch_update_vdso_clock __arch_update_vdso_clock
 
-#endif /* !__ASSEMBLER__ */
-
 #endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/include/vdso/vsyscall.h b/include/vdso/vsyscall.h
index 29dd4e097220..af62bbf04eac 100644
--- a/include/vdso/vsyscall.h
+++ b/include/vdso/vsyscall.h
@@ -2,10 +2,6 @@
 #ifndef __VDSO_VSYSCALL_H
 #define __VDSO_VSYSCALL_H
 
-#ifndef __ASSEMBLER__
-
 #include <asm/vdso/vsyscall.h>
 
-#endif /* !__ASSEMBLER__ */
-
 #endif /* __VDSO_VSYSCALL_H */

-- 
2.55.0


