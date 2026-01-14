Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4EAD31A24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aey3W1GcF5/kk2rrmPxnaG8WX8/5pWHilYSE2+aWcjY=; b=M+WeschXZZ5RG2Fvp3M7AgvaIa
	sAAsgoLZd8jaCsbJBDOmOlpMZoKbqj6Wnx2b2dAjb8g2AT99vdV6QnlJ+ETaKnQQXSKSZfGF11JCD
	8LAN3QhcsIGQFj/O5VoOUbS8bCOTCkx9HJ7ix/W3XOLgETKwmWBiPO3H2yjd5m/FGHOpKb8l3OOFx
	pp+Z6AaH8Fohb+Aks2mrTeARGOmthDt8SdmsCu/SjiBAFJAYyV9DEo+rBxI6EDxbOMCBFViDaKcP2
	3CqTEKYjm+5koLHqUSaISSFEYmxYNgT8Fi8+8M/IFCYBAZrxD8xoLDOHyXAd9DjqryrFwVqSNQip3
	mxlB5hDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvp6-00000008FKp-3zlQ;
	Wed, 14 Jan 2026 08:01:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvp3-00000008FI0-24Xc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:01:46 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aey3W1GcF5/kk2rrmPxnaG8WX8/5pWHilYSE2+aWcjY=;
	b=Cjmfgcm32JhqkCEoeaSa9m2cIcMi8btvnt3YSf8E5s//imPdGugSjw298WAFNu+zQWvhyH
	Cy3fXO4wRSLdsdNe0neZS8UQfPnxTKhfqp349re7O8SAHxyEfUntmEmXiYvUiqmnhruBNh
	4bvnrbwt1xy1/T7b+axMGi7AHRxXh7vmVO06sXGFjb0A1C6FH7dRuvAezFI1QFxnZWsKOn
	YTC3U89Aqkdrl66NZST0xt8xuv4u7pgbiM/ZRcOTp1oRJUj3Z5Bbl4NZLfm9dcFT5DAky3
	XTsG90yM3cWzTbbCT68qcNmUSCK3b6hwbVpUCTomFS2Wg8e7b32WyWLLiwMbNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aey3W1GcF5/kk2rrmPxnaG8WX8/5pWHilYSE2+aWcjY=;
	b=MTKqHMuAYUsqIwBOH4XjiusWx952DVnyz7WgydQWEvzRnedDf/Jg+FWUTUooorWrpXWk89
	BKb4+xxeiroGAdBw==
Date: Wed, 14 Jan 2026 09:01:33 +0100
Subject: [PATCH 01/15] arm64: vDSO: gettimeofday: Explicitly include
 vdso/clocksource.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-1-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=793;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=MGIkY0CNSmg8aEEnDJvrpAOVG5mHT6sc+hCNGJPRU7Y=;
 b=X5KSM5ToYToqgQd2Uf6oIkrmBvM99b3NT57ZSfONBWJXgIK1bfM5/+g+FO9eWk6dgSUdSXSTi
 HTI2+uEr87BBN/4H1eV6/rt8WfmZKL5MYQtWQoWgId1EwNAUplCOeO7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_000145_680058_7776E570 
X-CRM114-Status: UNSURE (   7.73  )
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

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/gettimeofday.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index 3658a757e255..96d2eccd4995 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -9,6 +9,8 @@
 
 #ifndef __ASSEMBLER__
 
+#include <vdso/clocksource.h>
+
 #include <asm/alternative.h>
 #include <asm/arch_timer.h>
 #include <asm/barrier.h>

-- 
2.52.0


