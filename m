Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD4EC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=; b=SJvKgqwn+8L4SFJrrupRlZBgW9
	rXF540KVXVhEcsqPQH79jvy/LzOwz9CEsVbn4ZWeNteIhSkOxRIJXM8CRKM04Yxlut9Fp1fMzeJ7c
	azO+Jr9TGHn2OPH9v/cRTU85kQySFRNv7xWNU2BJifxrLn3J0lQwsB6Gt/eD/aCbl8s/vPBS/RxmZ
	2JKHIiLKRK7VqX/UZe8HRIODdLL+oCfxbtRdWC7JOYTE8f6UyUXX3VANVC793bkZ4h1az7nvF0caP
	5NEKfkEYbVg5XE4G+9WlbSOvvC6hFGl+0yPVGudsQPyTfJfHKs1pey0knyCjBGjCVndto4+ER/QAk
	AMvcHPWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7SC-00000001Ht3-1MG6;
	Thu, 20 Feb 2025 14:23:04 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7N7-00000001GPY-0P2O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 14:17:50 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso182041166b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 06:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740061067; x=1740665867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=TkBD3TfWj9hMBWDiW0D6IA69DW0ijeZUWf1jqHYPSOE7JRGYtmzPsgbJ7uG9iAJs1T
         47ogN396eRoLewkB75boVR4rSARH0AZxW3XG6ZA8CqAcyAdy7bxVL2fyipmTgIs+HcpV
         DNkPzemOwaDa6okZNGDUllE07N9B3kdp1Yf7fgSO+4FqBqvCkN22coLPNfgrIkRbPb32
         0LXYDOMFkvv7K21CBS8i4ZICaP//w0+DUvrpDX7LDdyGcq2HCr7RfrZCYvHujlfqYq01
         xmnQO/DeFCxv4r30DjQvr4uQTLmWIc/9XySoWTB9JtaoJZAJLBoo7nMTwZr4mxEjVype
         ltPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740061067; x=1740665867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=t2R+zXNgVQrqCxLswp3sWUqVTwYTNL04bMA6rpnTuewHMgfqocI5OlgeOXHRAFYN0c
         VUaOTjfWSHwYqgl4ChL6GJsgkCIL93XQWnynq4ac7LB4QHyibE+MD55U0kdr3lyU/AfU
         cuYmQv7McLK3FTqYjEs2kUC8/TpQWHURCkWoWSsHHN1SoXhm7LoCjmpkRGowzRfxfayD
         OS13nrU86rNyF/aHZne2vaNG7NFU+AYY5JOMzw3S35H8RlviXecFzu8ZjJ+2hH4gEUq8
         ghMPIC/E+6kRMOHBfIC0HnZpe8AhIodv00nhmCioXHFCidPmC7eA7Y2mRcjterXKv76e
         ZtCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmwHtlC5jRkSAO98jFOxd6Lb0lI1knyEddw52vvYqnTwaqJYh3I+KxFhZ9ieCL1QEJiHzFGX7bsE1E6yb8SeEw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx70H5BuakQCtZjaY2gxxMn/wEcbrbnoRl2he0BJLmsgsJkjVfF
	RUttdllUpSxH+LsdIFumAX3f643wAxpRnYVTqabgZ/ZXYm1wDhqY
X-Gm-Gg: ASbGncso3XuW9Qp9MmQin6DDewv0ZFEqr5SsBPcVKehggk/p1SARJ//kt3UAXasdtjk
	mVImtN4GIQSkrhPC+Q70gQlY1yrBQPdIN3T91dl+4qyCRM5+dvbJSshWlNitCHAEL8btfmYISea
	e991yfrD8vp81kv5M6Nocen7AC94dZJmxEfx3iwWe1Omo0qyqUCaexa4VHV+IPQLmBJQ0p30pau
	1wlbhPW00j1oCGFEUzSVR+EfWnbvC18iMuaLUt04WrnaK08l8cwPA0hBqR2GhvXEusAIXyTTOhL
	LJo/EBqvnmPhrwUCyf7nrRRxDFz/
X-Google-Smtp-Source: AGHT+IGbvT+ElwJFSjuG2SgiS1oHKWL2tTnh/dZxsOpA946XGKGKmXCEg6KymAHfaze7tPu7/efmcQ==
X-Received: by 2002:a17:906:dc90:b0:aba:cc21:8b3c with SMTP id a640c23a62f3a-abbcd0491demr861472966b.38.1740061067200;
        Thu, 20 Feb 2025 06:17:47 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4f59sm12124224a12.6.2025.02.20.06.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 06:17:46 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH 1/6] dt-bindings: media: video-interfaces: add support for Virtual Channel IDs
Date: Thu, 20 Feb 2025 16:17:23 +0200
Message-ID: <20250220141739.228714-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220141739.228714-1-demonsingur@gmail.com>
References: <20250220141739.228714-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_061749_132385_1A99C9B1 
X-CRM114-Status: GOOD (  15.27  )
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

Multi-camera systems often have issues with receiving video streams
from multiple cameras at the same time because the cameras use the same
Virtual Channel IDs.

CSI bridges might not support remapping the Virtual Channel IDs, making
it impossible to receive the separate video streams at the same
time, while the CSI receiver is able to de-mux streams based on VC IDs.

Cameras sometimes have support for changing the VC IDs they output
themselves.

For a practical example, GMSL2 deserializer chips do not support VC ID
remapping in tunnel mode, and neither do the serializers. Allowing the
cameras to have their VC IDs configured would allow multi-camera setups
to use tunnel mode.

Add support for specifying these Virtual Channel IDs in Video Interface
Endpoints. The supported values are 0 to 3, with a maximum of 4 values.
Although the CSI-2 specification allows for up to 32 virtual channels,
most hardware doesn't support more than 4. This can be extended later
if need be.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/video-interfaces.yaml   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index 038e85b45befa..414b5fa8f3472 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -231,6 +231,17 @@ properties:
       shall be interpreted as 0 (ABC). This property is valid for CSI-2 C-PHY
       busses only.
 
+  vc-ids:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      maximum: 3
+    description:
+      An array of Virtual Channel IDs. These are unsigned integers that specify
+      the VC IDs used by the device for its data streams. This property is valid
+      for MIPI CSI-2 only.
+
   strobe:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 0, 1 ]
-- 
2.48.1


