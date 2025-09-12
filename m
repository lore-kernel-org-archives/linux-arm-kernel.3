Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AC1CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPBuPCLu7oC6F/zEoocPKSa/sgw4jItLiwJOfQMM0jc=; b=ps9P1YzNUcAYm/HF/nArAl3cQn
	x9LR+0sTfdo7gJQrAbROynKJK0Sq1xX4zCz53rNSWc5/O/UoB+CGBx8gkyo76YR5kPn7Hz+CDKEgn
	8PzEDBriqTJ1uvX9Qw+AhM6voScQ98Jj3eJ0ZTMap0npoMwpe6rmU3lCniVkf6LG/A6u235IgUkGW
	6RyclawAJ92+TWZ+d9D52SZAlOc/S5hEkKR3odvU+l2Zfkz/fPo7Y+lKmy+8D1duHRUaOF804DuF1
	FU3MHao2QcHgcxiBnbrxLPHozsL6mxdBFwQ45tasIvG7J8uhCBWha/X/a3dPgE3HE/sug4W9rh2DK
	TYywY5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Zq-000000096q0-1q7G;
	Fri, 12 Sep 2025 12:08:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Zn-000000096nP-31Gb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:08:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6DB9C4010B;
	Fri, 12 Sep 2025 12:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC21C4CEF9;
	Fri, 12 Sep 2025 12:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678907;
	bh=be+bUwk0HwrL17vqiPMMJhD52aY5E7ndhs1cUU5HK6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VnO+Zw+vEeP2fK22pSjN3uy6nADz7y2IRjKwkvi4geRwoqcPOklI4xhf5362H6wSk
	 oRRj5PfC3Z+k1P8gLptL44nLQAavAVqPJyokURmtahqFKXkE9NZ+18ZrV6jGRWGGIp
	 5P2DPPROwqIX57gAOPKn2aTyDHKHb3BhRlfToES99CXMIP33Nq/+F9m359MSfPNiL3
	 0Cg4sZIgWcbdFgXEEL0q+eh/+FY4ipZ2sCkXUzngH76Pt5k/9jaf5xVhvRDkyk4GCw
	 U3WMKC3lkMHf36hDUEqgKrW2P/lsfzwvu9XyQBKIgF1Nl60bC16GEeNoDs8MWinlpC
	 +qd/B7BHuf/4A==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Andrew Davis <afd@ti.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 5/7] dt-bindings: watchdog: add SMARC-sAM67 support
Date: Fri, 12 Sep 2025 14:07:43 +0200
Message-Id: <20250912120745.2295115-6-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912120745.2295115-1-mwalle@kernel.org>
References: <20250912120745.2295115-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_050827_778918_13BCEB56 
X-CRM114-Status: GOOD (  10.40  )
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

The SMARC-sAM67 board has an on-board uC which has the same register
interface as the older CPLD implementation on the SMARC-sAL28 board.
Although the MCU emulates the same behavior, be prepared for any quirks
and add a board specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
index 872a8471ef65..0821ba0e84a3 100644
--- a/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml
@@ -18,7 +18,12 @@ allOf:
 
 properties:
   compatible:
-    const: kontron,sl28cpld-wdt
+    oneOf:
+      - items:
+          - enum:
+              - kontron,sa67mcu-wdt
+          - const: kontron,sl28cpld-wdt
+      - const: kontron,sl28cpld-wdt
 
   reg:
     maxItems: 1
-- 
2.39.5


