Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3416C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P+nTKmLHe1aQkg17I1EUR60j5fvGwXbcKmMufjMpp58=; b=uxKMAYFXYZujdRUEjBqUKWrvGp
	/I5uC+o1UzZ71/rEc7rDiCZDyrBQQPrtv/3rGEbdIcMLBsAPZjwINGlnUrrVjeIPn48cacCM7uWJZ
	BB0p+2SHmnKLqd9v4uBeKYZ8GqTx+s/UN/EfMV/MjhTtvAXTuofVNuasYW8W/t7qtpMdI+BvgDkon
	KKsKFKm4jdMys1U34CoUfnIL3GciI3yI2sfEmN+FED9DNRXeXn/FhwNWsUN16WvMUA3luwkIR0OXT
	o8H3fw3QDasof73iDjAGQeafdthL/FxE37ZiUaEi4vqpjUiH/fw0/WJ3VEdFVyYbjfegmrB/7vfNN
	t3ljfs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24PX-0000000H2x4-3V9Z;
	Thu, 03 Sep 2026 10:11:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24PV-0000000H2ve-2Am2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:11:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF6C140690;
	Thu,  3 Sep 2026 10:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2841F000E9;
	Thu,  3 Sep 2026 10:11:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3] arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
Date: Thu,  3 Sep 2026 12:11:04 +0200
Message-ID: <6108b9d8ba5e750fc3f104c7c47c765cda12ab0b.1788430197.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

Unlike older GIC variants, the GICv3 DT bindings do not support
specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - All other patches in the series have been applied,

v2:
  - Rebase on top of commit d0298724f901d45c ("arm64: dts: exynos: Add
    EL2 virtual timer interrupt") in soc/for-next.
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index bfceea5486f46686..9e17f36e1fbb7ce2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1928,11 +1928,11 @@ apm_sram: sram@2039000 {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts =
-		   <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
-		   <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
+		   <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
+		   <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
 	};
 };
 
-- 
2.43.0


