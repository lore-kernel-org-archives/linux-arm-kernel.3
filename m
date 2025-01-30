Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D29C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 17:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/T3EJxOo40vSJsKjdqouwzgYdU1aFdJJZaAU9qjSyLM=; b=ZdK5F22HmjL1I+q/lIph7mHUsE
	ysfj5xICUpjLEGRMrcMLm8Rcn7FeN1+xO+fPNxgm5HW1WoJ56ExrZP+YP8fcva2TQRYbzSmaGuar0
	nklcZysyR+lk9q2ZNbH0FlXOxU/E6b+R8jPCV1ZNsw3tg/Lu0eZA1UmdtXHYbCkUHfsz/+tsqV/I0
	sr34EUCH+UvHNT+/kUB+LBEviihyxHP5f8LfaU+Hmy5VCiavgJ9DcV/z3tSVzZB3jEDp7I2498Qej
	1N3wR741lplj9PcpUn8bKWfVu6q6sxsKG8fgikAitm2mCllKcCh9/Nis8QoDwKuOyecxYte/yWEz4
	zTWqa1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYf4-00000009KUn-1qqV;
	Thu, 30 Jan 2025 17:49:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYSl-00000009IRQ-0EzE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:36:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738258582; x=1769794582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fb436NRz70oTKLq9Kkjdb0oIgB7HP4oP2RLulPS2VjY=;
  b=WEGc92IByZaWa4ZeUw5w/i5GB7Z7+DO8ix5V+7sVQ+/gy+xPeoMPkn/j
   TlZZBrSohxTTkBg+ZRcexRhpDB4MI/E+LjxYqnQb01hkmg9uqNzvoCO6/
   /WK3ExZ9QhR8ifx9MsmDxsy6Tu+KtNywcKSxxoZyFAe9xkSYjslOAqw2R
   W36VU8BfYxzxc4yD3aokFQ0hhN/OYHnVC05afw9yOtUsiE51bU9YzjEiF
   5JQu8lkwfGoXGPzwWrkLxYAIADgGQcf1oeenyXodkbQg5VQbJhVJH1XhW
   LYs0Jsjt9D9EC1s2xBxgSVHKrrl/leGH0MD1I/f1/zdUibV62Foc33Ie5
   A==;
X-CSE-ConnectionGUID: Qux6TnwtQkq+U6Cg6JCAlA==
X-CSE-MsgGUID: KP0hDFVcTWu/DvrDoSnASQ==
X-IronPort-AV: E=Sophos;i="6.13,246,1732604400"; 
   d="scan'208";a="204623009"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 10:36:20 -0700
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
Subject: [PATCH 03/16] dt-bindings: sram: Add microchip,sama7d65-sram
Date: Thu, 30 Jan 2025 10:33:43 -0700
Message-ID: <e0cdc69ebb34b71135321841a0fe682ede104d79.1738257860.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1738257860.git.Ryan.Wanner@microchip.com>
References: <cover.1738257860.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_093623_161457_C3F27586 
X-CRM114-Status: UNSURE (   8.33  )
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

Add microchip,sama7d65-sram compatibility to DT binding documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 7c1337e159f23..3071c5075ee48 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -31,6 +31,7 @@ properties:
         - amlogic,meson-gxbb-sram
         - arm,juno-sram-ns
         - atmel,sama5d2-securam
+        - microchip,sama7d65-securam
         - nvidia,tegra186-sysram
         - nvidia,tegra194-sysram
         - nvidia,tegra234-sysram
-- 
2.43.0


