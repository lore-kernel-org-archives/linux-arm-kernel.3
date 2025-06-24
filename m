Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439DFC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 03:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DINB2+Qg4o1wHSQFu6plzQAkDVRF3iFOHN2c+ZfjwHU=; b=vYAfW/iONsiW4a3NEpWuXJL5wq
	Nag/OFu1mUxyd5rgxvEdzFEmk244qm0jtNlXhnQVnrU95sLYjAbq1f/ecrh2aDHzio61ycfBY89Zk
	9mZTn8rz5rIykQVGbMwzPHWoBlie+Fc3ZXUnidgyzQPolGllAPeVb3TYKZuSdXjytHy8RYxz9sAqv
	2/WD3MbiTYf3QdcQNZLG+j17jpaXD37OMZvzQTwLpcwm9yVK3TtlajKfIEL9PAgh1GMnQBMD76PQV
	cd/u6hm0b6Ew41xOEPFAUmNAF4vRhxtCvZPu3sMIx8oxEdVIgCMB+YtQBu6ABru8x07iK0lMxX8zI
	xGJ+r4pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTubF-00000004ZLu-44Ft;
	Tue, 24 Jun 2025 03:45:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuU0-00000004Yh8-3ZYd;
	Tue, 24 Jun 2025 03:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DINB2+Qg4o1wHSQFu6plzQAkDVRF3iFOHN2c+ZfjwHU=; b=pMr5lStVLZlfojN/2foawN33II
	t4cb/b68o8C5QWZAm7kOew6OtdG0vqDp5LoVLBB+dNKn24onanav/xXa4aJq8H6ZblPr5oNCmnn76
	1Mo1SqNfR24lXC+hN6vTgI2KPeKSXC64VHXaDytEfOVn0aQUMvGaK/xvMJoMMlZkqR6Zqdb9ScAoE
	RSCLeokQ6ezMTIlNAKX5q4UW2XiZ/9edFjgRfFsnlq4Hb6oRI+57/iK6lKbrMchExp7+xoTCKtgWN
	yhk0HSISFvPKj4xWWw0VhuRpgDA4hGH1AmEQxNNQsp/1TJd3XzzE9XtszqPyRd2ABBgoMh1aWSBGk
	AANAnZ/Q==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuTy-00000005NSy-1XIA;
	Tue, 24 Jun 2025 03:38:04 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6075D25A48;
	Tue, 24 Jun 2025 05:38:01 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HtQydR2Gl-zu; Tue, 24 Jun 2025 05:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1750736280; bh=d+V7TBTT7wJrr7gsE8yUz9MFL39onShxcUURX4hS+s0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=edNjQeyBjh/kZEAZkXTpAcuLponkhnf2jL0XQBXfbBH0pYTGCVlHIHOYb+xnoHuys
	 DQSs/7cQYdJqePqr6OeBth0iyLSn1VStEtLHwzC5F8LSI0lld8lRr4I7A3MXWjJtXV
	 yjCXAlzyD0VoLa16BLEn9eTvMwMidvkDASJy5X5SvtUALctDrAN8nC24PRxtrRMuFy
	 TWgNld4PzHh/fRVI020Ksmy+DfJHS9awMwSOZjvm2YmNbAW59HiEVpAU+qY6SDQhdn
	 CQQtIXQuoDb04TepS9zDemUMafiZ9+5F/24QrD7qP49TVISvILQ+TOs4tr+XdB/wyx
	 y8aZD7KkSqTdQ==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] dt-bindings: phy: rockchip: naneng-combphy: Add power-domains property
Date: Tue, 24 Jun 2025 03:37:29 +0000
Message-ID: <20250624033733.50197-3-ziyao@disroot.org>
In-Reply-To: <20250624033733.50197-1-ziyao@disroot.org>
References: <20250624033733.50197-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_043802_552466_5EBC180D 
X-CRM114-Status: UNSURE (   6.84  )
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

Though isn't described in existing devicetrees, most Rockchip combphys
belong to a specific power-domain of the SoC. Taking RK3588 as example,
combphy 0 and combphy 2 belong to the PD_BUS domain. Document the
power-domains property to allow describing the information correctly
in devicetree.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 3e101c3c5ea9..db293d2fbf1a 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -45,6 +45,9 @@ properties:
   phy-supply:
     description: Single PHY regulator
 
+  power-domains:
+    maxItems: 1
+
   rockchip,enable-ssc:
     type: boolean
     description:
-- 
2.49.0


