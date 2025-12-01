Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AAAD111A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lneCr3ZqgIhpQvTiPt2OPic1hCogXmFNQJJ7T8FWapE=; b=Mvm6nSOtYtU1LCeZmfsizMFAh8
	cfUNNcgUO9oBSRenMtgjvjldpJZ40NKkldHTnMtyT79FST1/3lb3TnmC3vjbxJpfd09Yq8kNUolQz
	mFKc7CUzfTw2K+Fq4JVU2Yy+uSbcM5UNdMxd+4qms5cRIp+0DUfi0Yh9VnZHpaBz1DGyEsP5VJuKk
	1QtNgGu2qYq7WMhuyViYgokAyTQutke/g4UgneTj2DQalweb8oX/DoBLkqWxKNA7cGGOadHN2oxnA
	PqJTfNJAmQk1LhpjIdODI7UVZNrEcmdJ+ZK8/19sv4S0IeX2r9jtH3hshhtoMCRWMSxUM8hpnxHFO
	/CmLvbyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pk-00000003MJT-2NAM;
	Mon, 01 Dec 2025 10:45:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ1Pg-00000003MFd-2GIH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 10:45:51 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-42e2e628f8aso438944f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 02:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764585946; x=1765190746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lneCr3ZqgIhpQvTiPt2OPic1hCogXmFNQJJ7T8FWapE=;
        b=iGYLq1YiZyCT3EZvnRM1WxWXb7PK326E3yVwo6RdMZ2Rry+4VeA4jld2ZoKMGlISBs
         oddanJj7tZZEq/BbQMAm7D/4OeMTsGil8yJBfVpNC4o8DBuCx5aVF+RmAsvc4kp878C0
         rWOXmGnxs2cqwbnuItom1NrDtAIgFtO3cnvw9bQYDbCz+Su0gWJfwfxj0xnRAiXjynHk
         uOygGj8a/SB3ZVFhLPyoqC+0tuT7QObETX3aEOvUBOH4ien70zBCqnPpX5k4Zzfw4d2P
         kwt0UL5eZqJ+j7gD+JXNaBCQh2gVvTLzN4xmmMye93SSLeCf1pfzhxHLFOl2ZZ5eRD3u
         u9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764585946; x=1765190746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lneCr3ZqgIhpQvTiPt2OPic1hCogXmFNQJJ7T8FWapE=;
        b=J5makn+LsbdZ2fV91GtrnCJtwxM9LMjhzdmcp/WVavsRTalSK/D4y0lz6sI4dtL1aq
         sge0tygH55wHcn7cTSltI0fU9IGxORXgG7VOdbI3vnTt2rgvsKewlop+fVJKypk3oAIm
         dPVjczVhEdm2MkxsKYD33Fn7UpvGkYaZJ3enA7QeALVk/NyzZhN0Hs0MDSZS6UW6SJm9
         sBQp0CpNaX9Jcs12++Wk5b5AnzSoHakHIau4g9TXOUEs8S363bToy17VsfZ/KdNBm19k
         33d93C4aelPIoYrxqok0fnYLdzz5ttccrUFGbnD8Ksjoy+5wgSb8eojy501TnIES4pRX
         rHfg==
X-Forwarded-Encrypted: i=1; AJvYcCW9Mjx/NZFpC3YuQzEaxC5DNT1xiinwjClxAaPw1k7cYbUN0NyllovtFQ/UBMTV6UK7SKgkgANiyclGoef/sDT+@lists.infradead.org
X-Gm-Message-State: AOJu0YzHO1L/YaUIL0Q5BuIDe2FT6zrz/QsBAFAKAA2a4f6J0/1Arbt5
	meZTfusVEoab7EXQfpS0zyi192QS199DZ1Hh5OS0Iw6M3lIXf4+4nGfz
X-Gm-Gg: ASbGnct8Wb24sW+YIGiUgKpKbv+F2hr93bgX6PWXrJmjTa45oOkpiAEBqg47BVeOe6p
	W525gKk9FyHI7TdMYD5Y4A8HBAIQxQ3Wq3vR4TFLhW6o77Qc8HmOABkxtxHIwcqlVGC8b7+9mYC
	H4PuaRAlG+eVucXqiOdinsPJ+A67E4ubM3oC1kwWoLJ0PyNAm/j/ADXSI+jwa5cgOEmZbD9Tv7C
	Azz0ndB+HQQb4fXvG0sblpkauC1tAzkIN4i7Srb4mBEdo6vHaX7p10yap2eg0zf1+jQD5bUxTa4
	Nk/NBMkYVrWrmJg63pnY1PgvG+0PUj13VAdclz773l92YEmB0NbWxqzn/DQOCJcQ4R1mR7Zo87y
	mYslHr8DAI0U2dugvK15L12ze7NIkXK3wY82/Vx+F3h/xbM8nW6b5Su+cW4BNRZI/8SeuRq+Bvb
	8BNdimXLnQCulMhO92DSHkwC9h5w==
X-Google-Smtp-Source: AGHT+IHPCCG5O4iwIX/7gpyKWK10moypwr6m4s4LZngi2H/39mMdg/U4SqDEjLE2T2Oq9T15qq7X/w==
X-Received: by 2002:a05:6000:3106:b0:429:cc1c:c2e with SMTP id ffacd0b85a97d-42e0f1e3499mr28032126f8f.1.1764585946426;
        Mon, 01 Dec 2025 02:45:46 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6049sm26264262f8f.10.2025.12.01.02.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:45:46 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Mon, 01 Dec 2025 11:45:18 +0100
Subject: [PATCH v3 2/4] dt-bindings: arm: mediatek: Add Ezurio Tungsten
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-review-v3-2-07f9af7341fd@gmail.com>
References: <20251201-review-v3-0-07f9af7341fd@gmail.com>
In-Reply-To: <20251201-review-v3-0-07f9af7341fd@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764585944; l=1391;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=PNtzRnHeMa9DlpoWVZx3pwmISNuUbrxGoCv/8DLShLU=;
 b=1roTWqzlzM5O+BhkbGLoRapqg+15AtDQG3cylp9Wt2ufCry9QrXIB8uJ4mrXxH/si29U06EJS
 FwMMxEdu0amAmDJBa3PNBeB6wbZgyyhvxaeygqrPZBwMudD3Mt+j4X6
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_024549_924976_1E122573 
X-CRM114-Status: GOOD (  10.74  )
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

Add device tree bindings support for the Ezurio Tungsten 510 (MT8370)
SMARC [1] / Ezurio Tungsten 700 (MT8390) SMARC [2] + Universal SMARC
carrier board [3].

[1] https://www.ezurio.com/product/tungsten510-smarc
[2] https://www.ezurio.com/product/tungsten700-smarc
[3] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

---
Changes in v2:
- Squashed both entries into 1 commit
Changed in v3:
- None
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index f04277873694..cffb0f6ac690 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -431,12 +431,14 @@ properties:
           - const: mediatek,mt8365
       - items:
           - enum:
+              - ezurio,mt8370-tungsten-smarc
               - grinn,genio-510-sbc
               - mediatek,mt8370-evk
           - const: mediatek,mt8370
           - const: mediatek,mt8188
       - items:
           - enum:
+              - ezurio,mt8390-tungsten-smarc
               - grinn,genio-700-sbc
               - mediatek,mt8390-evk
           - const: mediatek,mt8390

-- 
2.43.0


