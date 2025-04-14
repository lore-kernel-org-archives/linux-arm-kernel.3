Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF88C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 21:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JbKMCNxPp6IvfrHgAU84c0A0g8QVQHqMEYZXuQB61QE=; b=g6AXuiBpqDQHxi0Op1L78Z7zsZ
	ewZjIHqhQcPpJNFsxnqbasuHWdQWD/nx4LhbemHYzclxxi5FiQ0iZDmjEWOJybQL/5eiJKONe5Vto
	SVK91b/Ygs6F1srF1slonznrgptht5nbnv/iiNcNn5FTMncJasG17db/bexEGVCDXXAlQh8bUTlqP
	wVyXUzdJ3+YDAgCcbBDQJoNRa+rMBE2VLMtoFVoH3wv9HwLjtX/gWAS0ZFObaYvHKk/ByjBn5hemP
	8lGLNDPeXxtMG6wJ9RiZ1uHlDYiZaJU/LioClffMins0U7ivrjmZM0/t9JGG8p1Lym/DbYsR6AvrN
	Mqd8i/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Rg1-00000003bzg-0UtF;
	Mon, 14 Apr 2025 21:49:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RZ1-00000003afr-2dx4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 21:42:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1744666919; x=1776202919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jOJz2FR/B0tRpFsFUS+2kPu1QtdKBp50iFZ5wBb9Z9c=;
  b=PWFOQCZdlNtJWItMElNmZBKjwkLxUWmPYXg07FT6ivfY86lzqQtBz8jl
   izuoi4dDG/Gq+BmQDR3LfIDKo7ut/jWnHf7z/d6Vsp23ugG3ehF2FMNCm
   B2uTqfMWJfOz6b0xQXFr2ErRyV/V7G2gX2GqoinYrW4EIAwNO1LfQqL2D
   wwEKmCEe4CP856jvRIKCnlKRWmh9gSyMe1K8CbYAA78b5Y04UwaX8OGO8
   bR1oeBfqGUeOBOaf+m71IwX9FDw3Yn+85dNonIHpuYP2VKaAv0RwMQvUx
   y1GJET74AHNlXDqhOkeTq5sYdT7wE+78ZOZL6xuHGjViTlLAShDOeAclm
   Q==;
X-CSE-ConnectionGUID: jf75aQsXSneWELgtntpGWQ==
X-CSE-MsgGUID: kear+yGWQxarTgaYcOwEtg==
X-IronPort-AV: E=Sophos;i="6.15,212,1739862000"; 
   d="scan'208";a="40006669"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2025 14:41:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 14 Apr 2025 14:41:05 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 14 Apr 2025 14:41:05 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <lee@kernel.org>, <sre@kernel.org>,
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH v5 02/11] dt-bindings: power: reset: atmel,sama5d2-shdwc: Add microchip,sama7d65-shdwc
Date: Mon, 14 Apr 2025 14:41:19 -0700
Message-ID: <24666308604d3eb9f2b8c64d4a466c6fd77120e9.1744666011.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_144159_730814_E3C957F7 
X-CRM114-Status: UNSURE (   7.51  )
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
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml b/Documentation/devicetree/bindings/power/reset/atmel,sama5d2-shdwc.yaml
index 0735ceb7c103..9c34249b2d6d 100644
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


