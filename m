Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E69C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 21:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkWKEORJW0YIkn53jU3aVO+VIP+UBqvdDG48JWJJBj0=; b=e6f2Ccl8aui9rrRxr8tdzIt0iJ
	y//agrO5RGin1wKgN6lOHsVYrXRGEEKSrH3JCn3Izyf74JLI+iAkKdvrqkn1Ut1A1K9jBxdo87rV9
	0bPNIMmia9NexxV+pr5yozeFmDNpSC2d9IJJLvz3Z8cAuawufzDUx1YY57PeAPzGr8PCDb0PugU3x
	rSa+CbkEcALvr5gn8WlcSctvke7FhvCMQWrgUOeuvkRDK4ZMUEV99PQ28yvtCTN6wgbcjCofA8tTR
	FaulVGeOR7BCDQYK5BBDJ+ZuoUNqTpsMQeXidJxypyJ9qU8XRUVgQEIBfybCpYT5D4axFyYD/rJ6H
	jMWb70RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RnC-00000003e3N-0BUl;
	Mon, 14 Apr 2025 21:56:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4RZ3-00000003aew-2Jxc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 21:42:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1744666921; x=1776202921;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OM1d3llXIfkK0/Fd/B3sNNDqgNroniFjy4Xdxaa5Z5c=;
  b=rkXHkfCTjvT2pjAyWBZ57uFm+goPZK5p3/hBnfUjtlqpAPtRo7Qoi4Pv
   4j3J5fTwcvSK88ZRjTlqm1DOih5bRPckQzWYnf1a2412UfRlBOFkvNbET
   RuzjedaPDo3fkNx32nUoKyRELBtDoZS2Z3Syw+hLXzuR9WYU0ObBl9y+9
   neByrx9NAmx4HtymYuO0DB3bo50c/DJ9kksDhnFx+4ZRBNlHFu/CUIkoq
   tMw/f7CttdhNVzelLEEap8O3vqjPBTfOBM1ilj7tEqjFCBz5i+BG8UWKE
   fmwRy8HPVDVJ8m/xi/iLNiQWdM003ezg9bcDTqRLbvaAQvsei+aQWFUin
   Q==;
X-CSE-ConnectionGUID: jf75aQsXSneWELgtntpGWQ==
X-CSE-MsgGUID: fu3b2IBCT8mVUyCt3fIHXQ==
X-IronPort-AV: E=Sophos;i="6.15,212,1739862000"; 
   d="scan'208";a="40006674"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Apr 2025 14:41:56 -0700
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
	<linux-rtc@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 06/11] dt-bindings: mfd: atmel: Add microchip,sama7d65-gpbr
Date: Mon, 14 Apr 2025 14:41:23 -0700
Message-ID: <ddbcb306699b8c09f3210d714c0701afa1a7cb96.1744666011.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744666011.git.Ryan.Wanner@microchip.com>
References: <cover.1744666011.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_144201_667095_C5F2147C 
X-CRM114-Status: UNSURE (   7.45  )
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

Add SAMA7D65 GPBR compatible to DT bindings documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml
index f805545aa62a..f6f47999c6c1 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,at91sam9260-gpbr.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - atmel,at91sam9260-gpbr
+              - microchip,sama7d65-gpbr
           - const: syscon
       - items:
           - enum:
-- 
2.43.0


