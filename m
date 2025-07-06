Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C26C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 13:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ClLbCZ+zdSqyrw5Nmp7Lz+LivLsRhboCI3tLkE3fW8=; b=1YoT/t+3cXRcudSMD9M/pVj4q+
	2q/+6PIOfbIowK0Clqrq8PYT8nfQg7U2XBbiT6GAW3evi0vkXGrn9m0kGSgj4iS+ZSq93izLVdjpY
	fksXzXe7HzZVTe9hiFWWbynV/ZREb0FcTM/+IEM1t0c/OhdqZtbUzL3S2s+SjjYDG+zgGGoYz+kvR
	Bhh+ZxXN+GAIS9/8sNxz72wzwnNTuNoyAuikKlr/w5ysulooYLRyspm1KTgeBYKNHYhV/2LQukj2B
	y9oiPPfT/RVGIQc8pnOUYnVD2AXk8/CmmZQGwTZjb8qcmuaVIuxPbLpQSRKgs7eUBLTmccJXKoqqY
	vu95uGmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYPTV-00000000J8c-3QRu;
	Sun, 06 Jul 2025 13:32:09 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYPKC-00000000Hjh-3khM;
	Sun, 06 Jul 2025 13:22:34 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id 69C265FD3B;
	Sun,  6 Jul 2025 13:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1751808147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ClLbCZ+zdSqyrw5Nmp7Lz+LivLsRhboCI3tLkE3fW8=;
	b=OIMH3IbslQ4k7GBFs39aHcpdZcIlG5JleljNZWyN2UYos1SBrIwZ8NJE/rfrqU8Udn7fGX
	JDexY8aj7FsWBNOO5Q5fvbz/+kkzDD65tir8pT6b3c/kYT+L5UHpvQUK1KEl0stb2ydBsB
	jkSbFu+uV2qOJ5IO0cRNgoXc5e3HTYU=
Received: from frank-u24.. (fttx-pool-194.15.86.111.bambit.de [194.15.86.111])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 1156D1226F8;
	Sun,  6 Jul 2025 13:22:27 +0000 (UTC)
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v8 01/16] dt-bindings: net: mediatek,net: update mac subnode pattern for mt7988
Date: Sun,  6 Jul 2025 15:21:56 +0200
Message-ID: <20250706132213.20412-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250706132213.20412-1-linux@fw-web.de>
References: <20250706132213.20412-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_062233_075455_2FAB4970 
X-CRM114-Status: GOOD (  10.19  )
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

MT7888 have 3 Macs and so its nodes have names from mac0 - mac2. Update
pattern to fix this.

Fixes: c94a9aabec36 ("dt-bindings: net: mediatek,net: add mt7988-eth binding")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index 9e02fd80af83..175d1d011dc6 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -382,7 +382,7 @@ allOf:
             - const: xgp3
 
 patternProperties:
-  "^mac@[0-1]$":
+  "^mac@[0-2]$":
     type: object
     unevaluatedProperties: false
     allOf:
-- 
2.43.0


