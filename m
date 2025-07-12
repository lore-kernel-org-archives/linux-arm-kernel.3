Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542D3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 07:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5dxBcOAcxTKSjfDBsqK/4k0cs1olf+oJR2oRww/n9c=; b=X6RSNO/LsDkJTFpp0Qd1wvPrQy
	KzG807EhJnnOB4q7P0CqFWXK3zGkPv1r/9M+uOyGwD/WjPr9LSql2oYGOG4Qkc9S3Og9zNQlEegiF
	MmcUlJ31AhaWdtx2PcRXDtlLX9UoI4JHyRYfKM0+0NDRPXF9e9hWGMlazN6EpV0fVdXDqu4h4QIqq
	xL4AE8VPiBuSRHoJtIJd8I6PrWfLjsFVkRCLYAMZwBgax9ms0xCR4ugOdJr+lEOWF2GYlg/OoD1Qa
	P/maANUnofkdoMwTqOFkIgeqyNK8Zgk/pYgso798TeQZQDDgS8jI5DuBrVSzezi6YE8a2iP+67Ijq
	qnlzgvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaV4u-0000000GNnm-30CM;
	Sat, 12 Jul 2025 07:55:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaUqm-0000000GMmQ-1GdA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 07:40:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D9664720A;
	Sat, 12 Jul 2025 07:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7F01C4CEF4;
	Sat, 12 Jul 2025 07:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752306047;
	bh=BnVNBCmaGD8QKefYif7ONwqBQvBpS1QUbrNhxe9uuik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vIS1XkB+tIS1q6MQDWPYVYScsNdG2z77DV9w8N8KxXTvLXA9YHLvi60ba+oFPXWcY
	 +r3z0elC2niosw3oU7y4doGzoYq1FsiPCkMYHvhfElysMhNcFmkY5tq53tJ0SBL+3I
	 bCB1pb0Qbrc/2QWK+GpiGpbOHsXwxzcmzWXYq7U3cJFtk1BLuNz5uF/pA8+L41iNNV
	 7fOk8kwSy4csNkTvX/ct0WHC0en/IyEfOmABzqJz9c3f3kWvxEoSQrriSG20+xixTa
	 o2i6/qEayA9qH7JESWDcB4+9VS5eKb1Pc80vd9N3Hby1cMa9sokeXg1+FeI4VZ21gg
	 M//C9KshEDeXA==
Received: by wens.tw (Postfix, from userid 1000)
	id C36FA5FF44; Sat, 12 Jul 2025 15:40:42 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 1/5] dt-bindings: power: Add A523 PPU and PCK600 power controllers
Date: Sat, 12 Jul 2025 15:40:17 +0800
Message-Id: <20250712074021.805953-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250712074021.805953-1-wens@kernel.org>
References: <20250712074021.805953-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_004048_385408_0FCCAA23 
X-CRM114-Status: GOOD (  16.56  )
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

From: Chen-Yu Tsai <wens@csie.org>

The A523 PPU is likely the same kind of hardware seen on previous SoCs.

The A523 PCK600, as the name suggests, is likely a customized version
of ARM's PCK-600 power controller. Comparing the BSP driver against
ARM's PPU datasheet shows that the basic registers line up, but
Allwinner's hardware has some additional delay controls in the reserved
register range. As such it is likely not fully compatible with the
standard ARM version.

Document A523 PPU and PCK600 compatibles.

Also reorder the compatible string entries so they are grouped and
ordered by family first, then by SoC model.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v1:
- Re-order compatible string entries
- Fix name of header file to match compatible string
---
 .../bindings/power/allwinner,sun20i-d1-ppu.yaml   |  4 +++-
 .../power/allwinner,sun55i-a523-pck-600.h         | 15 +++++++++++++++
 .../dt-bindings/power/allwinner,sun55i-a523-ppu.h | 12 ++++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h

diff --git a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
index f578be6a3bc8..a28e75a9cb6a 100644
--- a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
+++ b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
@@ -16,8 +16,10 @@ description:
 properties:
   compatible:
     enum:
-      - allwinner,sun20i-d1-ppu
       - allwinner,sun8i-v853-ppu
+      - allwinner,sun20i-d1-ppu
+      - allwinner,sun55i-a523-pck-600
+      - allwinner,sun55i-a523-ppu
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h b/include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h
new file mode 100644
index 000000000000..6b3d8ea7bb69
--- /dev/null
+++ b/include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_POWER_SUN55I_A523_PCK600_H_
+#define _DT_BINDINGS_POWER_SUN55I_A523_PCK600_H_
+
+#define PD_VE			0
+#define PD_GPU			1
+#define PD_VI			2
+#define PD_VO0			3
+#define PD_VO1			4
+#define PD_DE			5
+#define PD_NAND			6
+#define PD_PCIE			7
+
+#endif /* _DT_BINDINGS_POWER_SUN55I_A523_PCK600_H_ */
diff --git a/include/dt-bindings/power/allwinner,sun55i-a523-ppu.h b/include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
new file mode 100644
index 000000000000..bc9aba73c19a
--- /dev/null
+++ b/include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_POWER_SUN55I_A523_PPU_H_
+#define _DT_BINDINGS_POWER_SUN55I_A523_PPU_H_
+
+#define PD_DSP			0
+#define PD_NPU			1
+#define PD_AUDIO		2
+#define PD_SRAM			3
+#define PD_RISCV		4
+
+#endif /* _DT_BINDINGS_POWER_SUN55I_A523_PPU_H_ */
-- 
2.39.5


