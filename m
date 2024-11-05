Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17F7D1266B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=djQbbob5DRcgyzgtrmCeJK9wCGVRn3M70o+CkFeCAc0=; b=VZaRU6+92Qz2hhsd1+dvEkLbel
	FMoCrFTgn51zWtcoNomDkEvWoKwTA9KoO6r7VBowUMIxE4pG8cBVaWIvUCCDTSY2nVrXxyxrS97xS
	LMNkDvBlpcwgHMbrsVZ2XyrhtjiLXW6YeFLxinzzyHKYARZPviCv71IhLmor0R2FAcL5aQYHwLFnh
	itOtJnSZcwl7fT3iNZha4RVqWQumKbd1IFMRA5+wvOkAeibGLvIMrqfqierYlscSueJvulHdDN5YT
	ypgwjghnaOLvYIFfGn+TMw4xzaDRhehorUln2oEuc0QNb25SEambFTINNSaShh7xojbDFLfMMYvV8
	Iu+bQu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FUI-0000000GRAI-3JT4;
	Tue, 05 Nov 2024 09:04:34 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FSK-0000000GQcF-0iWg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:02:33 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7f3f1849849so171966a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 01:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730797351; x=1731402151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=djQbbob5DRcgyzgtrmCeJK9wCGVRn3M70o+CkFeCAc0=;
        b=lpyeEORl8udmjWqnUg6BnidOsCfCZk0WtarVLTiVnl9w1OPGjTRgVogX8qoea2x0U2
         fxCpwaEhrpWRBb0J8wyisMUOPiGSBZ6rSYBKdoCXOHT63ugonev6ZeTuOiTcRWrFxZz3
         R8TJA0oUC5M2Wf/Q18ITt8FPcICc9xIJfSj/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730797351; x=1731402151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djQbbob5DRcgyzgtrmCeJK9wCGVRn3M70o+CkFeCAc0=;
        b=Bufu83J2h519agmqL4RNm0d44d4Jjr2zLFsu44pIGLRXjdZEV9bmwRSRByk81l140p
         74CGTCAOCmeaC8SwYrwjtFLKkhCdthmh6nIb1nLnnQzYyqtbxjAV2fczbm7HgtVpkoaV
         55qD0oM6W+xb5MsBu9dET3MHJ0u+1RpR2Vrv4TBusx8zvdISpNEkevHTEaDySiFo886Y
         rfapkwEVCgfcLrkC3oiVJ6Up5rb0C1F9xNZNQhH0Lt3+beZdg2BTatrzW9gsFC2CWd/H
         lj9dYmwTMsLBLG1InfI2YBhzDh+jCTOiK6nz7knznIpgecucnNPQKuW2IBFWQtWZWyIu
         wu8A==
X-Forwarded-Encrypted: i=1; AJvYcCWBc9r2nohZ5gyEEd2Vo3XgIcUTyHXHoEdAXtM+TJlkLKhj/F1nwUgBY3PwFhdAfBP9zaomHctzenLCmLTbEFH1@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/QelPiCpaIQlqORbltX+u/kZM4wd4KyMtBKbC1FIhAR3qqtSo
	nXKwmPfArVIOOUXhgWCRRFU4baReWJa+PCARltdgoB6qXlBv2txGY/p0NUKDdQ==
X-Google-Smtp-Source: AGHT+IH1k+zMqS05NS5QvavH+ykcILKALPqruVdecenHRtfW6dG9qXj72cxb37tXkc0AOy3qeQYb5g==
X-Received: by 2002:a17:90a:bc87:b0:2d3:da6d:8330 with SMTP id 98e67ed59e1d1-2e92ce32e36mr25501301a91.4.1730797350795;
        Tue, 05 Nov 2024 01:02:30 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:20ee:3712:ce0b:1ed7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2110570ad54sm72591315ad.111.2024.11.05.01.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:02:30 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2] dt-bindings: display: mediatek: dp: Reference common DAI properties
Date: Tue,  5 Nov 2024 17:00:28 +0800
Message-ID: <20241105090207.3892242-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_010232_219311_CED32A7B 
X-CRM114-Status: GOOD (  11.76  )
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

The MediaTek DP hardware supports audio and exposes a DAI, so the
'#sound-dai-cells' property is needed for describing the DAI links.

Reference the dai-common.yaml schema to allow '#sound-dai-cells' to be
used, and filter out non-DP compatibles as MediaTek eDP in the same
binding doesn't support audio.

This fixes dtbs_check error:
  '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- reference to dai-common.yaml since the hardware exposes DAI
  and update to `unevaluatedProperties: false`
- update commit message

 .../display/mediatek/mediatek,dp.yaml         | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 2aef1eb32e11..75ce92f4a5fd 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -42,6 +42,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     properties:
@@ -85,7 +88,21 @@ required:
   - ports
   - max-linkrate-mhz
 
-additionalProperties: false
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - mediatek,mt8188-dp-tx
+                - mediatek,mt8195-dp-tx
+    then:
+      properties:
+        '#sound-dai-cells': false
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.47.0.277.g8800431eea-goog


