Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA6FFD4600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MT9mABwWNsI9TUhFehMJZiWYa4Ex6pH1UA905O7REYU=; b=ZxybC/5c/9DT/fTXFavxUSmj2w
	ih6m495gZqVv9B6z6MQeWnWzoQpx6tEJWJWL7bqURS9Nnw/m/Xi6q0n71E3/cA+fX5GRmsJChXOqx
	FIm6IoPBYLG2tPjuWCD59WoKzd0rMwYmABfFBFvmwc1Mh/oRlJJquqUGBYwQjRkteoaPpmZrw4kZU
	2hq6SeSkXHkyUXJiXil3tf3bVO0Ubluyhx6r08zxdttuYJAaW1/2+e1oNQ0uZRnAULZ86tzb/y8Xo
	gWqSaQx1OccgM1LZrHMiZsoLin/mdr0MY8a4LoACZY5Uqh2DQ91g+x+vmE9AcI/6Xiyqi29va6lqh
	lIjY+RKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrb0-00000007nzk-3JoS;
	Fri, 27 Feb 2026 06:45:06 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrao-00000007niV-1uh3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:44:58 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MT9mABwWNsI9TUhFehMJZiWYa4Ex6pH1UA905O7REYU=;
	b=cfwTsi/TJFnGxTTsjdk4Rgs/kzta9IiV4oujNs3wni1/5PjXuy4A8a0i/6UiAlDAnVseJq
	FyNeV0vYG3uOJ3+1d2kOPEn4pBQH5BiHbGjY/ku0ElcI9meL6zLsZnMsmT5h+6Pl0tQwUg
	1wFal3bFZQ/eBwT1GJmkJKBPA9JL6nK5OzJsaRsVxnAYnInr4K1wU6c8yBebzK8qg7w0fw
	zCFJVTUMD/0eQViWGrGRR4yyuShLxdcpRb7G+s6gRv2jjHmmtterWN6txIhhIMcvWB9DMW
	dIhbVKTnV9q2rNCZc2dL3lY/WfvnD2cgtYnJCSVC07QKIIA4a19BYN4d+78sug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MT9mABwWNsI9TUhFehMJZiWYa4Ex6pH1UA905O7REYU=;
	b=ejl3tkioO0eAW6zQD6+EN1IlNxld/j23NlSypfSOnM0QS1PfbaeufOf39LlN/21czLUazH
	Fah2RpDPocULVGDg==
Date: Fri, 27 Feb 2026 07:44:39 +0100
Subject: [PATCH v2 13/15] vdso/datapage: Trim down unnecessary includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-13-35d60acf7410@linutronix.de>
References: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
In-Reply-To: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=1385;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=wv97jtVp9LOrbbaSqFqOUpDy+CygaDPJQt4r4ulajgg=;
 b=AA/7qY6PTiNVEDs56dWZ3coYTfVBsUCA3r+IAwZgBJqIY5/VFuNp8T0w/pyEmtxInjOgjugDa
 TNjazZGT0VqDFcMgG6k82FKVxRxh7RU6gITXsgHdVVJ+Kgb1OpuenNw
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224454_738014_9520D099 
X-CRM114-Status: UNSURE (   9.52  )
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

vdso/datapage.h includes a lot of headers which are not strictly necessary.
Some of those headers include architecture-specific vDSO headers which
prevent the usage of vdso/datapage.h in kernel code on architectures
without an vDSO. This would be useful however to write generic code using
IS_ENABLED(), for example in drivers/char/random.c.

Remove the unnecessary includes.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 752856b36a3a..9021b9580be2 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -4,24 +4,16 @@
 
 #ifndef __ASSEMBLY__
 
-#include <linux/compiler.h>
+#include <linux/types.h>
+
 #include <uapi/linux/bits.h>
 #include <uapi/linux/time.h>
-#include <uapi/linux/types.h>
-#include <uapi/asm-generic/errno-base.h>
 
 #include <vdso/align.h>
 #include <vdso/bits.h>
 #include <vdso/cache.h>
-#include <vdso/clocksource.h>
-#include <vdso/ktime.h>
-#include <vdso/limits.h>
-#include <vdso/math64.h>
 #include <vdso/page.h>
-#include <vdso/processor.h>
 #include <vdso/time.h>
-#include <vdso/time32.h>
-#include <vdso/time64.h>
 
 #ifdef CONFIG_ARCH_HAS_VDSO_TIME_DATA
 #include <asm/vdso/time_data.h>

-- 
2.53.0


