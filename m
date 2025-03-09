Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE294C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qe3n3ZQ5LVdeF6eehOPJZ7TfJ6ssfs/dDpnWYl0JxU0=; b=VSJROi3hjOpE2SqmwhXCs5H97o
	U4OFvwNso7t4JsF3FEDv5tkTveDKRLhdMU1czSshHQzN77eQeL1rHlh7le6/mgRIBTgyUrP65cloB
	BP4C+EUMWXqKCMBEmVbE/utem8vynKKLaGh477iM4SG5qlevjN+jHvPAE6DdacIT9iIDs1i/tFjLK
	LBAd/TwxFfheKp/5MgsRuz8/wKNqPMOx35dcPm5zzf0oFKhiSdSmwNA3GWv6En91f4RP5wN0c0gRS
	jBp8tz3MqrgGUWPDbLQdwC3t0XvohwtehFpgUnlFTvFuJf9hQxQF23C5NIrdJfyiogLkXb4Aq4q32
	MIJm4Vkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKW9-00000000qtz-2bSM;
	Sun, 09 Mar 2025 17:32:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKRL-00000000ppU-0lKK;
	Sun, 09 Mar 2025 17:27:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so19925585e9.3;
        Sun, 09 Mar 2025 10:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741541269; x=1742146069; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qe3n3ZQ5LVdeF6eehOPJZ7TfJ6ssfs/dDpnWYl0JxU0=;
        b=JzsYxLXuVDv3DV4V9NPCWQboRAFG8waAkANW9VBTFHvZMk/JTCDeDvv4N+EUAMFiJO
         olmiZwhXx8HDdWUX6PQHF7xwEFCJGAI1oAE7Sh3LjqS9ZYksNJc2DvJHHCgd6GPJU0lY
         VXHSrJADhdt2/JUrcIKTqzBBCnB8to3OD+5jEMqs8WCKz0nw1ABPnhS8P5/dxRTuq4qw
         NUvfb5SltN/c3c4HZg6hR4DIxTKI5LEdtixDvj/I3tJ9GTqdirt7BPHYE3cSNZsXm6Qu
         yVbryYEa7/4NOY4InGc+PBcworGZey02Ecn5E6jcfGA9PeeijdH2u5sKM2YRpF2Mc3sY
         wVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741541269; x=1742146069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qe3n3ZQ5LVdeF6eehOPJZ7TfJ6ssfs/dDpnWYl0JxU0=;
        b=IjjVQJ1lQPLOdmGbDkIabjDkD8AYIaAOjnSWioj5vSjAvY/e8kIQO9X6CZ9iiJA2c3
         e/fXFpnv1FgfuzR2kqS9gDew/17CvbnaLtv0eB8Ci9YYtcM2d+HG9HjZhgloFbx6ZYUN
         O8FZ7Fw31Z2quKYgYmjkyKOfpd5OJSxdcx2cJ1XQB3XfnRFNIvy3ChURaH4aXGwjvjGE
         ykTASPY/9IWcMDMe8bVczpzyxdByaY62tWH9elXnBVOhd/KY1Hg4WQWhMg7g565qaLe3
         at58XqBwxC2H7PQT3Fl77yvXFZkl001V7d7C2MvcgfGjNEHqq6i/eHtFlnHZr1riM2mg
         yfpA==
X-Forwarded-Encrypted: i=1; AJvYcCUwF8ofmc1yVdmx0+UP8Ih0ZmHf66u5xzyBloyn4f+Libn4yfee7qlewPWtzNDxAedS2EIkfhgEQePP0GGi3JQz@lists.infradead.org, AJvYcCWEOITyTSoJ+QhiIrioLG6d4GS56858siPCJSu1RA8iu+/V2yJI2+iFqhrFOd9h6jbTgMeanbymG3v5tntMSN8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwoMA1uO7d3/DtWiTTrAg4AKpWNy1mPF0SDTQay+B9EfJCHmmY3
	uC0LmXCzAq9KLHM1u3mHT1ujyfufIDzEgYlwt/Uhwx7ydmeMBIVZ
X-Gm-Gg: ASbGncuhaoNmEiNXl7V/HoFE/VTgT28lvNCo7KrJffXqmpfH36O9rQlUVEqjCmXkw8U
	ToU7Rmhkd/nRtFXZMB3y42Xrp0/a1WvxCZMloI4HKw8IZgo3M1eGNXiW2J4ZiNiQoY7HW+RkuE3
	WnBZGo5q+jhZxlPVMOPsPz/wAwcDe6O33Po7YG8FCJf+YrNkkNBbrNBcXbEmG57fG3i+5cOzgCR
	c2ApsUG/tuwrrLNzNxvbCADjhUNgkP3bRbup+2ujL8BnNwhLq/hVNzAuVGG/s0N6xvK1e95GMgp
	8QBxiQOLTpVFtgn1vZ39QzwxRp8IfbEZZFlqm0y9GqL9GiqohrpZ4OFBF/a1NaxtopgcUeB9KSP
	pNYMTnO+KddBodg==
X-Google-Smtp-Source: AGHT+IE8jl5fwzucCdfNuxyx+ySkmGSPf06fqDN9KMw/7IGsP3/vKw8Xjz6SFrR9lc/ycFJLxcGb2w==
X-Received: by 2002:a05:600c:524c:b0:439:5747:7f2d with SMTP id 5b1f17b1804b1-43c5a63049dmr62147795e9.21.1741541269430;
        Sun, 09 Mar 2025 10:27:49 -0700 (PDT)
Received: from localhost.localdomain (93-34-90-129.ip49.fastwebnet.it. [93.34.90.129])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3912bfdfddcsm12564875f8f.35.2025.03.09.10.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:27:49 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v12 02/13] dt-bindings: net: Document support for Airoha AN8855 Switch Virtual MDIO
Date: Sun,  9 Mar 2025 18:26:47 +0100
Message-ID: <20250309172717.9067-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250309172717.9067-1-ansuelsmth@gmail.com>
References: <20250309172717.9067-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_102751_219167_B20805C6 
X-CRM114-Status: GOOD (  18.10  )
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

Document support for Airoha AN8855 Virtual MDIO Passtrough. This is needed
as AN8855 require special handling as the same address on the MDIO bus is
shared for both Switch and PHY and special handling for the page
configuration is needed to switch accessing to Switch address space
or PHY.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-mdio.yaml      | 56 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
new file mode 100644
index 000000000000..3078277bf478
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 MDIO Passtrough
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description:
+  Airoha AN8855 Virtual MDIO Passtrough. This is needed as AN8855
+  require special handling as the same address on the MDIO bus is
+  shared for both Switch and PHY and special handling for the page
+  configuration is needed to switch accessing to Switch address space
+  or PHY.
+
+$ref: /schemas/net/mdio.yaml#
+
+properties:
+  compatible:
+    const: airoha,an8855-mdio
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        compatible = "airoha,an8855-mdio";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        internal_phy1: phy@1 {
+            reg = <1>;
+        };
+
+        internal_phy2: phy@2 {
+            reg = <2>;
+        };
+
+        internal_phy3: phy@3 {
+            reg = <3>;
+        };
+
+        internal_phy4: phy@4 {
+            reg = <4>;
+        };
+
+        internal_phy5: phy@5 {
+            reg = <5>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 576fa7eb7b55..1e8055b5e162 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -725,6 +725,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/airoha,an8855-mdio.yaml
 F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
 
 AIROHA ETHERNET DRIVER
-- 
2.48.1


