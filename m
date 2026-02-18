Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A070AE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lkO5yMEm0Wr9HgnHCT+xP0LavZhXIC+u9hu6Ibos1g=; b=FIwAaoHeeXZTs0U25u7D2BTq2P
	ZkcvMglxCp5+nJGSOnWpJU2wyr8DWNnXhFI5CeQTTfM8G6XHTsJY9TWnrqeCM5Icqz24j97179tcl
	FePnkbYdcF2Z6HkQYJDFlB/EIww4UA0Ey+Hv5rgixyUeJjy2CWXK4/BOSwO8gxZTfA1Dtgs8dmLld
	xOEEa7AchaIAe0Az60MtZ/cNA9/zK/xC7tTcDS4T7nDKT6OUDeVBm3Bmj619bQlrO/D4nQmOk3/ke
	naWHY2OwwdT0cB10fAPp0LzsLGdQQeHOQRgUJYYKguFcPc1IRuhKiHhAn1Ntqgl+C7aWL+MoNM+dt
	N/GAFA7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdu2-00000009YPv-1wHs;
	Wed, 18 Feb 2026 09:31:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdu1-00000009YOi-1INy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:31:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B23736132F;
	Wed, 18 Feb 2026 09:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C28C19421;
	Wed, 18 Feb 2026 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771407054;
	bh=fW7DvfGweCHdA5mDWSKwIZ4AomxWRVitUg4zv46c/qw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tkA1xaJDfxH4fQjqwHxfAQIca92VRC/hYLm4IZkNGqXQBEpvo9zVqFEbYcpxOnL2y
	 9ToJ0ZFZOoBP5xRwcSOQXo1vard8etcEe+MaF0/3Lna648Gg+ta+KbdRDl0LU92MHE
	 EoLRjrlVzigxXdnSy+uLTiuzQUyTnSbsqR5I5Gj06dgHaRRxefT/fdQiZOZIjzdKoy
	 C5MkSx9E1lbXSxFgvQVe5YdZOOQE+ahuUHffCmwHWFodKyLkerTXSY7QlHuhRHuNlQ
	 vJrSIvqxk7fRNSKsL53ZDDyJ24alJ944wiFJMb+lkiIB4H4Lqh0NFuaaBj+0xvPNfd
	 lUB3unEOFCjGA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Feb 2026 10:30:48 +0100
Subject: [PATCH v2 1/7] ARM: dts: bcm6878: Fix PL081 DMA block IRQ
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-bcmbca-i2c-dts-v2-1-5373ef82c50c@kernel.org>
References: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org>
In-Reply-To: <20260218-bcmbca-i2c-dts-v2-0-5373ef82c50c@kernel.org>
To: William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
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

SPI_TABLE_OFFSET_2 is 96 in 6878.  96+30 = 126.
Convert back dtsi SPI interrupt 126 - 32 = 94

Reviewed-by: William Zhang <william.zhang@broadcom.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm6878.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
index dd837bf69390..5a37bfd7f53f 100644
--- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
@@ -244,7 +244,7 @@ pl081_dma: dma-controller@11000 {
 			// The magic B105F00D info is missing
 			arm,primecell-periphid = <0x00041081>;
 			reg = <0x11000 0x1000>;
-			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 			memcpy-burst-size = <256>;
 			memcpy-bus-width = <32>;
 			clocks = <&periph_clk>;

-- 
2.53.0


