Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3235AC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 17:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+xY4UZr8LvAM8jYcOJRM8hzadDR3NumATbc214IapM=; b=RiyZFxQC2Q25AZCGl/T3X9g4aN
	OMajCIAdcbA0MG+/JazYmx+hPpVgp1EW3o9FF7eQbZTGeqNC65uA+pqNIi83qXb4Hq9S2wpbcvb9q
	34UTFS4zqyNp33fimfh1T9cjyVu7x/nlgGCHvuU35uUidy86BAZQTnQ67aPTuNaeURBWI3DsJQLl8
	L+IqA+Vgk8MxWnQZcHds1UYLK9EvZPqAibTYApu1PZjCoEQi9Y4885HK6gSCBYd+uUbjGcyHyiD1u
	gFKkDSquHaC86j7kqKJWk6BtVVUkIAMoErt3hJuoGq1IQY6j7ycfefFLm5mJloQCvGKJUnTd4WV9i
	MUqdhJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhAPG-000000025SX-3FJv;
	Wed, 30 Jul 2025 17:15:58 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhACg-000000023Xa-0ioY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 17:03:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE0E6442A6;
	Wed, 30 Jul 2025 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753894975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+xY4UZr8LvAM8jYcOJRM8hzadDR3NumATbc214IapM=;
	b=QrZJunuzAe9A32IXdLxegg+gs4exspfjaG6mJNmOBcAId+g/COu7BRFQUYml/7aUdlElg/
	5k019XhQbOTZakt5FNPO68V8akrtj04+biWh8SQvGRQOUPgDMvbHD1fZGBeDz45Ixctlsk
	PKwvSnyHqcNG+NyrMVm1mbF9njC7cm5l8roFPbJn8DbfXqYTzQnVn3fcQrGVEc3jgAx4ky
	IT/9gKcgJqkt3+pS6TkO9nGSvJ7Q1GVdhsQLbL5V0C1FC8QqHDFaROVS3yvIFS+eiG2b2O
	0vu2hi2xpPqRJ/GWLNBCQS1sF2qLKQ3rptTpHoRghTgJcYyXvh4I/3CBVu3rUQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 30 Jul 2025 19:02:45 +0200
Subject: [PATCH 2/4] dt-bindings: mfd: syscon: Add ti,am625-dss-clk-ctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-fix-edge-handling-v1-2-1bdfb3fe7922@bootlin.com>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
In-Reply-To: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
 Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: thomas.petazzoni@bootlin.com, Jyri Sarha <jsarha@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1779;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=+vQmzWOpJ3o7m/vAWofAcDWRydefU96Ll29wNpFlYIo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoilA3M4ea0dmIilicR6aW0qGwK4i4ICkosRsvt
 d60pygWKgmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaIpQNwAKCRAgrS7GWxAs
 4upxD/9zxSfXLrFH5tI+71ohX67Q17YO5UDoErAp8zVlMW9VQFTihgpw0Ulexzo5d2Hj9OgZl01
 SfQPcsgnY4J6Zm3lL6584731SIlWk3xkH77d3bSotXbkLhlMcOa5GaUJlV4aHOmnGv1Q7aDbw0W
 TARRvPlLlGPRqAqTUJ53I7cUnbq6edBc2CzOD3D6v/NS3NqArH9Um9vVoi+DKZxvQWFt4IHnc2k
 4uSQ2hl05y1oJi8uMlK2slSpysT5lwcdkj5rQ807cRw/AYXDM0Ftr3VbA+JKJj6uid/ngC9m2fY
 2HqinTX07O3pojp4hoKrCWTPRnsGJldzqispnktmQClZpq93W0gbsfa/tLXwuzWcke1vqqdAatv
 DCsU4M1dAEHE4v3Z6Fa9ogDw/n1dxQBAZ+LuqAVVeI9NO88/cZWrPBLTXXqvdcs9B51ImzSiFeC
 AMnGnG8pJeBNiA0NxsDtYS+Lo6YeDMoJbRx5huwzaKtc8100GsB41vZoykPFixIdLgqWHGPukPI
 KGs8NJRfQQdJBfIxym3w5v2AhI5+gnjH6mXF8HPv7DT9dgJIXY/+euv8krKh5XjniHVadMeD0Fe
 MxwqXZ2VW3tU/gEIjYD2Ok3gvpoy+lGr/WbBOIusOZLGQtxluZHSAiL07boSFEil0LqxqNxw5Uv
 HkMjHdbq7Qd0qNQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehjhihrihdrshgrrhhhrgesihhkihdrfhhipdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrihhsthhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheps
 hhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnmhesthhirdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_100258_361287_25D3411B 
X-CRM114-Status: GOOD (  10.67  )
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

The dt-bindings for the multi-function device (mfd) syscon need to include
ti,am625-dss-clk-ctrl. On AM625 chips, the display controller (tidss) has
external registers to control certain clock properties. These registers
are located in the device configuration registers, so they need to be
declared using syscon. They will later be used with a phandle in the tidss
node.

Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---

Cc: stable@vger.kernel.org
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 27672adeb1fedb7c81b8ae86c35f4f3b26d5516f..afe4a2a19591e90c850c05ef5888f18bdb64eac9 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -121,6 +121,7 @@ select:
           - ti,am62-opp-efuse-table
           - ti,am62-usb-phy-ctrl
           - ti,am625-dss-oldi-io-ctrl
+          - ti,am625-dss-clk-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
@@ -228,6 +229,7 @@ properties:
           - ti,am62-opp-efuse-table
           - ti,am62-usb-phy-ctrl
           - ti,am625-dss-oldi-io-ctrl
+          - ti,am625-dss-clk-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
@@ -256,4 +258,3 @@ examples:
         compatible = "allwinner,sun8i-h3-system-controller", "syscon";
         reg = <0x01c00000 0x1000>;
     };
-...

-- 
2.50.1


