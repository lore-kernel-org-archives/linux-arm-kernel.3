Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDE8C44502
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 07:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Message-ID:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FShFSBar2e4LM7uO/40Qd7kb3xOrWO4j2ojR50S1ZIE=; b=WA5vuMICyL0xvwLpXalwObTj88
	WBSkpCrwebb16mz4ld+fEFisj90SIazhZ5DhENxxm8gA3dWERQcN6HAvyuQmRnMjT9TeYIi6aXwN4
	34ypsw++YSsQMupvsVqNVcpvgh1LWJmyZZanheOFYigLIX2Uh1ctsZ5+DQRi5wejWo6RNOEgeBopd
	8g9SYSYQjhlJRXvDnxrOyPboJIhAKINYBOJ/A++4eyVbH7nWLj7h9f3xyaeD44WEGCirB99Vn5mRl
	wZ10WQBujL6zIzyvMLdQDtFmH7mcDd9adKwnk570mraJWMOSdU5HtIaQe1weYqc5B0H5t331U53TD
	ygsFmEAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoxT-00000000r65-1KIL;
	Wed, 01 Jul 2026 07:02:07 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weoxL-00000000r2k-0UP2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 07:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1782889317; bh=FShFSBar2e4LM7uO/40Qd7kb3xOrWO4j2ojR50S1ZIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=wIuDB3N1QKDzKxqvdvOSZlIuCX/0fRRVO+AWwbPsraxxKupXz5m0d7aiurzV0VL0x
	 4Oh8FgVzia5+yVtux7dFLO2UPmK2qY7lNzrIL5q92KMtKzqqLJ0ulQWrYeswjnVrpd
	 FV3BI53YeI4aVvUQ5536yVkgjZKoXSSvUiHsoEpw=
Received: from localhost.localdomain ([2409:8d20:2a:1b57:9e54:40ff:fe02:3f0f])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 71832C3; Wed, 01 Jul 2026 15:01:49 +0800
X-QQ-mid: xmsmtpt1782889312ts72e70l2
Message-ID: <tencent_83A61C9A79199D04CC118A8026C435BFB907@qq.com>
X-QQ-XMAILINFO: NwdNTztrVPAhWG/Ary8iIcgmz746y/a+3zoJp7nCqTD9tf1OdnigiabLGRksUa
	 CoALf6Q8iPt2i3x4D0ul9kBYkgnnfA4MvQbBfj3hfBaxx6JzIJpgNc5fniq30N0q4YD1hNSrITNZ
	 FLqpkTGWL7WpfiqDWlUryCU4t8zhIl2Pz925IVRjJxb6QEWe286xYkmSfAzN/ecJTbLqPXj471jM
	 cXoHfegvO2xhMw+Ir8cFUO/ASvkzKyTpPAKHn0nzxQNY1UcgsMcXGM+spgICj83emfpGzpKTDxNQ
	 rSEuOL/LNQLhz/XFboJbhF22F9dbxFZYE0tbhDT4kCIfOfmyWpcyMW35eY+kFxQEE6hbADIFCT7M
	 sK3MX6uYHMlctw2lPJoxCCDPBzNMEcVeR08BkmqqtpaZnHDpYvKjGLwz4IlR7abAsSdUq0Z0B3j9
	 tq5GSUmlzR10wShQkTYQ6MfupHVn6jDzGDcbcurkanr01wqGJ2CQZ+EAdt16JJiOZHH+n6qPgrD4
	 SPR5/wWqPhwFE4tI6nW9EoNVnZkS2gNFgD6lSb8jYwnxvKuLP5b1Y9gvAIhNDUBuVvVXSkp5/fq7
	 KBPrqrwfvCond3ugQDzmaHiyHfBHWGhULIyou6hBIW+S7UgLlYHXn9pvc3zNw3q4BoMq6S3OLrrB
	 apOwlZdDrtax8wiovZkbO3V6lF/6Q6lb9tPnFU4NiBRjuCctKgjRKU7rmwyQg4KrSKTAu1hIv/MV
	 urfICn9+0c4xmX/3l/bHht8ShzUZwALgNbcBBUpZRvfTnvHXUgDpu/63Cd5EJqfmatcjSudrKE/s
	 rbilbHK1r89PpCBro3c843TDmg/lrPtaoujs5fsddNf6C4YOXO/6EaDP3rWvB/bEUO2hKLDyuxWV
	 0EOJgm04RNs7DJksG0mpHYRkxxhQ4Dltp5lnevkPCqUgfySLxrWoSBGkTIGVGw+3DoF/Duh0KVqI
	 2BDc1ZVHxL6dm48aV6hYMdtb6B/Y8HQUVVLm7UzY4XzaEggZmGSXd09N0JTn3T5fHZ/Xj4nGK331
	 p3TgsIvw7WZFpKl11VJrYAXwsd5gG60B2pRTr1uy8gkvG8IDTmf+gNhtlcistjxJqJ30+u2aMAFs
	 loBDSSniwbc1ryTFsIgpF2sOaCYtOKweSwYm7T56sREcVbiZhEgOtYNnBnyEz3eL+gori5
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: 1579567540@qq.com
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	linux-can@vger.kernel.org
Cc: Vincent Mailhol <mailhol@kernel.org>,
	kernel@pengutronix.de,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	luch00 <1579567540@qq.com>
Subject: [PATCH 1/3] dt-bindings: can: rockchip: add rk3588v2 CAN-FD compatible
Date: Wed,  1 Jul 2026 15:01:26 +0800
X-OQ-MSGID: <20260701070128.2096267-2-1579567540@qq.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701070128.2096267-1-1579567540@qq.com>
References: <20260701070128.2096267-1-1579567540@qq.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_000200_398051_8401989E 
X-CRM114-Status: UNSURE (   9.39  )
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

From: luch00 <1579567540@qq.com>

The RK3588 CAN-FD controller uses the same DT properties as the
existing Rockchip CAN-FD blocks, so extend the current schema with a
SoC-specific rockchip,rk3588v2-canfd compatible instead of creating a
new binding file.

Keep RK3588v2 as its own compatible rather than an rk3568v2 fallback.
Driver support uses separate match data and the RX FIFO count field
layout differs from rk3568v2, so a dedicated compatible is the safer
description.

Signed-off-by: luch00 <1579567540@qq.com>
---
 .../devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
index a077c0330..aa31ec78e 100644
--- a/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/rockchip,rk3568v2-canfd.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - const: rockchip,rk3568v2-canfd
+      - const: rockchip,rk3588v2-canfd
       - items:
           - const: rockchip,rk3568v3-canfd
           - const: rockchip,rk3568v2-canfd
-- 
2.34.1


