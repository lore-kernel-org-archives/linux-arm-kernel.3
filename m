Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64F4EC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srenrKA8TZTZE27Xm+W/eTJunI/18g9zNzajpdx4Gqg=; b=CsDQcNC3oFKXRrk7fhqjPL+Yco
	Smkr3KKWN6mDHiiMlf+JkRhCY70koPRYsCYBEAMk/8Lu8x/GJTGuqEmd+CPNZsVMNtahEdBdVHEgf
	WjPbrdTEOY6zlGsPo2VXeLjAdrkneF9w1MfNegIHBXNV2So7lUO8WThmqxl/E5xGHE9Hu+nW2gzGi
	3Oynxr4u+XuubMJtueR0lwTkOM9zX6dOQIuKjw9ReH8oOIgSUT9LY1DBbdrS32osz8yEerGSQU6mA
	bnfEBQHCiIYqquUXi7ePgCYFOG1P+tJU4IlYU0ap07hRIIJPuaHdMfk1363+wiz48E4rOQAWkOVbF
	aWdqRKiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjiL-00000008W1H-0zAJ;
	Thu, 27 Feb 2025 19:38:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngC3-00000007xuh-27x6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:53:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740671579; x=1772207579;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hRdyyYzhcP4NUii0TNQFW8OotTcsthHzkmqSXvcB7NY=;
  b=Y5uZqy68RoaRaX8xzkLpPb0gJbx+pmG3t6QlInuWpb8r3YbcLdUAGai9
   vOnQQkxxJ5mJTGMPXdnB1ZJ4iJXSB4QZDQXpQUq/nkUEZzYym2gnTcszp
   b6OXK4Y28kru9qiRMstQFiphMjRjMV1tiQeRNiomsDZCcnp9H7sf720Kf
   /d0cA9tIy+PCrs/Wwfk/p08shF04FN5gvCNwMTlz7waUc22JyY945aaa+
   1WGJa53ycykxiwrQTvL8N7YiEdxN+q29U1NqSPAdFBgxBtK22x2rzvi+K
   PgFAqm7nwY+p0CCq/mVg1Ui85UAQq5VHtTQCpcGxCQY2NIHGLnU4t7ARB
   A==;
X-CSE-ConnectionGUID: xBkIAngZQVSwQhIMCQbtUA==
X-CSE-MsgGUID: TJdTlsGTRqqYfLqHWjYU1Q==
X-IronPort-AV: E=Sophos;i="6.13,320,1732604400"; 
   d="scan'208";a="38638166"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 08:52:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 08:52:45 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 27 Feb 2025 08:52:45 -0700
From: <Ryan.Wanner@microchip.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <claudiu.beznea@tuxon.dev>, <sre@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<p.zabel@pengutronix.de>
CC: <linux@armlinux.org.uk>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>, "Ryan
 Wanner" <Ryan.Wanner@microchip.com>
Subject: [PATCH v3 06/21] dt-bindings: rtc: at91rm9200: add microchip,sama7d65-rtc
Date: Thu, 27 Feb 2025 08:51:53 -0700
Message-ID: <27c5b177a41b89c5c983e7e292eb4b321a258991.1740671156.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740671156.git.Ryan.Wanner@microchip.com>
References: <cover.1740671156.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_075259_604118_5EF11783 
X-CRM114-Status: UNSURE (   8.77  )
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

Add SAMA7D65 RTC compatible to DT bindings documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
index c8bb2eef442d..7c5b13caa40b 100644
--- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
@@ -23,7 +23,9 @@ properties:
           - microchip,sam9x60-rtc
           - microchip,sama7g5-rtc
       - items:
-          - const: microchip,sam9x7-rtc
+          - enum:
+              - microchip,sam9x7-rtc
+              - microchip,sama7d65-rtc
           - const: microchip,sam9x60-rtc
 
   reg:
-- 
2.43.0


