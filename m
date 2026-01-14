Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB05D31A23
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZ4al2SPwjZRA5ArbmTM9kL6oha9+6/vJmT8I4plK7g=; b=faVgNjr9b/Fpbd+ghDp+37QbPl
	GfNEhywpWWNClS3MS8Yek/VP0J7IyK7sDW1yQcrezUamoJs++CjLvQwltfDM6fiaGKE1DXsj1C5yq
	p9VgRMiSRLkVBTA2BuMClOI0iwWKIsyDdy85Zz4gjcWc33uUfQrmvQKd8xsEfBfzHQZXncn3XfPSV
	1f4uBHQzfTK7hWt11bbw7UZ1lTRd9551AdY1LVdqDyT4hMKiXMraQNUbdGuV38WZo67ncGCKpxCv+
	LRJvjMVeyhawPOABhmTExacYyjL5UljIC/gCr2CKRNEVRSMj5+lxktN6k7T/55pb+ItAN0qe09DIR
	uP/654qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvp7-00000008FLM-12ML;
	Wed, 14 Jan 2026 08:01:49 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvp3-00000008FI1-2E5y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:01:47 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZ4al2SPwjZRA5ArbmTM9kL6oha9+6/vJmT8I4plK7g=;
	b=X2n9lkHENZ4jfYgkIQ0C0U7KDMwiB/Rg2H2tdkd9A6BbnYGQPssZLxfBLWKDTbgxIrY/ur
	oXEl5UwdXS1/q1kXweuIY6KGKTNjDO18nlwRuPS0OKxUu+p3RAcGGSSv3TZr4o/cIa8sZQ
	1qlbd3VXxwi6M2SxeEAL/T/JANsRH+WI/8qWOnJh7mZpfb2m1nkTWDObXGYA8jNPwOqLi5
	UrzMlcBaRCIoSA955H6MQOSIqIIQSolCNrUd/zWbdpxZBiuaOwc7lKqtSqcTmFgjhVLpnY
	iBiQnI2wKNG6psVu+pogvmjS6xrs9jy+uW5UChHoqypIet1/Pnd/iQIYJ/l7vQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CZ4al2SPwjZRA5ArbmTM9kL6oha9+6/vJmT8I4plK7g=;
	b=7G3UuikPqM3fOKDGIyjEvivukjlLNfUfcdUPQWvDD+A26guirPEHCHpTzVW/XT9icRpcsf
	BkLU7S3q2MMxxXCQ==
Date: Wed, 14 Jan 2026 09:01:34 +0100
Subject: [PATCH 02/15] arm64: vDSO: compat_gettimeofday: Add explicit
 includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-2-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=920;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=8dTNv+yVf4Z8az2E9ZQfv2/XdTFEorjE3dqOlt1qLCc=;
 b=xtjZ67L1Em5phMztPWgzg+bM7UF3KsFOj9j8pFZJbq6H0oFSziF7X7lFCJyq48vPbE7jeJ7H9
 NtolTY0TjEjAce/TkjdesOrSUKjHjDD4T8aqlg3hZeamMTgUF8NYuU+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_000145_709584_1D726A3C 
X-CRM114-Status: UNSURE (   7.29  )
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

The reference to VDSO_CLOCKMODE_ARCHTIMER requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/include/asm/vdso/compat_gettimeofday.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index 0d513f924321..a03e34b572f1 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -7,6 +7,9 @@
 
 #ifndef __ASSEMBLER__
 
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
+
 #include <asm/barrier.h>
 #include <asm/unistd_compat_32.h>
 #include <asm/errno.h>

-- 
2.52.0


