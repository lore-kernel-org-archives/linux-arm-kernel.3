Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B33CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 07:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fb8KGAEKVYZnPu6e+o9GR6NcQ9hYiKO7SzU59n9Pv4A=; b=tRd031F6ntbZzBRTvE081pbTM/
	0TW55mCXIjZFbTXZ203u7UVRMmFNS/wjueSqrjtLkxIQ3K6STGfN6BOYxe7qKt4tW+t9PLDSx5Bjh
	BN461J+j1hVyv6cSz8aDO5Yv0wwcYyJkAt/vLDFOHoYviYobrwWvCYRTf01Nc6J/7cYubRt1P52u5
	SfNqzKg4rmB3qstf4TqNZvsOqhByckzXF6Fq+nnUDraE/gmQfwQhLex30F9Pbw9HI5ps3HP7AimHk
	6fcporuX2uX4/bxBTGgNzNv7gwRZztfEUVtKKrrsz3d0T1Q2/E1cIhc6B3gDT2mpL3Vu1/3H+2T8F
	FhoPl4bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsgR-000000005Of-353T;
	Fri, 28 Nov 2025 07:14:23 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOsgO-000000005N9-2Z58;
	Fri, 28 Nov 2025 07:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1764314017;
	bh=fb8KGAEKVYZnPu6e+o9GR6NcQ9hYiKO7SzU59n9Pv4A=;
	h=From:To:Subject:Date:Message-Id;
	b=psLeKOCBRG2Q7VVcKH6Nt9ocyG0TVPyxoAdd3oI5bvbuR/qDonVLn5MX8lBWsn6+6
	 U6t+5u0rsifNe6gxIq4b1MToXXX+nuwL2Z9BxH8JhPeZfB5COA+STLBGR4TYouB08F
	 0FpS0iw/WweAdKPb8cta+eATMEOSAAzJp9i58WpA=
X-QQ-mid: zesmtpsz7t1764314009t30004287
X-QQ-Originating-IP: cthJK7YnRP6ioMEHxol02BgS/hX9CBmdVTpAFbkHym0=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 28 Nov 2025 15:13:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2606932567877476135
From: Chaoyi Chen <kernel@airkyi.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH v2 1/2] dt-bindings: iommu: rockchip: Add support for multiple interface clocks
Date: Fri, 28 Nov 2025 15:13:21 +0800
Message-Id: <20251128071322.92-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251128071322.92-1-kernel@airkyi.com>
References: <20251128071322.92-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MoXwTY6T4qpUZUqmSovu0AcaMc3ZJLxzPli3CY8NwPj5Kek3JAUx/Ba0
	ktG1lWrNEEwWeE3WjF+U8N/mCyQCW+hvN0SyxbTnTnD291WG2vLOqIpne2K48vcYYgMnZtC
	yiloC3ooe5aT1/vXQ/wMkAJSefVC2qrcj7jl3s5d64pCa0SSYG+mD/bp/GoygxjMIQQmyzB
	iAjttU4nlSZJDOX/fD8r2GlBPLHp0D4G4XayAUNgmrvJurP/oUIDQHisY7xH5N3XnsY3Zf7
	DCb2MV4By4UyYQkvGbzzhXwqHPB75hJMv36flMMS4LPtlgORI1GbDyS2gpDDfpAVZre6XQc
	S14JMbYSNm8Ac2pWwI13oZNP6TrXurA7TWhYZ886VmWTc/cLTPi6bs7qZ+xMEK2u/52tXl+
	YGMGClL/ihQGELspEDMYvQBA4WrDSJknv8N/IP5UJy2ncetLHbWrFUahU04sy6p7/9npEkT
	StK7uyVGJRoDGiubeOcxvGientVpdVJYL6gHBxieEOtm5rjfQ02l3arJ3im+blq95GPA6W7
	LA3Ai7HTpby8zOklQWHoikD7p/HOd+x9K5kbYOhPEJmdjl9jwTnUXMAUiajY3QGM73zau/u
	iYsa6hFwriXcPqU8yKs5sy5O+AtyEe9J9vXre/LEKEvN/PbvjD9r7delTB6SZrkYAaAsz2c
	MqXq9IhBcsxiFfJjZYaXzwx4ZOcm3f+W5bS4ECfINuXG64e2KjBawDLkcy6Zb2+96k6inV3
	JgXYURYJZKwzklROorO3Q4IYTFD8SBlLw9K3eYNjGh8L4yuV95qEpNlYothPt60JUgdEVSA
	8nzvAAp2T/kNTquM4w54YjVtzV6z4EFJZzOQCBJfSg1L6VYcInV5IHz6TInAx7g7/K/HaGs
	Jb8EjoQU/aOo6caFi9RnkqEabSwzkRBSM2IYeGxFvttl5x3IPknGkIo9stRlkBOYNAmzq99
	bGG4eB4uaeR2vQPbaBT3yEQT12UDYFwtIX6b8gvddeXil0M4jqVmNn3rgcJ/Uv/Bld6E=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_231421_102178_D12A2AFE 
X-CRM114-Status: UNSURE (   9.67  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The iommu found on RK3576 NPU and RK3576 RKVDEC have 4 clock instead of
2 clock. Their clock names might differ, but I don't think that matters
much.

Add support for them.

Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

Changes in v2:
- Rewrite dt binding.

 .../bindings/iommu/rockchip,iommu.yaml        | 52 ++++++++++++++++---
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
index 6ce41d11ff5e..dfa5e25476d9 100644
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -27,6 +27,8 @@ properties:
           - enum:
               - rockchip,rk3576-iommu
               - rockchip,rk3588-iommu
+              - rockchip,rk3576-npu-iommu
+              - rockchip,rk3576-rkvdec-iommu
           - const: rockchip,rk3568-iommu
 
   reg:
@@ -42,14 +44,12 @@ properties:
     minItems: 1
 
   clocks:
-    items:
-      - description: Core clock
-      - description: Interface clock
+    minItems: 2
+    maxItems: 4
 
   clock-names:
-    items:
-      - const: aclk
-      - const: iface
+    minItems: 2
+    maxItems: 4
 
   "#iommu-cells":
     const: 0
@@ -64,6 +64,46 @@ properties:
       Some mmu instances may produce unexpected results
       when the reset operation is used.
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-npu-iommu
+              - rockchip,rk3576-rkvdec-iommu
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+  - if:
+      properties:
+        compatible:
+          items:
+            - const: rockchip,iommu
+            - const: rockchip,rk3568-iommu
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3576-iommu
+              - rockchip,rk3588-iommu
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
 required:
   - compatible
   - reg
-- 
2.51.1


