Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159F9CCD1AF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 06:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhEwTOJpvO51g4Dk6tmaArlCoSEY7pRYawJS6aX1OdQ=; b=o7a2wIJaRF0ynVkNitJ/dlGHvi
	kNQfrwGMvDSHO/Sfz7agTKWsEYxoumRgRua8Sqhs/P/os5POvqExGF/4MIZabIPn2+q4ST0dU5fGc
	/xXPoDh2tslbJlDkujP2LIeWYYD1U8iGFxvkAnN15HepZCwyW2M1hflV0jOCVsaG9FwtLJ6gVQ2/m
	4+Oi4NPrzQpSYWH5abdY1RsasH3rilBhVOMZ1VdaVVPhi2ZI5E5c0Nyhx1s/8eWNH+k24R7p34cLx
	sM2mt5xzghrGny+/HJ8GjM2KFdSn+dOqqx6cbvv6XZJ7JFzwh3opnB8/LiOIdq8XbTY2pI6IawSop
	wSCk7Y5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6F1-0000000FyEz-1IPh;
	Tue, 21 Oct 2025 06:53:07 +0000
Received: from mail-m19731110.qiye.163.com ([220.197.31.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB6Ef-0000000FxsJ-29oL;
	Tue, 21 Oct 2025 06:52:47 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 269f91a48;
	Tue, 21 Oct 2025 14:52:41 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	sugar.zhang@rock-chips.com,
	zhangqing@rock-chips.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	huangtao@rock-chips.com,
	finley.xiao@rock-chips.com
Subject: [PATCH v4 4/7] dt-bindings: clock: Add support for rockchip pvtpll
Date: Tue, 21 Oct 2025 14:52:29 +0800
Message-Id: <20251021065232.2201500-5-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021065232.2201500-1-zhangqing@rock-chips.com>
References: <20251021065232.2201500-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a058a9aee03a3kunm647d21e85ed77a
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQxoYSlZJTkwfHR5IHh5CSk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=RrSO886Izj7S6i7FK/BUBACmO5T2+pTnTdwiHLSgFObCdi6VT8W+70X1gYk7KaaUtGT5S2Qfd2XyXE2S000v+WuqAzP50QfJSC8WZrdus0rLgdWNzC7/D0x32kGzTvz+/75+5gIL3DaqOXJCblEoXYTz+iA2Prr9K7ixNDfrO2E=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=rhEwTOJpvO51g4Dk6tmaArlCoSEY7pRYawJS6aX1OdQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_235245_746313_BB865868 
X-CRM114-Status: GOOD (  12.20  )
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

Add pvtpll documentation for rockchip.

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
---
 .../bindings/clock/rockchip,pvtpll.yaml       | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,pvtpll.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,pvtpll.yaml b/Documentation/devicetree/bindings/clock/rockchip,pvtpll.yaml
new file mode 100644
index 000000000000..7be3d2848c84
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,pvtpll.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,pvtpll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Rockchip Pvtpll
+
+maintainers:
+  - Elaine Zhang <zhangqing@rock-chips.com>
+  - Heiko Stuebner <heiko@sntech.de>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - rockchip,rv1103b-core-pvtpll
+          - rockchip,rv1103b-enc-pvtpll
+          - rockchip,rv1103b-isp-pvtpll
+          - rockchip,rv1103b-npu-pvtpll
+          - rockchip,rv1126b-core-pvtpll
+          - rockchip,rv1126b-isp-pvtpll
+          - rockchip,rv1126b-enc-pvtpll
+          - rockchip,rv1126b-aisp-pvtpll
+          - rockchip,rv1126b-npu-pvtpll
+          - rockchip,rk3506-core-pvtpll
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    maxItems: 1
+
+  clock-output-names:
+    maxItems: 1
+
+  rockchip,cru:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the main Clock and Reset Unit (CRU) controller.
+      Required for PVTPLLs that need to interact with the main CRU
+      for clock management operations.
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clock-output-names
+
+additionalProperties: false
+
+examples:
+  - |
+    pvtpll@20480000 {
+      compatible = "rockchip,rv1126b-core-pvtpll", "syscon";
+      reg = <0x20480000 0x100>;
+      #clock-cells = <0>;
+      clock-output-names = "clk_core_pvtpll";
+    };
+
+  - |
+    pvtpll@21c60000 {
+      compatible = "rockchip,rv1126b-isp-pvtpll", "syscon";
+      reg = <0x21c60000 0x100>;
+      #clock-cells = <0>;
+      clock-output-names = "clk_isp_pvtpll";
+      rockchip,cru = <&cru>;
+    };
+
+  - |
+    pvtpll@21f00000 {
+      compatible = "rockchip,rv1126b-enc-pvtpll", "syscon";
+      reg = <0x21f00000 0x100>;
+      #clock-cells = <0>;
+      clock-output-names = "clk_vepu_pvtpll";
+    };
+
+  - |
+    pvtpll@21fc0000 {
+      compatible = "rockchip,rv1126b-aisp-pvtpll", "syscon";
+      reg = <0x21fc0000 0x100>;
+      #clock-cells = <0>;
+      clock-output-names = "clk_vcp_pvtpll";
+      rockchip,cru = <&cru>;
+    };
+
+  - |
+    pvtpll@22080000 {
+      compatible = "rockchip,rv1126b-npu-pvtpll", "syscon";
+      reg = <0x22080000 0x100>;
+      #clock-cells = <0>;
+      clock-output-names = "clk_npu_pvtpll";
+      rockchip,cru = <&cru>;
+    };
+
+...
-- 
2.34.1


