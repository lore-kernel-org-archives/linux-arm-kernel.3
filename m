Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63EEBC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 04:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ckMpOvtuPLSY4ZM/iLJczk0xqiCFXIKu36b0tFD+YM=; b=zdWPbO/agD459xtfN+ZwqmPTly
	O1t5CV3BcAan8cEIGiWE9IK3CCLdU2Hu8H8SyOZ7Ne0lFnbzmoy34s3no/j5hCCDNovjChV56iuRr
	sD+eXj7zS/99Tf1bPsvX4esVwfMnlKqScmccJsn6VvOgqc973X5e5J5sf/kQWTDxdgehGxk/zmtXQ
	Osu6BCT/AxV8+t6h+0d6+x8X85BnFnmXR16IB+BNNGCUOrgY6bppNE/MB4mro3daXQvD3taC2m9Hb
	J7g45RG2rDYEH7EWWCYk/HjhOl7+1eyVNJtiDWvvXvsEa4ay6wGl/NdeOO3lpWFjO7HEqUTdf8nI8
	BdkWWtsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tKa-00000008Raq-3ylL;
	Mon, 31 Aug 2026 04:09:12 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tKX-00000008RYq-3NqV;
	Mon, 31 Aug 2026 04:09:11 +0000
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 7DF411D000E2;
	Mon, 31 Aug 2026 00:09:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 31 Aug 2026 00:09:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788149348; x=
	1788235748; bh=3ckMpOvtuPLSY4ZM/iLJczk0xqiCFXIKu36b0tFD+YM=; b=q
	2CnulabnnbQe3gJ54dYsOTn4igxjFG+xw8SxZ/reyw+/2Vo7gXWy6HK+E9A2bG+q
	4zukF3MTux/IYVZDDZe/NF81H1jWTp+UHcNhbg/TFOScjo/KRkTv26GAJoFsbzfj
	gWlPLlIvZAsjujbBbUKO4bMm+x5N0pq59+8EK2UqDueibzqw/33xb63RrIxEBh58
	TKDc+RY0zGLWfVwrsq9iclz/2LgmiucIAlOYEdJQi/vHZPRuILqk1k6JcvR/vAm+
	byXDc0yvci/mKkRR4bYw9b0I+aIIU6ULQlV1LRTYid0rnkjkizgfTHcQJG90CNtM
	RkYCeDnHulTFV5DhNWQng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1788149348; x=1788235748; bh=3
	ckMpOvtuPLSY4ZM/iLJczk0xqiCFXIKu36b0tFD+YM=; b=OFxYDheUU4KlvZtCd
	69dT5G/NNk/vVFX7iyCLHFjv/NnYsBbRwdayJuf0QoO86xj+N/of8C+Ea7MFJIGT
	lSQ0Epeq+EJG212579pKiAiu7QNGfpyz4Fpuvj6OxjzX2D6joHg05hY+hW6xXFn4
	XzWmIvRP3wMleiApHfhl7TnENz1KIHyKQUXP8votyqKQbHJ2MPpp4i5zJ64CiIYd
	dPhwMHYymF0SJkPQmb/HFiXdkv2a/x+am2wLNTIiyUH8NlcBokWrL7OTR26NqiIe
	gFeou5x2v0YeMyBxvqBL1gqBuADHmoTQ6KzILzRotasMhiLcIJqrcelkWKvfKy0I
	jVKpw==
X-ME-Sender: <xms:Y_6UatG-VxzHWMy-H6nk890I9gZDtgaEzlaidA23uJcRnVXD3VZ6-Q>
    <xme:Y_6Uaro21v4s-KWRnehh5qmLhVEL2EjnOtJZJTLL6RD54H4eIwFremm1AC0-heBLi
    VFk92VAGUKHaDUtwUT9092r4cUsy-0EQouubii-yEkfmIvWRniOEu0I>
X-ME-Received: <xmr:Y_6UanLSqf9Gk8ZicKdsD9LrbGgODejxe44vU5nsarmlMXSwiopcBlnMOy3Ao9iajSTWoUPgMw>
X-ME-Proxy-Cause: dmFkZTF3kzz5mUsX0ffOLPp+AMVSX5b/dLXdhwKSfVjql5XJ4SzcHn3lQyJ35gjaWoe5pV
    pTWOrG2yzauQptRvb2hoqfG8A9brAT8IdgPnmhT32G+FOhqdEADLLBb5NvTr+No2A/yKNi
    BPIM4W7mcetr/khdnqla/ZTdtEzFdeaUaRGXcvZiP1yCn4LQVRnw56A0x3cU1zgkXqc2Ly
    gLnnmTWu2pHxADQhiLpEHQhSiH4bzRHaKCqjd8pD/boDSmKojGILV86KJBKtprNvpTLJn+
    wl5WH4EyF9786foOUv0D41hbRhRb7MUNHj0fjfAphNVG7tK6+tjp9vflZNDPL+o3tG+BOV
    hH1S470fl3OexNjelIEh4Ny/FNXSXLGR3bauQcVbd/Yf/7lPfQY152kjKSMC33ui6976wP
    Ao05lFl9ksJvCV4+UYdpDxe0CLurDIkhPsLnKHByBqoh3+EkTmZWUsPg8qwmyz2SMhhXaB
    3qFmkmohGwjFrYAoXq/msvfa5XjMbwh2K+Ofc7vqDav091DorpoaCpat0KisWp5Vsj69Ua
    Dpv/H8HcC5sW5FGNJcKevL9aFdNssbTvnbwmsW+vALPM2Fbmp75LXriLrNQdLUD29En8hI
    SJiGJmxNk+ub/wAILr9blj/4Xk627SeDrXZH0w7xIbtjujqNFwCz8AevnoNw
X-ME-Proxy: <xmx:Y_6UasxliI9KHHgihX9ngKyg19fjedSog7axNPRtCaJ56TjTaE_oZw>
    <xmx:Y_6UauZJigxhxnmgsxfk49plBOlkiikpGe9lLVX0b05m6_m9s_2fzA>
    <xmx:Y_6Uao5yReFWg97lqaMh_mr6xays4xUrjIOtacGlIHgULLIfyI9fyA>
    <xmx:Y_6UavBwCZgm0TMkl2kIgBzz0QMh_4_3vItBy7U-7Q5Y-3CFwVUpeg>
    <xmx:ZP6UavYlHeErTUPPurAzriLOXNMpLAZAco7-jRgQn2aVfZmHqmgLdBLM>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Aug 2026 00:09:01 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	ulfh@kernel.org,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 05/13] dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
Date: Mon, 31 Aug 2026 16:07:56 +1200
Message-ID: <20260831040804.24111-6-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831040804.24111-1-gahing@gahingwoo.com>
References: <20260831040804.24111-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_210909_896781_5D6637FA 
X-CRM114-Status: GOOD (  10.33  )
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

The RK3576 NPU has two cores of the same RKNN block the RK3588 binding
already describes, but it wires them up differently: two extra CBUF
clocks, two power domains per core, and a single reset instead of two.
It also has no NPU SRAM supply.

Widen the property ranges to cover both, then pin each SoC back to its
own shape in allOf so nothing loosens for RK3588, and keep sram-supply
required for rockchip,rk3588-rknn-core only.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Notes:
    Based on next-20260814 plus Igor Paunovic's "[PATCH v2] accel/rocket:
    request the core clocks by name":
    
      https://lore.kernel.org/linux-rockchip/20260729130743.128876-1-royalnet026@gmail.com/
    
    That patch is the only prerequisite. The cover letter carries both in
    machine readable form: base-commit names next-20260814 and
    prerequisite-patch-id names that patch.
    
    It touches the driver rather than this binding, so this file applies to a
    plain tree as well; the note is here because the series as a whole does
    not.

 .../npu/rockchip,rk3588-rknn-core.yaml        | 47 +++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a490..3b611b64c 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -21,6 +21,7 @@ properties:
 
   compatible:
     enum:
+      - rockchip,rk3576-rknn-core
       - rockchip,rk3588-rknn-core
 
   reg:
@@ -33,14 +34,18 @@ properties:
       - const: core # Main NPU core processing unit registers
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: aclk
       - const: hclk
       - const: npu
       - const: pclk
+      - const: aclk_cbuf
+      - const: hclk_cbuf
 
   interrupts:
     maxItems: 1
@@ -51,12 +56,15 @@ properties:
   npu-supply: true
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   resets:
+    minItems: 1
     maxItems: 2
 
   reset-names:
+    minItems: 1
     items:
       - const: srst_a
       - const: srst_h
@@ -75,7 +83,40 @@ required:
   - resets
   - reset-names
   - npu-supply
-  - sram-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-rknn-core
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+        power-domains:
+          maxItems: 1
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+      required:
+        - sram-supply
+    else:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          minItems: 6
+        power-domains:
+          minItems: 2
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+        sram-supply: false
 
 additionalProperties: false
 
-- 
2.43.0


