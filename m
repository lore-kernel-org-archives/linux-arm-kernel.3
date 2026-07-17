Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32642C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 06:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=; b=r/w/lV7/E5eIIKVd1roZiWGWmn
	d/cqVLtMJrowD0vbdF6CA31olkqGWouV0SvW8rWpMD6tzO6LDrGsEY2hy+b0xG2oDr8HxBeAJaaYt
	mJ4UTpdcQ2KQDY3mYAKVMARpmsxpOK5qKUD9vrviKydupDsyjCDG3onhFcbdqenxzn16icKD+g7dc
	Bl6m5mU6MVA9KjKOIJq6kXKnYMbiRcGHg6UY3Rucg4BioQ5axl6uQFI92tA7+aJbYjrSN9iX0hVYg
	pyM+n12W1CAnElTgOSL2Xy1yJ2UWhLeOoDXDg+XtjsnQC+J4qOPuO9MAf2pZYYvRIcua8A5OImsye
	nch0ITxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbr4-00000001E0k-2qwS;
	Fri, 17 Jul 2026 06:15:26 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkbqx-00000001Dtu-0pVV;
	Fri, 17 Jul 2026 06:15:20 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784268901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=ovjYqPfP49nfKV50tUridaUCmN2wEut8eA8C8vu1HpUDDDG4MKVHrU+TXQvRmHTHW/SZG9
	eBN4eN4cj8OOVwsHfa7RzuAN+xk7krnjKS5R+GB1U3UxER99/Eqb1/ZtQgpHkjTVKVWXUx
	6hNRIh6jvfY2o+Tys7CVxCKW9AjEmKTLZMeK7CIPuXd3YnXe12XnfHniJ6ECaxNzycCOsb
	NVYeZ3UvZzPN8GQ73OQ/rjH0KM3zUS0Xr5Mb1wLpmkM5S5XGbOO9e2Co0c+UZR21PGGTH0
	qM5qhKiWB6+VgQ1nxscWhy9jyFC5VfsKAWTvv53Q+rGOpW9cpcD9ssalzRtHIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784268901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vQbno2WvTFVUJzsRinFLe6H6OiW8r6h0VjyMcplhKIo=;
	b=r4tWelhaNShXcQKY3JDouYaui2eyhEbnWAbHyyJe+5Jr4uhktzkJdfKjWxywa+MG1Bb1hX
	dMs3a1rcRJ+vIyBA==
Date: Fri, 17 Jul 2026 08:14:47 +0200
Subject: [PATCH v2 3/7] MIPS: csrc-r4k: Remove CONFIG_GENERIC_GETTIMEOFDAY
 ifdeffery
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260717-vdso-arch-clockmodes-v2-3-756f5a5d1467@linutronix.de>
References: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
In-Reply-To: <20260717-vdso-arch-clockmodes-v2-0-756f5a5d1467@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784268894; l=1015;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=t3APLy9t2SZVxR8iClS2KaGCf82ju0LDxr/0aH1HIvc=;
 b=xI8NbmAXSs8ogUaOoFJQHyozFpyiKZY+gTXc6elvzxJ/8aAMz++2OBYOxxmDzQezptzAU4LCo
 C3mfof7qJeGDv8TsxQP4KGhrtSCFjQ1QLt4BHVyXQNIUkV1JNwmDam6
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_231519_389055_FF860306 
X-CRM114-Status: UNSURE (   7.44  )
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

Now that there is a definition of VDSO_CLOCKMODE_R4K even if no
vDSO is built, the ugly ifdeffery can be removed.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/kernel/csrc-r4k.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index 241a934543a8..59eca397f297 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -126,14 +126,12 @@ int __init init_r4k_clocksource(void)
 	clocksource_mips.rating = 200;
 	clocksource_mips.rating += clamp(mips_hpt_frequency / 10000000, 0, 99);
 
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
 	/*
 	 * R2 onwards makes the count accessible to user mode so it can be used
 	 * by the VDSO (HWREna is configured by configure_hwrena()).
 	 */
 	if (cpu_has_mips_r2_r6 && rdhwr_count_usable())
 		clocksource_mips.vdso_clock_mode = VDSO_CLOCKMODE_R4K;
-#endif
 
 	clocksource_register_hz(&clocksource_mips, mips_hpt_frequency);
 

-- 
2.55.0


