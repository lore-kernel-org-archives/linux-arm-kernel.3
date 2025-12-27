Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C331E8FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 11:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUb3WvGCjbszmhGW+RQqN+i+i3u3FpqE02r/bmTKsh4=; b=3hkiwBcCrM1Cs/s8NpLdfek4HT
	f1F3/zbivMk8W07ZaaFyf2RoccddCWTUt7t0AsnC9td2pS2tOewRu98BlrLlTeHZcXrnBr/Sf2xS9
	g/CZJ2+OYsb45SEhBe5wIUfmXdSgAp5eUKze5aRhbUh1Sx/6i6pq/nE81zaCCm2cY1E9L09Ycil0C
	6VNwyRI90vX7Ipyc4oSoZ12W74p6tushoKSyVhEwE8ZcvyBbVGB998V282uGtcae7daiXjSmPv8nV
	loOwDyYint7HWXpLw2GOk+rB1pnMoil1ItyX6Ld8bTmkAE0+Hbk5WUAZTo+00kEoWoaVAHyb3DgDp
	DrXY7wIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSoZ-00000001twt-3TDY;
	Sat, 27 Dec 2025 11:50:31 +0000
Received: from mail-m49195.qiye.163.com ([45.254.49.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZSoF-00000001tl1-1ntR;
	Sat, 27 Dec 2025 11:50:15 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2ebf64e08;
	Sat, 27 Dec 2025 19:50:05 +0800 (GMT+08:00)
From: Ye Zhang <ye.zhang@rock-chips.com>
To: Ye Zhang <ye.zhang@rock-chips.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tao.huang@rock-chips.com
Subject: [PATCH v4 5/7] dt-bindings: pinctrl: rockchip: Add rk3506 rmio support
Date: Sat, 27 Dec 2025 19:49:55 +0800
Message-Id: <20251227114957.3287944-6-ye.zhang@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b5fa4f8a809d8kunm85cc97d2e30a64
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUkdSVZPSUtOTkkYTRlPGRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZSdLH+ZcF3RZZpP6xKRbDNhs0yS9mWcg4tAQ72tlHCQusjor8NhauZTDceAmmwhg/lrY5c+Pm8fczb5xfxGzuKK2x2K/XFbVAAc3eXQtkbL5ZJLYBSz995RYwJLHClOvIZd0T5GWmcbyowINKfJ01iAV/TBcTZRCz25ZmFpYnIA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=CUb3WvGCjbszmhGW+RQqN+i+i3u3FpqE02r/bmTKsh4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_035011_968982_89924CC8 
X-CRM114-Status: GOOD (  12.25  )
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

The RK3506 SoC introduces a secondary block-level pinmux controller called
RMIO (Rockchip Matrix I/O). When the primary IOMUX is selected to a
specific function, the pin signal is routed to the RMIO block, where a
secondary selection determines the final function.

This patch adds the necessary properties to support RMIO:
- rockchip,rmio: phandle to the RMIO syscon node.
- rockchip,rmio-pins: a matrix to configure the RMIO block.

Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
---
 .../bindings/pinctrl/rockchip,pinctrl.yaml    | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 97960245676d..887bec22b172 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -66,6 +66,13 @@ properties:
       Required for at least rk3188 and rk3288. On the rk3368 this should
       point to the PMUGRF syscon.
 
+  rockchip,rmio:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the syscon node for the RMIO registers, used by
+      some SoCs (e.g. rk3506) to configure the secondary block-level
+      pinmux functions.
+
   "#address-cells":
     enum: [1, 2]
 
@@ -144,6 +151,23 @@ additionalProperties:
                 The phandle of a node contains the generic pinconfig options
                 to use as described in pinctrl-bindings.txt.
 
+      rockchip,rmio-pins:
+        $ref: /schemas/types.yaml#/definitions/uint32-matrix
+        minItems: 1
+        items:
+          items:
+            - minimum: 0
+              description: RMIO ID (Controller index)
+            - minimum: 0
+              description: Pin index within the RMIO controller
+            - minimum: 0
+              description: Function Mux ID
+        description:
+          Configuration for the Rockchip Matrix I/O (RMIO) block. The format
+          is <rmio_id pin_id function_id>. This acts as a secondary muxing
+          layer when the primary 'rockchip,pins' mux is set to the RMIO
+          function.
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.34.1


