Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68F5C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=4wcT7AMfORBc1dDHoJCPcNTM1Q
	hXTlldQIJuc0G1SNNlb0NL6cU23pYNKDJUeFmK2PkxO6UweVO/AgNrCzOCGAvfKYhAjSlkuCPBCOi
	eKdFVvGs4ToBVT3F3f6TQ4Z+weinGNzS2WR+LI4Ac34FP7KNK1D5ywRa043R57trha+9hCb/AGCz0
	uRQf/40HtafAXtaTuiaSQBGilHq1/wFh00/ynF9fFDZg66cJ8+BbOl5xvIhbT2BRMPMInvO8PHtLN
	fIHXfvZe52nysES57JMru6CR8ETfiRnGSflbZzwaitpuXHVokTAQPbQxxctiBb/oQiyqti8S4yffd
	y1RZb/mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1qT-0000000BX16-02w6;
	Thu, 20 Aug 2026 12:26:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1qN-0000000BWz5-3zac
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:26:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49954b88fffso22524735e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787228762; x=1787833562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=ie1OgdQYr834t/M0dEsXsd1/dJzPr41Lc//ORmIvm3KBTXVVPNr99RvZLSmjDJMeGk
         w0aavlXF7xOy6EiYat0QRA3j83YF4Wxl1lf8M353uwA9y3Qe2qO1ExGPkkUp1LKQmvhM
         0XmxanylOWgb9nVBflMcmq9v9hK/Jr/OK57/DwF2F8GBqi4O8JLEpyl8HSYLnR5DaJ9P
         883zmGZiM8KHfxT/YHLMEx+aynp/vWq2wy3WcRvrd7nnsM1iHb8ZuNdYTASUUygi9gea
         cLi5qzyhSF4Ho6aE3hdBhnUVR1n8z2g0GdSsXAmBDjZDZKkFbHQ4v3sa7GEX2kyYyucG
         JWrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228762; x=1787833562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=MDKTqQoJZ+vIDENQQaKv64nmB/+Nnt0YBqUuyiKp5qrgnIiRPxRnmP/+vz2i0mx4pR
         BZ/OTZDtSjwE5mIAP3XtOeklKR9ZgaIGyqGxFcRQuqebGfZtqwWtRodlCFQY6/KOqzEN
         pfGcTwxOQCVFylL4dvM7uvf+8dJ46Qx253H9Xm4/wTZJzhNminPRCvGr7T1U/pQHJUkA
         HOq5SDhRlKdBdcZJhFA/kCl6rs/pkiD12c/Um2YRpLvh+68zzaB5eJNjQwJEn+YK848f
         A3QXNANx/SmKadD55bpzC8eruGAshDjiwM/hxk395hypcWkgeUR4EPM26mGAtfpA7ql/
         FYxg==
X-Forwarded-Encrypted: i=1; AHgh+Rqlc4xA+L/2MuCzad5pN2n9pyjxQcn7tNDs64LrPZiPJtd8KMr+D6TYr1TuQp2CkbFm4Mv7uWg9blxxrz7wrrmY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+z6YqGilq+feuYSwYwgBkZxRHaKwNyA33t5KNGZxBq9NNylCW
	F/M5azJZJ+krvfVPCkrbjxtuSmPAmReWGIPFnaL4MVX22rr24cwKcPpY
X-Gm-Gg: AR+sD127Qw3bFWdW0XYoiFuiRfwcdgdbIwRNiCgaNhJr8GmqPDdq+08WiRvalx0B3IK
	v/Ac5LtCPwfSe/vXiYQ37owcZYF7bbW3TpNzcW5WX2MVeimv8V5Od/EFBe6pwyp4OBld00hPggT
	qILSlXLa+cxjmrF7W/2rkzpHrsJhFcdTebNlawxQ4oo2EGOCaTLyHtvGOzuUqAhQH4Sn8oS+hnu
	7B090kjgjWO19pHS8mvKH9WU0ma8uk+ApAfYQOkepBSxrZ8DTwPdmJPifDIswvB4gVLVNhJ7F6q
	FcNFYc2CQ1Hurquxh5hnmbkUFCBE0B4r4KTTOBxVLUycR9ZGaYGgc+5rPU7vz8BnKu8wMXJ8e6F
	aFhNtSMJfer5K+ChqjgFP4hRxVdcJlxJFmGLJm8kZIrlaXbORSC5wmloOWZA5rnHvs8sy9mHNzP
	hXuQ44ugrLi1rz0k//gJ8GC0wtZ7JsZ7NqXraAvCquw7KZHbrs/YDN6Q==
X-Received: by 2002:a05:600c:8b65:b0:499:a5fc:2087 with SMTP id 5b1f17b1804b1-499aa1722f5mr231760135e9.6.1787228762272;
        Thu, 20 Aug 2026 05:26:02 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ab2a8b34sm170494645e9.8.2026.08.20.05.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:26:01 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v9 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Thu, 20 Aug 2026 14:20:00 +0200
Message-ID: <20260820122242.120039-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820122242.120039-1-l.scorcia@gmail.com>
References: <20260820122242.120039-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052605_860660_DBE51C02 
X-CRM114-Status: GOOD (  10.71  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


