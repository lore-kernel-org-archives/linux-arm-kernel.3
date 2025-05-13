Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C77CC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkwdOn5n0SYL4gFgl3/rMnyEKOjKxd4O0ZvjvmC/+0A=; b=PUvAW3wVuerj8YZxaCvWvThUdv
	Hn0Vp1Kr+zt6V/yHxe4yu0erD8aU2XKRSL1rMPhY/jzbBamFkGxLWt3NsTp8brAOElUlBuQwor6pP
	wwRPzHZ1eRa39u/5ZQOtHpBf2+va52AZqs0+FyHqjXnnjqpp++71iNmxq7qVkPa+TROvaeG6g/99+
	Ywe3LumcEDSdUQ5I9zu93CwAHBtkDzbghcEXNbSPWnzMbujyXFuGXjHFSvr3xhhrI228b0GBNnJSe
	T7qCVEvHd0TtuGtu6Ydm0DhttBwuV2k+gJjoguzcJTIb4WMNk3BKN+vvJ/9BPzYfdcNfVOOysF9/1
	njF+roJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErOu-0000000Ckkq-18Ui;
	Tue, 13 May 2025 15:18:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEr9m-0000000ChlE-1dza
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 15:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fkwdOn5n0SYL4gFgl3/rMnyEKOjKxd4O0ZvjvmC/+0A=; b=pmjtmzi/1sZUg6WJWrzGXxok3f
	MYGWsX4oQGMe8VkZnSXqGy1li2IcMH23CwpZpR2Td5CBcOXHqcNgGYztZG5SQcNvkmMnrnrLKts/i
	FAWf/Y5wk6Q94FQA9asAmS3uN2ZH8/QKmuJJvQK3rHQGoNNFIpVphHzBep/+iCNFLhb1fSkgbbxxY
	hmgqJEaBTkDcOpyBH0Nvx2Uaeo/KNThCL7NZ4Xhb45k8yU0TGOoAgUM3u0idH8ywjKrEfpsjGDtyK
	GD20paF0HQE39cTgSM6BEDEqR9i2yT+ZVIyjObFEcv3jHb53gh34A7nqpSnlfiS0xEYejin+rpNR7
	vt4fwmrg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEr9j-0000000GzyZ-0EJe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 15:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fkwdOn5n0SYL4gFgl3/rMnyEKOjKxd4O0ZvjvmC/+0A=; b=p62HqCjvIbL9XCbvEHKv8qdeGu
	HTunAre0nqDOI72blUMU1ky+rJlmewv1XfMvrmqYcAQIFa2EavIvFJ2wNKNZJgj+pcHAesYKgyHhA
	TCc2bqaOOXcWZCQrQfA9n2eUGSrSEXN6VNG4kMxJaUGV7obTdYVDYu7i33uKUV3ZfA3o8vzDCpU1V
	M+6uTybs3s2dTVY1Lzs7H77OEFQR+GpSjM8rwPo0UcVehortM+WCKRk03dOagKoUn2jMeUcX1QHuD
	UN1prPDCHE3yGJX6HNZ0RGWkCBZbNimdp2h4niJxmamh/sgIvC0KGcycQsrl4NJ+2IndJ63Rc4Vhr
	ywQ4Betg==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uEr9c-0008L7-Oq; Tue, 13 May 2025 17:02:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 5/6] dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma Systems
Date: Tue, 13 May 2025 17:02:33 +0200
Message-ID: <20250513150234.2331221-6-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250513150234.2331221-1-heiko@sntech.de>
References: <20250513150234.2331221-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_160255_418132_7FF71B77 
X-CRM114-Status: UNSURE (   9.61  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

PP1516 are Touchscreen devices built around the PX30 SoC and companion
devices to PX30-Cobra, again with multiple display options.

The devices feature an EMMC, OTG port and a 720x1280 display with a
touchscreen and camera

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 6435c724e682..58af37b4d6b8 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1119,6 +1119,14 @@ properties:
           - const: tsd,px30-cobra
           - const: rockchip,px30
 
+      - description: Theobroma Systems PX30-PP1516
+        items:
+          - enum:
+              - tsd,px30-pp1516-ltk050h3146w-a2
+              - tsd,px30-pp1516-ltk050h3148w
+          - const: tsd,px30-pp1516
+          - const: rockchip,px30
+
       - description: Theobroma Systems PX30-uQ7 with Haikou baseboard
         items:
           - const: tsd,px30-ringneck-haikou
-- 
2.47.2


