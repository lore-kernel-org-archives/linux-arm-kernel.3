Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31B1D60D06
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmCztwI8aFrd+R8hgX37u0yrzsMtD8uN7QQglYFC3qw=; b=ijNE1noVY8uNj2mMzb4u7U2v0T
	uE1AZWWBExp0/ZaPjdJQpjYWdBcfCMoI6p42FHJoyJlKEye9JFcOB29fh8h2Qc2Nj9zlfo8IEI/KM
	lydWWliaTD9BQ7yMQhtNHDX09UJskSjmmJNOzwm2sIk+KwJq5E5WsKEr1ejgODNmQK0qtRban4kQQ
	/WqfzXg7vIr8QHt/PrRXlfFYYRzNTd9BNqUscj+mePFCDDocNjKHaGeiyuT6NpZ5QqCnWQrpo+l+N
	j0nJMtKOYawdbRw7ys1J6DNu5K5zrhnsQfoKP5tqQxeiUv0iQTnL7SM6c3uY6SVkIWpuMCsiEK3j0
	s4LSDDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRQh-0000000D6BK-3rYD;
	Tue, 19 Nov 2024 16:50:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDRHy-0000000D3dm-0use
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732034478; x=1763570478;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IkUEIEdPXy7wkYH0G4cdeeO4OCotIh2ZfFv3jVIZP/s=;
  b=CbncS7xLspkuPhs3kSn/htCoR+IJU6BzmIDzQXbnrErAj3yG4gKwj+jK
   F+LgFAV+OHYTSclG2HDl+cKk7MgW0iA5YHfnjE2zWxZyPIvRLxrbV6KIm
   NSTcRbQ66M+57vYjSnJAF23a3BEhusc/+AgdTYMmpIGBLo7DgOjTdoZ2a
   GaDSSzDFS2HzXgxhn4AoOytcRicky00TWXXJV/l+yjDx/tS15hrAjMLl/
   Piu/ymo2qG/MFcwEZaRdtIrH7CKZE43LPBBww9n5Cinf4s07T5xt60Qud
   FVzJ6TxfGIS55z1LKjUrCXWMamwdDASRSOAQpbiF0Fog8CL5RNbHLyoo8
   w==;
X-CSE-ConnectionGUID: jnnvkeRdTYaD0RwnHEXOug==
X-CSE-MsgGUID: 3RB1pgPmTraD7gKWw9eMbQ==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="35018896"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:41:14 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 09:40:54 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Nov 2024 09:40:54 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<arnd@arndb.de>
CC: <dharma.b@microchip.com>, <mihai.sain@microchip.com>,
	<romain.sioen@microchip.com>, <varshini.rajendran@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH 08/15] dt-bindings: clock: Add SAMA7D65 PMC compatible string
Date: Tue, 19 Nov 2024 09:40:14 -0700
Message-ID: <4b6b8223b14b4d593fbc7786264f11580d2f7673.1732030972.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1732030972.git.Ryan.Wanner@microchip.com>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_084118_314217_A030817D 
X-CRM114-Status: UNSURE (   8.69  )
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

From: Dharma Balasubiramani <dharma.b@microchip.com>

Add the `microchip,sama7d65-pmc` compatible string to the existing binding,
since the SAMA7D65 PMC shares the same properties and clock requirements
as the SAMA7G5.

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
 .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
index c9eb60776b4d..885d47dd5724 100644
--- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
+++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
@@ -43,6 +43,7 @@ properties:
               - atmel,sama5d4-pmc
               - microchip,sam9x60-pmc
               - microchip,sam9x7-pmc
+              - microchip,sama7d65-pmc
               - microchip,sama7g5-pmc
           - const: syscon
 
@@ -90,6 +91,7 @@ allOf:
             enum:
               - microchip,sam9x60-pmc
               - microchip,sam9x7-pmc
+              - microchip,sama7d65-pmc
               - microchip,sama7g5-pmc
     then:
       properties:
-- 
2.43.0


