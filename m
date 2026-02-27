Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A817FD4601
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 06:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLji6Amx+w4gkoyKP87sApLv4hbvr/R4BbROA9mF7Qw=; b=YLy/IPhSUNaFjEr/e1XxT2177g
	tHEyuwgp75NsLwxbJKaqoUI6GXqH0XcIwYQg4YKjIXMw664+kSiQXe9eyAF9REj5g9eohF/ZG3XSJ
	7dyt19lRhSLMAKvN6OuVENbdZmf0/QCEm54tlEaJsfQbk9rLxrumC/ShTH2IN1AUi9xOiWwpuSrAF
	baOe5NVr18Lr46mfh8NNs/V7OWI6N8tq7GDQRmQIu4p/UniTdv/Ym3abFeglW9XdLAoRLooVmyeTg
	ToZZ35OGulTEExANgrybtcM4luzbcBTQYyU5xJYOgq3cO7EDs5i1mD/R9gw1LiBMD8y5QrAJOkAx3
	dNG/964A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrav-00000007nsR-2DK1;
	Fri, 27 Feb 2026 06:45:01 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvrao-00000007nhm-0Cqg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 06:44:57 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLji6Amx+w4gkoyKP87sApLv4hbvr/R4BbROA9mF7Qw=;
	b=dCLNqQkfH1i//wSvIpnoq3xDDTzR2xeibPPMp/z9eZz64hGWimn0Lzumwy5pZBFei6FZLf
	G1v7mQUgTptwXQOorAhU4ZJk6uoK4C6efBUGJuSSMAW+9LwDA65lAhe7BLSk1GcozF7A+h
	ZlAAYWN/CSrxWHeMBVbf0yTx1gerVfh7lptz5Ry5V2dWHSqH2M2TME6HCKkyYogti0sP2G
	P6tZEdTPnz+Ch4F3lgRI/UyLbXCV97/qFf8eP3ybFVgQsdVbUJOJHabtbAoOaVU3QyEflS
	7DG9IaKYRC6xXbioku99cIA+Ibmq04T5oJ9d97OkF/WEyLWHLQ4myVt0QjtBUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NLji6Amx+w4gkoyKP87sApLv4hbvr/R4BbROA9mF7Qw=;
	b=eVLtN9AWbevcPEHUTybrUg+PUlahm/LpMjWb5A6zQ6iJSsUcLh5Op7xSCyS6qNu2Uawows
	K8JJTt0JPIDm1MBg==
Date: Fri, 27 Feb 2026 07:44:35 +0100
Subject: [PATCH v2 09/15] random: vDSO: add explicit includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260227-vdso-header-cleanups-v2-9-35d60acf7410@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=844;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=JcvE3kQiMg07X05oSReGQNnDSkDG6pLjGh3SaRJFDSk=;
 b=RZXvHH2HxCYtijPWzFmGuHR3sRa73ICHOAJnT8sgpwEldcg8giFkj0QCEeXbaQyeRwjE8NIZG
 3G4L52NK7P+AtsNoMk77ybqM5aiSaWAXCceP66bohc97O91JdCE0VU8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_224454_276732_5B34B22A 
X-CRM114-Status: UNSURE (   7.95  )
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
Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 lib/vdso/getrandom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/vdso/getrandom.c b/lib/vdso/getrandom.c
index 440f8a6203a6..7e29005aa208 100644
--- a/lib/vdso/getrandom.c
+++ b/lib/vdso/getrandom.c
@@ -7,8 +7,11 @@
 #include <linux/minmax.h>
 #include <vdso/datapage.h>
 #include <vdso/getrandom.h>
+#include <vdso/limits.h>
 #include <vdso/unaligned.h>
+#include <asm/barrier.h>
 #include <asm/vdso/getrandom.h>
+#include <uapi/linux/errno.h>
 #include <uapi/linux/mman.h>
 #include <uapi/linux/random.h>
 

-- 
2.53.0


