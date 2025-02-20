Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FECC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 23:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=; b=q6sF7D0aMnoGJzIEIsNwHCGDd3
	WVDQCxwYU29W0xvbN0ng8IlGvhsqMiD3IRNwY+YDm/1GJt0oVbhRHL+RJlcjkkfN4KA90mjMnyL00
	hhPEHuk3wfP9P6jPeExyRO5aJ6l0g5u4dp1eGY02P3dZmoKOv754XuApLQkLofI1qvETEPxmnZTQs
	5Yh66q7UONfpeuxEy+zCTqs8ahV1ALf+GJUyws7ky1d3AYh5vLRSxZ/r7BymdnlRZKq4KOAwKC82S
	0CBEGVkS3uSwDDrjF1dvrFXwB81sYvIwtcni1xNbQIzX1x+Su8Wpw6IyyFhAT7iw+8U11XfvncE0h
	i85gQnWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFhZ-00000003G1p-33Rc;
	Thu, 20 Feb 2025 23:11:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlFeu-00000003FGw-00Uu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 23:08:45 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e04f87584dso2338648a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 15:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740092922; x=1740697722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=EDv18zb5pFdYVXwwBphyglYWkxStdwSLwpe4sDVF4/aqcZH7ddVH43NNdIwgKHboZE
         yN4zCTefzUJOr4JzeYd0qk5q45eTF3+tVm2aMegTCV/HtzI95VbmJR0sC14ch3F7S0gv
         IWDtAbLmKQ8ioSc6owcq/r0nln+kV/QdYbXAflm81vJ54cF4FplBub9BGZlnLrmA02C6
         OcePpLN38EPVZZakVvW1Y1oOjhr3zLDD3ayUcwx053NtNBtJgkcFGrE9Dw7Boz/xtjRw
         /7RhacM21ukAS9Laco3jbl/SJOhmHv/JH2vKkHir4NUVvvNZYIXG3SnxYbrmPAc+LoHC
         mpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740092922; x=1740697722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFOJHCDRxWmWioNC6N/UlZoweJhdV9qdoQg8e0aFcrs=;
        b=evz9IhFxfvxvk2eYWXnUPf+ncFzTsEezEowlVdN1tkIWUgtI/AsQ0o0qiJKBQfABvT
         6TCUdpg3G3XrQLUWhkrZjlr1avit2NlcdoBImExLjOfnTENI/1dfV7f5j2Lb4QIJSoSS
         nEq+KjtQDJQAxsB+V+RGE8L8kSqM5OH5jZGaVlNTHgiiih4hzssg0fMh8fMxaAMrrWq0
         NnQbi7mk7Yx8dSTBot+iNQbA3gVvRi6lwS41L7wuOcMVvGuBJ0LIUMAE/6k86RAsHOv4
         E2oDQgQK4MCFk7YSOy1VEaCi20uhQGSCqDCPBUY6v7YvYNVn71sA63sqSlykBHUBzBMu
         EOFA==
X-Forwarded-Encrypted: i=1; AJvYcCXKRRcod2eBirla5zlCjN1dqoY5gNXdTHSEtgtFGQCfqEPRxUW8q5ZpBC6a0QYtO3sekgFdJzr8SaO/x4QbJ27I@lists.infradead.org
X-Gm-Message-State: AOJu0YzRpCS6Px7vc2m2lZgDMdoTQmNhzX6xPFfbeX86WkeAEtd4mWYx
	drhDUifnM5dJU2fEp0QJU6n9npi0TK5IJTSNq04ch7PTI7H+71xd
X-Gm-Gg: ASbGncsiuHkU2PtmN7BuExMeYRyCdHhLQatPE3WWGiQUv806uUXU4yefjYN02bVkANa
	mXnoxFUvnvzbySfwzlJMEH7wHcacPnpucg2E86rG1Fjv6mW21mZXC2vy5bxPV8agsXDK0CjG6ta
	We7Z90w9U9WZJGtdM8JKu+60c7EAOUgoqq+A6R3sxeh6YnMdN4shZNiLqXbVo4y9AHyCN4RPVM7
	wJos7qT59Ql+4Dmfmiwh8lVFelZcKYPpvxEEamrmEG6QBefpIkBAmXE21rUze+m7T9xb1/tVJu4
	6NHfsXec4W1EAw1D72rorXoeQd3/
X-Google-Smtp-Source: AGHT+IG9EAhYRQtFAS88EjfSpO8anFUAbm7p/IUPqkE3ggwd0qucvdpByol+KZZelROudQA+nudZqQ==
X-Received: by 2002:a17:907:c284:b0:aba:5f48:eda4 with SMTP id a640c23a62f3a-abc09ab9bcfmr86596366b.25.1740092921968;
        Thu, 20 Feb 2025 15:08:41 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb9654a6b2sm909107066b.135.2025.02.20.15.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 15:08:41 -0800 (PST)
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
Subject: [PATCH v2 1/6] dt-bindings: media: video-interfaces: add support for Virtual Channel IDs
Date: Fri, 21 Feb 2025 01:08:09 +0200
Message-ID: <20250220230818.275262-2-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250220230818.275262-1-demonsingur@gmail.com>
References: <20250220230818.275262-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_150844_032566_A49F1000 
X-CRM114-Status: GOOD (  15.23  )
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


