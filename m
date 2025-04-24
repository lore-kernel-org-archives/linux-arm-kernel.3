Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162DFC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HOVuiI+8mSRH7O/02K1BDgrIMTx/XasOhwMXr41vKIE=; b=hFlhZ6Hf2kCFWYP7O2gP1MOioF
	kXgNEF3ySpYLczlvSSsZbgDzgM2rgVnXtC0Tv7RZKOS5Nep/3ysloTqhGO9FSm5NZd8U/Ay7MtguK
	pLoSV7TWR475Op+2o450j3QmIdnyxPHZWqoSBuSQoKn+0IHnAyLS3GYmKeCI6WthJw7OM6OVr6kZC
	5Dg6/yPIjOd4U9KFMAF0c0+jkweffiRKKdqbhrh4rh/DMzsbSUr/1A9EOmiEDRWiGzlXfmPDSPNya
	GO6hVA7xZRBSRmGaojV3wgeg6SoGFKN0WXRt39vEGUziFKEhNrPFsp0kl5Nf2RNavcd8aqtqt+AEA
	9uNGpd6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7uu9-0000000DtCA-3phY;
	Thu, 24 Apr 2025 11:38:09 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tlu-0000000DfSE-333o
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:36 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22c3407a87aso13018795ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490333; x=1746095133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOVuiI+8mSRH7O/02K1BDgrIMTx/XasOhwMXr41vKIE=;
        b=F0HscKVhiGRqfC1tSTuOPUCaJpMmgrxC94WKsNOhi1jlwGaSd0U54Pa6srlPLLn0gM
         IJsW6zXTkKLkmHL/nghZdB9J1nvI/bz5HtWfgek6cg99TOmaNdnJ4H35pk44kFh35+in
         sT0y23uUyri6feNmzhH6Wd9hmBiGWjOscbb3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490333; x=1746095133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOVuiI+8mSRH7O/02K1BDgrIMTx/XasOhwMXr41vKIE=;
        b=wxoXsO5zDt8CaOxYzftXvvO7XLUiwWhM9ZbHY8CtOPrLQa3XSz9S9qmM18hSsUP3HF
         r+lJ4e3TjQD3LBnJpMsx/7feDx8wGK2+i8eKVW3pRVn29pdSh/Tf2c6ku9Go9+vkyAap
         y9fPXz1palVOy82jTVqn9JWYYJ6UDyEI/UDdwfTOGuUOSk9IwuSlDHpPJI7kivV3Y/G3
         AwXfeDcSBYMsq5O+sDJYFMp6/19C/gucYoOot6moF1PcszaNiWU/Xhiz6RpSjDZmzIZf
         Wz6S2sLCVc+Ivc3ZmAHtW0f9Juui0DuKLAHqY2DcuJ5v4STYZpbR2DIw2HgbUe8TnxJ7
         CBOA==
X-Forwarded-Encrypted: i=1; AJvYcCVZEKmyLTBMKYjjF+B5JugU9guVjqKh9PkBqCJLVHt1DnCItQCMKFvynAyfX/9mTH3aNRoh2FMiY1bhNTRQdXM5@lists.infradead.org
X-Gm-Message-State: AOJu0YwS75JVXbRIdQ4HRkEFOTHtxHs8v49N538CPsUdaRZ7whY8rhjD
	ZXaWmikwaBANfwBE6rf0nd4/YpwC13kwhnJ94hkSTM2xs0jcY4cgBrNOVWfDWw==
X-Gm-Gg: ASbGncu+AuCq9j13jFBQucyqg9W7t29Z/oVsfSRUv5Yb8i4XeIDf08k8mpWiSkaBPqZ
	/WlXleRzqF3hzi0ZLK8Z/9R9pN6tFOds0fJIsuIjSwCBQzWKCuaJ3oZ/B3Ns0JWXmDeQ6vgsbGr
	QVzBU6ZU+0mGineJ3JUTZqH0XAidKETop4pNcVEp2mCeKM7v4DV8wx7gRRFlI/waD+jppdeNvoY
	FK3DwvX7ly3fNnQiOKu3hlwBhcVCSYXUespAe6gIMwyKw04XsiI4wPPmIw2ZRzgmGPgeRfge5SU
	F9nX4hUqdQfwnP/LM8re0iGTkLEBTo9kSxNsil8ggdTrb8IN52zewffqFw==
X-Google-Smtp-Source: AGHT+IGD0vIug8Nt9qcP/TU1PZMvFZmtESOf6amtEN+pO0sojtfEbRYqEQc7zpWOQxTNCIuHa8wc2g==
X-Received: by 2002:a17:903:24f:b0:220:e655:d77 with SMTP id d9443c01a7336-22db3db14ecmr31506645ad.36.1745490332983;
        Thu, 24 Apr 2025 03:25:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/13] ASoC: dt-bindings: mt8186-afe-pcm: Allow specifying reserved memory region
Date: Thu, 24 Apr 2025 18:24:58 +0800
Message-ID: <20250424102509.1083185-5-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032534_770875_79CE7617 
X-CRM114-Status: GOOD (  12.16  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
index 7fe85b08f9df..f5af2cf18158 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
@@ -25,6 +25,10 @@ properties:
   reset-names:
     const: audiosys
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
   mediatek,apmixedsys:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
@@ -170,6 +174,7 @@ examples:
                       "top_apll12_div_tdm",
                       "top_mux_audio_h",
                       "top_clk26m_clk";
+        memory-region = <&afe_dma_mem>;
     };
 
 ...
-- 
2.49.0.805.g082f7c87e0-goog


