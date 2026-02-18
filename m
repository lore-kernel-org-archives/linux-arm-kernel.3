Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D403E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwbYGCCd+bxGXa7zYVP/dJAP8SrwzALdFw8YTIVAygg=; b=HJY4GhDgcwyyNckzC0zd4lIkBE
	iZ2ap/Ec0IiDXqt4xjLpVJICYEa4eUjihR+1+ZQKKpv/CbRf0nQbQl/0ZR8o7+kei9Yxt2F7R8Pw9
	pqXagQ+ofDcubHXhZGc/RBE+vb52oxxV4t7HBQ9PCsqZ4/CiHZC1Sz5Sv+aueXXpBYw3RPmM0IFJW
	WM0ylacov456n+sykJkavngf2aPco38j2XZi9wK9AYNQqNV4PuFDoZ0Wh9pOEouvbySRyMQB844sc
	vfwdFSLqEbsusB74vRbSteo1r0Hv4fa1moDJx2Y5FSlGR3CucpvVDx8VozvXPi7gCLoUXfHKVvQyh
	DMiKqJwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdta-00000009Y6c-1ZeB;
	Wed, 18 Feb 2026 09:30:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdtZ-00000009Y6G-2Oyl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 09:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 988B660018;
	Wed, 18 Feb 2026 09:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF56BC19425;
	Wed, 18 Feb 2026 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771407056;
	bh=dkIJ6OAxESM1yng0K03FEndz5r4APXbZ/k+XRDm0D4I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iHASCSvXQj6t8Jpwx7qKKIQSXUK+xnrYxttTPrh9WUdaijuYufWYd+H1tdSqvlFEm
	 B81g37stkSXFzoYLsFS3XvCqql+DNABR59YtyftEv4D0PXe3cv+zCI7YTW27ujEiS4
	 qk2KZoST3qrpDa4JqixfAc+aNzFi6jegsDDIf/Fmt4jxOqEdMDcES7XWmwmbOIwHE/
	 zc6makkYOWDHQs0voVKz+W3HIwaLho3LsmYl6WUH5vAExwpmHRZmc3YPfHgdmOlH4i
	 +JRIDmx2jmA9UKBNXFQSl2IqAL9Ldyge6Kr9AQG7RGBIN5lS6ub36Jo5cv6jJ+riiv
	 rcU8T8RETUlkw==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Feb 2026 10:30:49 +0100
Subject: [PATCH v2 2/7] ARM: dts: bcm63138: Fix DMA IRQ
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-bcmbca-i2c-dts-v2-2-5373ef82c50c@kernel.org>
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

INTERRUPT_ID_PL081 is (ISR_TABLE_3_OFFSET + 23)
which is 96+3 = 119, convert back to SPI interrupt
119-32 = 87.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/broadcom/bcm63138.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
index 4ec568586b14..8e41c7130406 100644
--- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
@@ -317,7 +317,7 @@ pl081_dma: dma-controller@d000 {
 			// The magic B105F00D info is missing
 			arm,primecell-periphid = <0x00041081>;
 			reg = <0xd000 0x1000>;
-			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
 			memcpy-burst-size = <256>;
 			memcpy-bus-width = <32>;
 			clocks = <&periph_clk>;

-- 
2.53.0


