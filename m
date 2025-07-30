Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95135C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 17:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kp/er0tAcwSGh4h0rLep0cfDaCG3r32BhF8cj5ZTgVk=; b=3krOOy5dpLFtP1+kMrHI1T+uU3
	+q3HlRqaEvRPOFCQYppm1cyxF6+HQUbJY4PhPacWToDiONNLxY/cuD0996FiVDlSKpmC/patByvk7
	R033YvdujmQHXj109KiMunwlAgSPFxJ5HSGjcibvqZgQrO2E+t2cRjbPVVRGgidHi5S2eRHmMVK/i
	s3+ZJQWUGhgXHWIbhrAqKGuj2rKQOQy5bh7Uk/yCQlZXdHCN+UeVqGMOqfYwT5WImeBcB2twKNXPr
	NN11AFmZxL/RFclB3tiyoM7awhmk9/JtnGPmXRvd6X1IIXi9+n2szK/qnWjS+ih3St7+6lFA+vCFk
	pxE3Hjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhAKM-000000024aC-2wP4;
	Wed, 30 Jul 2025 17:10:54 +0000
Received: from relay15.mail.gandi.net ([2001:4b98:dc4:8::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhACg-000000023Wp-0YmU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 17:03:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D617442A9;
	Wed, 30 Jul 2025 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753894973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kp/er0tAcwSGh4h0rLep0cfDaCG3r32BhF8cj5ZTgVk=;
	b=Jyl9vUZJ4ufUq1ms4UZ/7fOnDkbDMxSZhF3bF8bgP0IY+3gWu5ROhf7v96XzIsQxFlePLO
	uRLVQ0YctxEXbu8CMbFOm8VhEDWrHGNRcZ+4yQQ4tosRmF/yPKYvyNZ9vABFwPCY43lgAm
	nk2zLRmMOVq7WvXWpJAJu8Eygu3/Ua6tYjeMYiKAcXB4SM1KYoVbEWg02EK/w+XQSJGHPh
	VirFa0cl1GYVP/Kgx3zUsvWlN7d/9aaa9xLUy+1tblitRXTAiqQRPbGkccRpTjINMbg3+3
	/yreuk97z2R5Cgu5hsAQxlFN305sUYhVXdQWtVbkHe9+THgfbfoZ/K3RqKmBQg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 30 Jul 2025 19:02:44 +0200
Subject: [PATCH 1/4] dt-bindings: display: ti,am65x-dss: Add clk property
 for data edge synchronization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-fix-edge-handling-v1-1-1bdfb3fe7922@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1754;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=u/DBPrrXi1YUBX587wY3HEnl0jSOb8wEheVaHESnVqk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoilA2suPh4nRhBtWG5qKVTjCFsDGyeZE4Bq4Gd
 u0vOdgXHPSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaIpQNgAKCRAgrS7GWxAs
 4jDTEACExFMJe49yi3EY4yiiTXZOHCHmbi/MWe3IyQN+ciki2IfkgmVMuTsTy7rpQbH17Bif9wc
 vwhmqQUd9GLY5UuGlP6/ZT4glcRi24XWNt1/ckIagtL549N2+pymVinnz4EsmlhTXPL8u9/NSUO
 wLsqChLJutV+GEsLH7HwK5OxEB3I860UCqzasSTpQQp+61LsEBJurYYTiBR3n5nb+UwBWUvDqij
 COQGqOC4eTxHZZvLFmTiTI4NMNjsYRN0qp7mXrm8fEm6x4GOaxN9MPeZ4vdsmIFHsvJVD3bhwps
 C8Ilf7nLvXPtLNaB461Y8zi2WrSc+G1ckZi78Ru+PywCZ21uoAzZu5PbsTINnGzD1l2IxVdK4LZ
 W9RmeKNAO51b05+4og6UpqiWAVpvWxdf+hjgw/uh7I/6Ca/fGDO3NueIsOMObXZjqns96fQTdw7
 cca7cxsMWhuleKj22UjmpjUBMcU0WieUJBWghZTUPT+z5YZcsxCDW1upoORginI8Dh+8jHwZWwQ
 WHdjP7N7j0ST68qD78xlWlylKT/P/LbslrNfXJvEwC/YsTgIJoPuB5SvMS9mfL/nKXs1LI2uKlL
 lf9tAVcGVwffhm//IWarU1qK7ed/E6lxqM9ZA2kqGbBVE78pGzPIQlXp5oNhYW3cipmqKmNVMLD
 ZBNZ38Dmg1nF64Q==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnohhuihhsucevhhgruhhvvghtuceolhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephedtjedttdetieeigfeljeekteetvefhudekgeelffejheegieevhfegudffvddvnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvhedprhgtphhtthhopehjhihrihdrshgrrhhhrgesihhkihdrfhhipdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhrihhsthhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheps
 hhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnmhesthhirdgtohhm
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_100258_325159_90AB9611 
X-CRM114-Status: GOOD (  10.75  )
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

The dt-bindings for the display, specifically ti,am65x-dss, need to
include a clock property for data edge synchronization. The current
implementation does not correctly apply the data edge sampling property.

To address this, synchronization of writes to two different registers is
required: one in the TIDSS IP (which is already described in the tidss
node) and one is in the Memory Mapped Control Register Modules (added by
the previous commit).

As the Memory Mapped Control Register Modules is located in a different
IP, we need to use a phandle to write values in its registers.

Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

---

Cc: stable@vger.kernel.org
---
 Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
index 361e9cae6896c1f4d7fa1ec47a6e3a73bca2b102..b9a373b569170332f671416eb7bbc0c83f7b5ea6 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
+++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
@@ -133,6 +133,12 @@ properties:
       and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
       interface to work.
 
+  ti,clk-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to syscon device node mapping CFG0_CLK_CTRL registers.
+      This property is needed for proper data sampling edge.
+
   max-memory-bandwidth:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:

-- 
2.50.1


