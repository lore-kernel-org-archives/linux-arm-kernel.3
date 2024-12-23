Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E018E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IYylV8X3kG4etEmNRe4Z7PF9+9a1DSK0QLEu47Tihug=; b=zfnJ6cEzpByeZKqERqWyl/B/5s
	WmDgAy3CHZfOZEXjpZvQE6IkKOWia+uRjQixcDgM/gBvcwzEUtrymTvDG0QKnQE3a9QbFasMvYLLW
	DTzsQAGo01aaXhnfL+RnYXMrXKH6v/EXFfKRL3WPcW3XA8SGONp9tPIPASF45PNAr7N756WVpSDdO
	DskkIZWjYkOa776yZVlqz3qYk+ZHdgxTObZVBRJkQkHucQ/oRPpFiyGA/u3+MqaBmkw11X0OxFqSN
	7Ey76+0R9J25bi57NFd+P2PJHFJyw6wC7czt8yBx/i6TpYhSfGbplzoC3MUldUhwIpMuTbDPCSTMT
	WdAZjEBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfTk-00000009luo-15AH;
	Mon, 23 Dec 2024 10:16:00 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfSX-00000009lmH-2VrJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 10:14:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2164b662090so31972465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734948884; x=1735553684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IYylV8X3kG4etEmNRe4Z7PF9+9a1DSK0QLEu47Tihug=;
        b=R1cql95upXmBsxQCPF+ppwoa1PITDOMJY8iwRLCDK8d/AQ64rJArdRnB6rdWHqLcJM
         u7GmODtpPy8I1mycjm5WYnuCe2zl60tRdSqt291H61EZWumNlR3+6vsRyuY7Sw5hgBmw
         LzMeP/pC8ltcBjorCiTbmxM5rqAmLIRlNXAgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734948884; x=1735553684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYylV8X3kG4etEmNRe4Z7PF9+9a1DSK0QLEu47Tihug=;
        b=cmsURseUIvMq1Zmg+Tp3H0x6xyDE/mc0UbkYeWpMtIz+QEPP9mn6hMLScw8B8Dp6tT
         EoCbpZN6wGfMtAgF+JcItZ1Tzt9GvEo/ML5IfP0Kj5ytB77GqJimj9fhfTgST9px4MtR
         LtanothRUhpjh8iYjYLxaj9vwugPaJX9i/XjQn0zuEMZiDNx6NN+NWyyxq6tRPhteA3c
         XScgNwF/HnwKqWBQhIQrZdVR7VvEeCPNmEOkfjFrl/5t0lbdQQVMjYpFQmB6BoQhtzVS
         +agQ90QKeNxUtSHpxb31ueYIqAxZR4aw6DWNTcHkrk/6ccNt3jx9Zppn/7+BdOQONKc6
         nOWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoxx2XLTNMM2bAwbtxBtcOW3C7BskNMQx5eYFaVI8pHXioWWh2mMBsRrcc192P+JCguZNzDTrcoTfHmYVFxHI9@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl4QXDrzY1mMGJ9IUTCBfQZ6RQmrtib0RXEykF+OOyMuMWyFPP
	PmmivnAKQGEjWwk1FTGXNgjbXMhYa7wx63oIxPazx/SOJh88ej3JLaoJ/HQC4Q==
X-Gm-Gg: ASbGnctjoc7MCiemMVQ0tBpk0lxv6vjIUt7nAD+TrENBFhi3ohURx0tYahVQtkrXZLW
	Y76onqKglrutH7Hn8HpgV7W1knb8jEaDZugpPbyclhjJaajKuWw/nB58KGrys5Hqo1cMMzlCSj8
	dLghGdEa2QcH5MGA+F0SRU02GNwY8reCi+lwjLG3PihveqLKpLdxQBw5wEz4RgDfLHqim7l2KWf
	rMGfPnLLIIAqdZR8sH3WZV8CJli0cN9gUVu3QQmDiUFzua0I8kZ/eRJyEE/dm7hugYhI2K5XQw=
X-Google-Smtp-Source: AGHT+IGYdqL5qn01ogk9p/xgsJMLTtx9vs0gfy/O/5AgnXiCHLrB4hynGoXLmR8ilJTbmNz5Qv1kfg==
X-Received: by 2002:a17:902:e945:b0:215:4a4e:9262 with SMTP id d9443c01a7336-219e6e8c58amr194289615ad.8.1734948884572;
        Mon, 23 Dec 2024 02:14:44 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4fc4:9ee5:ceb8:cb2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdde7sm70193325ad.149.2024.12.23.02.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:14:44 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: mediatek: Drop MT8192 Chromebook variants that never shipped
Date: Mon, 23 Dec 2024 18:14:31 +0800
Message-ID: <20241223101434.2170166-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_021445_661031_E8C2001B 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

The Hayato rev5 sku2 and Spherion rev4 variants were designed in
anticipation of shortages of the headphone codec. This never happened.
As far as our records show: the variants were never produced or
shipped, and no such devices were deployed to any lab.

Drop them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index b1687bbc57c2..2336070abaf4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -375,12 +375,6 @@ properties:
           - const: google,hayato-rev1
           - const: google,hayato
           - const: mediatek,mt8192
-      - description: Google Hayato rev5
-        items:
-          - const: google,hayato-rev5-sku2
-          - const: google,hayato-sku2
-          - const: google,hayato
-          - const: mediatek,mt8192
       - description: Google Spherion (Acer Chromebook 514)
         items:
           - const: google,spherion-rev3
@@ -389,11 +383,6 @@ properties:
           - const: google,spherion-rev0
           - const: google,spherion
           - const: mediatek,mt8192
-      - description: Google Spherion rev4 (Acer Chromebook 514)
-        items:
-          - const: google,spherion-rev4
-          - const: google,spherion
-          - const: mediatek,mt8192
       - items:
           - enum:
               - mediatek,mt8192-evb
-- 
2.47.1.613.gc27f4b7a9f-goog


