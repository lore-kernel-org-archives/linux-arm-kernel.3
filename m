Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FE1C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 22:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fiPjcCfrZDpkJa9XggDDghz/xr0MLnU4sclLIpuyUTI=; b=dVf2ei61oqdxNQCqgjA5a5wOIi
	iASyN9HEi4KH6xqOsRKv0fatT1y4j36YtEkJGdRfkWfjRoDpSeJt9jhwD0+58C8uVdDCAk75/mpmk
	QW2cqYYsq04c6TORfiVBpteXMnQV8QttAEezqtNCyYmqFtt2LMeg0l09LHYw0rFKzbxbSI79GKGhk
	NvjYG0fsaL26Be1VtOm+E4kobjqIZo/BHQcUIbwJy//xIfEEnE6EhdPvK+EpJ+s9HiJRKseUOf59i
	U9CzxFHWIy5MsNdBQdrqGxe75D9F8qu3z+MzvvEPDHwJP9QDwnXeShv8PO5KSyfQkOOVlCF5LzHZV
	KBOeqXWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6xnY-0000000ABzh-3EWU;
	Wed, 16 Sep 2026 22:08:12 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6xnW-0000000ABzJ-3uKl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 22:08:12 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hlY1255bnzKnRx;
	Thu, 17 Sep 2026 00:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789596486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fiPjcCfrZDpkJa9XggDDghz/xr0MLnU4sclLIpuyUTI=;
	b=Tvn5BVv1h8c17a+fi2zeZYQeAMX8ihT4R2nuaWZKmho8kAuX9dHwvwQvYZeeSzFAH5baki
	8eVfL5wBRlETcIqKXRQdxCH/vxrknU9MwDn42BKOMTQmNMgJE0oWOP+kxsH8e3hBKq/brf
	ELGmNWSlqIV774Q6WzkVoeofRxPI73NMRJsqULVg7elw6ebNU0bd15ZCO+cP0fo8pdvH4y
	E8NsFNkxqSD/oxMVMQvaNz17zCn3ImYtvps2GVfpkqtxyQnseOIZzotZYz8pI9e/L7clVK
	ysT3+aptVMPH8u5zTFbrbgC2sw86zwNUillvp6klXMNjALeU8gEF3bnkfQqsDQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789596485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fiPjcCfrZDpkJa9XggDDghz/xr0MLnU4sclLIpuyUTI=;
	b=GTRVOv6cqtQ1UV+EdzjVKukp2M1CnIycMBElJ6FoxZgjnCA9DiZZetJHxkaLkXs1nn6XIB
	eG8Ydm1GjP0CXXEE8px/tZIwLLMrQ8aPljMdTS0LO2TOTGr/Y0mOGp3nvsEgzZrEtQLDUc
	6Bayr39kOIb4tfFT1MclCIivknVKKu5MoGgfYYKKaomyTMir2TGo+Hdb5n03n0ZqAgqa9v
	tSle3+39nxSZQrUbt08Og16/lWP3Qo/xhVxE76B8QClgZ1pm/JcHU9I3g3dQiKirKpZAhx
	HNZQ3upOR8bej2dAulFW9x+K+j5GV7UIyYamTa5Wmc9zlDcW5RVzVEj5bvGG6Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: ironhide: Align inline ECC carveout sizes with bootloader settings
Date: Thu, 17 Sep 2026 00:07:45 +0200
Message-ID: <20260916220801.240796-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bd14e6954791015599b
X-MBO-RS-META: dj669y3ffcji7xcyikz3xcy5jjri9fua
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_150811_116422_486460DF 
X-CRM114-Status: GOOD (  10.87  )
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

The DBSC5 DRAM controller protects DRAM content using inline ECC. The
current set of carveouts follows SoC documentation, which describes the
three trailing carveouts as larger than the rest.

Both the downstream IPL and mainline U-Boot on RSIP configure the ECC
carveouts to the same size for all eight carveouts. Align the carveout
sizes with the controller configuration set by the bootloader.

This makes 1638 MiB of DRAM available for each of the three carveouts,
which adds up to a total of 4915 MiB of newly accessible DRAM on this
platform with this fix.

Making this memory available does not pose a danger, since the current
set of carveouts were carefully set to a larger size to prevent any
possible issues until a confirmation from the hardware team become
available, that it is safe to apply these less restrictive settings.

Fixes: 6fa6ee724d8d ("arm64: dts: renesas: ironhide: Describe inline ECC carveouts")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index 8e68266bb0ab0..239175c54b937 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -161,18 +161,18 @@ ecc@18cccc0000 {
 			no-map;
 		};
 
-		ecc@1a66660000 {
-			reg = <0x1a 0x66660000 0x0 0x999a0000>;
+		ecc@1acccc0000 {
+			reg = <0x1a 0xcccc0000 0x0 0x33340000>;
 			no-map;
 		};
 
-		ecc@1c66660000 {
-			reg = <0x1c 0x66660000 0x0 0x999a0000>;
+		ecc@1ccccc0000 {
+			reg = <0x1c 0xcccc0000 0x0 0x33340000>;
 			no-map;
 		};
 
-		ecc@1e66660000 {
-			reg = <0x1e 0x66660000 0x0 0x999a0000>;
+		ecc@1ecccc0000 {
+			reg = <0x1e 0xcccc0000 0x0 0x33340000>;
 			no-map;
 		};
 	};
-- 
2.53.0


