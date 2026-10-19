Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C1DCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMgbNhwoeuCGyN6Tie1PzlNRtNa+QjScRMtBLI/9URY=; b=cvpJXTiAk0WGWWaVQDpDKUr5qw
	NvM3ue6iD2Y5VW5D+JtIXcRrRJ9Ci/4LdI/K8dAzgM71qErlsxoypQbyzLHtrCGia/6qgTBpKStXC
	TNZEJJc0uxl0QVeUqQHuusCWNMdvOYCuYgoMkOJXhHHyfGH2VTdIFVH34O2fYdEt4FeaksOvzCgWc
	5Pfqexlj3UzTfeJCzT3w82UdfM6ofc4PorV0AxCy50ixN2lZ6io9MLs/ZWe+JGPjWBbJsXHJkOhGP
	ZeMH81LGaHOUIzwpqJVS/EbjJfblFKqCGtYH1RNfETPqWAbikqOlsDqlc7FuIgjMKqWPYQK5Oru30
	rn2eV26A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYh-00000007OoV-3VeI;
	Mon, 19 Oct 2026 12:33:43 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImYe-00000007OmA-2Hbr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:33:42 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1088469f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792413219; x=1793018019; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XMgbNhwoeuCGyN6Tie1PzlNRtNa+QjScRMtBLI/9URY=;
        b=mDBEmicqX9i9R0UO7Jm2jwKHfRxxZNeJIgxib5+4huLuoz9NK2IJneAPZQdNGie7tn
         /stdJquT0KAAqZYE+CvkDaHDMV0BrAw4z/yYWtiMkcl3NePnZMgtsp07CHoB5BSr6M8E
         DX3Xrl23f0OgxW/m4L0QSn4AGoZ+ipSdMcxt1Y3Sg75QZd98kc6Z1useHmJVcE/F+FkC
         l+Cpv3oqzPQD+YWGdph/FD01DZ+BB8qug4zZ7OHwi/Aw3P145r2Z4LkChSHpWl3PxXPL
         0d3V5qUHI1Xzl+RpwlCfqrquOSfV1o6kVPFwwODxFXVLE/tvBwBcS1kVdtcrlOOw5/k+
         rW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413219; x=1793018019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMgbNhwoeuCGyN6Tie1PzlNRtNa+QjScRMtBLI/9URY=;
        b=PLrMBg8Qmf932KdoA0gPAv3rYvUBFqEeWTeZtma5JsCCaPyZS47kDiLYyO2hPV88j9
         F8atKZsjLE5dsobfQa3NUdzkDziIbCwAcIgu9aR4zJCm0UrO1Y7D85IHWew2lZke5u7U
         5hRpGdC/W+fZGtsBE8fNxlmvW1QLsRFPrpiDyjj9w16iiGpK08XVJxrUNVqTYqFwqP2o
         ame0Ohts3c1V76RuSO9yEjUGJ3EsL5UAsa136we7yPCHEji8+o6aj1EL2QxOXaBLSWVW
         cdXGaG17qwJ7WoDxj7EWOYjxYyvliMDXmW4pLdu3Kbkf7uVEVs3Y8B/JvrASgU4RJMo0
         Y2Wg==
X-Forwarded-Encrypted: i=1; AKwUvByQpqn6wCqPak3E7XB+VPGFGhr4ghondK1qgWq2UCbzaPI4N0LMiedj5DHFCGUChe5yyI4zAvvpMeOEb/VWIFf8@lists.infradead.org
X-Gm-Message-State: AFq9FYLU25WwBlyYDmUD6oDmhnE5eHabhJhJ6847sfkns8n3h73tVMXd
	l9sYfrcyqgT56Z5BGe8KGNzgTIaHfWibTheFnA7E3Z7CCqa3UB8RdgGZiUBNLWHIS5I=
X-Gm-Gg: AYBFou3/GDU4puUeavxOPx20kZD8FraSa0XgqCsYt1DeWmDb1LJesUW7QlvYA6vy1zI
	8XJrDBWK/9AbvNbZXmkxJS/3ps3NmNoWJ3xH56DrhA2gPZMwxdU+DQI2CZaAtTv+pCZIkwoIwHq
	b/qdM6Sv6ddY4cNVhNWhRy0BucVbaMTpSBkSB9Lkzv81mb50K2IzGHGsJb08TKZB+onYrsF3lSH
	ZPQLvzQPuCbdbX5R8KiQodtXoFxCmFq7lyoktDb5Ukz9mv3y7Th5oKyAAhJOjE+eoDa5/77ZBfa
	PKK5EgUrpGa8bW1+0Z6FLMvoH0hKg/fUqWMx2QZsNa+7pdGlyFYt8+UqXgPqsu7QGMSrPdrli7V
	BZJjrp/RrOv9wYqS7HNZrWmMsGm15Wk3xvHpY5/1A9ds/P7q9N7+OSiD1fgZwwzXHjQdZU3KRls
	riBsh0krFj7wymSpH1hG08JMoBP7bkY5+BlObCfhY90OJzomad26wx6+f9Qykf4BHwtxFedoLCC
	krE4C2lQoHbfPGUstEVm40TNug6JwRm+PC6zZgy5mNCZudmOHPAn1NDUJApK7L9H6Pnu4b5XSbq
	NbuOLXcw9gn4hyRiI5JjoyYKxhzIVx6a9w8D1yxC28qjcEgEQ1HXjdc=
X-Received: by 2002:a5d:5e03:0:b0:48a:fbcf:6f43 with SMTP id ffacd0b85a97d-48e07fbc4camr16385796f8f.54.1792413218623;
        Mon, 19 Oct 2026 05:33:38 -0700 (PDT)
Received: from [192.168.1.100] (2a02-8434-7c41-c701-8278-849f-666b-c282.rev.sfr.net. [2a02:8434:7c41:c701:8278:849f:666b:c282])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f576asm24677930f8f.32.2026.10.19.05.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:33:38 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 19 Oct 2026 14:33:56 +0200
Subject: [PATCH 2/2] pmdomain: mediatek: mt8365: add missing define
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-2-dfd445dc3763@baylibre.com>
References: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
In-Reply-To: <20261019-pmdomain-mtk-mt8365-fix-defines-v1-0-dfd445dc3763@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_053340_602894_12D9C7C3 
X-CRM114-Status: GOOD (  12.24  )
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

Add missing define for BIT(25) inside MT8365_POWER_DOMAIN_MFG
declaration.

No functional changes expected.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 drivers/pmdomain/mediatek/mt8365-pm-domains.h | 3 ++-
 include/linux/soc/mediatek/infracfg.h         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/mediatek/mt8365-pm-domains.h b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
index 3775e4dc2c91..e360fe142027 100644
--- a/drivers/pmdomain/mediatek/mt8365-pm-domains.h
+++ b/drivers/pmdomain/mediatek/mt8365-pm-domains.h
@@ -126,7 +126,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
 		.sram_pdn_bits = GENMASK(9, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 		.bp_cfg = {
-			MT8365_BUS_PROT_INFRA_WR_TOPAXI(BIT(25)),
+			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
+				MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG),
 			MT8365_BUS_PROT_INFRA_WR_TOPAXI(
 				MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0 |
 				MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M1),
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index d2cfa09f81ba..ddc53675529e 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -14,6 +14,7 @@
 #define MT8365_INFRA_TOPAXI_PROTECTEN_CONN2INFRA_AHB			BIT(14)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M0				BIT(21)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_MFG_M1				BIT(22)
+#define MT8365_INFRA_TOPAXI_PROTECTEN_INFRA2MFG				BIT(25)
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_STA1				0x258
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_SET				0x2a8
 #define MT8365_INFRA_TOPAXI_PROTECTEN_1_CLR				0x2ac

-- 
2.56.0


