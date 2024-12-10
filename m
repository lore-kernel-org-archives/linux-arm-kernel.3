Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54239E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 07:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fU9h1qciZfo1eCFrj9RBOWdEPoZjJk9V1VI96TtLyqU=; b=01X5XB3A9zmIUMzqCJLrKleRLp
	MnyD5+fUh2jKjEqqI+g4gayrAD/8qTG40XuLWPTftdorECBCm6NQGeN8JOap45Lv8C9iRBuAuI82S
	jpPkYK1zWseAtmYooed+snCoe5NkM1J1SFn9raeT2KqWAO1sE16Hu02qIaNh1iL2CfwjaIiKGG3Xu
	OFtSQAsFHJe4uaxTEZQc8a9L7aGXLQmeI4nXOxEVhJpjelT2OdCMzJm5pOs4s3cMV73xS0JG+NHRD
	ciiUHGu90JHLr3RvRTtJXzIN+y+fVM6MtSyesh9Y81xB9P1qUBdYmyi5TgJrvELtXbi63wSve7Wg4
	5JvVUseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKulH-0000000AZOF-2vZW;
	Tue, 10 Dec 2024 07:34:27 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKujF-0000000AZ2j-1tNN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 07:32:23 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2164b1f05caso18573565ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 23:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733815941; x=1734420741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fU9h1qciZfo1eCFrj9RBOWdEPoZjJk9V1VI96TtLyqU=;
        b=MxjpQU/P+tH+/qA5gojpF8fPehzNXiIYikaCOf/HspvSJfh9vRkLI6V1W0ikO6Wm9w
         XjzH2yJwaPBnfXRDW19HSmbGt2j3dgKXfK9+G7uQltAKcqvLE7I3l1CM1KmSZC6eSx3q
         2r3JnaGHsiUnbXJEXEpefiy1dTw7SlD2GaRf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733815941; x=1734420741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fU9h1qciZfo1eCFrj9RBOWdEPoZjJk9V1VI96TtLyqU=;
        b=AUYX1vgxH6csnCBRCLTeiMboNEoFavpZQFDMXuafV3jkydDzk4Wf/hwnVutKfmYbu5
         5CmbiwWWHlzT8EpkaFCknyqRBn8elJ8Lne9l//IJh6JrFG492v+dms+glpVmrwRB/LGd
         rO6D9I7ZRbQR+s18BgHgDAoaNlonqUwsqa4z75JdxO7ynyxyAm5JnFpQl5YrOqez+fd3
         IZhrQjbrrsw8iVvPIM+xMP0BsFRsBkvLTUp4BQxiHbtEx/yssmzcPqBwN4tYrqPqJoYD
         DZKnYplrPcWXex/C/EwaYynB6zevjdfq7Cwkm++UMxZOTzDVH4ev/nf+a1y+gCsUJnHV
         LY9g==
X-Forwarded-Encrypted: i=1; AJvYcCVIyn3f5GaBk7eZ7eNg2E2T/5AEUmuznaWRd6HYA8ULu/1MrwGwHK/s26+t1noIyr+krWLOk9FyNmh0rBVVWTwK@lists.infradead.org
X-Gm-Message-State: AOJu0YyeP+b4lfhPGJI1eLDcDg1pJruym42PcGVHdJKGD5zuLeOKOxmd
	1fRYQOL/1L7ZVsLLjbAj868TsIqDVlIis7OU0KGjR8zo12Tc+ETTUBujxHwsmA==
X-Gm-Gg: ASbGncv1Bg3CwQMHu2h53pqo/MY9v6FWLndAy4JPUeVqRO1KgP/K+l6zGPJGbjanaCD
	oC1+Bao7Uw2FnnF48v6EBjKEtLM1S49gc5G9Q8hINdZB5e7L/6K3F/GwLIymGKOPlHDqOVp64KJ
	FCs5wtkBC9G9/0h8xkUTaHOA1eBZNfiB0QFdRYWhOV5yHsZmnK9Y6GbfVEPPceKVXcWs7seRU3K
	hiTFNmoKnVwBlpGOCu9dcoEH4DMpEm4+m6UWnJ7wzhRDq9fkT4WtGQNUY0XtxdZED9ASgKF
X-Google-Smtp-Source: AGHT+IHPmON+PwbNAPPZYDE53KwGnbvTApGQhaNGbUZe2uB605PBpV+ZcftSN2qQ7es0oLZxPl5QBA==
X-Received: by 2002:a17:902:ecc1:b0:216:3876:2cff with SMTP id d9443c01a7336-21638762fcamr152395915ad.54.1733815940983;
        Mon, 09 Dec 2024 23:32:20 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:89ce:2db9:f7d5:156d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f09146sm83693295ad.199.2024.12.09.23.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 23:32:20 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: mmc: mtk-sd: Document compatibles that need two register ranges
Date: Tue, 10 Dec 2024 15:32:10 +0800
Message-ID: <20241210073212.3917912-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241210073212.3917912-1-wenst@chromium.org>
References: <20241210073212.3917912-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_233221_481566_A5059870 
X-CRM114-Status: GOOD (  10.94  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index f86ebd81f5a5..0debccbd6519 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -235,11 +235,19 @@ allOf:
       properties:
         compatible:
           contains:
-            const: mediatek,mt8183-mmc
+            enum:
+              - mediatek,mt7986-mmc
+              - mediatek,mt7988-mmc
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


