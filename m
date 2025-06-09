Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A8FC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uICamvnlE4eYIYrX7UHBmV4OQ1J8YYFkcBFU8syPJIg=; b=uJwSnjPEBCJVUJ5ERceABGRRra
	0IpmscjXsyJwy9wbyBLIr/lQsqKU397NgF54O7qUdXf5vY6Dled1QtsLkBW079zGAjjg6O/5HY1WL
	TWujghEK9OuqpArj1j5pbD0TlxN4UqrXr/VtyZ18pO89S8mEL8iCMDDowk/fexym8Ye9uDwgInqtP
	GMGWU6GYk9+rqI+i3T66mD20Xev0oufVqhHvlSj/OURkoOfoY4lyiT0lvvx5dMdfOvKIjwGhebJDy
	/FMWH4j/Ll6HwbL+P+SxuhpfqFxv2ygjk9XmTOPH1CPyLCGI/wt/5q0IKPvqEaqn0+QJ4hcRQhSM2
	tqVE2twQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOfIH-00000004f4e-3K6p;
	Mon, 09 Jun 2025 16:24:18 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOegi-00000004Z3Q-2NQe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 15:45:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E942F1FCF0;
	Mon,  9 Jun 2025 15:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749483926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uICamvnlE4eYIYrX7UHBmV4OQ1J8YYFkcBFU8syPJIg=;
	b=Icu8Aik3up8SgL0spQPEfie2Rd9mIlmKO7N990ZKVgfxQnroTMdqO5+DQXR32Wj2zrwmbP
	8UFeVs6RWxuIbvKOL6+KMgPaqzIddiEBnD6iaL23OquXnitPfHj7uDLRX/Vy87iMZvPyKI
	cHDkSplf3QEWAUBrCohk2FL/xE8r8mDbk6x+WRxibZwL5FtdAlvcZnr9zVC1mCxzh9YmZv
	wg02vPUDkBIKOEuDWzx7VsGMmVC3PEltpGICYV8RTvhgIvDoHvBrDcpyAhL07S9EhK2Ot0
	KYaJ8w7cWZ6yzZei+Nn1xwywk91M/HAsvLYKSUnrN1Da7C//OJh8MdVdm3vGoA==
From: Kory Maincent <kory.maincent@bootlin.com>
Date: Mon, 09 Jun 2025 17:43:52 +0200
Subject: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-bbg-v2-2-5278026b7498@bootlin.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
In-Reply-To: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.15-dev-8cb71
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdelgeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepmfhorhihucforghinhgtvghnthcuoehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevgfdvgfektefgfefggeekudfggffhtdfffedtueetheejtddvledvvdelhedtveenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedukedprhgtphhtthhopehrohhgvghrqheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehlihhnuhigqdhomhgrphesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrghrohdrkhhoshhkihhnvghnsehikhhirdhfihdprhgtphhtthhop
 ehkohhrhidrmhgrihhntggvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhonhihsegrthhomhhiuggvrdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: kory.maincent@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_084528_741609_720F093F 
X-CRM114-Status: UNSURE (   9.19  )
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

Add several compatible strings that were missing from the binding
documentation. Add description for Bone, BoneBlack and BoneGreen
variants.

Add several compatible that were missing from the binding.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---

Change in v2:
- New patch
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 3603edd7361d..c43fa4f4af81 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -104,12 +104,50 @@ properties:
       - description: TI AM33 based platform
         items:
           - enum:
+              - bosch,am335x-guardian
               - compulab,cm-t335
+              - grinn,am335x-chilisom
+              - gumstix,am335x-pepper
+              - moxa,uc-2101
               - moxa,uc-8100-me-t
+              - myir,myc-am335x
+              - myir,myd-am335x
               - novatech,am335x-lxm
+              - oct,osd3358-sm-refdesign
+              - tcl,am335x-sl50
               - ti,am335x-bone
               - ti,am335x-evm
+              - ti,am335x-evmsk
+              - ti,am335x-pocketbeagle
+              - ti,am335x-shc
               - ti,am3359-icev2
+              - vscom,onrisc
+          - const: ti,am33xx
+
+      - description: TI bone variants based on TI AM335
+        items:
+          - enum:
+              - ti,am335x-bone-black
+              - ti,am335x-bone-green
+              - ti,am335x-pocketbeagle
+          - const: ti,am335x-bone
+          - const: ti,am33xx
+
+      - description: TI bone black variants based on TI AM335
+        items:
+          - enum:
+              - sancloud,am335x-boneenhanced
+              - ti,am335x-bone-black-wireless
+          - const: ti,am335x-bone-black
+          - const: ti,am335x-bone
+          - const: ti,am33xx
+
+      - description: TI bone green variants based on TI AM335
+        items:
+          - enum:
+              - ti,am335x-bone-green-wireless
+          - const: ti,am335x-bone-green
+          - const: ti,am335x-bone
           - const: ti,am33xx
 
       - description: Compulab board variants based on TI AM33

-- 
2.43.0


