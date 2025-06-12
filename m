Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECDEC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rmXxgdE5Y76+Q2Sd3HDIMfBzQR9l3cd66jsguV0wzs=; b=ixM0eGliS09SQxQfQR3RhqpeA1
	Izs5UnahrETLAx6bQgRcV3XwtGrxMNuxIufUnZWMIRBDoWgTJmZxTbgNJ3BGCV3Yi13CEDTYtjI4v
	QGtQmLyM464N1fU9beVG/x1Y0eZ2KDfyH+Cvcyr8dX3nbJ4EmrwN5mW3Xzl5QCqStx5Ihrie5cqXI
	zeFQLla8JyfuzZrB39gF9TfVg4HeoAMYTWCjqt3sKdC+zf9dYH7wAoKC0P3E2zZt0dSedEHd6jD3x
	6DwGvidw0XWrRaTAInWiSfIoKjO5MKOn/alb2csPgCFtX8fyMEyv/kFbUeLQ936i0HYqa2884ty/s
	VBTC3Oiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdAj-0000000Cb4T-29XI;
	Thu, 12 Jun 2025 08:20:29 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcge-0000000CVQ2-0S4C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-236377f00a1so5753325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714563; x=1750319363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rmXxgdE5Y76+Q2Sd3HDIMfBzQR9l3cd66jsguV0wzs=;
        b=fNLmz3ABL4/0/+ADQkEQ24CjGbjiW7I7KWN9692P6VVZ5LrEuIVxVTt0t+zae11Jyt
         cDwHcFmD+48qtoWPDRKnoLf2IqcbwqKzN6I2+4xBSKzJxOj63eRk6lpry6c22ENMugo8
         7ymO0OrUg3TrXlY3O7mXZ4nXGvjBNWg9JLE/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714563; x=1750319363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rmXxgdE5Y76+Q2Sd3HDIMfBzQR9l3cd66jsguV0wzs=;
        b=vV8GbxPShdrKYI1SsA3sjJ7wRQZiwLoN6fJu72Q61if/HtMEqMydo7Y7R2JsNShwcH
         kfH/k67eWmsDRAxKXyznGiEN/kCe8Gi8bFoW1IyyBNm0sjqX4cmUGygJKX4xSuAlSA0q
         6TePAdPni3tQjxVwniUOjYLub6bz+wsT7Gnxu3Kje2ORRooOfgSbfch1uXm0lMsBbOvy
         Sj9f+ny9STzGQprWu+8s4OGsc/z/+V5GuAyyZQUtdgrTlg1nAROZFZbGEZZ4dXpegvIK
         5abkDoLvMn1DwaNbFIpC0YLe1WinG74b3dHlI81KwGp/sG/flp9KXZfNE4fPhpZ4s9aL
         r8CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk3xAFR6EmRkbM7WLfYMc+VqCRfAWN7kldchzAZU6NFpSUuObzShbBDJV3zqidKb0x4A7s3+VQSBOXyLXNjfdS@lists.infradead.org
X-Gm-Message-State: AOJu0YyOl873rc4gwAJ6uV7qRgdTig8kzIYOgI3NILaX2FOuiW64G0oF
	oLhKAxhCe/iUjzk48AdOSKwzYH7IztsTqooHLCG0Ypr6y+9d/rtLu21cMAmh0yNAFw==
X-Gm-Gg: ASbGnctd1ADPb+RT/SbAZwcr/7dcIqfPcqZQJd9baLyadbNNIipZXjui+IxzkeiujM3
	v0UGIWo7ZRNbNwbXRwPcGBQuN4M+UMriyoi3BRWxZ7DkqxmgvAKz+3cPakrzMJ/IrorUMF/oIMr
	cu3eD2wO1Sy7AJ/6hwS7igE+aQfeYA9w7Cn8O0vag1UeQ9oDYjWAkIfkKOeOI0MPavNfQ1sTAH5
	FyWPQ9MHgEjA9s/5O9cYvbzH5vP20wSGIZidYX4NPG/NMMtWp2TgDpkpFk2owMSrXHWcfcEScVp
	A//kO7QhxM+uuHLESXBnxCtmRzjQwdCbUQUnSWqjGRCtAIN0nsUfyW/agUozcnndARLcoJ0s3yj
	cOt8=
X-Google-Smtp-Source: AGHT+IETZGBfj/YzdDSsonxEfwWc/CcthND9zSTKGdklyqrJnMUaY4T2coeXgqpNXh9qqeHQt9lwGA==
X-Received: by 2002:a17:902:d2c6:b0:234:c65f:6c0f with SMTP id d9443c01a7336-23641aa245dmr76936875ad.8.1749714563347;
        Thu, 12 Jun 2025 00:49:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/9] ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory region
Date: Thu, 12 Jun 2025 15:48:54 +0800
Message-ID: <20250612074901.4023253-4-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004924_146168_64D0C253 
X-CRM114-Status: GOOD (  12.45  )
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

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index 666408d32f5c..d8993b5d457a 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -48,6 +48,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -90,4 +94,5 @@ examples:
                        "i2s2_m",
                        "i2s3_m",
                        "i2s3_b";
+          memory-region = <&afe_dma_mem>;
     };
-- 
2.50.0.rc1.591.g9c95f17f64-goog


