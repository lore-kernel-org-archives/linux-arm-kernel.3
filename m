Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D4BC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjsWnfDY8FEyU5Uqim3p8EzbkBtYudkvmMbhQF4WWrQ=; b=qbNZd+aqcokIzKLvJ+Zkj5dl+P
	8Y5cvCfKN3w2TC1W16nsoku1Ts310MV+2rC2+zFfL5GnkUQC5mhBBnuAY2SoMCkd38lc/UHOBVVQJ
	A83w7JN0BSuLdnKwN9zgk8DA7g8YX2Tpnqwz6p4VNvo5n7QEeVzTjyJrHxLOeTPK5qN7kef1LZnqG
	umH9XMPBETWQ2f4UOkDLUSm7N7pUlJgrKtPVxTmoSuItFEKjCJOnM66MXydvbuCBLpBlH9QgNyu5p
	NEMebrZOBS6VT/xAkV4SNvs6IUbSCrBUOqyhhLNOshzQ04oIbRzDjtaTAPoGisLxFfme6K1dgKY2V
	ICRAWNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBhB-0000000FDww-1FZS;
	Fri, 27 Jun 2025 16:12:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVB18-0000000F6da-2jsg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:29:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAA3743F0E;
	Fri, 27 Jun 2025 15:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86233C4CEE3;
	Fri, 27 Jun 2025 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751038169;
	bh=P2snesJzCcoewtMetOLPemSPMxBI1rMj38HQO6OHc0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H6iaMyjIJSuJKtCHJZ6x37YyMHYme+Bod9u1ZsU/7PCjyXrz//E4WTaIOqMbkhjd/
	 94+M0wIwSFWutdT5V/qplc4oFcCxbz+fKtX/IEtelLZHoWuIZE251HW5Up/60hIoaC
	 AU32kdGZZilFI92vGZyghti24aRHHEFBE65lQoDD+pbqbazVRg74Y9aYF0IqS8oIbN
	 yaHZY0go/TQ3yBy3zW38sTyiwcuo+OKWqYD5xS/dWBdm7bAG65bf4E/n4U/j3Xwlfi
	 Fk/SrzofSaJ0YGEkBqoin29zJWVs94bodR2PeW6ZrQBinmwH1LQPadLLACOGloEEUF
	 PKAdsBX1HNs1A==
Received: by wens.tw (Postfix, from userid 1000)
	id 2BE3A5FAC5; Fri, 27 Jun 2025 23:29:27 +0800 (CST)
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
Subject: [PATCH 1/4] dt-bindings: power: Add A523 PPU and PCK600 power controllers
Date: Fri, 27 Jun 2025 23:29:15 +0800
Message-Id: <20250627152918.2606728-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250627152918.2606728-1-wens@kernel.org>
References: <20250627152918.2606728-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_082930_736966_27E1378B 
X-CRM114-Status: GOOD (  15.88  )
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

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../bindings/power/allwinner,sun20i-d1-ppu.yaml   |  2 ++
 .../power/allwinner,sun55i-a523-pck600.h          | 15 +++++++++++++++
 .../dt-bindings/power/allwinner,sun55i-a523-ppu.h | 12 ++++++++++++
 3 files changed, 29 insertions(+)
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck600.h
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h

diff --git a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
index f578be6a3bc8..b9f550994512 100644
--- a/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
+++ b/Documentation/devicetree/bindings/power/allwinner,sun20i-d1-ppu.yaml
@@ -18,6 +18,8 @@ properties:
     enum:
       - allwinner,sun20i-d1-ppu
       - allwinner,sun8i-v853-ppu
+      - allwinner,sun55i-a523-ppu
+      - allwinner,sun55i-a523-pck-600
 
   reg:
     maxItems: 1
diff --git a/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h b/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h
new file mode 100644
index 000000000000..6b3d8ea7bb69
--- /dev/null
+++ b/include/dt-bindings/power/allwinner,sun55i-a523-pck600.h
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


