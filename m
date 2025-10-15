Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4570CCD196
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 09:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3feRxQwXj8UVW8icsO/FwpsLSsQskq8tcnSYVzYE0IQ=; b=I1oSAtfFMX10ZasgrzvtzKULjj
	kikMZaGntQ47hGDG4s+vAvsOsFHghHlMQDMTIam+lfxy73kV41cohV/nnlDzqdvMZWB17/0XiRzta
	bDRMAPRyMGThmq6AYzYZNCrXJz7zbcF8gwzy7OWlbmStxtOVl2PpVPdJOM4FXbH14uzReDvUh54Q1
	3r3SWaARgwH2iEuOX+YVYDfo9U684Oee4NFeyh4PipGjKL0D/HRnUzRifkqTs0aaD2F0yGkTtXLy1
	FS3avHmOGYRkhpGSGfrucdnfBmx+4+XUi+Fffsdx0K7CFLKHUG1Gx8Z3EC/LheCJCStin3glEmgAt
	v6jYG9HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZr-000000014gr-0DVQ;
	Wed, 15 Oct 2025 09:13:47 +0000
Received: from mail-m49215.qiye.163.com ([45.254.49.215])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xZh-000000014Og-2MSA;
	Wed, 15 Oct 2025 09:13:41 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 25fe0168c;
	Wed, 15 Oct 2025 17:13:33 +0800 (GMT+08:00)
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
	huangtao@rock-chips.com
Subject: [PATCH v1 4/5] dt-bindings: clock: Add support for rockchip pvtpll
Date: Wed, 15 Oct 2025 17:13:24 +0800
Message-Id: <20251015091325.71333-5-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015091325.71333-1-zhangqing@rock-chips.com>
References: <20251015091325.71333-1-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a99e7256dc603a3kunmdd11480e6b2129
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhlLQ1YdGUJJGR9DTkkfQ01WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Lq87zOiLnWEvXgh3ArsdWKfVi5wrgBhY2sxhj1vOEII0tTVDAbhbw1MJsVdXDx0xl0Pg9L88cJRCOiIZwfB1Ob9gpU0G3FHeMVS2c7fETGKYePpb7IW6YOSou5GlRVPO8QwT99ltpHCf/7dz9GztxuSpa44l+cbq5Z3MGlzfDR8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=3feRxQwXj8UVW8icsO/FwpsLSsQskq8tcnSYVzYE0IQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_021337_852555_5CC2CFD0 
X-CRM114-Status: GOOD (  11.74  )
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
 .../bindings/clock/rockchip,clk-pvtpll.yaml   | 100 ++++++++++++++++++
 1 file changed, 100 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml

diff --git a/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml b/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml
new file mode 100644
index 000000000000..91cb1f475048
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/rockchip,clk-pvtpll.yaml
@@ -0,0 +1,100 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/rockchip,clk-pvtpll.yaml#
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
+    enum:
+      - rockchip,rv1103b-core-pvtpll
+      - rockchip,rv1103b-enc-pvtpll
+      - rockchip,rv1103b-isp-pvtpll
+      - rockchip,rv1103b-npu-pvtpll
+      - rockchip,rv1126b-core-pvtpll
+      - rockchip,rv1126b-isp-pvtpll
+      - rockchip,rv1126b-enc-pvtpll
+      - rockchip,rv1126b-aisp-pvtpll
+      - rockchip,rv1126b-npu-pvtpll
+      - rockchip,rk3506-core-pvtpll
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
+  - "#clock-cells"
+  - compatible
+  - reg
+  - clock-output-names
+
+additionalProperties: false
+
+examples:
+  - |
+    pvtpll_core: pvtpll-core@20480000 {
+      compatible = "rockchip,rv1126b-core-pvtpll", "syscon";
+      reg = <0x20480000 0x100>;
+      clocks = <&cru ARMCLK>;
+      #clock-cells = <0>;
+      clock-output-names = "clk_core_pvtpll";
+    };
+
+  - |
+    pvtpll_isp: pvtpll-isp@21c60000 {
+      compatible = "rockchip,rv1126b-isp-pvtpll";
+      reg = <0x21c60000 0x100>;
+      rockchip,cru = <&cru>;
+      #clock-cells = <0>;
+      clock-output-names = "clk_isp_pvtpll";
+    };
+
+  - |
+    pvtpll_enc: pvtpll-enc@21f00000 {
+      compatible = "rockchip,rv1126b-enc-pvtpll";
+      reg = <0x21f00000 0x100>;
+      #clock-cells = <0>;
+      clock-output-names = "clk_vepu_pvtpll";
+    };
+
+  - |
+    pvtpll_aisp: pvtpll-aisp@21fc0000 {
+      compatible = "rockchip,rv1126b-aisp-pvtpll";
+      reg = <0x21fc0000 0x100>;
+      rockchip,cru = <&cru>;
+      #clock-cells = <0>;
+      clock-output-names = "clk_vcp_pvtpll";
+    };
+
+  - |
+    pvtpll_npu: pvtpll-npu@22080000 {
+      compatible = "rockchip,rv1126b-npu-pvtpll", "syscon";
+      reg = <0x22080000 0x100>;
+      rockchip,cru = <&cru>;
+      clocks = <&cru ACLK_RKNN>;
+      #clock-cells = <0>;
+      clock-output-names = "clk_npu_pvtpll";
+    };
+
+...
-- 
2.34.1


