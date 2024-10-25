Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD54D0C5FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHjnlTjdt8BtFp7CiIXNRB6RKGW6gDEeynV8EXeDZt0=; b=kiaZ2KOdWnT7uPS6Ujx2n7xIky
	nAR8DhoyBSuy3JnAFFqNM/zMca20Ei2gpxdAibUlqjCypNtMA/vypOlODOBS1jN7aKlvvUrQiDvQ6
	WVE3T5BOCtR4X2uI2hb4ODeXIgvaMVIs8qnB7nAMjxPPqrYQyGrgBZ0bqUjkFsW6N+OfizJZu6EbU
	O+z5qJ38VyQN6liXWlhqbCgLOX7vVUNFM0G+BoRxJ+/apmT/pa+lKQVj0PWvNsConoyo4AuskXx4M
	Mi2vzZqtD7jwaiNQ/W4Ucj7CjTboS02+k4ge+BErfFPSx+f/TaJMvsndGmm6TjZ07UVIiaiRDrotF
	IS6SQ5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4I2j-00000003RTo-1B8f;
	Fri, 25 Oct 2024 10:59:45 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HpV-00000003Ol7-3RDe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:46:09 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-656d8b346d2so1211882a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 03:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853165; x=1730457965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHjnlTjdt8BtFp7CiIXNRB6RKGW6gDEeynV8EXeDZt0=;
        b=amSRre08sgDKPMQlXE55J8yWiqxcWjPovXUCB2UrC2h04oF4yPbDOqtqQ/TjXhBeAp
         GT55HTtlec2hL808os/3K+5M/RtT2C80DBWqiFt7fVHb2ige4zSW4gdW8MHxrwMSEqFJ
         7K1YSHNThHH2DaWRl62BGO459FenfVdETnDss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853165; x=1730457965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHjnlTjdt8BtFp7CiIXNRB6RKGW6gDEeynV8EXeDZt0=;
        b=qV3ktZtfXwmoVod7TXEkmJegu3PAuJpxMbSzOyJcmTJ413ZRMf7x656o+nVnIwvp3v
         ShPWBcpLsnTtuK4yd2uta003ohRtg44oixSwAvRAqAeyLZhe448ZPESJxuAG35widoiy
         IYIw7wOuhMkDbbQWor3tcGV5thBvnlcJSPWC/oXAyOqgvzJpSNnk99lZsvmsHAzsjSbw
         323IW4CEUNLPbnv/ZE/TRPBkzzobVADnsCuMN/lgJRDWnu8pvz4OobJZ0q+uF3MNqKTb
         sx3STCYowqytXhMViDWkfYCzivXx0I3SJZ8X4adalsKAwVRNzlRvsuGaL+JXeRRN+i7b
         QUUg==
X-Forwarded-Encrypted: i=1; AJvYcCVj7qCyZKLIKdcymLSn5WEVzYrEJgcXb27e7xxcg4J27ry+VEKKovrxuE3VWY+I+czViri8nn9ViVS0UkczFV67@lists.infradead.org
X-Gm-Message-State: AOJu0YzmR849AUCVuAM7Lgu1DSTBN26eoW32ftjcfsPuKwJFxQ+GKh2R
	UZobFQaWUc3bawbAReBWYTOm9CdTHHJRZzJivOQEy9RZkt0x0mxBNxbpCoIxSg==
X-Google-Smtp-Source: AGHT+IFS0h0JqPw1ebmNNkhQOl9Ys/JQ1lPG9I77D6EUM2T3OpCnZPEttx0nxdHn7SemMJj6wUzG/w==
X-Received: by 2002:a05:6a21:3a82:b0:1d2:f124:a1cb with SMTP id adf61e73a8af0-1d978aeacccmr9904743637.9.1729853165012;
        Fri, 25 Oct 2024 03:46:05 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d089sm829548b3a.99.2024.10.25.03.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:46:04 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 2/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Update DAI link node pattern
Date: Fri, 25 Oct 2024 18:44:42 +0800
Message-ID: <20241025104548.1220076-3-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025104548.1220076-1-fshao@chromium.org>
References: <20241025104548.1220076-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_034606_351305_C67379E4 
X-CRM114-Status: GOOD (  13.96  )
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

The associated machine driver is not dependent on the format of DAI link
node names. This means we are allowed to use more descriptive names
instead of indices without impacting functionality.

Update the binding to accept arbitrary DAI link names with a "-dai-link"
suffix. This is the common pattern used by the target (MT8188) and other
(MT8195, MT8186 etc.) MediaTek-based Chromebooks.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 701cedfa38d2..2da34b66818f 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -40,7 +40,7 @@ properties:
       name defined in the machine driver.
 
 patternProperties:
-  "^dai-link-[0-9]+$":
+  ".*-dai-link$":
     type: object
     description:
       Container for dai-link level properties and CODEC sub-nodes.
@@ -112,7 +112,7 @@ examples:
             "Headphone", "Headphone L",
             "Headphone", "Headphone R",
             "AIN1", "Headset Mic";
-        dai-link-0 {
+        hdmi-dai-link {
             link-name = "ETDM3_OUT_BE";
             dai-format = "i2s";
             mediatek,clk-provider = "cpu";
-- 
2.47.0.163.g1226f6d8fa-goog


