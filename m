Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A076C44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 22:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNdlD17+le7OWabglfycXZnoWKec0Rc5Ynf/AvD7l74=; b=MA7NelqGxxtkWf2sfJUo7SStjz
	RS390SDpVKnWxznYNrAiySJMvRzAIaFPE+8n6z0UDX33L9sOfLXz7Wu8W1oCq5PbM4D2xTXUVc1tt
	GlH7esIonYrUx5yGLvyWYCsctNJzXcMtoxprSb9MPP/XNHV8SBHaZeZelpdCG5iDfVWhWu6K/HNIM
	R8P5SFRTHEz/Hd5PhW5e3+xfVbqr8JfkzMzd4wbhmHdqYchuYnKWS2VyvHhMQ1Z7Qc5ceJ731/0vK
	hlcRa7yR6Vh9gk99ykbRJVjJb3ibgxtbNtXwgxxHf78E/lc2Wu7BRHAZygwHDO5HNK0ucCOeAtObY
	DLianuRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whahY-00000000XSs-0qII;
	Wed, 08 Jul 2026 22:25:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whahW-00000000XSA-3gzz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 22:25:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 98F4F43D3F;
	Wed,  8 Jul 2026 22:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 489941F00A3D;
	Wed,  8 Jul 2026 22:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783549506;
	bh=fNdlD17+le7OWabglfycXZnoWKec0Rc5Ynf/AvD7l74=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=D/VUTdBUOnQaqVvY1CC8TphDejeuhGNxErlCIBHLnXRz/hxabGV+Qrc4TrwI7D5x+
	 XyidImsDnRXNXcdm5CBBnYCiuEBXPR1k3THmMUoVkhnZ/kQhq4VqqNBDjUQEB0A+17
	 ZptIE3NKrsjuW7KK0Xk4JGAf7EaXOv0KAjn5IYwvkwbJNkZSbEgYUhai8Qc6Hk7kI0
	 7UrKH5eTtrZW7iB8s3Zb8C0kdPfsThBXQxiGhEsi/p217SX+8jRChaXummaw+ZVV21
	 HcW3/5WVXMgcXkTWo8uen17F8DPWrQFtMG0v6NljT+jatCNai9bOjg4TtME1NIj9Fa
	 TUOYDhdXLm2oQ==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 09 Jul 2026 00:24:56 +0200
Subject: [PATCH 2/3] ARM: ixp4xx: Relax endianness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-ixp4xx-little-endian-v1-2-e9622d0ba9e4@kernel.org>
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
In-Reply-To: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
To: Russell King <linux@armlinux.org.uk>, Imre Kaloz <kaloz@openwrt.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
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

The IXP4xx can now boot in little endian mode so relax the
endianness requirements.

This will make IXP4xx compile to little endian by default
like everyone else.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/mach-ixp4xx/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-ixp4xx/Kconfig b/arch/arm/mach-ixp4xx/Kconfig
index cb46802f5ce5..2bc8a497d318 100644
--- a/arch/arm/mach-ixp4xx/Kconfig
+++ b/arch/arm/mach-ixp4xx/Kconfig
@@ -2,7 +2,6 @@
 menuconfig ARCH_IXP4XX
 	bool "IXP4xx-based platforms"
 	depends on ARCH_MULTI_V5
-	depends on CPU_BIG_ENDIAN
 	select ARM_APPENDED_DTB # Old Redboot bootloaders deployed
 	select CPU_XSCALE
 	select GPIO_IXP4XX
@@ -12,8 +11,8 @@ menuconfig ARCH_IXP4XX
 	select I2C_IOP3XX
 	select IXP4XX_IRQ
 	select IXP4XX_TIMER
-	select USB_EHCI_BIG_ENDIAN_DESC
-	select USB_EHCI_BIG_ENDIAN_MMIO
+	select USB_EHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
+	select USB_EHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select USE_OF
 	help
 	  Support for Intel's IXP4XX (XScale) family of processors.

-- 
2.55.0


