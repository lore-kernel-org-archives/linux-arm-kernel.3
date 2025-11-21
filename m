Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776F6CFA761
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 10:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzjekNmgRaAQ18lyWUzsEgEEJcD+Pamj+FUs+1j6mw8=; b=WuNPZ5SYKt4AMXl7erqRJ6j0az
	Jo/CMH7GRaMzjU6a51s1V/tllqI5Q58BVtRX5Tt20vimSz8gg6QGRh+tC+QoCqySWacLlwouLrYqh
	Sdg6e9hH2aKUbavDDYcT5HVScDOBJ0DNudQMooufK3tzH8aPhr0lmegReq7KJZq+CrHmCb2tNhmo8
	z9THfsdhb5HSzwFYeP3Beuq4lA9qAsbQbMYM438KZOAcRirEx0sYifbFqNQA1gIYXcqzRLrmGIKqg
	+z+ArT67ybKXzYTTWYnEOxu6cPqZ1khCjYxcKx0K+q1xFPudz1IjpNO2Piw3BgWK2XJ/Oq2COhyvP
	WlAtpONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNxg-00000008BvY-2msS;
	Fri, 21 Nov 2025 10:01:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMNxQ-00000008BdU-0sPv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 10:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763719290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HzjekNmgRaAQ18lyWUzsEgEEJcD+Pamj+FUs+1j6mw8=;
	b=Q1lyjIVJUji3hRiYJopbi9dVjhd0tLk5u+uYHD1CyrsmpAJk5CrgO08aDs+Jt58NzER+kg
	1HA71aCQKKjecdfecFCR6RQ/gRu/221j1PyRafGFKGoMfDDlA1DR31Yq1wbXYBqNCSLvJR
	9g8ukmQX65H2ebp+CrVJPp/0RprXtE8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-KhGOA54LO2idn1_FQ3SIiw-1; Fri,
 21 Nov 2025 05:01:27 -0500
X-MC-Unique: KhGOA54LO2idn1_FQ3SIiw-1
X-Mimecast-MFC-AGG-ID: KhGOA54LO2idn1_FQ3SIiw_1763719284
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A83221954B1B;
	Fri, 21 Nov 2025 10:01:24 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.78])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9142E1955F66;
	Fri, 21 Nov 2025 10:01:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kbuild@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 8/9] x86/headers: Replace __ASSEMBLY__ stragglers with __ASSEMBLER__
Date: Fri, 21 Nov 2025 11:00:43 +0100
Message-ID: <20251121100044.282684-9-thuth@redhat.com>
In-Reply-To: <20251121100044.282684-1-thuth@redhat.com>
References: <20251121100044.282684-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_020136_367923_0F665A01 
X-CRM114-Status: GOOD (  13.32  )
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

From: Thomas Huth <thuth@redhat.com>

After converting the __ASSEMBLY__ statements to __ASSEMBLER__ in
commit 24a295e4ef1ca ("x86/headers: Replace __ASSEMBLY__ with
__ASSEMBLER__ in non-UAPI headers"), some new code has been
added that uses __ASSEMBLY__ again. Convert these stragglers, too.

This is a mechanical patch, done with a simple "sed -i" command.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 arch/x86/include/asm/irqflags.h      | 4 ++--
 arch/x86/include/asm/percpu.h        | 2 +-
 arch/x86/include/asm/runtime-const.h | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index b30e5474c18e1..5feaac1d235f0 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -77,7 +77,7 @@ static __always_inline void native_local_irq_restore(unsigned long flags)
 #endif
 
 #ifndef CONFIG_PARAVIRT
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 /*
  * Used in the idle loop; sti takes one instruction cycle
  * to complete:
@@ -95,7 +95,7 @@ static __always_inline void halt(void)
 {
 	native_halt();
 }
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif /* CONFIG_PARAVIRT */
 
 #ifdef CONFIG_PARAVIRT_XXL
diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
index 725d0eff7acdf..50f73a8df7f6c 100644
--- a/arch/x86/include/asm/percpu.h
+++ b/arch/x86/include/asm/percpu.h
@@ -20,7 +20,7 @@
 
 #define PER_CPU_VAR(var)	__percpu(var)__percpu_rel
 
-#else /* !__ASSEMBLY__: */
+#else /* !__ASSEMBLER__: */
 
 #include <linux/args.h>
 #include <linux/bits.h>
diff --git a/arch/x86/include/asm/runtime-const.h b/arch/x86/include/asm/runtime-const.h
index e5a13dc8816e2..4cd94fdcb45e2 100644
--- a/arch/x86/include/asm/runtime-const.h
+++ b/arch/x86/include/asm/runtime-const.h
@@ -6,7 +6,7 @@
   #error "Cannot use runtime-const infrastructure from modules"
 #endif
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 
 .macro RUNTIME_CONST_PTR sym reg
 	movq	$0x0123456789abcdef, %\reg
@@ -16,7 +16,7 @@
 	.popsection
 .endm
 
-#else /* __ASSEMBLY__ */
+#else /* __ASSEMBLER__ */
 
 #define runtime_const_ptr(sym) ({				\
 	typeof(sym) __ret;					\
@@ -74,5 +74,5 @@ static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
 	}
 }
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__ */
 #endif
-- 
2.51.1


