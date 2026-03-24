Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F916F532E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pSryKHG3scLNvvcESqlGtLpiDqRFPGeSIvUCmCoE7gY=; b=OlJQUCJeygHkfHk7LBtY43Ovzi
	LIaSDn9nliS/JP0psI4COSBhi9xI+qfsdi4alHRsYsZccTZ55lJeQaZtJHQEk7IUw/2asNj9+mOcd
	u1q1fMrNwFAIU53mz0/8wlzgimHbvPN7xSCu58sCfOv1JW+kGgR6VWh/3os6LzSHTGJ1OoGcDynEY
	lG17/lIsdhRQmWvRRA4o/KnreXkYN+eCDeGPbE0xOirZ4GWioHPXY/MmvK2jALgkDtUq7n5fM3T4J
	U5xH/kjBDKkVuEMyHfTNYq7192GnxZdI2kXFkeTCEtdtBXfsRzxXXqQfPs4bpArdM0DOeaH57Ww1w
	WCZFhyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wU6-00000000v7i-13h2;
	Tue, 24 Mar 2026 07:47:30 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wU2-00000000v6t-1MUe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:47:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35b905a05a8so2954481a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 00:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774338445; x=1774943245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pSryKHG3scLNvvcESqlGtLpiDqRFPGeSIvUCmCoE7gY=;
        b=CeRkzRG1DhwFbwrEEr8JIPPYrshIuZWsPetowr+VkjOBn+rT/vEA1qmHcVNEq1Drbm
         8AUVqlR4G3IPAMdTgVfDsIHaF9jUsnk/fpeAmRscrwpvBD8o8EngABLqccHW5gAur9vO
         d4zeIE5xrAba6CLnq2BMEl/E836ywzKm2Zr/N3x4c5dBqN7c3V2bGBv1ZOkxF2Lujv9d
         ytLiswkjJwhzYmaM+JjR12z6Npcn+5Ug45tHZP244qImo/CSCPnoadDCn4TMfzB3Duyb
         Fi3peNRQyZej/9SwHoqjVVmVvNiu1MTZPYh7NZAO9dsHbgLD9YKH16qhjU/e46CsdHLd
         Tjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774338445; x=1774943245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSryKHG3scLNvvcESqlGtLpiDqRFPGeSIvUCmCoE7gY=;
        b=oBKeKpnLAe2MRhyxVZW3r3Vx/9jcGsKoLkuZtKFVoOPxxPokVoBjmlSkY6IqDyROfs
         cLE7F0rIonhEobnsjzUqN9FlZTjIT0NU8WV0JNJeK/PjX2q9lq7BwGC1mV0PWgSyleqC
         VhfpPmqrjQqq8wrWoJcDsTm9IeIt2nKxpGtdP/wXrfKomas+Ac4BL6IZgkmTUVRM7Wvv
         mFptbVX2d7N9HOf4Ncf7+qDUahPE1VAckgcIFdkYialVOuAfS1FstArO8+pfGS0t09Uv
         /LS/SXhy8HQT5GGqwC/ziu+DAZGKwihVkAJt/wmw8zDZTdno/eYVfszUo3LW2xjCW97j
         wx4A==
X-Forwarded-Encrypted: i=1; AJvYcCW2T/wH/WGNaYTKeZvr6Yrf+OXAle0I57GGjNuCgsrkLU0nH2kaKAMSfkxLNmoAvBf7rplbTypQ2BXrzTth0RkO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+plVEb34TpfkNXwDtAd/DsNkQsbXcMD4hM7uLDgXRhZywEai4
	jVMUomcrQJ8zgOkFY7Rn0SdOJN21ib8fgnl6DI1yfklEGd1I58cA+uB5FiRgwQ==
X-Gm-Gg: ATEYQzzlv/JZoSXHDwatnTwEAYtVtH5BtN+pne0usP1N4jYa04Ug84H1ChfXc4x0ahT
	0QEWiXabhKX8gdzJNTIA49IFBARDqD9nuBnH6NDuZw3tB+e4wD+RfAAZ+CPxwccSxP0o8zbQGYR
	wqXEltw8N4qvs+PXd/s1689tr7PeJEZVJ+Tr90m2+0h/cYvQy9YOJ4svu+QND46kg48MWgVoGlg
	9gpbJi9a4FVJOQszmm0zpMPWhYPV4thKILGQP5itbaEdd/8/E3X63qDMOk2QVCu3nrK6W/D1fRU
	qEqf8fx4/wrfUyw69QQOXWUnezP7ChdPU2OGok/Hz6HmCQa1QIVKoE0dpJg0JPKB8eSylzJB9Vw
	cYOvBHJvEJqk6Ja1bOvKESilwN+QYJ6eILAnu11x2OTlON4kWkoFB03/K/1GD7xchPUhBGMuGmx
	0/s/pooyTCTFUGgI9a7KxugP9Jm5ke
X-Received: by 2002:a17:90a:e70f:b0:35b:a3be:f1b6 with SMTP id 98e67ed59e1d1-35bd2c6efb8mr12454014a91.16.1774338445076;
        Tue, 24 Mar 2026 00:47:25 -0700 (PDT)
Received: from snowman ([2401:4900:613d:9aee:633d:3c5a:a63:3067])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0316327esm1364059a91.12.2026.03.24.00.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 00:47:24 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	koro.chen@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH] dt-bindings: sound: mediatek,mt8173-rt5650-rt5514: convert to DT schema
Date: Tue, 24 Mar 2026 13:16:18 +0530
Message-ID: <20260324074618.145567-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_004726_366666_11844783 
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

Convert the Mediatek MT8173 with RT5650 and RT5514 sound card
bindings to YAML schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 .../sound/mediatek,mt8173-rt5650-rt5514.yaml  | 41 +++++++++++++++++++
 .../bindings/sound/mt8173-rt5650-rt5514.txt   | 15 -------
 2 files changed, 41 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
new file mode 100644
index 000000000000..05bb18006e08
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650-rt5514.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 with RT5650 and RT5514 audio codecs
+
+maintainers:
+  - Koro Chen <koro.chen@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-rt5650-rt5514
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandles of rt5650 and rt5514 codecs
+    items:
+      - description: phandle of rt5650 codec
+      - description: phandle of rt5514 codec
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8173 ASoC platform.
+
+additionalProperties: false
+
+required:
+  - compatible
+  - mediatek,audio-codec
+  - mediatek,platform
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8173-rt5650-rt5514";
+        mediatek,audio-codec = <&rt5650 &rt5514>;
+        mediatek,platform = <&afe>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
deleted file mode 100644
index e8b3c80c6fff..000000000000
--- a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-MT8173 with RT5650 RT5514 CODECS
-
-Required properties:
-- compatible : "mediatek,mt8173-rt5650-rt5514"
-- mediatek,audio-codec: the phandles of rt5650 and rt5514 codecs
-- mediatek,platform: the phandle of MT8173 ASoC platform
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8173-rt5650-rt5514";
-		mediatek,audio-codec = <&rt5650 &rt5514>;
-		mediatek,platform = <&afe>;
-	};
-
-- 
2.53.0


