Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940AAD31A28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGpYGZ/EN2AZqYN0WEm5UmRFd5B8Bamrz8S6pn+n13E=; b=oaYzAfWnkRAzkmG/LPBufy518m
	Ry3VMrXbCqMNqvMxxOFK5GKL0uz3bmse+ewWmNO1mTH5U1qMDxmCtxoJfTZdU8s7dAOfh3o9kaF4A
	s+hfhaxLIwG8LnOkfBNo9iFTKWIReDBLtOirWWqr1LzLx7fRa9OJsrGX4pj+gPZzcVqqHOmA2YHsF
	RT49zX1aIylXe3kNjNranUKmk5qsDm6E3JLHtprG77d1/0YrLaAcW/XivZQ7DV2/GS/RDq/hLDry2
	IFaHFT5WKRwofbu9SXQZ83h8ml1jDH2xJbb+bzBD/vXBqs2GVapxaeSmbHbUx7pPxUHqVUrNTH9ap
	gfS2c8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvpG-00000008FUq-1IyV;
	Wed, 14 Jan 2026 08:01:58 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvp8-00000008FLF-0jBp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:01:51 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGpYGZ/EN2AZqYN0WEm5UmRFd5B8Bamrz8S6pn+n13E=;
	b=4oIgJruX9Pma58VWDp5HIJutiSb9llrWOkO8f5GeeoDW36Trzbl5sBwpMip4aW5JGAOXX6
	J2i2qbx5qxIFfruEl5dqDFk92gMuh/vEJX91+t/xTTdlFMWzLJDKrgS1DP8JTejizodoSi
	gWUzK/4lFD/BXUfnGC0aPcmMKSbCDPAVEQZDDBTallOrB/EEazs7Q3yvzu44EQFbyJK6Nv
	d0uD5fzNKNBko7wv4oEUdFniXwbSpT9743mg4ACQl1D06tz37IO3MUjNbAxnHDFQQxSh3K
	vbrMOrCYrlLLVYFNJWYSB4FuwRRtT4z/G4pLMrokuQssj9Z1MnvUjILuZrrDtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GGpYGZ/EN2AZqYN0WEm5UmRFd5B8Bamrz8S6pn+n13E=;
	b=yJSrzBvnUM6qYm9C3OI9GWcdK6AbNFlRyVNEpoMooh8VO4N/VpKJHMLOY5V9rDz7XM2trs
	UncTbn21uHBkCrCg==
Date: Wed, 14 Jan 2026 09:01:43 +0100
Subject: [PATCH 11/15] vdso/helpers: Explicitly include vdso/processor.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-11-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=694;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6/mNsjAlKjxQ4RplTzUqjF/4vooh/hplxS2bcWKZqDo=;
 b=WKou+6nB5sbu+Wcr76Etle4+RUtUJQds56pKfoSvq8eG7qKUXBH17sbcep/48mSG8Sid8fFHB
 t8hjfmA67GLDNiNtzGetCc81wu1tJRHvXqlouD33bhoD+v11ZohncEZ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_000150_475847_7C50468E 
X-CRM114-Status: UNSURE (   7.87  )
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

The usage of cpu_relax() requires vdso/processor.h. Currently
this header is included transitively, but that transitive inclusion is
about to go away.

Explicitly include the header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/helpers.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/vdso/helpers.h b/include/vdso/helpers.h
index 1a5ee9d9052c..a1c995af4696 100644
--- a/include/vdso/helpers.h
+++ b/include/vdso/helpers.h
@@ -6,6 +6,7 @@
 
 #include <asm/barrier.h>
 #include <vdso/datapage.h>
+#include <vdso/processor.h>
 
 static __always_inline u32 vdso_read_begin(const struct vdso_clock *vc)
 {

-- 
2.52.0


