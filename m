Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48CECCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of4ciGBE1QtDtuaFiy2j/98VhhbFACn3EI5ZjgDv2qQ=; b=x4/bJb+Uq8BNObhSxg+0WY9ET8
	5T152ypeNOnDWuUwsAkTxGjH6D7Wk6RbKRtcTnbyySOsiMyNUEG+Ty0ULIo0mVpx4WhuMsLeRFGSu
	MXdsnJGKtrhF7y29M3nzWdj9u2U4AOOInJ3qPSHAkqO3w3jpv/gXOAbyvKgXzIG0Ys/LIph23cUJT
	kd3R/AazvblMIBYeANAVMqPZEStEq9v1zvx4UpqRlg6oGV4gQ3QbnfO0JlxNhXtwDfBjyo+QaQPg1
	exwURr3RNCfIkagUFKn5d6HXi0adXm0gDzougYWcwBkigMhKdleEmGjG125kl4xXJyxJ/taIgddca
	RmrCauNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh5V-0000000BUt0-0AZB;
	Sat, 25 Oct 2025 16:25:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh5T-0000000BUre-3itK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:25:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C89E60587;
	Sat, 25 Oct 2025 16:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900E6C4CEFB;
	Sat, 25 Oct 2025 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409551;
	bh=Em1vmYzb3CPqjJdulvBWr7VV9J5NImJHW4FlbVzFjhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C83fisvN6GC1POYJioqMtF7W6fBWly6hd2mrsBvtQI1QhukBKifLvwCCD66ABpG35
	 ODhG5ogR7mIa+t6nAmJP/wHTZeQmQ3b5uOi8pS8Gi/hCBl9l4uDilJuvM32pvMJ5+M
	 ES7YYSzCgpzI6lOojchjgQzPLG6kfUti3fV6Osu34EQHMDCY2gnbtsp7vIQpvBEu5w
	 mf800yzNQItEXNTZFpNnD6OgfzjNVRbAnGnkqnQ15e80JgvzOhcuId2r7tgcsVzuzV
	 2Un3LOGgfwlJ8elBcMhoNuSD8auWj8CoDdkPGFBZS7NUlTaTxQcoA/OPGdbtvt21Ji
	 iS9DAI0bf5Itg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>,
	Sven Peter <sven@kernel.org>,
	Neal Gompa <neal@gompa.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	joro@8bytes.org,
	will@kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev
Subject: [PATCH AUTOSEL 6.17-6.6] iommu/apple-dart: Clear stream error indicator bits for T8110 DARTs
Date: Sat, 25 Oct 2025 11:59:52 -0400
Message-ID: <20251025160905.3857885-361-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
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

From: Hector Martin <marcan@marcan.st>

[ Upstream commit ecf6508923f87e4597228f70cc838af3d37f6662 ]

These registers exist and at least on the t602x variant the IRQ only
clears when theses are cleared.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
Reviewed-by: Sven Peter <sven@kernel.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Link: https://lore.kernel.org/r/20250826-dart-t8110-stream-error-v1-1-e33395112014@jannau.net
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- Fixes a real bug: On T8110-class DARTs, the interrupt only deasserts
  when per‑stream error indicator bits are cleared. Without clearing
  them, the IRQ can remain asserted, causing repeated interrupts and
  potential system instability.
- Minimal, contained change: Adds one register define and a short clear
  loop in the T8110 IRQ handler only.
  - Adds `DART_T8110_ERROR_STREAMS` at `0x1c0` (drivers/iommu/apple-
    dart.c:125).
  - In `apple_dart_t8110_irq`, after acknowledging the error status
    (`writel(error, ...)`), clears all stream error indicator words:
    `for (int i = 0; i < BITS_TO_U32(dart->num_streams); i++)
    writel(U32_MAX, dart->regs + DART_T8110_ERROR_STREAMS + 4 * i);`
    (drivers/iommu/apple-dart.c:1093, drivers/iommu/apple-dart.c:1094,
    drivers/iommu/apple-dart.c:1095).
- Scoped to T8110 only: The handler is registered only for the T8110
  hardware variant (drivers/iommu/apple-dart.c:1298), so it does not
  affect other Apple DART generations.
- Safe by design:
  - `num_streams` is read from hardware (`DART_T8110_PARAMS4_NUM_SIDS`)
    and bounded by `DART_MAX_STREAMS` (drivers/iommu/apple-dart.c:1152,
    drivers/iommu/apple-dart.c:1153, drivers/iommu/apple-dart.c:1156,
    drivers/iommu/apple-dart.c:1161).
  - `BITS_TO_U32(...)` ensures the correct number of 32‑bit words are
    cleared.
  - The driver already uses the same write‑all‑ones bitmap pattern for
    stream operations (e.g., enabling all streams) showing these
    registers are W1C bitmaps and that this access pattern is
    established and safe (drivers/iommu/apple-dart.c:485,
    drivers/iommu/apple-dart.c:486).
- No architectural changes or API/ABI effects: This is a straightforward
  IRQ acknowledgment fix limited to the Apple DART IOMMU driver.
- User impact: Prevents stuck/level interrupts and interrupt floods on
  affected Apple SoCs (e.g., t602x using T8110 DART), improving
  stability and correctness.

Given it is a clear bug fix, small and localized, with low regression
risk and meaningful user impact, it is a strong candidate for
backporting to stable kernels that include the T8110 DART support.

 drivers/iommu/apple-dart.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 190f28d766151..8b1272b7bb44a 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -122,6 +122,8 @@
 #define DART_T8110_ERROR_ADDR_LO 0x170
 #define DART_T8110_ERROR_ADDR_HI 0x174
 
+#define DART_T8110_ERROR_STREAMS 0x1c0
+
 #define DART_T8110_PROTECT 0x200
 #define DART_T8110_UNPROTECT 0x204
 #define DART_T8110_PROTECT_LOCK 0x208
@@ -1077,6 +1079,9 @@ static irqreturn_t apple_dart_t8110_irq(int irq, void *dev)
 		error, stream_idx, error_code, fault_name, addr);
 
 	writel(error, dart->regs + DART_T8110_ERROR);
+	for (int i = 0; i < BITS_TO_U32(dart->num_streams); i++)
+		writel(U32_MAX, dart->regs + DART_T8110_ERROR_STREAMS + 4 * i);
+
 	return IRQ_HANDLED;
 }
 
-- 
2.51.0


