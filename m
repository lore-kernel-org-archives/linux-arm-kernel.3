Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AD1CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 09:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISYKmXVI5dGO3RCkjTpj/otEcK5TE9KEG1oM+kKbrzw=; b=d5ciwaQ5EceGcmuk1rk1TjW6tb
	41KyiVKIgtD+pmmcKRyI6xfbg5iwj3oV1kA8qHsZUvCe4+TViHvuXYe63DcIuMybqaJwUcLOokV3y
	a73AuKO9rERLd/vVXqhjxhosxLkFd7FbgXMhrcA47z968AGwxi1HsK2ZrZnKbDP0YIk3Mu2uDL6cX
	IWOO3i6wCa7Y6ECBCFRQ53XScJ3hUCPPjFIqHvXTQkcdXj0iogGH4UeQnnIouOYDHX2AYvsxxNrGs
	V5l/4HJstvtcL4makL75xU0B5qmQUTk6TY0J7Po3vlatwpbB2ZABznMlUmVFvFXuAqeSPvmqR1/sG
	Jv7BD79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRN-00000007p3K-1D69;
	Fri, 15 May 2026 09:02:41 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRE-00000007ou0-2erx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 09:02:34 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3665a90bcd3so7142701a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835752; x=1779440552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISYKmXVI5dGO3RCkjTpj/otEcK5TE9KEG1oM+kKbrzw=;
        b=e8V50OcnCvodTMRCTyQfR0t7qdRGbo5lud9B8ekZU5ftJRD3jh9BSwNDQWSJIhQeCh
         xixY5kDLss/tz6NfnVguPX7YJXtSymXKH5n38b0KikeThnqkEIwBU0LpHKIe2lfDnqfw
         Icw9SVeupOHWAJ5AtqqYtjO+OiNGmnHVfXyaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835752; x=1779440552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ISYKmXVI5dGO3RCkjTpj/otEcK5TE9KEG1oM+kKbrzw=;
        b=V12woFBuoznoPKnrqgTrwRSum+bh1Pa3NUGM9uyqJ71P5VtgP6es74Tp20wQTcBk5B
         D9hIrIKwsQRWnDV3E+I88f05+FB3DGSQItpgYXRDNXp8eTji6zKXlH5d3QGqX7Xq7Q9O
         ljV9lB+bP7Uypbim2ZjvwvswCRc9z58vPhN689hdbruNjpm5ZUxejnMN6RTmbVGtJ6JQ
         TwlDY+gFg7Xhrbp5Fz94IIB+9+SzFD8xq12Sa28DO4Kd8i0ySMxVRzGEYOvKimxAKN1m
         S3nmhj6J/CmlPIWOf8V2diQ/aiLhfuXYDZ0jEp5YNUGPwBJHhBX2m5kKwg7oYUg8kPPT
         ncGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/8qYhtGVjNjdie02yM5oFIISmRoowYgEt8sVC2qx035vS74wLM+G8eITeh4E0gw2FeJT/AkvJih3urv2nfkDJy@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+1cnVVpij3WPaSEdaYQtqzcdVaxRqbzfWGQQAmIhMapU0xVuW
	fPwlolv0+VBiM5/3vpqzQPe0ErthaBy/70ajkWGrsNpDTCuqqj7IuC/ezdX3buwOwg==
X-Gm-Gg: Acq92OEdlOLj4rS/Hqvfapg4hFoOTBScUH80afIoNeWUmJBBO3rWrZ/632m0q2rEwlZ
	WOIhDuhhyW4XmLuKI73yRJUbt4HZx5H9iUHiiCrnyjPUZQ2mMzutFNku/JXxqzRMlq2CjIMLoZ0
	5Yg6adqRcghdNh6bfhsMpAniwty8o/ZDpVYFWJ6ixyNyff+6PXI0nKIY3ndsaZJLRats7pZw84P
	X+ngzyf1Tmtodari4PPnp8b5iLyLWD4RKWvElafbwSCy6a2sHXkgSiMwdxx8Qk3E2vWRz/sVZi/
	CMPVhwQlDra6FwvdqXrJ6LDxpbke/RkMO6BZIrThO37C0qGh2o76dE4+OCLBVSIUopiKg0S0KPX
	c7F/0dWCXaRBfrp0PO3RZFoe1MroKsMQVZ0PmiohTusErepNDMMhMQH2q5C1exp2SgPL+ofr1mN
	oeCOxSOChaZOrWUncoSY4yOjZ8Vm65RZTloXMzEPdkbQpI1gI5Bxa1bs3uZMh+7zQOK3bdBWb/9
	KmVAMXZq4ZFZmchg0w=
X-Received: by 2002:a17:90b:5784:b0:366:479c:59e8 with SMTP id 98e67ed59e1d1-369519dfe40mr3451397a91.8.1778835751725;
        Fri, 15 May 2026 02:02:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 07/12] dt-bindings: usb: mediatek,mtk-xhci: Allow ports for USB connections
Date: Fri, 15 May 2026 17:01:43 +0800
Message-ID: <20260515090149.3169406-8-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020232_686873_C4F353F0 
X-CRM114-Status: GOOD (  12.49  )
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

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Allow a ports sub-node for describing USB connections. Port 1 is Super
Speed if the controller is SS-capable, otherwise it is High Speed. Port
2 is High Speed if SS-capable. This port mapping scheme directly matches
what the hardware returns in its capability registers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 75ecce3bdc7a..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -184,6 +184,19 @@ properties:
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
2.54.0.563.g4f69b47b94-goog


