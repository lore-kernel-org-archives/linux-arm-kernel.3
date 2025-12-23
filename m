Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED05E6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUF+eCTLG+mmzttQnUwvPW7szQcj8nRq0nrcTr5Z0BU=; b=EgOeMgG0Cj9KscAruMJmmqrJay
	j4hAsth9FScFW78ZrJ10UMvOX8gRC5+l7FYq6yICG8hXJvfurNoa53JB3vuaHEaL7LvyOV6CTKU0+
	ivKjKjAqIfHFpo+P9PTIRF/nHZs1tt59Hv5WuiZSSvGGTmaBEJDk9+WEkBkNnVMq2+654w7ysqmPd
	JYN78CgfhhwsAYPrOZQeXKQO8ofhHPGX39HfDb4gn2ONCdzncjsGrPuWnE07uPIsLbT+sceCf/n+8
	fqtJ0zBZ6KchyNZ1qY5XMgSD9gVTVynWWgNL/tWhJxGod6nljyh7S+2Jpgp7E6BwQlX20nwtizaUn
	/6h48LUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6dX-0000000FsRu-2Uvv;
	Tue, 23 Dec 2025 17:57:31 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6dT-0000000FsQW-2dDw;
	Tue, 23 Dec 2025 17:57:29 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout2.routing.net (Postfix) with ESMTP id B541B600EF;
	Tue, 23 Dec 2025 17:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1766512641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NUF+eCTLG+mmzttQnUwvPW7szQcj8nRq0nrcTr5Z0BU=;
	b=hAzGLMHNGuy2VarmXTmSSkr8FUSAN5XyZswHTyFVyWaD47AZV3TK5/U4nMU4luxIzpVzbK
	0GTaNf09WCk8dbMGfsaw8YabjvGol6RK6Zy4hPwlQTaXv/4Tt9s3xZR6mNZC3Ry/BcFk2M
	b60XgVtVi7Nh9XvTuuKzMFLMLe+MCbo=
Received: from frank-u24.. (fttx-pool-217.61.156.193.bambit.de [217.61.156.193])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 73622122705;
	Tue, 23 Dec 2025 17:57:21 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Mason Chang <mason-cw.chang@mediatek.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for MT7987
Date: Tue, 23 Dec 2025 18:56:26 +0100
Message-ID: <20251223175710.25850-2-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223175710.25850-1-linux@fw-web.de>
References: <20251223175710.25850-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_095727_962177_A2F8858F 
X-CRM114-Status: UNSURE (   8.99  )
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

Add thermal controller definition for MT7987.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/thermal/mediatek,lvts-thermal.yaml     | 1 +
 include/dt-bindings/thermal/mediatek,lvts-thermal.h            | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
index 0259cd3ce9c5..a9befb523fd4 100644
--- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - mediatek,mt7987-lvts-ap
       - mediatek,mt7988-lvts-ap
       - mediatek,mt8186-lvts
       - mediatek,mt8188-lvts-ap
diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index ddc7302a510a..e9780edcd26c 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -7,6 +7,9 @@
 #ifndef __MEDIATEK_LVTS_DT_H
 #define __MEDIATEK_LVTS_DT_H
 
+#define MT7987_CPU		0
+#define MT7987_ETH2P5G		1
+
 #define MT7988_CPU_0		0
 #define MT7988_CPU_1		1
 #define MT7988_ETH2P5G_0	2
-- 
2.43.0


