Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DD5C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 21:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2O9616h+49gvHFrer0109b8cG1XSWh7LoELVF/b9KT4=; b=ICZuEecRqCK1+lvtOXKdRhZTAz
	rHOUgZ771ZU8JKpzLtRuqCJkp7R8aiSTEbyapOIMfB8RZWpoPRcpMMolBFAj65zMm9msAKc2II9Rh
	zjdbutX57CHNBn1AJf8R62cB5ZwejbSq/vFZg3BR5cVeaqweRKYbqMQ0+fH9ZbGbIfc+3sbrnzJz6
	VoCnqrOkVjJfoag1M3m1KpqJS9ugrxhrUxpes/ty4+pF8y20DZxnEvdOLPb7IBGQE23LIe/pks+Wy
	ww5xe5v5jkVZGNsLsDfR9Uzq16qEyborCacUY+RFWgjgplRZ2tEAH7O3Kczo+XIaTPesuyzOYTk0h
	ZrHNNj0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twpSH-00000004KeM-3Wny;
	Mon, 24 Mar 2025 21:35:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twpQX-00000004KRV-40A5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 21:33:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 324ABA4A56E;
	Mon, 24 Mar 2025 21:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E792C4CEDD;
	Mon, 24 Mar 2025 21:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742852025;
	bh=gvtFPg92j2IlNK8PyXb1c01xAnOHXBZXWy56YSAh8MU=;
	h=From:To:Cc:Subject:Date:From;
	b=Y6pVrZkQAtvmJocHyy54S2VCSV3ZGRX8VbOEXfG/dzt1tQG24+aO06QhGrhxge1tD
	 z2qMP3Qw5ZeQmpA08VMCzUpqtd7aHYGVnYSRN3xaAR1r0kq9iZ3a9MAOAjSWK/LeTT
	 OQa0yZqh2ckTV1iqVyRxVenL5bSMgHNP11arZio8bPwR7MiBXHXZ/9KdHE1MtFqv1i
	 sn4lhcgfXa1CfOGdgG8cjEWQbNUUTuvT8Yg+WTtjD5n5vnq6QwMWXb+EnOpnwr99oR
	 +TG0Asp+c3cz0ECo6xkKiLagDOHncYLU8ROjjmsxHZ1xqTDzw585CC9iIdNyTdWwd7
	 TTlBv3uQdnr2g==
From: Arnd Bergmann <arnd@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Stephen Boyd <sboyd@kernel.org>,
	David Lechner <david@lechnology.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	David Lechner <dlechner@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: davinci: always enable CONFIG_ARCH_DAVINCI_DA850
Date: Mon, 24 Mar 2025 22:33:35 +0100
Message-Id: <20250324213340.4129384-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_143346_060983_4C77E444 
X-CRM114-Status: GOOD (  10.28  )
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

A change to the clk driver broke configurations that enable DA830
but not DA850:

arm-linux-gnueabi-ld: drivers/clk/davinci/pll.o: in function `__da850_pll0_of_clk_init_declare':
pll.c:(.init.text+0x30): undefined reference to `of_da850_pll0_init'
arm-linux-gnueabi-ld: drivers/clk/davinci/pll.o:(.rodata.davinci_pll_id_table+0x14): undefined reference to `da850_pll0_init'
arm-linux-gnueabi-ld: drivers/clk/davinci/pll.o:(.rodata.davinci_pll_id_table+0x2c): undefined reference to `da850_pll1_init'
arm-linux-gnueabi-ld: drivers/clk/davinci/pll.o:(.rodata.davinci_pll_of_match+0xc0): undefined reference to `of_da850_pll1_init'
arm-linux-gnueabi-ld: drivers/clk/davinci/psc.o:(.rodata.davinci_psc_id_table+0x14): undefined reference to `da850_psc0_init_data'
arm-linux-gnueabi-ld: drivers/clk/davinci/psc.o:(.rodata.davinci_psc_id_table+0x2c): undefined reference to `da850_psc1_init_data'

Select ARCH_DAVINCI_DA850 unconditionally to ensure the driver can still
build.

Fixes: a31b4dcf188c ("clk: davinci: remove support for da830")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-davinci/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kconfig
index 3fa15f342240..8f66de0405d9 100644
--- a/arch/arm/mach-davinci/Kconfig
+++ b/arch/arm/mach-davinci/Kconfig
@@ -4,6 +4,7 @@ menuconfig ARCH_DAVINCI
 	bool "TI DaVinci"
 	depends on ARCH_MULTI_V5
 	depends on CPU_LITTLE_ENDIAN
+	select ARCH_DAVINCI_DA850
 	select CPU_ARM926T
 	select DAVINCI_TIMER
 	select ZONE_DMA
-- 
2.39.5


