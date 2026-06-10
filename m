Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96A2CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hX/jIWszcWOIogXe4xuTg3RtGTHkPgwP5y+/7FrfUZk=; b=hkGWY/VUsGvh1gtvUprgZ57SO0
	60jHthnfNn1NW+j3JcKYF7jQZcP03TFosFrIQngIRWGDLvEz0RDz9s85a6M2S0Z4fh2EIaBZO76fb
	Ngqe0SkYNDcoyq3Fx6g7TSRuWDsVMYH/KBw1rajQ5aDVp9GSiSkc4MbW5uiuxRCjQ9IMvMLv6hyKt
	Y5SKCGQCNjtdVeVWFirLj5i5J+TyfW70KU3gTDaWkv0MYfe95VcWv+EECxb6DAmHCF8z+lZpecmtK
	mWffpoE1/4Hehew9a2Zuv55wM6QvaIpDHzEAj0QfJk/BcCAqxOJ3ml1Pig4eVoeNO6ZqSmJcE1PjU
	5tEfsMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKZA-00000007zHY-3Tb1;
	Wed, 10 Jun 2026 15:10:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXKZ9-00000007zGj-0R8Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 15:10:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9A2C441B4;
	Wed, 10 Jun 2026 15:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D330B1F00898;
	Wed, 10 Jun 2026 15:09:59 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/2] arm64: dts: exynos: gs101: Drop CPU masks from GICv3 PPI interrupts
Date: Wed, 10 Jun 2026 17:09:53 +0200
Message-ID: <9967bb6d5a9f371a7e02a16e5bc8057bcdb657a9.1781103355.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781103355.git.geert+renesas@glider.be>
References: <cover.1781103355.git.geert+renesas@glider.be>
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
v2:
  - Rebase on top of commit d0298724f901d45c ("arm64: dts: exynos: Add
    EL2 virtual timer interrupt") in soc/for-next.
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 86933f22647b701a..d4250f51b13092a2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1853,11 +1853,11 @@ apm_sram: sram@2039000 {
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


