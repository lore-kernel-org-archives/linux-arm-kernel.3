Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F37CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvtiDxnTnYu48RxdTy09BgHhJHijBhXddWmTcJXbaDA=; b=s8wAAVU2kP3b2T0zgeOezgSBP7
	eBPmqA8qwLgpV7aK8MZmLpktlNp4hXwp1S+4NQQ/RCIaAHMKiKxry6ExeuJG9rjuQVki7Ddhf99Ji
	Uxh7a+cdV5UcERG8YEjwg8gsb/VEt+aoTNc+UyTf+uXB9JnGqN0WNJXo6FjmxwQgGG/seZTdXCfOX
	ZAP+przGKmldTqRunTElZt1BDQSgagCqnJve09Ye0TULhLfprmO++6Lap6CkYb/ccz4Ayvf1GoxKP
	IvAQkTJkEuHmgy0ptX1PzIoOjCVlQhWSaUh99Vho2fKzec0dwgCbrnRtlmJXCZrka348cbswrLr9i
	GU5efBpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRY8-0000000GnUM-3P4p;
	Mon, 25 May 2026 09:24:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRY3-0000000GnQw-0VBW;
	Mon, 25 May 2026 09:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DvtiDxnTnYu48RxdTy09BgHhJHijBhXddWmTcJXbaDA=; b=dgsqwlMcKmEq8vHbqGBacUjCIY
	5BhpNlsvMeEvH3zT03C1D8SDDkXsxzAJlKxFtCjgfjjo7ZIzql+sVly5ds79UBjtVUC0gnTQF4R7u
	kMIK6v5YAwnlJ/mIckxk09PeQoTK26T76ScoZFe0ewpIH3M3YthAbkwltwjJMCaVnwU6S2LUJfP72
	v9XOxF7NH1yrVd37zD27BB9rieiMQYl+UmqLh4bKVqL0N93PHITFmu64lkQYjV/n7GWR0ZSa1iMln
	M5sffnvBlYbGY6+xlZY7m10XBtrg8ku2vC5SeG4OR1OGJLJn8wrCq9c9TtH+KXzHSqUos0uJRc8NE
	D0u7GYWQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRXy-00000008tA4-39Aq;
	Mon, 25 May 2026 09:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779701071; x=1811237071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZmyfIH5KhFAjKsOYICrfyLRCXsbn+1dxlewuuX1LfIQ=;
  b=gfUmzLaKRhrfN5chZZxbAaK07lUdmrxINqHvvM4mJ/MDapNrGNrdeov1
   G/rsdHVFRDOTPVNWkC4N/LqMJqdX/i9ks8z5hXt+tuP9MWd7P8XFfjGu+
   x5ztBkzqrHrQCCNYUkf1B0FNr70b5Wye9rk1C3IsuvXpdfjfZDIHamO6p
   EXDX5fRtvlOXsvNEwdI+ch6x6Aa0VAPx2xQnEC17Chl1pxw1fijeUs/+k
   S8gQWpOuzvte5nBDkHLL0N+BblOViinZGG8hPXpyYmHEvE0tpDPeIc3Bv
   kQg3W7IqHhdqMtrSugthPEWQBz1jAh1SeAvtoR0Xbx3seRHYCQtLXdulc
   Q==;
X-CSE-ConnectionGUID: ErrMcRDBRb2Cm5bGCRCQQQ==
X-CSE-MsgGUID: J4LVG0OBTUegvkqNrxcbUg==
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="289388357"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 02:24:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Mon, 25 May 2026 02:24:29 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 May 2026 02:24:20 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Manikandan Muralidharan <manikandan.m@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v7 1/5] dt-bindings: i3c: mipi-i3c-hci: add Microchip SAMA7D65 compatible
Date: Mon, 25 May 2026 14:54:01 +0530
Message-ID: <20260525092405.1514213-2-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525092405.1514213-1-manikandan.m@microchip.com>
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_102432_433569_E68C95C0 
X-CRM114-Status: GOOD (  10.10  )
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

Add the microchip,sama7d65-i3c-hci compatible string to the MIPI I3C
HCI binding. The Microchip SAMA7D65 I3C controller is based on the
MIPI HCI specification but requires two clocks, so add a conditional
constraint when this compatible is present.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v5:
- drop min/maxItems around clock entries
- use if/then/else clause instead of separate allOf entry
- cosmetic fixes for indentation and formatting

Changes in v4:
- Define and describe the clock property in the top-level properties
  section rather than inside the if/then conditional

 .../devicetree/bindings/i3c/mipi-i3c-hci.yaml | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
index 39bb1a1784c9..d488fb420945 100644
--- a/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
+++ b/Documentation/devicetree/bindings/i3c/mipi-i3c-hci.yaml
@@ -9,9 +9,6 @@ title: MIPI I3C HCI
 maintainers:
   - Nicolas Pitre <npitre@baylibre.com>
 
-allOf:
-  - $ref: /schemas/i3c/i3c.yaml#
-
 description: |
   MIPI I3C Host Controller Interface
 
@@ -28,9 +25,17 @@ description: |
 
 properties:
   compatible:
-    const: mipi-i3c-hci
+    enum:
+      - mipi-i3c-hci
+      - microchip,sama7d65-i3c-hci
   reg:
     maxItems: 1
+
+  clocks:
+    items:
+      - description: Peripheral bus clock
+      - description: System Generic clock
+
   interrupts:
     maxItems: 1
 
@@ -39,6 +44,20 @@ required:
   - reg
   - interrupts
 
+allOf:
+  - $ref: /schemas/i3c/i3c.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: microchip,sama7d65-i3c-hci
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1


