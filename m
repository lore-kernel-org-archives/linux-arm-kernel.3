Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68027C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FaSMl/x9dV8lcufKDJbNAHnr+I/Njcbj01AW/02xFuk=; b=bnE8rKzMj5eqVNHkEef/fzb3Nz
	hIGgmxXkoY+7E71k7IcUY5lW/OCZ/RrBYzFl2kndYffgZRLJHa0repGtvCn2H4IrJkQYJjUolCzU8
	UYhrNtpCWha+g7281LuEN5vpTiMSoqnIlwzQLZ59Hj+CI/rUmR9BtFfjxwMW/vcHOtFJKN46UdG9x
	oKuqP2SD4UrNgYczsjW4e/GqbIf+Mgoe1EC8rtMeaDbHTyg8WqIEXLf/K2PmJqTscbsejp7ly40ip
	tTy17fwNxabfex7X2rHnfpq3Zifj7Dng2fkDxLSsaIqXcv7sTA8uqrZQ64sf25FRj5BYf9uhFSOzT
	pYQRnAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5fo-00000006qO6-0nLd;
	Tue, 11 Mar 2025 19:53:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5WD-00000006o2u-0pGQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:44:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCFDE5C687D;
	Tue, 11 Mar 2025 19:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78599C4CEEB;
	Tue, 11 Mar 2025 19:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741722240;
	bh=cNLHeDWhNyuM27QisQzqNRVewktto9osrReTHyq97VA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RUfCh8LFZAR1jrtj67BqPaR1pjNlhFuBgUAd33xLzramO4/RhD8AEmQEBIdvMvjSo
	 xGD+pwSHL++SvRzjowVlHKaIoCJ0FUbTd0+euSY7qtAqYLeFIyqisGI4wrz+ejdRyZ
	 wQsjQIpzEoli4pCT/loUhei80hGmkepKSNxEGM09vV2acQPRz1wObKDYxhg4nu7AUP
	 rHzlNdp4blgcv6t5LfJkAVH+zIySMMQ49U7RSnPvjBP0v+mnqqBGG7UOvfEefwnA8n
	 2h3h37Cu6OpQ3vEuQpXJpufgYwUt+KgA8IjvrsYcdMLBOrhy0tM2h9qvF40YdXEuqy
	 Ho50mpnsy8Hng==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 11 Mar 2025 20:43:43 +0100
Subject: [PATCH 2/2] ARM: add KEEP() keyword to ARM_VECTORS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-arm-fix-vectors-with-linker-dce-v1-2-ec4c382e3bfd@kernel.org>
References: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
In-Reply-To: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Christian Eggers <ceggers@arri.de>, Arnd Bergmann <arnd@arndb.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Yuntao Liu <liuyuntao12@huawei.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1474; i=nathan@kernel.org;
 h=from:subject:message-id; bh=k6KErdk8UAE5TaS8j5kgByd6cy02OSxvuL6oLJYcWN8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOkXJlWmLj/rWPU569kZZ8NOjq9mmuvOy6dP1zrzJzfJ2
 GJuhSpTRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZjIvMsM/wuTIu94La9+fE1B
 Zfob1eNpEQ5JKtozw4PKGxaVqZz5oM3IcKfYh0GqM1Kv4M7Fyr9fdVL9so0+LdlTYiT8eEv99Hp
 FNgA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_124401_296252_B0144544 
X-CRM114-Status: GOOD (  10.58  )
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

From: Christian Eggers <ceggers@arri.de>

Without this, the vectors are removed if LD_DEAD_CODE_DATA_ELIMINATION
is enabled.  At startup, the CPU (silently) hangs in the undefined
instruction exception as soon as the first timer interrupt arrives.

On my setup, the system also boots fine without the 2nd and 3rd KEEP()
statements, so I cannot tell whether these are actually required.

Cc: stable@vger.kernel.org
Fixes: ed0f94102251 ("ARM: 9404/1: arm32: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION")
Signed-off-by: Christian Eggers <ceggers@arri.de>
[nathan: Use OVERLAY_KEEP() to avoid breaking old ld.lld versions]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/arm/include/asm/vmlinux.lds.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/vmlinux.lds.h b/arch/arm/include/asm/vmlinux.lds.h
index 0f8ef1ed725e..14811b4f48ec 100644
--- a/arch/arm/include/asm/vmlinux.lds.h
+++ b/arch/arm/include/asm/vmlinux.lds.h
@@ -131,13 +131,13 @@
 	__vectors_lma = .;						\
 	OVERLAY 0xffff0000 : NOCROSSREFS AT(__vectors_lma) {		\
 		.vectors {						\
-			*(.vectors)					\
+			OVERLAY_KEEP(*(.vectors))			\
 		}							\
 		.vectors.bhb.loop8 {					\
-			*(.vectors.bhb.loop8)				\
+			OVERLAY_KEEP(*(.vectors.bhb.loop8))		\
 		}							\
 		.vectors.bhb.bpiall {					\
-			*(.vectors.bhb.bpiall)				\
+			OVERLAY_KEEP(*(.vectors.bhb.bpiall))		\
 		}							\
 	}								\
 	ARM_LMA(__vectors, .vectors);					\

-- 
2.48.1


