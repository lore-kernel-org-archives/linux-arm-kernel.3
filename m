Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD30D31A24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVE7UDpBEJQzs6r1E3Q1QZHCQl3Me/v8mkp8raZ1pVU=; b=deWRlgJpBclKQxz5tQceyLJRAo
	c5EJh3Li2wody4YORzcLF0S1KFKnSSsMpO7GSAu0d4cUDbm+cfpZDOqqNmtZ2rkLjYJbHM4wrPr+8
	xiy9eZ3szg9Qd7/ztL2Gqg7xQ6jfECl2yG9M408FbCsWqtia+uMQKI00PwvWk6JveINIWjtE36Lu3
	VAUruIIjYjFJAL2H/SkyOGBMl7RFKe47x7WLzQAf9939bFu/vxPzww2J+emeqrBgmtU/qZ3s/rSFP
	aP5wMLbTCpnNM7FkSh6ltSWG6MwZhKD2rP66vKPn3sY1zf4hrJY6XGOC63DNIpLCCkVQdKLmFc3jq
	768RTIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvpF-00000008FTq-2Raf;
	Wed, 14 Jan 2026 08:01:57 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvp7-00000008FKM-2wMX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:01:51 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVE7UDpBEJQzs6r1E3Q1QZHCQl3Me/v8mkp8raZ1pVU=;
	b=1GWqSl4O8frkZuGBVEYparTPXcEIULuaQAHPdpWQ0EpnZ8DFU6kG76yfTmEL/uFcrqifGB
	qDsG7q88iWJAQj9WaVerLrOIX6uiIlNIczRR5QIMCpoZXn00+Y6nQypzcNK12CduQULJMP
	2cGnMod0mnyeSxq++wou4ZRawxpygSbp9OXO5V0a8pyp7lvXGv9jlueX9Miv4t7Yl7A0JH
	r0EDzhphdhYKgvX8/msd3XVzAhdG2ibo7AsZMqfuDX76IFb5GM4RQdA0x6mOOKOSf5E6Ck
	xtKVaFEWDyWi4lAVPU7Up18IphP4ZcYO+Ns4bK65lN2wYKyTqN9M60nGi/R0tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVE7UDpBEJQzs6r1E3Q1QZHCQl3Me/v8mkp8raZ1pVU=;
	b=RuEHcausFw0WTFmyY09rtvGUsovhmgPHBLrdaFaqIfLg7PS3Nas2PhsrCcboVycDNO0E9Q
	C8OYIy64slBZtJCA==
Date: Wed, 14 Jan 2026 09:01:42 +0100
Subject: [PATCH 10/15] vdso/gettimeofday: Add explicit includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-10-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=905;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/PGHbFBRbF87mDQ8qVakdB0oSPGR2/opxI5t5u5CZjA=;
 b=cahlVVRYw0sTKZd1PnS4H0fXwsD3uJLNe4aNXSh3zZLPx5OrpUjhanSW/lZKlX6oG5dZD7lyW
 PAfccetFzyVCvZ50oqWEnCHNxcdvr2SPb78dJglEIcSXMNmi34om0W5
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_000149_907049_D5EDDC6B 
X-CRM114-Status: UNSURE (   7.39  )
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

Various used symbols are only visible through transitive includes.
These transitive includes are about to go away.

Explicitly include the necessary headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 95df0153f05a..7b3fbae85544 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -3,8 +3,14 @@
  * Generic userspace implementations of gettimeofday() and similar.
  */
 #include <vdso/auxclock.h>
+#include <vdso/clocksource.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
+#include <vdso/ktime.h>
+#include <vdso/limits.h>
+#include <vdso/math64.h>
+#include <vdso/time32.h>
+#include <vdso/time64.h>
 
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>

-- 
2.52.0


