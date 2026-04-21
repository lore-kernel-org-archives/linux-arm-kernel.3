Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F74F8925E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 11:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jPjnZBfP1z/pXHiEqouMeuwtbWPnoWSvPWYO1xCNVEw=; b=OfwZlJrAdAEMdY4CSafywI7Np3
	Tu52jFtjLZGtNY8FLGlnloUIDExDfrKdOE6FTXFVDyV/GMl68UlMcNhvwKGxrwXLSHrEJD9nhloYt
	XMl76RTh/cji77ighhrvB3LRpv5avK7qjN188G++tl7z57NgBuR67P4KDfdeXcr05NitWkNK83q09
	Tip50DkyZrvzuvWB+Mo5Cz+KNn/3+6XVLskw38HJjYsOHNuOXGOkRTlnRYRFeroQXH7kfpGGdo7d9
	vXufT6rCyESZVON2+N/7fVf/cXXy7SeNEGlVB/RiIpXfPDsz/fzLsMOlPoDK1AWQ1sG56tKYr/ZLp
	wN4BFBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9JN-00000008WJm-1XWc;
	Tue, 21 Apr 2026 11:30:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9JL-00000008WJW-3Dv6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 21 Apr 2026 11:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jPjnZBfP1z/pXHiEqouMeuwtbWPnoWSvPWYO1xCNVEw=; b=JKj0Kb7kqv7IxWo6WXs/CiIywE
	NlH1HYhInzyI7mT2iZUSxcoLpdwgWCTUknEU11roQYJgEp3l/UDkZZc8Qc0TaSA+dBwuxjd6ZbUmm
	GME+QZ37GFukJMV6z7h2gZRm649uv2Qe5Wc6Jj17Pmq6vsdEeXJx5+Eq5NO/lVRIbIckjcnDlOtcq
	FlI0Ivkj0PSDEWdbc+7Y2TyjPZcY+YGf456n4xl360OdfINKJvdJBz7Ra2lrK/ikgCABXFcq2Y06R
	Z9uP9Z2ivscRaKUEXa6klSEQ/6A7EBigJadVF0ESixUP4lR4YLfgOAg8Ce12ammP6ijPT2igzuFQV
	E4uUFrLg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9JI-00000009eFT-2N0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 11:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776771021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jPjnZBfP1z/pXHiEqouMeuwtbWPnoWSvPWYO1xCNVEw=;
	b=VfNxEzJ54FXahdc3v5X+j6YEMduHyLpkN1MdYEEqlk0Awi/KnpeXPFvkerHuhc4VZU9Yv8
	cV9yagryjzwTly7Kfdt6BkwzzJzdvYC7cODKPn/Dtr6eriJPQAP8DFPKpbXVRKLsTLr7ZA
	W7HMTBVNaGJ7mkTiZ8TJ6pHKttHETRA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776771029;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jPjnZBfP1z/pXHiEqouMeuwtbWPnoWSvPWYO1xCNVEw=;
	b=Ch4XlYrMhJ0R9oLzX6PK3VlGQFWfkVkmHoXhO2O4ajSNT6Y7M7sBPgXVizs/O5izh3shFd
	bZjggEvzwwT8znybfsT051XkbVn92wLlvFC9PHXVDUp2QNQFpz6IMEfLDy8zuAX5MxmtAu
	UUHZOY2FPYBceTlVeqCBngfdkr3EOvU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-474-PatFLygDOaOEH02LjEqflw-1; Tue,
 21 Apr 2026 07:30:18 -0400
X-MC-Unique: PatFLygDOaOEH02LjEqflw-1
X-Mimecast-MFC-AGG-ID: PatFLygDOaOEH02LjEqflw_1776771017
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA96B195606F;
	Tue, 21 Apr 2026 11:30:16 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.49.140])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A49C1956095;
	Tue, 21 Apr 2026 11:30:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/gic: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Tue, 21 Apr 2026 13:30:12 +0200
Message-ID: <20260421113012.146528-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: ZQN0vvpsPsK3Na9HZYAiXAQpQbiQGwruIaq3pM-n05o_1776771017
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_123032_768111_670496BD 
X-CRM114-Status: GOOD (  14.33  )
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

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: Patch has been split from an earlier patch series of mine
 to ease reviewing

 arch/arm/include/asm/arch_gicv3.h  | 4 ++--
 include/linux/irqchip/arm-gic-v3.h | 2 +-
 include/linux/irqchip/arm-gic.h    | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/arch_gicv3.h b/arch/arm/include/asm/arch_gicv3.h
index 311e83038bdb3..847590df75511 100644
--- a/arch/arm/include/asm/arch_gicv3.h
+++ b/arch/arm/include/asm/arch_gicv3.h
@@ -7,7 +7,7 @@
 #ifndef __ASM_ARCH_GICV3_H
 #define __ASM_ARCH_GICV3_H
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
@@ -257,5 +257,5 @@ static inline bool gic_has_relaxed_pmr_sync(void)
 	return false;
 }
 
-#endif /* !__ASSEMBLY__ */
+#endif /* !__ASSEMBLER__ */
 #endif /* !__ASM_ARCH_GICV3_H */
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index 0225121f30138..ea5fd2374ebe0 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -604,7 +604,7 @@
 
 #include <asm/arch_gicv3.h>
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 /*
  * We need a value to serve as a irq-type for LPIs. Choose one that will
diff --git a/include/linux/irqchip/arm-gic.h b/include/linux/irqchip/arm-gic.h
index d45fa19f9e470..849386dc5ec80 100644
--- a/include/linux/irqchip/arm-gic.h
+++ b/include/linux/irqchip/arm-gic.h
@@ -131,7 +131,7 @@
 #define GICV_PMR_PRIORITY_SHIFT		3
 #define GICV_PMR_PRIORITY_MASK		(0x1f << GICV_PMR_PRIORITY_SHIFT)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include <linux/irqdomain.h>
 
@@ -162,5 +162,5 @@ int gic_get_cpu_id(unsigned int cpu);
 void gic_migrate_target(unsigned int new_cpu_id);
 unsigned long gic_get_sgir_physaddr(void);
 
-#endif /* __ASSEMBLY */
+#endif /* __ASSEMBLER__ */
 #endif
-- 
2.53.0


