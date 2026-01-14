Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475BCD31A23
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kIfhCctwH/PXRTS/l0pyrY0rWJculxYA/h7dmY+/9c=; b=YZtJZj4vPaM9FRsJ46BX7KbVoj
	hrvteEwbnRsCNvmJkfzDej+cCrQOVig29VWSzuWL1uCje8toEc3Y0EDatpyES6w0jA5umBceCRHp+
	gIomBskoTTT/qHZgEufD3B1LFQQM/HhsaHFkf6R4k1DD25QcFW3fU1VtN/X6J5se7rDZe5jJmLIGQ
	yO/eydxga8N6ggUa+02Np0809rfGjK77T9WnKz72lObioVv7iTc49++Yw/9/pYkgw/DwT6tT+3JWJ
	Bw+R16Bj/+Q8nEbG63GPEF5I+ChP6fIjVs6ZjzOMAVriXQ7fxdUJWk37lkNeKKwK7j9I9baJ1lMim
	AAxgC/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvpd-00000008FrA-1Jg3;
	Wed, 14 Jan 2026 08:02:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfvp9-00000008FMY-2umi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 08:01:53 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kIfhCctwH/PXRTS/l0pyrY0rWJculxYA/h7dmY+/9c=;
	b=R5HC7GTuc259FnQxZrp+F5cNuaIoqy8A+ES/ta60Un2RsZxIod0YLBs/5lvuk/8sCfBcAw
	CwfSEBD9J/oFYWHtkATRmZvTX3DL74gCiBcYV2lYjGZWiwpjPlHt2eUTne1FYso/qCPD3B
	7kCUi53E15QfiWJtVf1YcV775RxLushJo5GH1LVA07p6oq+HrUEkgf9k6TGAq5eVWxggUY
	K00RCb0YrS6j4b503xeAwxfr0XvA4ie2ixgYs+9cWm43F0ayCBsL1C77M/xAWOPRadxM42
	rgTCIbVPVdq7MXLdgHcpTMqflxCfPivR/7vm+TI8rM3yQu0YJzhanbRDkUGlTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kIfhCctwH/PXRTS/l0pyrY0rWJculxYA/h7dmY+/9c=;
	b=qweOf2NEn+Fp/jDOE0ObfArk2md0NGD1Z/8dF7nNyaA+uRwgAKPz/pww3+6mAnm7R0MfbP
	G4dmGsbg2zb55qDA==
Date: Wed, 14 Jan 2026 09:01:46 +0100
Subject: [PATCH 14/15] random: vDSO: trim vDSO includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-14-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=674;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=iHRl2iopmVoBePzD44Ct4WnbPDG3Iws20lECSBoN0BQ=;
 b=TVPL39Ltr/bfzoeZIk41jLl3TqbrMhbh4gc6ACjsLk7nBMd2BGcBUreA6Oc23LOS/NZtXPByZ
 OVgpnwljI5sDx8kJaHvSrgE0mqNtbsrGLWjIuxYgBqXYq+noXoe5/IK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_000151_872152_3284F29D 
X-CRM114-Status: UNSURE (   7.75  )
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

These includes are not used, remove them.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/char/random.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index bab03c7c4194..c5122ff33594 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -57,9 +57,7 @@
 #include <crypto/chacha.h>
 #include <crypto/blake2s.h>
 #ifdef CONFIG_VDSO_GETRANDOM
-#include <vdso/getrandom.h>
 #include <vdso/datapage.h>
-#include <vdso/vsyscall.h>
 #endif
 #include <asm/archrandom.h>
 #include <asm/processor.h>

-- 
2.52.0


