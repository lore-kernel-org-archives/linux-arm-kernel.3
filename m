Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F229C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZ48jct9UUjMQhrUYFjdJha+PeVUYC5zibsjPkcbh/0=; b=2o/+adyaechX8VPZZ7ZvT0/Kpf
	mtYHLmQkyJXVh7D7fS2jiBRMOIK7mCUPI44EYvBFjt3VRUhQ8UbKpk+oD0iJ+Crk2AcypNJohB/td
	+tKZ6/i3LZTr3IHSGE1RzpZgSN6p1bffe+a/3qx8Maihckx3NQYAeNLTl9sw7vKGVEAlgbfax6pOK
	zeYHK+/qVZYJMu/6pfy8JeMI7jVJB78L6ju/jrTAo3KF3ArMjp/fNakDYmMndW4Uh51SQOyU17041
	MWPsjTLGueT4F15glXXl4AO0DNPIMSfIA+50PnKVRxNhqtRqgKk96+jO+omJ/g72n3ciGz+0LDenx
	3QhzgAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tixjd-0000000FLiJ-0WtK;
	Fri, 14 Feb 2025 15:36:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tixVT-0000000FIDs-1RPE;
	Fri, 14 Feb 2025 15:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739546489;
	bh=3QtZFaY0HrQ2qIf35atRwXoQaAvu1LVwT8pVaLegjcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fVp/E8YzLBUFCR0Mk1PHogxobf75P0Z11CQ0tPD4agBViSuqQ36z+FvUtaA6G5B7u
	 6ti/aOKX6bYxLpMrOeV110vpsd7RGPGFmBmh5T3JaUbOrl5CcsH6zyUVGawKDR6pJr
	 ye0MSXNpcNdzqVqAoNXSDSCKojJRZffB3dQXpWHjIU0XnCjemmZ+R1djDe/QjugWj3
	 sj8bCcyIy+iP/U5Z1y9daWowU6WKZzwYjjWmzfs5X65syZWTwKoNdHCUPL2x1RAJ7/
	 hUTCTCdbCj5jrd+NkjNRPoMmuwvAqJHiWMGn6+iR81jHvBJMcS7x0PXO/0hkydwRZM
	 FseGrdYiR2S7w==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B81B17E0F8B;
	Fri, 14 Feb 2025 16:21:27 +0100 (CET)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Radxa ROCK 4D board
Date: Fri, 14 Feb 2025 10:19:33 -0500
Message-ID: <20250214152119.405803-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214152119.405803-1-detlev.casanova@collabora.com>
References: <20250214152119.405803-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_072131_561180_1FA7ACB8 
X-CRM114-Status: UNSURE (   7.87  )
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

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


