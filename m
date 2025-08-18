Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4556BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 19:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uJorF8EfRjxYK/NCeeslezwPgPXN8yJL5t9z/DTZ3s=; b=BvC9Fvx47PZZUn26lKUXXN1/HG
	BrkBwmSHDME6qGPNZo7waVFKFERMA03dC2v7Y7REOQLP4cYJDIsx1PX0KubnzTYqPyQhMYOwVQR2O
	yF/53CigSQbbB+GUCa7dl96CL0KozslIz7aQw/mBL1cgUQLAiF4Js1tsid0rDEG7d5drtxtAcSjys
	M5TdQkVlPQRH5m+iZFxqGzXPxV3CLgAjSGbuOa5Qx7ulKb91F3eauuglaYTJO/zSpVV2pmzWnxtMU
	714c8eL0m+I5FymmARLTpoW4IO9wOf9ubWWwh/mgaboxZb23qqwUXHLYRmYysI4Bwd0TNNDW/8dSt
	1U5k8slw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo60F-00000008ZbO-16NB;
	Mon, 18 Aug 2025 19:58:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo53L-00000008Qgw-2O6E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 18:57:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C80C845FC3;
	Mon, 18 Aug 2025 18:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A1FC4CEED;
	Mon, 18 Aug 2025 18:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755543474;
	bh=FsJkJ+dK2Mbqz7R/o/xHg+jFYwje/hGODWlWxFEWQd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pxfcfoHuvfdZOXGw6PaOpZbjt8DfpzAEDJed6zxAIM7/4qrqY57Ezp9XtDzvyQ8et
	 w7+KdLvIiw5mhThNnc6NlYOjhrQi4P0Te2QSH00ffH8OpUV6xoxRHlieMKkhZk9kv5
	 j/Tg/i+YNAkVd8Ne1LzfWiVcuvuXWdKsPfuw5laC2mxpnKbLdMjoj+5QPBevN4Ghht
	 TzTZkhisZtZfGu/vqY7oR50HWkm0d08NGid19K1h0gANHRszQTsPEJbwbXfyz5veEH
	 riiHG9jKCmH4ZYiwHs5fx+5hyDGxJHR9Tr5D2ORg/UjWja4vHP0oYqTUqfuLaFEfRe
	 MfmxcZMrrzz6A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 18 Aug 2025 11:57:19 -0700
Subject: [PATCH 03/10] ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-bump-min-llvm-ver-15-v1-3-c8b1d0f955e0@kernel.org>
References: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
In-Reply-To: <20250818-bump-min-llvm-ver-15-v1-0-c8b1d0f955e0@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1494; i=nathan@kernel.org;
 h=from:subject:message-id; bh=FsJkJ+dK2Mbqz7R/o/xHg+jFYwje/hGODWlWxFEWQd0=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBmLyxce0nhsHlVV1TyzyTr6yp/Lrk7FnMIMqtktcXc8J
 qz8cmFiRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZhIyQyG/25nj3ry3GHaIv+Q
 9VPs++8y+dpN93bvsWpwCihZ1cWw7zQjw5ZTCW0cDjcSGue9WHn/6tv60u7lCxNKClVff7X98XA
 eJxcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_115755_629029_3EAB056D 
X-CRM114-Status: GOOD (  14.43  )
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

Now that the minimum supported version of LLVM for building the kernel
has been bumped to 15.0.0, the first depends line of
ARM_HAS_GROUP_RELOCS is always true, so it can be safely removed.
Combine the !COMPILE_TEST dependency into the 'def_bool' line and update
the comment as well.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Russell King <linux@armlinux.org.uk>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/Kconfig | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b1f3df39ed40..faf83015b961 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -166,15 +166,12 @@ config ARM
 	  <http://www.arm.linux.org.uk/>.
 
 config ARM_HAS_GROUP_RELOCS
-	def_bool y
-	depends on !LD_IS_LLD || LLD_VERSION >= 140000
-	depends on !COMPILE_TEST
+	def_bool !COMPILE_TEST
 	help
 	  Whether or not to use R_ARM_ALU_PC_Gn or R_ARM_LDR_PC_Gn group
-	  relocations, which have been around for a long time, but were not
-	  supported in LLD until version 14. The combined range is -/+ 256 MiB,
-	  which is usually sufficient, but not for allyesconfig, so we disable
-	  this feature when doing compile testing.
+	  relocations. The combined range is -/+ 256 MiB, which is usually
+	  sufficient, but not for allyesconfig, so we disable this feature
+	  when doing compile testing.
 
 config ARM_DMA_USE_IOMMU
 	bool

-- 
2.50.1


