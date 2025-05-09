Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4ABC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLGPh2FOP5gBSogplBe5Hi56djbiBKOKubmlNQeIoYo=; b=p9NWeedod68k6BWbjHaA9uIilb
	Tx5IdQHPskGtyz7g3otwLoSAEpdH21+sMww8Vaj05VIU0AEKUP+agtHOi8jDTWOXSzXrU7pVFcjPG
	C7m6Xy36f7xSDSqrkwZklYOoY1+zzVWf30quffwbJPtMQqZWosIhXXzMacB/FC1+U8VxjUh5W+M9Q
	t4AU7PzzZn+BRuglufRLhAPAKPvZ8qCd8Qm8n17ouHYRCwrZBdbyiQaJEmIoLsuuT6+NxB/BUR2Df
	M5K+n5IjIIbn/Kwn8RZoinz7q3zOU1D8ZUaw8kX+tvP0EnzsPBfb0FeXjv4Ee2b0Z9RtjgaxEgYaY
	rfHU2YiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVi1-000000051CJ-2Fwk;
	Fri, 09 May 2025 21:56:45 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVdH-000000050d5-3ytp;
	Fri, 09 May 2025 21:51:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3FA711FCEB;
	Fri,  9 May 2025 21:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746827508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PLGPh2FOP5gBSogplBe5Hi56djbiBKOKubmlNQeIoYo=;
	b=DuAvBW2avA9oLpCRX/ei5YvsWsVt2aowNBGfR8oOyJv7oSim+SjO4usuuoYiEfDH328Whl
	5m/N+eMfGbCg3Kwf4PKkBf9g84kWhMsMiQPznvaGVSadI9BlfCNHb0LDLvU+nrF/P4FfCG
	EHdgX/L4OW5wxuCIuDUkmZsy5yQuBTnlkw67j3+UujPVTCzbTMGFLTA42GNjVPIqMdKbVA
	9fMUS+1D1iLMosWOZAhb+Bk8zpoSsK+klX+5W0sP1p6+gpbi0in0CbTlJrGzj8Z7OtQa/T
	J1zf90J7tI+VgRtX+g+ndJo6+dDfCRM9oSjDQiTln1N9973tXF04vCXldhOW4w==
From: Olivier Benjamin <olivier.benjamin@bootlin.com>
Date: Fri, 09 May 2025 23:51:37 +0200
Subject: [PATCH v3 1/4] dt-bindings: media: ov8858: inherit
 video-interface-devices properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-camera-v3-1-dab2772d229a@bootlin.com>
References: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
In-Reply-To: <20250509-camera-v3-0-dab2772d229a@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 imx@lists.linux.dev, Olivier Benjamin <olivier.benjamin@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvleefjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepqfhlihhvihgvrhcuuegvnhhjrghmihhnuceoohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegueegiedvvdevveevvddufeejvefftdeugfffkeeileehheefieehgfelfeeileenucfkphepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvfeegmegvtgefkeemvdegvgdtmehfhegtvgemfhefgedvmeeiheekjeemfheiheeipdhhvghloheplgduledvrdduieekrddurddvtdgnpdhmrghilhhfrhhomhepohhlihhvihgvrhdrsggvnhhjrghmihhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvuddprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrt
 ghpthhtohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrohgtkhgthhhipheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: olivier.benjamin@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_145152_593095_232F2915 
X-CRM114-Status: GOOD (  10.51  )
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

Update the OV8858 binding to inherit properties defined in the
video-interface-devices binding.

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
index a65f921ec0fd24e449331772e39a16cadd73a868..491f2931e6bcdf5a1ad2cd4f9eb187055c3a7a2d 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8858.yaml
@@ -15,6 +15,8 @@ description: |
   controlled through an I2C-compatible SCCB bus. The sensor transmits images
   on a MIPI CSI-2 output interface with up to 4 data lanes.
 
+$ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     const: ovti,ov8858
@@ -69,7 +71,7 @@ required:
   - clocks
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.48.1


