Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40164FD9E3E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns/5VchQVCZoKSPGG69oVFKcL4Adw7WpxEQJ3c/B2CA=; b=Ylv6aDdSV3EV4EenAJB8cYHaqZ
	ljFFPQKPXXsQnmauLbxP5XtEf9N0HtoWvzpRLm86V+bQyYNJ+0jy77KeClMMk5OxhLrnu5+kW7b8I
	zZvBqv1Y6WukvbnYZjJJapi44mAMgBgk7+kXrUQKaobZPzJH0BQuTeldngoRHaZyFqIq7RHACHjlX
	ahHMa3ky1B4xxY1WhhMZUXhEhzh65Nf67nMKz6EgP79Urt9K2tZj5vv++MEUpOEtf8odUfjm5RYGJ
	4BUt7XZ+UYKhkuWtNQTMlgvQElk0PLK2r8o6wN412Aw5Bd1EF4ielP2QGq/GFyDJ3onJ1LzvkXvl+
	OPl5gQnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvraz-00000007nxQ-2mRi;
	Fri, 27 Feb 2026 06:45:05 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrao-00000007niU-1ucZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:44:57 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ns/5VchQVCZoKSPGG69oVFKcL4Adw7WpxEQJ3c/B2CA=;
	b=JCmZPwYWDYToRyEQ9DR8fipEF/ULgK3B4oVRwWHLTcekFqTViMl2N/xXKz75LI5l1qr47j
	xPn9Rsn34YLZ/KdRp9IL3X+UgseOAA5Gw6UEoQYdfwz22lZl80Tfblc0sChWc6GBpsZI/X
	Ivbxyk0MeuNL2Juh5AUY+wlHXIUtLd1baIIerKeCUAi1yXNMPRPS+IZHAI98jUrgizIzOK
	8qin9uAxtsCYs1UsSNa2TBL3GgFusppXtMq5HGGPhOSMssvIQimvH+lscXk9wHq0CMgdSQ
	WTXWmZ1XohrP5u+BH2H+6HxknCbr+MJ/OBBBGUtbq9JrnV/R54GXj7ZL1/ouHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ns/5VchQVCZoKSPGG69oVFKcL4Adw7WpxEQJ3c/B2CA=;
	b=Q34qgHOeSxFo3Ifozm8ShqwF2m6jrAUnaadKtDXG3hehTabXwbDdCf5WWlUypCd06X0U2E
	lxTt7rcOT8SLyJAg==
Date: Fri, 27 Feb 2026 07:44:40 +0100
Subject: [PATCH v2 14/15] random: vDSO: trim vDSO includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-14-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=674;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=kYG/ybqKszLJuacxc6F+IgigSyzq9bc/Tf+cZR6TFzc=;
 b=hRsrMQVPxwKxWQngl7rDhlf+sNF1zn7pg7IIBz8oApCVJ13R3dYi+fdcB1s31dvzbU6Sx8f15
 IpdV9+rftWEARi2FlzZ45wcpJn7tR73aFc0r+30IO7QgRivY2an1P9j
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224454_767948_E8C3BFBF 
X-CRM114-Status: UNSURE (   7.88  )
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
index dcd002e1b890..9738673018f3 100644
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
2.53.0


