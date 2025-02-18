Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D47C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSmIRDqz5hyQFPdpXAuJTO2isFyroG+03fNCyyzcfnA=; b=njS8kdEx5XUVOjeQ19IdmqQRqh
	q7y5KyWAeK42RBLu1+qtzJUAiCAtrcY7/J9H726bmYrhxMiI4G8gdVQDTrB6YKKFqgTgZ79OaOqda
	6I7p/xp3SgxdmHQ+vn53U1PbHX2u693pF1HGeRHfaXWuBuoVyeY+EsGUXofFBQnt/fGrumKUFaNmg
	LMJS/QC4RQkftl5+nnWGLyr/i3j2V1vCd0hVsffcEvPb31aduioQ5tshEuxwB4h3mCVrozVO35Nhf
	nWngNNhXGwk0o8bCPghtJtiI9H0aYWcXD9/DQkrbKpUsf8s2+mWO8Rctfh+IqLx4LJ96sOUNsVxBp
	5FvA/BhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQGm-00000008v4x-21Nr;
	Tue, 18 Feb 2025 16:16:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQ87-00000008swM-1OnB;
	Tue, 18 Feb 2025 16:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739894845;
	bh=ZO0lUUOVRwRafqNoWetQgISwi5s0VD7UwZ87lSrTg34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XJy9PO6udy88MzzypCBFe7Tn0YyH7CjsxUwa5DLaQfjhsrV5+SLvIEbb5ZERnGedd
	 ewzY1fIvN86U8IxWup4VL91EjMI0oqhhQSH9NGG8wMSdDAlOzd5UtVt1eJuqh3Sg1X
	 SG7xM8PGJh23FRWcrsipcNyzQ949lGWXJ0WMePEMaRcAAGJbAmqKaQgbyWZgdYoSu2
	 SbNZz6pwNQksIkT0O6FfGlvPpatT43NpiUb0JDZmUiVLGNvtd075chRlQJuqS7lhia
	 2LZAlaPgm8bCGvIrp04NSXh7wIY+jDtQNlSqaZZnRTSzBB1ZNXuoPu1QM8OjXML4ZO
	 T1IqkFftRMcbw==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87AE117E1411;
	Tue, 18 Feb 2025 17:07:22 +0100 (CET)
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
	Michael Riesch <michael.riesch@wolfvision.net>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Stephen Chen <stephen@radxa.com>,
	Elon Zhang <zhangzj@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: arm: rockchip: Add Radxa ROCK 4D board
Date: Tue, 18 Feb 2025 11:04:18 -0500
Message-ID: <20250218160714.140709-2-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218160714.140709-1-detlev.casanova@collabora.com>
References: <20250218160714.140709-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_080727_509073_D7276B4E 
X-CRM114-Status: UNSURE (   7.79  )
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


