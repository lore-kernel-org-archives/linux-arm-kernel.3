Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C30C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRAxPjZgDa6ntXP4Zl1WhffxSqufwl7Pl3uMzQrQ3GY=; b=AmsNjmpDQUhMcszbqa3lK7fteE
	fIPLi6TNpKlEqA7jXvPTll1WUhnsEeWMyNxDpKGbD00LgqzKUw4W66Mz+/plB30pj/yTXd8ifuole
	lYA9DHhaVVv+S77q1r+gNKSgKsgwHSTyi9xGCdcTKIpDxcIkH4KrkkcGE/N9/0DgdhLtIz/deYACa
	+a7/dhdJCZyKvtXwhc+CHnzBHjXFZwxsvhY0/PnTUnMd1AkUw8KQj4rMaR57yThINSqCZCVe3UCxp
	NfKj053epCp8Q+FHCIFjYjofPFDnDTsv0DZaB7x1p+AVt0TcOCmyL7XlkhENBHVr+Jy3RgtGL2BJe
	z662NYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOg-0000000EEHa-0Eoa;
	Wed, 15 Jul 2026 08:55:18 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOZ-0000000EE6f-0GUV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:55:13 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8484f229529so1342406b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105710; x=1784710510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRAxPjZgDa6ntXP4Zl1WhffxSqufwl7Pl3uMzQrQ3GY=;
        b=V4V2eDflKKvWrJEZinT604iks8ME253E2SuDdH2BTlcyL0JNjDXjoK6obznhLqCv8o
         pFhpCQiJopU7dZ7toxT5jv+e1MyZRF0swzxf63/W5cr87qZs32veoFheHOngJ1pyyy6G
         cjUdJfM3g380zBC+Yclt9jtB5xZCAebqZUCsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105710; x=1784710510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRAxPjZgDa6ntXP4Zl1WhffxSqufwl7Pl3uMzQrQ3GY=;
        b=SlgnzrfWPbxI/jqZNVaY9JhYxa/4ON6SdKWfQJgm7RbCcC3Z7LHcB9xL6XJ5Y/zOt8
         KL3XaVWAAqwy1aCLmlYxYqMMzjcGmTfOZiQyHq6JaZQaQqJycV/VjQqkAPxszSMDexY7
         QEIQNCxtgzDNJ8PduIGVXrosPThfFS2xCmEHIMJuhRL5Usu+4r+xSLfSx83PJrFsCKtB
         NznCBN1ALIyw+pWN2AoZJ+5tKKp6Mzf/QBLesTJ5TWUkq7PxumBzZ1plcXfo7QLQLe1X
         D+Jad8t9TpUbrh89lFAreOFUYipRNsiesq2cn9Y+geCN6Mf3wSCtAA9hrnyYzedGLi1N
         yW3g==
X-Forwarded-Encrypted: i=1; AHgh+Rqm1ZriH5U3B8wp7w0hxqs1mUZIs52RPYDguyMDcJRvZ76FA9R2PGrikxcb2EjS1n26H+BGA30spcrZ47XxOS0i@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7wWtS/3aQauaN/MuoKPP7RNALEcMSQgmUnrqJrud71GsAhqVw
	oH3VXf6FNCXe/zeXK8grxIZDPgWtgX3YaWC2rU0Cm7BZM2NhMtvqX7YIL5zuk/nuzA==
X-Gm-Gg: AfdE7clEC72pnzw1/Csr7sm7L150atv85LJT9cJZ+hexBE439WfpTOt38t461r61IQo
	2Yw+ZHExgSHn8ADb+/ax1UTMmq744ms59oVmSa02KwWCxvY3V9pyxb+39VVtca9Re9X4oB2dfM4
	cINEpew6jTZOv66ijWCQp05kqA2sCVFQHwGbH7tj3eULq6yS/Tn10iyKOrdY9as6hmGiI9BLigF
	kchG3RQr73Tcdt3/9G+8KXgPu9Us9zUO7FgYEowD2h8N7wbPMCwGCxFd3w+5cJL2zknLb8tdnxY
	arOdqPxQ/5Jg2OztFm0Hdl1B6QckpB6FS/JSz79ATdZdskvi/AklAV/dPqTZwiQgHdbzavsM94G
	SBD0LvUR15qpBaN0+tH7yrSBjj6w2OeaHbZzOrE+3QqM+aAk2LTbd1oVWPH/hU/cPFBjjWGLxpD
	8KE6wwOLqS2XgqnA1zvuNVwJGu1axIEvKmjoIxeRU9TIZZAdunTDJAsrVvjZjEX3Zd52hY4g==
X-Received: by 2002:a05:6a00:1d90:b0:845:e9e8:6458 with SMTP id d2e1a72fcca58-84889703f26mr14531622b3a.20.1784105710178;
        Wed, 15 Jul 2026 01:55:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Wed, 15 Jul 2026 16:53:41 +0800
Message-ID: <20260715085348.3457359-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015511_218141_188CBBBA 
X-CRM114-Status: GOOD (  13.19  )
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability. The SSUSB controller
handles the device or gadget mode. Saying that SSUSB handles the HS
portion is wrong.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Switch to a "ports" sub-node for describing USB connections. Port 1 is
Super Speed if the controller is SS-capable, otherwise it is High Speed.
Port 2 is High Speed if SS-capable. This port mapping scheme directly
matches what the hardware returns in its capability registers.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Squashed DT binding revert and addition together
- Dropped reviewed-by from Bartosz
---
 .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
@@ -188,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.55.0.795.g602f6c329a-goog


