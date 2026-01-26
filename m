Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EC6D19503
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ikefJ0Lg9zqFN/4soUWHxqlZ0gXA1SebeRz+/vpe7Yc=; b=xbF/Hxje+HniKauXVtu9IbDcB5
	lwf5PMnunD2vT/7r6r2l/x2M51wS3I8BXIqJBk5yRQyUZq+I/Kj2JJFD/bKpGfvLVatKCmJjO4z+q
	WKyEOPzACqEWGxqo93SP6w/EN+ZFyxzcPpoS6VlFxO8IuU0fj/5qA0iBzBFdstW0BGpW98DmNTpW6
	FSJlJXM3J54KMx7l598Sjo5MPDUY15VAZs+rDN3zNxndm8fIiWEtEMuPOR7dqNyyViymyK1EwE5xf
	/2ZeQ4BckKrC95tvrOA+h6DkAKn45C5XQbTucThZkbOgYWLhp3hJlBNbNJiouwxUEteBjKedvWG0T
	KUDL592Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPkr-0000000CtKp-3Zsg;
	Mon, 26 Jan 2026 16:47:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPkp-0000000CtKX-3ikC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:47:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 026C660121;
	Mon, 26 Jan 2026 16:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86717C116C6;
	Mon, 26 Jan 2026 16:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769446074;
	bh=OTgN+AOgoWAXyZjcPvOX/MFtQjNRVU5usZ1XNPxTrto=;
	h=From:To:Cc:Subject:Date:From;
	b=gErd8LZpO5mnHe4QTq3JaXLDMcIO0Qvh7d0yzXw2Vlt5xjkum5A8fqyAj8CeZ0p0S
	 S9pVAXmkr28yvW9DSiBNMFXULNCcW34EwKisF1i2F6rHUnyHDPjbz/J1GkVasmW8HQ
	 GxNn19iw7dXyWE/LkOiq+Y7uEdRyQCkPWiJJ5/yPduqz2196ely+CFRorga3Lw5LHh
	 e8e4iq/Dju5KBxWCFWEO7zuh9EdIM2vMGLnmzxowevpkhBy8PaOpyFUmaLZBukrJ2S
	 aq+MqhzXYi4F0rYtsLbuD850v8aoM9wNxsyjVf5V7uyscdH1+ePuzL0xcX+yVxYgy4
	 Fj2KTAmcpnB9w==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christopher Ruehl <chris.ruehl@gtsys.com.hk>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Vincent Huang <vincent.huang@tw.synaptics.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH] dt-bindings: Fix emails with spaces or missing brackets
Date: Mon, 26 Jan 2026 10:47:22 -0600
Message-ID: <20260126164724.2832009-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Fix email addresses with spaces or missing brackets. A pending
dtschema meta-schema change will check for these.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml    | 2 +-
 Documentation/devicetree/bindings/input/syna,rmi4.yaml          | 2 +-
 .../devicetree/bindings/media/samsung,exynos5250-gsc.yaml       | 2 +-
 Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml     | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
index 3d14d5fc96c5..7b38f2182ffa 100644
--- a/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
+++ b/Documentation/devicetree/bindings/hwmon/sensirion,shtc1.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Sensirion SHTC1 Humidity and Temperature Sensor IC
 
 maintainers:
-  - Christopher Ruehl chris.ruehl@gtsys.com.hk
+  - Christopher Ruehl <chris.ruehl@gtsys.com.hk>
 
 description: |
   The SHTC1, SHTW1 and SHTC3 are digital humidity and temperature sensors
diff --git a/Documentation/devicetree/bindings/input/syna,rmi4.yaml b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
index f369385ffaf0..8685ef4481f4 100644
--- a/Documentation/devicetree/bindings/input/syna,rmi4.yaml
+++ b/Documentation/devicetree/bindings/input/syna,rmi4.yaml
@@ -8,7 +8,7 @@ title: Synaptics RMI4 compliant devices
 
 maintainers:
   - Jason A. Donenfeld <Jason@zx2c4.com>
-  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com
+  - Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
   - Vincent Huang <vincent.huang@tw.synaptics.com>
 
 description: |
diff --git a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
index 878397830a4d..9196cf5dac0f 100644
--- a/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
+++ b/Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
@@ -9,7 +9,7 @@ title: Samsung Exynos SoC G-Scaler
 maintainers:
   - Inki Dae <inki.dae@samsung.com>
   - Krzysztof Kozlowski <krzk@kernel.org>
-  - Seung-Woo Kim <sw0312.kim@samsung.com
+  - Seung-Woo Kim <sw0312.kim@samsung.com>
 
 description:
   G-Scaler is used for scaling and color space conversion on Samsung Exynos
diff --git a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
index d286b77921e0..8f5d33050348 100644
--- a/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mbvl,gpex40-pcie.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mobiveil AXI PCIe Host Bridge
 
 maintainers:
-  - Frank Li <Frank Li@nxp.com>
+  - Frank Li <Frank.Li@nxp.com>
 
 description:
   Mobiveil's GPEX 4.0 is a PCIe Gen4 host bridge IP. This configurable IP
-- 
2.51.0


