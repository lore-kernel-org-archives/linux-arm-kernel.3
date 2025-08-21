Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F953CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 03:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckVbPKieyAfUXdKWCFU994i5sF/h3xmTbQ2d85yhOkU=; b=dyOygpoJ0qRH4NXkqvRVDadAVL
	u5rFRYbfdmQ+3r+OiQVERTmwsxQadt24pby0t/Oy0rcZlxaNb6tC7k6PsbzGZzVXJ3OZc1GzwUbDb
	55u4KB9jdvhg0n4Ji7z8lh3RRQMGvbziZyjkSN+prDVT8yVT6U1uFX6dLDBd/H5yUedinzjzJBE8i
	Um4SYb9TfY4d4MQz1WCCe0xtr/SCuMVZomZXsaprPILjHiNKmEwq4stIjNfKY4VaskKzeCv4E9S29
	E9OK/EV1uT/ReJsTrrKKckWi3bix5zuGj1R/UHmV/5BX7Z+CGONDtCMYcLG47yolO86cjUr7wsyhD
	SiQ94PcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upIIe-00000001Ma0-0KR8;
	Fri, 22 Aug 2025 03:18:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCdg-00000000drP-1EXW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:16:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE312A586E2;
	Thu, 21 Aug 2025 21:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47012C4AF0D;
	Thu, 21 Aug 2025 21:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755810962;
	bh=7CiDzOmiuSVjS8lOEl7Pi4ckMf1acrF1U6d8qioo+Vg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HXBiLczjaeUeNSpkYM98BJ5W2kwcQy/QP2xsz/ayEUXJNaIDObI/8mLoaAbd7vyKQ
	 qNDWMFZUQ9/Xd1WfYbKBAuWfFJhymBx/63CqFwDTcBng3VrzfUjEMSPrYanx3tSEI1
	 YgGYsRhSW8DxDCBrIDmS79dC+f907Gojl83qLX/2CzIuXplbE5dJc1PORbBKhThJVQ
	 PNtPjf87diIINFAG8vTcmZ7Xt1gvIrDg1H3IpHiYrubdjIaO6//EaGBzH9yGf/yEQ3
	 /7MJmbUMbjDAKW7MkKAA8neDCdmQtk35c1bwnpFYBz4IrUzUdFcHN4kj5XeexBgr8y
	 phmv+PUlADBgA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 21 Aug 2025 14:15:40 -0700
Subject: [PATCH v2 03/12] ARM: Clean up definition of ARM_HAS_GROUP_RELOCS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-bump-min-llvm-ver-15-v2-3-635f3294e5f0@kernel.org>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1536; i=nathan@kernel.org;
 h=from:subject:message-id; bh=7CiDzOmiuSVjS8lOEl7Pi4ckMf1acrF1U6d8qioo+Vg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBnLe5oUZicnzd4+QThQ+9wcffWTvR1uBbqai87HRis+L
 SrYKWLTUcrCIMbFICumyFL9WPW4oeGcs4w3Tk2CmcPKBDKEgYtTACaSq8jwP7hK74Jc5rw9hwzP
 L8j9vNH4zpY9evr3vyvceW+9SyOy6yTDX9mWbr7obQ/nrth3JmtBxM/oGdPXXT/TNCs7rjTJQ19
 cgw8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_141604_402682_5AD8A4C4 
X-CRM114-Status: GOOD (  14.23  )
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

Reviewed-by: Kees Cook <kees@kernel.org>
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


