Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A231BC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 21:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Brur4C1KRH7ZUhiNhHqibnXMQBZX0rV+SrS3MM3LTAE=; b=rpnBFg6NvLeXRtW2RVaF75sHT4
	wI4+l+QV1GoOdDgWD8w0jHU5zZ23zKpoCaFS9DVNpU+6/u31Q8oJnyGA5O71DMatlO6wrIcj50tN2
	Z8Mmbo/MuFQjeHizadEPqy0wBs9TOvWcMs1KHUTPbTBssG9GJd/qAw4nT0XuTnFIhjON1QWijQX/v
	eORxRIUqjj+aB/y4oofONxXi/IdQpiOG8H1wc1KS2U0idSo3Vsvf4JTF8FHFCROZQAbdIP+0NKnjN
	5G9V2XTaOe6ubSfZMNFGD5eFD2TU6OnK6075xXJKLsBb5zR5TAczJkM5PrFaL/6uNB5yau1waKOzW
	iRqKgfvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONOH-00000002yqW-3Wbu;
	Sun, 08 Jun 2025 21:17:17 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uONM8-00000002yQr-3Awt;
	Sun, 08 Jun 2025 21:15:06 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 9F1B960131;
	Sun,  8 Jun 2025 21:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1749417300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Brur4C1KRH7ZUhiNhHqibnXMQBZX0rV+SrS3MM3LTAE=;
	b=DeAsXqnGnNiR+K6UcO6MlVhSX5geCOb64eEHO2CbkFl/v9XdVnfvtEGo4DMRcYwBTjvoUe
	aKsVLmrTBi2FR1u3eGvGAP6Q7n736kKaKAR0eyhHVSKhJQRTTVSOz59Rv7FJaoFC3NtkqS
	xrYyBpK/WoL7Kodeoc5LepRVogpCb3g=
Received: from frank-u24.. (fttx-pool-80.245.77.166.bambit.de [80.245.77.166])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 436781226D6;
	Sun,  8 Jun 2025 21:15:00 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 04/13] dt-bindings: interconnect: add mt7988-cci compatible
Date: Sun,  8 Jun 2025 23:14:37 +0200
Message-ID: <20250608211452.72920-5-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250608211452.72920-1-linux@fw-web.de>
References: <20250608211452.72920-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_141505_013146_3514B957 
X-CRM114-Status: UNSURE (   8.92  )
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

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible for Mediatek MT7988 SoC with mediatek,mt8183-cci fallback
which is taken by driver.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v2:
- no RFC
- drop "items" as sugested by conor
---
 .../bindings/interconnect/mediatek,cci.yaml           | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
index 58611ba2a0f4..4d72525f407e 100644
--- a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
+++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
@@ -17,9 +17,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8183-cci
-      - mediatek,mt8186-cci
+    oneOf:
+      - enum:
+          - mediatek,mt8183-cci
+          - mediatek,mt8186-cci
+      - items:
+          - enum:
+              - mediatek,mt7988-cci
+          - const: mediatek,mt8183-cci
 
   clocks:
     items:
-- 
2.43.0


