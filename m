Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832E8D31A26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zf5YPzBQZDKrsTEVEPeYB2jMwqKC6r6qPkNYPXsVb+g=; b=iUUUz6suZ+H+wOlVICwT25RXik
	IV+TUDPDNAekseRWywkWa8Lo5/6rOeKPMcVL19fByif8IP9P3OJTsYuc1KJ8aPzF2FS7JZFKlRFD/
	VXHDgkH8Kp8uoUQLBZ/vgoRFq+wwoMksb+2YUWqvqMzDgyDvJEfcMzulozHAdbrc38OjaELpTS5BC
	2dp5l6yyZ+iRAylv4tDdhFdGpWTrqEeJ3nwCL0EmL5OlO5xD5HAXEJ24LeTN5S3yy+k+J8x4dtDce
	XHrUWvXS36e9PAF2/OqK3yu0/b9L9jQtWq4Y/AUYCQS5uq7YLl16YrU67x4JonL1rQM9KQeFIKYwb
	Vv829fiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvpC-00000008FQi-12AT;
	Wed, 14 Jan 2026 08:01:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvp4-00000008FI3-2JbD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:01:48 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zf5YPzBQZDKrsTEVEPeYB2jMwqKC6r6qPkNYPXsVb+g=;
	b=Gat/DG50EAv/3EUc+6tlnCSA4nVoo2IOEVoTzpJlC8YhGCU8YB49JbSnusWsGweENp3pD6
	MeCm5iMMeRVNtRaZTECKU36redthL+vR6zhLgbGcuqkBqEcG9YSHWl4kEiQrXWjIaga+59
	8O3wGFUmyTObNW1QwcHo6u6UFvqZUdSUNy/NDFpkNnB+qN9vZ10o/AlJWKdgkLCZq3bsqU
	gqUqMUJeLCmQyPKLx8xiluZPTnzLx1ZmAusMQKuy2oD6ESW/LmUX2Peh9p2T0OeCQFpRA+
	lF02K+yP8Mk4lLVr6G0+ld7Di1EHWe9X9mhTGYyNqLI80GqN7t33iQGuGGbWNw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zf5YPzBQZDKrsTEVEPeYB2jMwqKC6r6qPkNYPXsVb+g=;
	b=0ACNizg5JT1Theaq397XvnVuytrcm3g1AHlXzaxE4xRWbheQ3cG0n5NLWSi+EampNnrqDE
	rLoaSZmZWv3GenBA==
Date: Wed, 14 Jan 2026 09:01:36 +0100
Subject: [PATCH 04/15] powerpc/vdso/gettimeofday: Explicitly include
 vdso/time32.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-4-803b80ee97b4@linutronix.de>
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=856;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=CY5CpcPjq39MxqXMgbeDe7Nib98JfeTlvdi5xywuqgU=;
 b=VaXzMveM6w4lOMIzZU6BEqJfNH9Cy5CDDT+7C6Azm9qkQOzBblUXGxZ15dzSZ0L63+fWF8qtf
 69bxDBriopJBCPBqTO8UjWYD6IuNUPAiExJ1TXcZbUCW7yYe0bsacma
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_000146_963869_ED81FBDF 
X-CRM114-Status: UNSURE (   7.97  )
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

The usage of 'struct old_timespec32' requires vdso/time32.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index ab3df12c8d94..b2f0e971076a 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -8,6 +8,7 @@
 #include <asm/barrier.h>
 #include <asm/unistd.h>
 #include <uapi/linux/time.h>
+#include <vdso/time32.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1
 

-- 
2.52.0


