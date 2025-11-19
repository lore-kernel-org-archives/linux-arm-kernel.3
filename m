Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9C7CF34B0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uk14deWlzB7yeJYaci3XzPAR7LA+rdXzoiD7JVL+UlI=; b=IEXqrUSQRdBntDxLftJlDdAxFE
	7A4l4m3BjdNRrY5uOn+uvHDIpb/xIn9sghbKzVypwox38vtzcWQQSWWp8OYZcfTqJXZJDcYeQCtxu
	LLdBk5rTE8qClS3nFW+hFHmDl0ioNj1qLADIxzsvbwFbzbGmud16y3c4lXJPyEsUf6UHLUHy6u39E
	INGz8HfNb73XO9G+qy87mTCqvOLyGLu3ZGAstRiUrw+r2elgzqMh9ahUCUjI2GhEQWqzM4NXRRLu/
	3bZF0KoVsmNRvLA0/R8QREjTNPKQMtxiMq9yTFssAD1JPAFZdj0wlVShicPncKhIxnOtupgjOrBfY
	/hzmohGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiY4-00000003JYW-1dYj;
	Wed, 19 Nov 2025 13:48:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiY0-00000003JY0-3tJU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763560117; x=1795096117;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xZVbLtQtCTrrDEgWar98Jt+Zmc5VQCpCV/VIbnHZMZY=;
  b=JGfLIDRjK5L3EokQutKN4q1FilkgDyRToXWuL+sVk0VW722VPancjqNJ
   sQb7RfQnDMJDpqeSTlw8epFbi8dnkw5cyl+vN6UX4CUKkNaenuzI6g4Fg
   pstApBLCfplvZWGm0NoQqUt4k58uwiojD0LW6CtGFAWvlVyuNsfPXNDc1
   8nMFtdg2uCSJ8Yo/9eSpAJfNknkslvvKehpfHUxKGpeG6IHs4qmRy4YYe
   /sKJQi9rztkiEw0XPPUOIWUshUiprGqRDEXxgc/nFGipWcihbHUhklST9
   7oS93IVu+jDBwCZLBxzVMqocB05gqZg9t8zeDH0Z9sEgZt05L6p6CQsB0
   w==;
X-CSE-ConnectionGUID: 71KvCTRZRcWm48O19CYCXg==
X-CSE-MsgGUID: SRxyaEjXS92SKLxPNJQCnA==
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="49381641"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2025 06:48:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 19 Nov 2025 06:48:20 -0700
Received: from DEN-DL-M31836.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 19 Nov 2025 06:48:18 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>
Subject: [PATCH] ARM: dts: lan966x: Fix the access to the PHYs for pcb8290
Date: Wed, 19 Nov 2025 14:47:50 +0100
Message-ID: <20251119134750.394655-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_054837_202115_622B7A54 
X-CRM114-Status: GOOD (  11.23  )
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

The problem is that the MDIO controller can't detect any of the PHYs.
The reason is that the lan966x is not pulling high the GPIO 53 that is
connected to the PHYs reset GPIO. Without doing this the PHYs are kept
in reset. The mdio controller framework has the possiblity to control a
GPIO to release the reset of the PHYs. So take advantage of this and set
line to be high before accessing the PHYs.

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
 arch/arm/boot/dts/microchip/lan966x-pcb8290.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/microchip/lan966x-pcb8290.dts b/arch/arm/boot/dts/microchip/lan966x-pcb8290.dts
index 3b7577e48b467..50bd29572f3ed 100644
--- a/arch/arm/boot/dts/microchip/lan966x-pcb8290.dts
+++ b/arch/arm/boot/dts/microchip/lan966x-pcb8290.dts
@@ -54,6 +54,7 @@ udc_pins: ucd-pins {
 &mdio0 {
 	pinctrl-0 = <&miim_a_pins>;
 	pinctrl-names = "default";
+	reset-gpios = <&gpio 53 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	ext_phy0: ethernet-phy@7 {
-- 
2.34.1


