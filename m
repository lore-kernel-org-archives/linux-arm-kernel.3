Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB545C282C8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wjf5qk9tIY6PWFIE2zevhBevRGtXVokUfnqWpdVT9E=; b=LUP80oU6GkUKaxXIPgdsrxVP4J
	Z0FHNhH0wmdyQWrpqD0p4W6VQsnlV0EI6eHXM1Qq3S1WSGZce+CoTt0sK6LDKiDF2DitGx8uRyYMm
	CEyVDcM6VFC+vm31VCjXF+gJtNJqnT1FqxM7Kb48EOB7kjcV3aP06UJDZFDR5SPIYNBR898XkkAx9
	A9+sxupiDmsJdcDQMgaaMpH6rGEyz3U/CoXQlPHc3oaR5gUu0nJ4nOpb9kcVM9659R0NR1nxy/YQZ
	B+u84rWCdi0MnlWaGTNp2U0Pcz9DchTAcXF9tw4LGIdEcK8W205sbfV7b7dsi93RpgKDkA2zHzM1s
	P1KdXPbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhA-00000008Tn4-11GD;
	Thu, 27 Feb 2025 19:37:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf5W-00000007n6r-3izp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:42:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28A722C3D;
	Thu, 27 Feb 2025 06:42:26 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E88453F673;
	Thu, 27 Feb 2025 06:42:08 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: linux-kernel@vger.kernel.org
Cc: will@kernel.org,
	catalin.marinas@arm.com,
	maz@kernel.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	gshan@redhat.com,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: [PATCH v3 3/3] arm64: realm: Use aliased addresses for device DMA to shared buffers
Date: Thu, 27 Feb 2025 14:41:50 +0000
Message-ID: <20250227144150.1667735-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250227144150.1667735-1-suzuki.poulose@arm.com>
References: <20250227144150.1667735-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_064210_974434_8EE925FE 
X-CRM114-Status: GOOD (  12.31  )
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

When a device performs DMA to a shared buffer using physical addresses,
(without Stage1 translation), the device must use the "{I}PA address" with the
top bit set in Realm. This is to make sure that a trusted device will be able
to write to shared buffers as well as the protected buffers. Thus, a Realm must
always program the full address including the "protection" bit, like AMD SME
encryption bits.

Enable this by providing arm64 specific dma_addr_{encrypted, canonical}
helpers for Realms. Please note that the VMM needs to similarly make sure that
the SMMU Stage2 in the Non-secure world is setup accordingly to map IPA at the
unprotected alias.

Cc: Will Deacon <will@kernel.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v2:
 - Drop dma_addr_encrypted() helper, which is a NOP for CCA ( Aneesh )
 - Only mask the "top" IPA bit and not all the bits beyond top bit. ( Robin )
 - Use PROT_NS_SHARED, now that we only set/clear top bit. (Gavin)
---
 arch/arm64/include/asm/mem_encrypt.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
index f8f78f622dd2..a2a1eeb36d4b 100644
--- a/arch/arm64/include/asm/mem_encrypt.h
+++ b/arch/arm64/include/asm/mem_encrypt.h
@@ -21,4 +21,15 @@ static inline bool force_dma_unencrypted(struct device *dev)
 	return is_realm_world();
 }
 
+/*
+ * For Arm CCA guests, canonical addresses are "encrypted", so no changes
+ * required for dma_addr_encrypted().
+ * The unencrypted DMA buffers must be accessed via the unprotected IPA,
+ * "top IPA bit" set.
+ */
+#define dma_addr_unencrypted(x)		((x) | PROT_NS_SHARED)
+
+/* Clear the "top" IPA bit while converting back */
+#define dma_addr_canonical(x)		((x) & ~PROT_NS_SHARED)
+
 #endif	/* __ASM_MEM_ENCRYPT_H */
-- 
2.43.0


