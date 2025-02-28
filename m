Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DB7C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+RyvZFdoio5p3L0+CdI3auMAM5bRt+oRVDnQ9bW1Mw=; b=h5LSi07JFCEOjEuyiInTUIILVL
	ru4DoNZaqu6kqsOtGAjjOg/5rqtIg88yfnZMO8DCMAQtq7tGPzRRwO8+w7HSKbldCz2D3RqO7rJ4U
	KG5zspjHNsys/wEL1nWWG/mvYJC2M9qdiLeyO0G5Q6Z4mG8nMaLdZVZfjSNJpXwIzDdf3zdS5A5jx
	mIjE+AMoweF5CKvUIpamh9DLPZZvl08qyXLhFoh0RNtWt5A5gdux3UoSnDZxjBi8KahOsEaHfSVYg
	tOVgFWMWev6pEPpTzFsvkXpWR572zu6KeJ8YZBu+9dVBxZLRhN+JvFNlZfFaUuRFjZaiPVUGDO6mR
	egKp08Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to2aT-0000000BX9b-3Sfz;
	Fri, 28 Feb 2025 15:47:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to2Ds-0000000BSN6-0h82
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 15:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740756260; x=1772292260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LzIKqDxFHg4172eexZcr4Iikohe0+ynv0N9qzRji844=;
  b=xNrzYLzVtmT8i4ODU25J/iFzF8DY8FSR3nv2ULOLw4wsw/RbcRDimSt9
   0aJi+JG31cI09mkK6nDh3cKoD3ErW5WvJbvE2MNPXT9YXnMHQHZZ0QW5J
   QwHCmB7wK4z2JDXpxP8GbUjiWKL/AaxFkc0Sk54BiNgwLtB9y9HX72ZmF
   WLEfJe7TB1ZYHGJKsBguLI131uFFGbc1Svh1e0RcwKnp5Qc8UlWLKmUN3
   sEe7yB9OcI4x7P4HsEj2K0CJT5JO5yXUZmpeFUF3wq3sfgum/xANrJW/g
   laAFGXbtHVCvug/uFBcik1Qpl3A5sQ7+EeX0ZFqqjEfnG1QlqyZrjLNzz
   w==;
X-CSE-ConnectionGUID: YRQSNli+QiSyLIXFC1GTlQ==
X-CSE-MsgGUID: OEUZY4WtRjiQyJmWabd75Q==
X-IronPort-AV: E=Sophos;i="6.13,322,1732604400"; 
   d="scan'208";a="42415302"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Feb 2025 08:24:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 28 Feb 2025 08:23:55 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 28 Feb 2025 08:23:55 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <vkoul@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<dmaengine@vger.kernel.org>, <linux-watchdog@vger.kernel.org>, Ryan Wanner
	<Ryan.Wanner@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: watchdog: sama5d4-wdt: Add sama7d65-wdt
Date: Fri, 28 Feb 2025 08:24:10 -0700
Message-ID: <15d6f901e64dd36d25a62e27601252c59708275a.1740675317.git.Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740675317.git.Ryan.Wanner@microchip.com>
References: <cover.1740675317.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_072420_215599_4836CD4B 
X-CRM114-Status: UNSURE (   7.56  )
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

Add microchip,sama7d65-wdt compatible string to the dt-binding documentation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 .../devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
index cdf87db36183..7668f1efdc6d 100644
--- a/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/atmel,sama5d4-wdt.yaml
@@ -23,6 +23,10 @@ properties:
           - const: microchip,sam9x7-wdt
           - const: microchip,sam9x60-wdt
 
+      - items:
+          - const: microchip,sama7d65-wdt
+          - const: microchip,sama7g5-wdt
+
   reg:
     maxItems: 1
 
-- 
2.43.0


