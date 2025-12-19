Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5D1E66880
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 16:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01cMqftZsswJxQ3FrQQhcZuowTNtnEI5y+kOuc6pxjw=; b=r6eoBlOyk6+ppzTBcwtcVLnEgy
	6yLZIITNfdqP7L2gVs0WPMsS6dNe9CqZ34cU8AQKgpYrW1v4Yg6JM9s5j1IJ/mtSbi57kdfD7fZmz
	QimSnSN5gMLwVWfww2zAr61r2KPmkiISnMeDhgABuDGvEOrq7Bjq0s/1mbx+kzwWeS6OVjKK/c16k
	mkT4tjF9Y2p5lKR9S8SMFlueD9jKkiFxyolU1smZieqbrROoESn+gCsGB+SqwCQr9stKpTdgUPMYW
	cK3/Wl1U2L5wMwmBTFZMet1DtNsTpSoqtW7OwTi0WnDIa9Ll3mjhCqUptUZh7n76zOihziw+TzIU1
	WAdpG6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWd9v-0000000Ad94-07vD;
	Fri, 19 Dec 2025 16:16:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWd9s-0000000Ad7u-1C5S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 16:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 030AD41A3A;
	Fri, 19 Dec 2025 16:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE9ACC4CEF1;
	Fri, 19 Dec 2025 16:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766161007;
	bh=47hL5I2ijXMcmF1JU7EI3Nhpa9ZQCp3egcgt0wmJuoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cu2dCyJigvnIJ4mGAhXUE+8LQLSdMxxsf9j1n6iwtD4VW3+uKb8f1+ydeAa7BQ8zQ
	 S+h9zdfukpR/1sKyw8Nv2b86nr52SGY6JZoNsmB5Wlxv/HpNKUZ1oXRuc0+whL4nPQ
	 n8M07pw863419mdts5E4xVdf+QQ2GL+hgz0UuwBsKdv5/oe1ChTaWfxhmL2BLv8sjy
	 7Ck7DTgFi+BX8xgYCywqy7IxdyCa5XadbES2il8LMaf0eu342WX+CZTNt8Tb22655s
	 bKaqIzztqrF73J1cLSW9sVWu65aIlAguqbxhWwd5aHrU7UWeTQGhofmrZ2lJaFtSVA
	 ZF79v11xxcRBQ==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-mm@kvack.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthew Wilcox <willy@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 2/4] ARM: add CONFIG_VMSPLIT_2G_OPT option
Date: Fri, 19 Dec 2025 17:15:57 +0100
Message-Id: <20251219161559.556737-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251219161559.556737-1-arnd@kernel.org>
References: <20251219161559.556737-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_081648_351783_CC7169EC 
X-CRM114-Status: GOOD (  15.31  )
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

Unlike x86 and powerpc, there is currently no option to use exactly 2GiB
of lowmem on Arm. Since 2GiB is still a relatively common configuration
on embedded systems, it makes sense to allow this to be used in
non-highmem builds.

Add the Kconfig option and make this the default for non-LPAE builds
with highmem enabled instead of CONFIG_VMSPLIT_2G.  LPAE still requires
the vmsplit to be on a gigabyte boundary, so this is only available for
classic pagetables at the moment, same as CONFIG_VMSPLIT_3G_OPT.

Tested in qemu -M virt, both with and without HIGHMEM enabled.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 7c0ac017e086..921ea61aa96e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1009,7 +1009,8 @@ config BL_SWITCHER_DUMMY_IF
 choice
 	prompt "Memory split"
 	depends on MMU
-	default VMSPLIT_2G if HIGHMEM || ARM_LPAE
+	default VMSPLIT_2G if ARM_LPAE
+	default VMSPLIT_2G_OPT if HIGHMEM
 	default VMSPLIT_3G_OPT
 	help
 	  Select the desired split between kernel and user memory.
@@ -1026,6 +1027,9 @@ choice
 		bool "3G/1G user/kernel split (for full 1G low memory)"
 	config VMSPLIT_2G
 		bool "2G/2G user/kernel split"
+	config VMSPLIT_2G_OPT
+		depends on !ARM_LPAE
+		bool "2G/2G user/kernel split (for full 2G low memory)"
 	config VMSPLIT_1G
 		bool "1G/3G user/kernel split"
 endchoice
@@ -1034,6 +1038,7 @@ config PAGE_OFFSET
 	hex
 	default PHYS_OFFSET if !MMU
 	default 0x40000000 if VMSPLIT_1G
+	default 0x70000000 if VMSPLIT_2G_OPT
 	default 0x80000000 if VMSPLIT_2G
 	default 0xB0000000 if VMSPLIT_3G_OPT
 	default 0xC0000000
@@ -1042,6 +1047,7 @@ config KASAN_SHADOW_OFFSET
 	hex
 	depends on KASAN
 	default 0x1f000000 if PAGE_OFFSET=0x40000000
+	default 0x4f000000 if PAGE_OFFSET=0x70000000
 	default 0x5f000000 if PAGE_OFFSET=0x80000000
 	default 0x9f000000 if PAGE_OFFSET=0xC0000000
 	default 0x8f000000 if PAGE_OFFSET=0xB0000000
-- 
2.39.5


