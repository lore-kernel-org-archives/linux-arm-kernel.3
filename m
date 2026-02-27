Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD34FD4601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j41rfTYZDcPnORX6+H3qvB6/XTLHclkdQxhoSfZSj0Y=; b=E4VHk4sH5jc0QNDLzVTC6Vi0Dq
	qDHCelzu2fd9FRZk5vGmgMU1/8nlQceSIbAXgIRgf5Tl6jpqVuR63vtnOK/5jl141VrPyqmajjsAE
	OCH0aTfKyi8y4NZSfPDOy2rVEpXH6lPCIPoDSSp/8upMx1Cuis2VU7lIrbbYZaMyREN01Pw3cWbpG
	ZxEACPBl74PLrc0Msrrq/oMEse8ivaPJ0qNnrNTEXsEl4D+JGLohOS+EUxKwjNwiFLrJJh9T0L3Q1
	oKK7R96gLxISPpnw7l14XZ8DN8zJUzsZBkWdC1EyMYmIHcb/w1c23zdMc/GTTXc2pD1yM2rd/jmWt
	6KwEnZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvram-00000007nhJ-1Hak;
	Fri, 27 Feb 2026 06:44:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrai-00000007nfe-1C6Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:44:51 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j41rfTYZDcPnORX6+H3qvB6/XTLHclkdQxhoSfZSj0Y=;
	b=teLIpbJDZ6ty4EgjyBCW0HNDQ34y6Z/GXXufwmzJ9LwvX3UJC767NVYgEO0dWOABJOe6Kh
	z+HJWNIcxCYB0GXNxmXgCAS8H/0wt4W6xzz6kpchpLwI0OiCnBQIJkfXTxsv0K3keVRjcA
	Zn/5jiYqYhQv+XPXUxPXU+XsHmZO0LaxiVSj2bdLrkpla+oImCr6cMtfd8bTEMrrc2zk2l
	/g1Fp7rXxGDHSUJFNFwcXAJmE09ZDDT7FRKrjb+BlA5OCRBIdfuEvwQ4v9UYZ12/GLk1s4
	655Aw+ZR5m/M+16gGq5fDWa1F9Pi1avC3N1OHab/nthSXnO9zRGI6fvAxp2yEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j41rfTYZDcPnORX6+H3qvB6/XTLHclkdQxhoSfZSj0Y=;
	b=sqnSEXW8Jtxu4AdEvoDJotRY5wYBKsIIkaMGtV3TVl8OfAUEgUeaTEYq7RJJG6dW062WZx
	wLWGxNssGv3lS0DA==
Date: Fri, 27 Feb 2026 07:44:27 +0100
Subject: [PATCH v2 01/15] arm64: vDSO: gettimeofday: Explicitly include
 vdso/clocksource.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-1-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=846;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=B56aYMYQAdEmPujlFuVOYBxgPBhNNOzHKiu9popOBq0=;
 b=Icd6rTz9LQS9xz5L4WU3B7Au6NWvTQBRcgEdv4gqrl76kLvgpQ8QZfGaYsOPM26zB1bhzUCF0
 HQhi0n2m0/LB3MiaPP5WgRq43qkpYPVWp3cMShvvv8zUN57f7Tc5KGq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224448_493133_32526931 
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

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
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
2.53.0


