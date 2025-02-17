Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3C1C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSmIRDqz5hyQFPdpXAuJTO2isFyroG+03fNCyyzcfnA=; b=Cv++R1sk0iZkuzWEz0ZNgSbIbe
	InW5IaO4FrvNfqjtTSD7iaxkYfVgai1QqmiEi87wi4zyFUwjpVRkS9Zseog0zv8xZtQk95upGbZQm
	p+MS63HQ8mXJ/o0HRXW+Cpc2W1p4Xn4ojRpaAMwYYslvQ6uAayWpChJLT3qcTFfwH87aXF+VqtVgb
	k8T8HwoeFNq6XopN1k1NdPLx8mBwKpOKYU99t6l0vu8ZyR/FUgPnD3uKW+bAi1lExWO1hIcGFLCbp
	mS+DtvemtRmDgx91GsTc55NILoVdFj94bvJOhlzSdfAfNWETS/dQh6oxin5Uw9vKl/+n2zi1IzZZx
	4unpeAbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk5YJ-00000005Z28-0vNa;
	Mon, 17 Feb 2025 18:09:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk4AU-00000005J5k-1wPT;
	Mon, 17 Feb 2025 16:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739810424;
	bh=ZO0lUUOVRwRafqNoWetQgISwi5s0VD7UwZ87lSrTg34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QpvRt9174RSz/2WWS1HtWCfx5iYmw5FRak+kNoAEF362fAiJ6IxTVOSqegB9jswsK
	 mqg/jOTL4wbDF4KTAvuRetacBZskgloEvDttfxmYyG1gdJt2ifGYLpXXhWzM2fqQjB
	 X8Q5RKt6gzbmrJ8Ztp2R5fgBeP4MeDofRA0hPt7Iy5RdiCss9tKsDIercTIN7gZsC7
	 ksCB/CCS0GSle0j1PV1GIgKLdaOEln17b3VeeLQw6M6Wh8GnW4Cs39AcH0ng+zBGTC
	 1SghL+Dzg10+nBSJGMiw4j5G1IQZnaErno/Z5kk36dEWpkVb1/CKRXa0fkVLp3illb
	 8k7JowKHBQkKA==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE1A717E155A;
	Mon, 17 Feb 2025 17:40:19 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chris Morgan <macromorgan@hotmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Tim Lunn <tim@feathertop.org>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Stephen Chen <stephen@radxa.com>,
	Elon Zhang <zhangzj@rock-chips.com>,
	Alexey Charkov <alchark@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add Radxa ROCK 4D board
Date: Mon, 17 Feb 2025 11:34:30 -0500
Message-ID: <20250217164009.130286-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217164009.130286-1-detlev.casanova@collabora.com>
References: <20250217164009.130286-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_084026_671039_68D5CA86 
X-CRM114-Status: UNSURE (   7.90  )
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

The board is based on the Rockchip rk3576 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 522a6f0450eae..9ddb20890627f 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -862,6 +862,11 @@ properties:
           - const: radxa,rock-4c-plus
           - const: rockchip,rk3399
 
+      - description: Radxa ROCK 4D
+        items:
+          - const: radxa,rock-4d
+          - const: rockchip,rk3576
+
       - description: Radxa ROCK 4SE
         items:
           - const: radxa,rock-4se
-- 
2.48.1


