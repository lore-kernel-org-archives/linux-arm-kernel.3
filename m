Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB164FF8844
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 21:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CUvVods0MbRhBVxLXtfEtW5oc137WtgLFEVTq/ba2PY=; b=iVAgcmw9zKS6059+udKd5M+szg
	RKmC1UTiNKhOc/rrynWFjpC5P8sSDVUef0IijFuV8BX5qYadl77JwHnr0tTaryR9s2Voqs9Br9MpI
	nzUwP88ifMFYjgxHNBFO4PHBjdY9h+BT2+ydLdsnkd4wgcBp9COgnSgsAVhS3ULvaIAcgMJK+ZT6I
	w6/sWI+7Qaethze233F0UYeCx1UA1g2t0I8nzJs9odiKcK5EOYWC5pAvJ+dVzV1RAep1fZq2QO2xn
	TCY4x7/b67C/hjiB5AG2w9qIOyFGw3MkQDkwN9yNlP9xviKZ5QqWkRaObXXITMbKKwXFp4zrxpsqA
	0fxoVJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGNgf-0000000Dkrk-2ttU;
	Fri, 24 Apr 2026 21:03:45 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGNgc-0000000Dkr2-2yBR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 21:03:43 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ad4d639db3so42183215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 14:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777064621; x=1777669421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CUvVods0MbRhBVxLXtfEtW5oc137WtgLFEVTq/ba2PY=;
        b=ET3N5o8nBK40cyDmB+D5yB0kuOudwv/TQ4vfUl4GTLwYJ5+g+wGKS8pS+vl9plaa9W
         Cc1RWFPwrFk1VL1mFTrsbKnL6xfHTBMCX8i1NsvziTU6xUmzMu70uwiAuY9054Qc3KE4
         ahLqL2/MavaXhGaJ9Hg9sXnZJVD5+FSX0wAPOR4nVDvwuKY9/qiFR+pFhrXjCuz2UcVo
         khu7/e7aj/gGOEdqRL6H0SYEoIs/8Ve8DdvhwLT/99Wqkyamc44MY0IQ5BVEfHFC6aKj
         WXovJ/46oUL9QTDyQAbnZHHA3opGrzjkY3QKHetlGTp6S2xthKINL9hKT/f12WcRHGyF
         uE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064621; x=1777669421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUvVods0MbRhBVxLXtfEtW5oc137WtgLFEVTq/ba2PY=;
        b=dcsRth9fv9WbyJ5BCeDsINotYiTDkv1nBfWXwHqDQlRNvI1j5auWg0XDEbV0NSQ1Jd
         iK2/rmErPZHg0AI8dNMTu4Kv8q8KWg2RwAZ5N8G/fonikvifSRTDTV0fCSwzf8hFeEPe
         TxIpS9yKxlUQeMzzcbmf2Tb01Etk5wxf8+eF8aA070pLSaXHxLE3EXsv4aDC4lN5LKwI
         hAMkdkflpAZxZHKQCtt0HS97Z2TTOH7ceE1nzjcpznAC9amsCJ8TwdXcPCgSvEpcT5Ev
         DEoTkZLsuImIHjyShX+mcckZ+IC+LdZ4+V2f2LmeuBO5UjoKXcKTovqRVkNzETdPWQMM
         M99g==
X-Forwarded-Encrypted: i=1; AFNElJ8khSw56mgpwZwFHhQm10MLkq1H3WuHR7Eq16zm/Qzes/Y69WqqvR8Ef131P9e26+BBUGEh90qUw5PlR/XVF96T@lists.infradead.org
X-Gm-Message-State: AOJu0Yzxrwxqrxer/KqxzU8tvXt8Re7XoJz8uUSVleGqe3XfOaYWcPZ/
	fe8zr/LNWQHy4DnyBr9sb1lkcIxOyLyTp/u3Mmoybh2Z3vNQwHnEEF2ImNgmx58M
X-Gm-Gg: AeBDietcgVcvpOawFWD8nBgAvLx49pe/0ryRGqrJpAcXvuuO0Fsa8oFT5fRYx2NCy4L
	nZv+KEOdZOmwVuk2k5orGzRvWTf49ytr/Xv7IL2E0/fBzp+lqUXOpnUe7+N/td0suAjsSjrr/Op
	3C+fLkTVfUbkV/GZ1VOhArX+yKyHpWDcJ3VTI8cUXA8fTAm9aV8akskHsmxLCsoylQN0NXtlcv0
	LdBtDQti9vQWwh7yJ+WKto1dTSJjAlOtBMzgQOmq2E9c+HLRmDYDAbGBeL+hRHPCTztCm4otLq0
	4dxPIiioDuTie2nTxEcOn5i2JeGiRs2aiwicIeK5yof8r/v+6tT2ObPBTJal6kn2lFdNPQhUb0w
	Pnd6uqXXGCoVe2XMLAw+91gk/dgRGYalmylM5X82dZ4J7WtYcJR/iuSTEo6LLhgtBavlxDAATT6
	XBjHcf7TO3E4uMyMtIag/lAoSv8zH3p62pJvFW++6NfpI25dSKT2mH8NuMIXDZapU7d97zwn3+E
	/Bv+w==
X-Received: by 2002:a17:902:aa06:b0:2b4:6664:97d4 with SMTP id d9443c01a7336-2b5f9f83295mr238594565ad.24.1777064621178;
        Fri, 24 Apr 2026 14:03:41 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0db13sm250554025ad.53.2026.04.24.14.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 14:03:40 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kaichieh.chuang@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	manishbaing2789@gmail.com
Subject: [PATCH] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
Date: Fri, 24 Apr 2026 21:03:02 +0000
Message-ID: <20260424210302.39972-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_140342_749249_E5C8430F 
X-CRM114-Status: GOOD (  12.31  )
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
---
 .../bindings/sound/mediatek,mt6351-sound.yaml | 32 +++++++++++++++++++
 .../devicetree/bindings/sound/mt6351.txt      | 16 ----------
 2 files changed, 32 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6351.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
new file mode 100644
index 000000000000..f9fab8962325
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
@@ -0,0 +1,32 @@
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
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+       compatible = "mediatek,mt6351-sound";
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


