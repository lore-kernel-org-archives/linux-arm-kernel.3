Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BC5E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3a2o2nbwJCPSnXwOfL4XIKrCkhJXnP+2FlXfd5kTMs=; b=PvrmKfp1HhlRyp/uEQWxEAlwUB
	GgNi4kyG4yTVQtrAUJh3w3rh946E9AttBr9nleciqMDfG3lTGHajIISMzzbwjlY1Ory/JTAPdyfFw
	p1SZF9pQLHjfT/8XDRN18lZNfEyi+7CzdkPHkbfAsR2lBuzY+/PqOYFpJlfJpP0YlV4wB/xuosvFM
	gnKQe1RAGpuhJE6Zj7PJyNvqapucmfnUuBGVigbkke3adB4T/LpVpJyYnBHhCj542NSUPRCN1pocC
	qp+UUAQnFubq21lGaJS2kA1pb28l0uW/jVvjbEjHcMG1a5NHViTrfnecWB8p7UB3U/HqiEBxzX3nc
	6IBpqWKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIljp-0000000C3Ou-0tny;
	Wed, 04 Dec 2024 09:32:05 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIlgv-0000000C2eS-2Hjy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 09:29:06 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-71d41932d32so2858821a34.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 01:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733304544; x=1733909344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3a2o2nbwJCPSnXwOfL4XIKrCkhJXnP+2FlXfd5kTMs=;
        b=Ki+4Pq5YkFbJnYmofVxezeuEi7jZlgTj3WXAt46oDkN03iu17pejsuDTt8ZhuEplgk
         uTmJk0JNt1OHr7rIdi3Ft4Ql8tkevM8He39ob0gP7G4GxruZZdCuyk0RB5wZv4pxpiZw
         HqvjvAyMIYXdSuNdxSVQrAazPyuprsr9Z0EMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733304544; x=1733909344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a3a2o2nbwJCPSnXwOfL4XIKrCkhJXnP+2FlXfd5kTMs=;
        b=rmcqqNPHDIwsQZ8cboDdP9ydgI8v0xMVlg+fI+MgNgKZ4P0JuAmi871UWh2rBhIUhP
         uy0ncMMIHjLKJJI++s+FhHQmMmp92ksaFC4t8zku9BGwG8BfeAZaHRH8LmamAzr8G0Gw
         8Qm0Ej2ojnf4pQK4qjFl201CghxQu2an/LqxXJ7ztPUUirh1a2zLILUJFjSfIkUm3Ab/
         j4oUQHIJVPvnqAWqNgzfuWrOg1UHdYJdXpxwfIymSnjvZq3V5PCTP2WBTY6eR4aYuNuz
         hVeg3eE0/y3jy9LsQiySBTRGegcxpdJ/qEPijxtfDDbnU5e5NYfn+uaPSzDAYpNpP7w3
         H9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXRMeCJsXZFG+FV8Xtun3SAZQO5Cb3znN+lFCRUj/MmwmU91sCXf6AcciFox98x0vtyvYLc7w7oN0blePFxGOb4@lists.infradead.org
X-Gm-Message-State: AOJu0YyvVP7fXKUidiYjk71kR3uGdSXJ70oRwcCMf9Trj3tF/mtJmbIb
	OUIgTLVAOpU2lLeIf/6FyWurBrafbFLLU+GjrggSDefiXmXgHM9eSLKpgsDQVw==
X-Gm-Gg: ASbGncubcsUelOQq5D3cl7tgVFolycc7E/7WrfOhqf0Q+MhwFSvLnH/1ua80b7YBp6c
	CvvaVAcSLczXSu4USNEX7ZX3wUR+qoQVddgnLazzYWPNrlZa5gdIfb3whcVtEIMLyeUnhw4aogo
	HovHkWPqOhSWO2w3mGq7DBMh+A4Ur+ACiy8ol0bwUP2qwJiW5Yy6cAy/0APpw2ZMrjUg/5fHfp/
	4dycLfnb21fgOoJotU/Uq7bbv/5FxJALI78YS7tV4Ukew7AVgki5NsR6oV3BU7bqh3f
X-Google-Smtp-Source: AGHT+IG2OOr+DFMkoVU9c8r19W+ABIjfnQAct57iSGJbN6PcBsKoE81tPXls96jiKM1xKEyUQ5FchA==
X-Received: by 2002:a05:6830:2045:b0:71d:5b70:41bd with SMTP id 46e09a7af769-71dad610b0bmr5596609a34.12.1733304544427;
        Wed, 04 Dec 2024 01:29:04 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2eb1:a68a:2625:b944])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d38dbsm11049024a12.15.2024.12.04.01.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 01:29:04 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Document compatibles that need two register ranges
Date: Wed,  4 Dec 2024 17:28:52 +0800
Message-ID: <20241204092855.1365638-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241204092855.1365638-1-wenst@chromium.org>
References: <20241204092855.1365638-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_012905_586882_0C26C305 
X-CRM114-Status: GOOD (  11.50  )
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

Besides the MT8183's MMC controller and all its compatible derivatives,
the recently added MT7986 and MT8196 also require two register ranges.
This is based on the actual device trees.

Properly enforce this in the binding.

Fixes: 4a8bd2b07d88 ("dt-bindings: mmc: mtk-sd: Add mt7988 SoC")
Fixes: 58927c9dc4ab ("dt-bindings: mmc: mtk-sd: Add support for MT8196")
Cc: Frank Wunderlich <frank-w@public-files.de>
Cc: Andy-ld Lu <andy-ld.lu@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index f86ebd81f5a5..9ea035928563 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -235,11 +235,18 @@ allOf:
       properties:
         compatible:
           contains:
-            const: mediatek,mt8183-mmc
+            enum:
+              - mediatek,mt7986-mmc
+              - mediatek,mt8183-mmc
+              - mediatek,mt8196-mmc
     then:
       properties:
         reg:
           minItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
 
   - if:
       properties:
-- 
2.47.0.338.g60cca15819-goog


