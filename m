Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE49FD4600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdFmvezM/13UIBOLqXgkSN+e2a31t12dc0rZR5hjhsY=; b=awz6SIfByCte64uXT1f7J7nDb5
	7BrpYjKpPfoZUg88ImuCqcjxyAVZ917mmkWTdWFT0z0/ebu5l+NvLdioiCc+esoxZKYaBEyI0CLFh
	jD8CJ9bxwnBP6yMKILjr8pdLq3yeahG2kjU/y2PVVd5ruKT8cxpIMvjvAqc+bCnYiqHpl1SG2Fph3
	hixNf7pEpCbj5GJm+bmupz8oCqji9HUvWHyX/FuMBlNNwn7xvltq8plgjufTrC0pb8rLo9tVW+bqn
	Cf/BiwvC49Ext08N76gN+uWKvYrg+IQTV6DN6oZC+chrx7BxKXjFt2DNqK0+YqIEkVDNl2XLCpadn
	ibUovXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvras-00000007nnh-3kQU;
	Fri, 27 Feb 2026 06:44:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvram-00000007nhD-44jV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:44:54 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EdFmvezM/13UIBOLqXgkSN+e2a31t12dc0rZR5hjhsY=;
	b=guerkA1YpVG/5ursk9ictXBkrOLUMELSSFYdzfIgzPv24IBuzqV/7wSr6LdLb9JYULTYH8
	dxg4NGR/6WwGdzMw7x315is1hHEdPwGCRT+RigrCiJM8G+wGwMRsqvUjofLAPSSvxvGM0k
	Xs6pJhmYZkiSe7QKqib2OHT0y9E5PjUIyLRVExT8biNiErdN4Uw8GDxoBo/GS1Cx+T5hGe
	V15bDVIbrlwV/AA/8xxHfKCcUmze1+PCsIb0VJJsP1fEcwLUVbM2/ZrcrGaDIDPpk3yH8G
	SzFEq+99OudB8AxOw8z8p12MvcBZj6TWNcPo1wXOuPp2GiFtFe6E+VJPsjzsQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EdFmvezM/13UIBOLqXgkSN+e2a31t12dc0rZR5hjhsY=;
	b=G6YAL9w5VJlvv6SIhTbu4Ko1jVx8II4adcQjHgTqP1AVdKPNXJ9EYWoYeJJESJU2w7+TRn
	xkmQHK/gWn5P1HAg==
Date: Fri, 27 Feb 2026 07:44:32 +0100
Subject: [PATCH v2 06/15] LoongArch: vDSO: Explicitly include
 asm/vdso/vdso.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-6-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=1174;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=VlobGs7YuJXZk2xwqXObxL44WjrcbSo2bt+/5ArFOMQ=;
 b=YdBHCMUo5DusjEOI4DV+0CTXJaCByr5krSoSQmpxScBLGKDg6mJmHX1d9paPZgVzpjmDM7K0h
 hnUOJW/a1xgBAzNcJyvU1/HV/dCuKogllRNecIi2DdX3xnqN10Ev6BB
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224453_155209_83439619 
X-CRM114-Status: UNSURE (   8.86  )
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

The usage of 'struct old_timespec32' requires asm/vdso/vdso.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/loongarch/kernel/process.c | 1 +
 arch/loongarch/kernel/vdso.c    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 4ac1c3086152..ac3a0baa5d00 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -52,6 +52,7 @@
 #include <asm/switch_to.h>
 #include <asm/unwind.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 
 #ifdef CONFIG_STACKPROTECTOR
 #include <linux/stackprotector.h>
diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 0aa10cadb959..8ce8159c10b9 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -18,6 +18,7 @@
 
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <asm/vdso/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 #include <vdso/datapage.h>

-- 
2.53.0


