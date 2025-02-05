Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F48BC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ud/6FVtqd5QSxi6h68q4ylRmVchH4WGNaP1Qprw0zWI=; b=c61cqUMPIWqATRCYYw8OVA5HGw
	XXGScT0FsM8nHtD1rW2U6DhmglM6VQZSfk025Kpq/6kic4ZjN+G0FNFdTYcGXZxFb5+hj/yGgxWGl
	qx8Tj6U2Wx1tSj3ytx/BmiFn1R0Hvg1iqNRta1st9O6rSlgSORaCCBaRFuVF1iu4SozV+FuwpkOrm
	QGUU3P8PU9rfGSM5KiDWN6VnTEy2VhEV0P1x1HHt89bRds1c2qt3RgoknG4sW3Xo1SsEaqi4TDFGL
	fr4vvwD40zjNVIOLzTLSVrMVSIiJ7nPpy5NYEK0Z94XxutGaPEA03E2jW1ZTfyMkmFD+/aa+E9l5Y
	3MZrgT/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeHe-000000039Wg-0o0h;
	Wed, 05 Feb 2025 12:13:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfeGH-000000039GM-0UCQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:12:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E114D5C5C58;
	Wed,  5 Feb 2025 12:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BBCC4CEE2;
	Wed,  5 Feb 2025 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738757527;
	bh=GpkwFNg5/6LmBREM3eLpvMeWoLhkjuVeBNbukdiwObk=;
	h=From:To:Cc:Subject:Date:From;
	b=H4nPwlC78ZmZC/hg/2dSZhmENcfZPzyV6fz4Q3YouKEfT4I36us1ZOI2pXR1vE6sr
	 fZwqWui2BGUTOjktM3/Z72PvUM/3Xjk7mfbxyqhSRQrmGyUA5P8xJD1ef90SiK97NV
	 h9O7jkRoaZXDA2a3/xDX6YczbmmmDj7CLvCEjEsQdFaFDhLIaHuWJZ62aV5nPDaHKo
	 0REebMyWjgnWHXW8Rl1nvcEsPUJuGZqJ9N9+NEJ0begucrwIlgQOBBfwmvXh7cnpHK
	 nYuMs99efG+xOx+rLQvOvec/67IgJctV0MVyMEwqeQreu6x0EFS6MBH6LH4bChAcom
	 uENutqOQ990CQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Tony Lindgren <tony@atomide.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
Date: Wed,  5 Feb 2025 13:11:33 +0100
Message-Id: <20250205121151.289535-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_041209_199549_A2DC90CB 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Arnd Bergmann <arnd@arndb.de>

When GENERIC_IRQ_CHIP is disabled, OMAP1 kernels fail to link:

arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.o: in function `omap1_init_irq':
irq.c:(.init.text+0x1e8): undefined reference to `irq_alloc_generic_chip'
arm-linux-gnueabi-ld: irq.c:(.init.text+0x228): undefined reference to `irq_setup_generic_chip'
arm-linux-gnueabi-ld: irq.c:(.init.text+0x2a8): undefined reference to `irq_gc_set_wake'
arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b0): undefined reference to `irq_gc_mask_set_bit'
arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b4): undefined reference to `irq_gc_mask_clr_bit'

This has apparently been the case for many years, but I never caught it
in randconfig builds until now, as there are dozens of other drivers
that also 'select GENERIC_IRQ_CHIP' and statistically there is almost
always one of them enabled.

Fixes: 55b447744389 ("ARM: OMAP1: Switch to use generic irqchip in preparation for sparse IRQ")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
index a643b71e30a3..08ec6bd84ada 100644
--- a/arch/arm/mach-omap1/Kconfig
+++ b/arch/arm/mach-omap1/Kconfig
@@ -8,6 +8,7 @@ menuconfig ARCH_OMAP1
 	select ARCH_OMAP
 	select CLKSRC_MMIO
 	select FORCE_PCI if PCCARD
+	select GENERIC_IRQ_CHIP
 	select GPIOLIB
 	help
 	  Support for older TI OMAP1 (omap7xx, omap15xx or omap16xx)
-- 
2.39.5


