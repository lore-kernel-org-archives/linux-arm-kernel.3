Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEF3FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 17:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7QVnrg5T5fwP5chnWeWOK6cyXsKrSBxIvGHnvHH3/V4=; b=EvTgFSmaYDrr8KF0ZxyVhjaI7N
	V5AgVxPooGT9hZeySXRT4ZBSkNq/OHqJIclIqvB8XHC94vNJ2+qZdJvxWDUPvPp7ygaPtsFiZiZpS
	chI8FhqdHSyfmPOWvwrov4ySjZuiUZzTE/37C2YggtnBw2hjh2Gei0A5TdOhsf3Dy8CUi49ucbf8e
	NQIbN2cY5aFoF9Woy6RfgNn3w9whaVj/rhQKIgJkGINC6ufHc8zcm9tlwBvxo67jszrXgAl40Eq/t
	R2DGup0Bvrvjo5+eMp9WZzdM1d4t7AAlrlkCSjxLfvgYdFF+mIii/Tkt3oWUUn/zh2PeXpgBfgIq3
	/WkZRCcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHm3S-000000020XC-0af3;
	Tue, 28 Apr 2026 17:17:02 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHm3Q-000000020WU-1CWT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 17:17:01 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82fb2d0c5d1so49313b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777396619; x=1778001419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QVnrg5T5fwP5chnWeWOK6cyXsKrSBxIvGHnvHH3/V4=;
        b=OkCQAY0KG640HuVntFS7mVUqZynqtXlvtyWj2XpXm9ESk+ZseNDRygEu4GagtdG8ko
         YL/Km+wqSoP2D3EdqA1MLjiqVV2BRbTUV05xMy/bZNFHYYCuegMRHe1Ean/NDvvahRaD
         X/bzExpX7S9A1adHzTzcGWkoQi1FEhCpw6Rce9GsG5g6/3HDwBhTkygpHN9X5MHAXzxy
         AmhNs4DhZKy8931Cs5GXX8s6MQicgAMffmLSzpnOZ8Eav4S5UUSJMZfK5ZFf0uyHRiPz
         Uxv++2TJGfxrKb7eRo052H2NxmTfzBE73a+p+xOUw36EoBFQIUZ6Q/L5LR41hk4rIzvL
         A78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396619; x=1778001419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QVnrg5T5fwP5chnWeWOK6cyXsKrSBxIvGHnvHH3/V4=;
        b=q2M7Oxs17ryoKsIyiBoPv9UmF9k3KhmikEDX3fDCrVneC0b7EVR8RlzdJrOuBIpZ5+
         F8BRoOJeafGl0C24oPgRhFAoRL5OCYVcrW3dim4pR86CulDWuKu4aoln/O0RGqNccN+r
         7w0m3qjkMuqyVP5dDh1krdTRoInlLG7NYrWQUhOY7sxw4On2TH4CRVsveBXhNMkGO0cS
         QGT6jlihfyUXrVzteQ92qf6NUUTcSFFmAyG7UAZ71e95Oc3GWUQbF30/sJ+yjCmk2tRB
         C4YpP0h8NXRcjsluLH/L1mM1Rz5gGu5ezQZTiu0DTW8nMw1yUrFzennFPnMe6YaZGkm1
         kfSw==
X-Forwarded-Encrypted: i=1; AFNElJ9PqtqnB2duImHhztjF/PDVvoPSkoHIYBKro8BYC72Dhy4LGPM6UvC/XjWSFEi/02A5DBZfYibkGkUBI4Ml1QLv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/ug5YiJmQPZN3P8EocabaoxufDz13YBjdpQW6/u+wsaczqtk7
	uEarz5HZq+cIEf4RdA/sflMZRiw3GBXW6fS1qUVZdmxhqQYwVO2nLKLq
X-Gm-Gg: AeBDieuRxNqaPeungXtyII7a8N1nUOCWJUeHNjOEUQ8YQQkpmN1+KadhTVItvJ8deoI
	stPMNQ8i9/WzHT4SwkxS12FN5EgOS80N+Eich3Rt3BlFcrMrX3YdFMMjeyNlXw3CGwFOYiDHfRY
	H7VnaPQx0zcQPBNrC+32BA1e94/Geb9lCAB0O/xOC3vq55YBSOR4zzjgSV0BGraDx3eUBjELXqs
	fifFnUf0OtMExZCIcIUPFoT8F32JQpibVd8iif6P4VEwnSVZDvGQqlJRjzp9Q3goRG02rtgK8u/
	w9Yk9Kg6/3aB30E0REOH37zUlPvk4XeUsJ8sNcWXu4bAJNYp6UqUOG5n3Hp5pdJ5890B/LI54Ia
	qXqz69tCf3roNO17qjfb+PhDtZUOBQjPL1u1rptYJce1AfBTaTqO6cOti9W6AUUS9YM7k+SB69J
	9G4kJzp6v3LRzN7KuE/0TnipAD4VOVcSWHSAfvoZqIn6NwdK6RVKGDS0Q58ZeL+Eq9t7839oz+P
	lzl9w==
X-Received: by 2002:a05:6a00:4fcf:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-834dcb99cafmr3645484b3a.13.1777396618489;
        Tue, 28 Apr 2026 10:16:58 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae2226bsm3370743b3a.18.2026.04.28.10.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:16:57 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kaichieh.chuang@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	manishbaing2789@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
Date: Tue, 28 Apr 2026 17:16:44 +0000
Message-ID: <20260428171644.5703-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_101700_334627_06B11780 
X-CRM114-Status: GOOD (  14.43  )
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

Convert MediaTek MT6351 Audio CODEC bindings from text format to
YAML schema to enable dtbs_check validation.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
  - Switch to unevaluatedProperties.
  - Add missing #sound-dai-cells to properties and required list.
  - Update example to include #sound-dai-cells.

 .../bindings/sound/mediatek,mt6351-sound.yaml | 37 +++++++++++++++++++
 .../devicetree/bindings/sound/mt6351.txt      | 16 --------
 2 files changed, 37 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6351.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
new file mode 100644
index 000000000000..b422e238b512
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt6351-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6351 Audio CODEC
+
+maintainers:
+  - KaiChieh Chuang <kaichieh.chuang@mediatek.com>
+
+description:
+  MT6351 Audio CODEC is a part of the MediaTek MT6351 PMIC.
+  It communicates with the SoC through the MediaTek PMIC wrapper(pwrap).
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6351-sound
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+       compatible = "mediatek,mt6351-sound";
+       #sound-dai-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mt6351.txt b/Documentation/devicetree/bindings/sound/mt6351.txt
deleted file mode 100644
index 7fb2cb99245e..000000000000
--- a/Documentation/devicetree/bindings/sound/mt6351.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Mediatek MT6351 Audio Codec
-
-The communication between MT6351 and SoC is through Mediatek PMIC wrapper.
-For more detail, please visit Mediatek PMIC wrapper documentation.
-
-Must be a child node of PMIC wrapper.
-
-Required properties:
-
-- compatible : "mediatek,mt6351-sound".
-
-Example:
-
-mt6351_snd {
-	compatible = "mediatek,mt6351-sound";
-};
-- 
2.43.0


