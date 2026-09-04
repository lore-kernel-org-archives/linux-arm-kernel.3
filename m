Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386F4C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=; b=4UPPVfoD852oKcOdls9RnwsUa4
	q7/jMW4AVxFp7fCvLU3rEgZLffoSSgcSaXIznZO9WuDgEiayu+dv7CmM8IjKvPD0Y9HcHl/8yTMtt
	Mi+wWc30+X83dafn0AXeZXM18rEEJ/ymrPHhgPLkddlGq9cPxilipz0OBSakaLjRLRD9JDIZvUGul
	/2WsnqsL8BC369Azjxqg/5tChmxkK2V5nawSBMNYRtHOgiPlbVrNx2ktyGe30B/P+Z73i8VoAcOlY
	0H9fGLRYvBpGDPJ1wz8qUOezYXiJUwccD5AtCeTSGKixHleSpRiOoOum6JWsO+t7R3nyq4754djke
	7czXN5Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PX5-00000001QWC-0qcC;
	Fri, 04 Sep 2026 08:44:23 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PX2-00000001QSM-1Nyw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:21 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso556899a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511459; x=1789116259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=;
        b=U22H7egshmZpnKTgdBR9xZkgpU69TSit5RtzDHgP4z5TNdMuylcggPzi6BfaLoVwCs
         lNil1Uk1zXt5qcYBWg5o1gzv0RqB1TaikhF3Vz4422/wa7JsUVBg25jgbd/bYDJM4iti
         VByPRd+qcuNdCthOAzp+xHDq6tux8vfS8IQFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511459; x=1789116259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObFYxd9MufAeOT7Yw9/ly+HXxu6y+wv2diiZ0sB4OhA=;
        b=saSo3BDx6T+eItm+0jBOICYdn+KFNAJ1CbMqdZyAKLlEu21+KawtQaC5pgikdGYGUP
         wHbrxfxQkWfdtQENM4vOUHM6IpYfMKPZeSLvDF9GmLY5o7DBc1R0ceIOplMiVNEnvwDP
         8yCOiINubIjOqP5J18qDxr/rOFKkMpeSB4Qsa+sVRCCd2rPVJMfCvXtlltk8R0K0VAFE
         IR1WjESOu4XQhdydHtyVduGLenM/0JwWtcYREl6sB8KgTOAiXrK1aJ1fgew/rx1OGdMd
         KcMW0SlSBsDzvG5Du5d30qhOe3GxSBx7bCrnFtER27BRZbDIVadiCGVTNcyETB7xxOA1
         QaQA==
X-Forwarded-Encrypted: i=1; AKwUvBzRdpU1NkV3wylhy1abevWhIg76DaGQsD3pAWq/W/rqsfYWk4kE13HycKJOJNQ/9hRqtWAs5i+XBE+YV6ufOkW2@lists.infradead.org
X-Gm-Message-State: AFuF++m1/Vq6aaIoS+VqvYwXon6W1QXArOFbidVkIb0bo17cPwidgqML
	BTxxfpJ70kqgZLdfSUIY3hZR2Bg71uws8IdT/J29y4Gk0TXmsDWlYZb+thUZYQHP0A==
X-Gm-Gg: AYBFou1XDorNwZMCpwyRtA1NfKcldMHOMECwkAlak8RP7WtSAJnyO4kfiPbLXKUD8ag
	nmJatld1MrIkblv25kVGq9EJvy1hDxFM5yb9iDWoSK2FaB6qWQssNm6fovhQ7NMqKp12tygQPqI
	7xqC0KsYiU9E3a/mw2ESmaYuz8YGjdpnmZHkh6kBTosZ1cH6ZLOTA2mrDWBwKl67cUBEEnt4ClW
	ke7fDhqVzIxVStzD1lZI/2AsFemVEwjpOtExZJPuyiP3Zq3fmUrpJq5lre3uXd/yhA/JsK0aR+S
	TQOHN1ApgJuabuFlhxISskGoPm8w44jNf9d6SR3BjQH0FfRPiLVnH/MdfyTf7lLd2VkhDmd+pTd
	LYCRJ+KDD8l96RtSJzb9kGrC2A+aTNTvn9906LzCh/nKNmfutSP7TR6dDhz/tjVHRINhtf1fr97
	xXEaEO56pcRSnsEKGlrKvVH9706UGRMr1B5pt4e2QT9nG2iskaJtfEaIDrzDNNx9F8mXmmibaYd
	Ppjcp5o/mQ+fdGvh1GHK9hYqgyrdMgVR5b2IbWBbH3W
X-Received: by 2002:a17:90b:2808:b0:398:b46d:48c0 with SMTP id 98e67ed59e1d1-39b262aaeb7mr7039451a91.18.1788511457565;
        Fri, 04 Sep 2026 01:44:17 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:17 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v8 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Fri,  4 Sep 2026 16:41:50 +0800
Message-ID: <20260904084158.1341550-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014420_367225_4C533564 
X-CRM114-Status: GOOD (  13.39  )
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
2.55.0.979.g7e5102b832-goog


