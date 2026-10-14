Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1F9CC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HJ88z5GPX8b+VXAqaP3/v3qo/EtaXQO2geHV+4a1+Gc=; b=knC2pl8CM/GUj3ldlNW7nKJD4E
	ZbhPSgwaMov+wmcMKfHcJvRVIjqqf1OyYqr7k5H9gpq5mX+ganpRZy81f+CkiIUYcNLZj0Bz32cu2
	WVjPY8ckN93U7P3lGA4Sh2QRkaDNPaxBnqWNKU40/ra68XoozWlpJvO91q0pRJ2B/NbmtItgkOtNC
	f+/c3zqGQbit6KoW97Duzrb3uBFDuCWuwXp4f+r9Sa2x3hewVHFJZiEiWt/saPeA8NzciY8IOkh4m
	KtXAVM2XYuwoJtIeS3NdkeKWU3nzMpQsWVtFVWMPEQ5hxNP/eiJknj2lPy51eoNQUKLHU7hQhE5bh
	ZbpmB2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKe-0000000EjW3-1WHJ;
	Wed, 14 Oct 2026 07:23:24 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtKK-0000000EjFi-0d3q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:23:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48c45111bebso2221569f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962582; x=1792567382; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HJ88z5GPX8b+VXAqaP3/v3qo/EtaXQO2geHV+4a1+Gc=;
        b=CocUF8qg9pp2Gr8SoEIdAGuKDwYubGYeY/wVwAN1PzCnZqdtqk+reW6xyRYdrdXKB2
         9BenJmXzx4KhKlcKCWnSpJNiugL/0vl3M8/3q/ivlZvqN+bi6JbrIaTnx2yzC7V8UTlL
         OSqMHxtjpYkMlCsRlN93vEngN4eblmmiRYDVvr96FW4MkbYICpNohilB/4OoU9JXmAJJ
         OMR73MYZGQNAD6T/ARzoOzG+DgQ2Uv5C59q6HcYbfNmVvuoWRNzNfzb6YmvHmrdvG4ZL
         4j1hISG/AY/8NNbsEdErn5UHEJjyF2jl4zGKVDI24y9IkR44Mu6v4RoMoL2exD1kwChc
         HbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962582; x=1792567382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HJ88z5GPX8b+VXAqaP3/v3qo/EtaXQO2geHV+4a1+Gc=;
        b=zXn1UQE9eKYroiKgKvMrXZSxsxMkxaHHnn3gdnJQKEhnPIgL+ByxpuD+dJXPuU9uzR
         A4qY/w4TIfeWP+G75tnYsXFWuI1WnVne07hjoTDBBFxhcEzUeJF7eZ/Gc+GI3Lf/fjbu
         DKBh7Nif9N8y4X3Hy7WdF40SOqf5URHLZoKf6dtaAFfSp6ww9hlBNz0O9spdcTm3pdPi
         rp5KWYGRcUZfS+9hS0hJIJLWKZczV3t3Itfn24yM0xnsf57ZJ9tnuAyInrSXjZhhvh6Y
         /gx8CBkT6mPrDjq9n/ZsfRsuJH7SyIs3A520cNmheErtSmv5ZAFuAyvk5n03B/wwKl0F
         GLqg==
X-Gm-Message-State: AFq9FYI+SYm7ktA8aePQcwL/hNX2wkIr6sE2V4wZi//NSb7VZNIjN20K
	AteWL9EV3MkPOO4D2vupbBEixgDJYZ3CKo7PLeg6SkfAD9AKNvqoyIZE7c/vwSOOUp/N5Q==
X-Gm-Gg: AYBFou1NMZPxxyIUWsXH/GhoQcXRFEy726/vvMuxlna17BSWQIuorD8zODrwysGVSqx
	1nix+og9EQEAT1y04Yg5aGqT4YqRwUbRAqvxS0y8IPwXUvdthdRyDSGtxmX0Jg9kj5+FsFgxA5C
	2kSxADIYBuZcmhat3CoTN1DX70JM4s20FQ+sAxEWg8SUZTar3rmzE2y2a9ivoe6Il122cWyWnxG
	XKM6CMm/NqWEpbV88qYqsUDgKuUBv8dg3VFMOn7fLME22mlpOivkpnpOdQ5elWyfWeTVWfIchhR
	R09FPToF4Vc4clF8C5koxstAq/bh2nSe4fJRwURLxgxWUkmCdxzn+Wa/zN1eJ19PhmhIagvG7SH
	Oo/oUQWuh4UJedxonAqhxAB6IYTii6MJDZh06gfSIcKwI4CMQ1xQPc+D+Zj9Ho8WJjVfAVXydXw
	y9mfMpHqZcMy2rymhz138QQkSoe3WrVbB4RJWOMGw3sp4FZhZfzTKdftwWpiZMhWlykOL7bcYng
	RqRRXM7yh7KdoZCixhbhMu0vdPTX9TLw78PncsjXmEbFvc3yGiQV1XdsVW+yHP0Zlop7nThGopV
	lUBnMN4I3E6z8Fd0kVTEcjT2LMor3RLozoWujWCEOvEfcjn5s46dIEGL8rcvWA==
X-Received: by 2002:a05:6000:2dc5:b0:48a:fb26:23a4 with SMTP id ffacd0b85a97d-48dd6517828mr15172799f8f.31.1791962582334;
        Wed, 14 Oct 2026 00:23:02 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm8500933f8f.35.2026.10.14.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:23:01 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/24] dt-bindings: phy: Add ZTE ZX279128S PCIe PHY binding
Date: Wed, 14 Oct 2026 08:20:50 +0100
Message-ID: <20261014072109.1759502-11-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_002304_243037_8B2FDFAC 
X-CRM114-Status: GOOD (  13.45  )
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

Add Device Tree binding for the PCIe SerDes PHY found inside the
topcrm block of the ZTE ZX279128S SoC.

Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/phy/zte,zx279128s-pcie-phy.yaml  | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml
new file mode 100644
index 0000000000..7bfa363294
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/zte,zx279128s-pcie-phy.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/zte,zx279128s-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE ZX279128S PCIe PHY
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  PCIe PHY block inside the ZTE ZX279128S Top CRM.
+
+properties:
+  compatible:
+    const: zte,zx279128s-pcie-phy
+
+  reg:
+    description: Port index (0 or 1)
+    items:
+      - enum: [0, 1]
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@0 {
+        compatible = "zte,zx279128s-pcie-phy";
+        reg = <0>;
+        #phy-cells = <0>;
+    };
-- 
2.55.0


