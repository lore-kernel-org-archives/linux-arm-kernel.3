Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC35CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=; b=eZ4d0rKoX8e1ls2XzIXkzzRnKr
	0iYZIGdSIDkZzngcb/sCY/uKJdWSRmcmrS3mxgWtAlL/hBLJ5XEAGwDml3zi43r81MNQxvCRCEmGH
	Ui8/ooljxlGaCniPaNfUKUBQTsH1GfsoSyAOSW40X66bfjSkewBFNe8R3CvHKrudWpEV0phqg5Lr6
	NM0vWf6+q3OLSAvhWhsoyKP6PYOiblsRofoDjndjhjJvu0t/GPxS27rqvGNfl6a3AU3TgkKQNu0al
	TvU/2JuWuvp6NnGGTD/q/LuUArT3MlBfWXSgZGSBSEfZ/y6kqTKr0XoiijlU58wNKWjjEFIfkvY4R
	lqGdVuZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIc-00000001UUO-39wt;
	Mon, 28 Sep 2026 19:46:06 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBHIV-00000001UOg-04gN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 19:46:00 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2749744f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 12:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790624757; x=1791229557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=tHMixuvwjhiqeWGP+fFi4nCzZX1K5ZueEDqK9UlJ7yaKgSzFx1LiGfmYZEw7SQnXq/
         c/BlOOBGtifNwPIv/dA1QcNE/34Gqg08evHNqsLfR948kYlU9HopqdkDsuSA/M8h/c5U
         E08AmM7gDpfRkcwS8ytHxrWYRKbuZzTVPsYI9YNfdUXJNRlfM530hivdANeamMiYMD/M
         Pi9B/RaV4jryQvwanQFIffx/W6+jfmpw/OmO1utr4/pK7DO8gyupZpiQoBl87DowqYcz
         4kjc7ctIi0lr/+tcixSvdLyUbBUYQCgtk49JXkOUd8Eud9V20inKirtvozw29THBHIjj
         3iWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790624757; x=1791229557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RZXcrD1S7/I6W/aF1UhtK1+p0qebXOrwfnsiC5xoqRI=;
        b=11Z5eUtbfZ+d2OTMdn2isq6hhJMUrrcw3V/d6Nnhnv7mYsJtMsBaAjj3mHF3O6Ypdu
         cFXLwPQO5QDgSqHibCDBNnjXVynF3zYqfvoFak4ivGUxxLYpGyzPlLGgsF7F5hNTC3qE
         1QliIFw1VyFDONTn/8wr94MolCRR9BzIcMqFodvO7E59F30B/MejgD0U/Eqlyrfy03G/
         NeOLjHrAyNAL5HEeqgvDQxh8pxVRnHn5wU9MMbzIx/5UOmpQS2Vqr7TQO3VarF9SC8T9
         aanIwffUNSXbfq1kEFXxbzSpTF/iMo4j1yTBNlodDfHdt7bknyYFv9ujNBqrQw+8GK4p
         qsYg==
X-Forwarded-Encrypted: i=1; AKwUvBx2w4Yxa4TqXT7PZPSObJw4g+7aWOQF8DZnQj+opR/h5plsDVYnAqymaGO4TnAQXZto702qL+n6TAxNENvoQuHB@lists.infradead.org
X-Gm-Message-State: AFq9FYJHe16VMv6TeduqRVmS1c1uf3CwzIZQa7tUOotKKngUD+aENIrg
	APZwHb0zmgzzap1+/0vK09cz9g24XDqCHOYOVQB0t+J4bODNvtPSyblX
X-Gm-Gg: AYBFou1idq5E96ImMOrIZlX5+Z1Vdaa9qzo0oLdrcZGZZ52A13jBh+MqlVAiSUEAHgN
	mC814W2cM08sKU28orCDFchRdMAnBrRX4+V3iRkIg8kkJfiohsnBkfJF4mKsf7flpq0oNslkSc4
	pB69MxF6aRtqYM92tUzcfe7BJZKeu6XH9e71P96Sp4H+AIIXgB/qpZZdYHZUtozE9PK5xMYjStX
	9NR+a4ESUErAbEOsTEfcEqm94WCsSNfQGyMV0wS+qiZyOMn8Iufg2SQmuJ+GBOte7xhxo2uUcCM
	UnHp2clKqJ6uyb7duDPrl4DWFzwRmTCWgv+S94ZFfiHziHB8HWvaAct0T/9YV+6np/2wZ3Ut2kv
	8PGsBamq0Cj54H/+UvU9CVhcbmpjTCL9W0oClxNHu2Ac4W1Ez8gBwW/PZavGtxHPJiYopqor2Vs
	wweUz1aJR1jp7MweugzWkowS3YPR9RzA80U0xfYTIC3W+bfSnlzOVOFqQiDWxXRV8gO1ggT4MAE
	dFhob1SdHEprQmUpqsdewGuwDmYJRk8Py4uBSETUTfktU4hmnQbPObj0HF9nolm
X-Received: by 2002:adf:e188:0:b0:486:f980:2361 with SMTP id ffacd0b85a97d-48872ac750cmr24124073f8f.45.1790624757303;
        Mon, 28 Sep 2026 12:45:57 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-82-57-191-234.retail.telecomitalia.it. [82.57.191.234])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48af071532dsm1527706f8f.20.2026.09.28.12.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:45:56 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v24 02/10] dt-bindings: net: Document support for AN8855 Switch Internal PHY
Date: Mon, 28 Sep 2026 21:45:01 +0200
Message-ID: <20260928194511.41878-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928194511.41878-1-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_124559_081890_4A30BD78 
X-CRM114-Status: GOOD (  16.84  )
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

Document support for AN8855 Switch Internal PHY.

Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
PHYs on the MDIO bus.

Each PHY might need to be calibrated to correctly work with the
use of the eFUSE provided by the Switch SoC. This can be enabled by
defining in the PHY node the NVMEM cell properties.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/net/airoha,an8855-phy.yaml       | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
new file mode 100644
index 000000000000..d2f86116badf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/airoha,an8855-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN8855 Switch Internal PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
+  PHYs on the MDIO bus.
+
+  Each PHY might need to be calibrated to correctly work with the
+  use of the eFUSE provided by the Switch SoC.
+
+allOf:
+  - $ref: ethernet-phy.yaml#
+
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - ethernet-phy-idc0ff.0410
+  required:
+    - compatible
+
+properties:
+  reg:
+    maxItems: 1
+
+  nvmem-cells:
+    items:
+      - description: phandle to SoC eFUSE tx_a
+      - description: phandle to SoC eFUSE tx_b
+      - description: phandle to SoC eFUSE tx_c
+      - description: phandle to SoC eFUSE tx_d
+
+  nvmem-cell-names:
+    items:
+      - const: tx_a
+      - const: tx_b
+      - const: tx_c
+      - const: tx_d
+
+required:
+  - compatible
+  - reg
+
+dependentRequired:
+  nvmem-cells: [ nvmem-cell-names ]
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ethernet-phy@1 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <1>;
+        };
+
+        ethernet-phy@2 {
+            compatible = "ethernet-phy-idc0ff.0410",
+                         "ethernet-phy-ieee802.3-c45";
+
+            reg = <2>;
+
+            nvmem-cells = <&shift_sel_port0_tx_a>,
+                          <&shift_sel_port0_tx_b>,
+                          <&shift_sel_port0_tx_c>,
+                          <&shift_sel_port0_tx_d>;
+            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
+        };
+    };
-- 
2.55.0


