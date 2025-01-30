Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0BAC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+37bzBrtUpMoGDkZ00gvL9v000U8PXgaqxle5ulUp8=; b=Mml2GUYCRHkeNFcj7agZR4h/Vq
	SwtDKjH31NZE50LZAjqSYl56eDbSFzR3sUvVNaROTD/MFqhWKTbMOWtvtZaqU0RhBZBjaLHSQwaCV
	slLoJtXyq3BryTVGMvnl4BYRU6ug4PgOtYzLVYOUMJiiOn63a+AKCV+mlmtyDM8ITBkja/friJ57h
	q5lvmpa2fQowuqKDkwyuLYy0NVWHrgMGG3/gIMuSnIvabg5I/l4F8i19dha5mDkyaXS8J5n0++aH4
	sWYKvO+hcl67DrGDLTlXOLv0ZjD56whlw9QWwbYOb+qPzYT8OPjcmfNJLQ3tkq53o/qG6cl/kD25q
	mjQa+xbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYgL-00000009KhD-0MjZ;
	Thu, 30 Jan 2025 17:50:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSl-00000009IQp-0SZK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258582; x=1769794582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Am8+kfWotqu7Acfv6hJmfZCzvd6QfUg8B6QOZ3v8VVw=;
  b=JeEGx5yzu0NroANit+kdncoUPhdjmT16WgUdPZNgn6JbVD8U6q83vFdO
   WCZ9fs66tX+/9i1b+9jrFFZpoEPKdllXkpsswZuW8gKUU3ubn238GGGJ1
   xMtGIRXym1GNZYpgZ1a/dyJMnDK9cft2Utoe0FXMUlfu23rqsvivIcIOw
   PsAYr4Fd8yDKItLsCUWSjcrZt2QziZyVdmC8kMTaWdujwm6kTunKC83ke
   Obk2TR+wA+SEAU2XG6Y8N0NhYsJ2yj7JVw2HJPrZ8OCZ9BcrtGq7ppNdj
   txCJ3zzBXAQC8wOUzW6sXbVdmOy+qxI3PQaofcRm3KKWM3UudDjSZCSIs
   w==;
X-CSE-ConnectionGUID: Qux6TnwtQkq+U6Cg6JCAlA==
X-CSE-MsgGUID: D+sBAwjISlak44ASGKVX5A==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="204623010"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 10:36:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 30 Jan 2025 10:35:40 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 30 Jan 2025 10:35:40 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>, <linux@armlinux.org.uk>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH 04/16] dt-bindings: power: reset: atmel,sama5d2-shdwc: Add microchip,sama7d65-shdwc
Date: Thu, 30 Jan 2025 10:33:44 -0700
Message-ID: <1e04bd9b667d2831be3c7f6dc6f3d23f07a7d8e6.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738257860.git.Ryan.Wanner@microchip.com>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093623_225709_91B61287 
X-CRM114-Status: UNSURE (   8.28  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add SAMA7D65 SHDWC compatible to DT bindings documentation

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
index 8c58e12cdb600..2930607480ea2 100644
--- a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
+++ b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
@@ -16,6 +16,11 @@ description: |
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - microchip,sama7d65-shdwc
+          - const: microchip,sama7g5-shdwc
+          - const: syscon
       - items:
           - const: microchip,sama7g5-shdwc
           - const: syscon
-- 
2.43.0


