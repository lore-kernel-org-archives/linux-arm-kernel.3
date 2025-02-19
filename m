Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D769C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 22:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZI+/6tdY/z4vCnpV+dVtX1fvFdzmOvnyvtXI8pfsiE=; b=hoN2g11wLGM7YpDq9boVkzKhd4
	nvxj/86IOXKVgdKernf6xC01gGnZqrqBFCTTzNmEFUi6lGqB+4BBNRm7RTCH8KNe0de8ZSyLiDP0J
	X5r28EO7Qp6H1q5gv3Xjox+MxH4a9Xh6xztp3R9v2iMBa3mj6JpdIGZmf59CYWyWyuUIgLlsTvvUJ
	rZP4n7FkJazjB5W8gjJ9fI7WKA56hvlAFn+woTAW6M+kPLTOhzm/Cg273RWYg6UpFZ603llD/yF6W
	+mzFPB/oZG9x5ZGonW34D61C480IUa9QO9/YL79EEoeoauQnVaF3IRsHkIMf5EowO0h5X4tz41re0
	fLJcpKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tksKW-0000000FNzZ-35Bn;
	Wed, 19 Feb 2025 22:14:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tksGE-0000000FMbt-10hr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 22:09:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8989B153B;
	Wed, 19 Feb 2025 14:09:59 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A20153F6A8;
	Wed, 19 Feb 2025 14:09:39 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: will@kernel.org,
	robin.murphy@arm.com,
	catalin.marinas@arm.com
Cc: maz@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	aneesh.kumar@kernel.org,
	steven.price@arm.com,
	suzuki.poulose@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Christoph Hellwig <hch@lst.de>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: [PATCH v2 3/3] arm64: realm: Use aliased addresses for device DMA to shared buffers
Date: Wed, 19 Feb 2025 22:07:51 +0000
Message-ID: <20250219220751.1276854-4-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219220751.1276854-1-suzuki.poulose@arm.com>
References: <20250219220751.1276854-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_140942_320464_B875639F 
X-CRM114-Status: GOOD (  12.17  )
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

Enable this by providing arm64 specific dma_{encrypted,decrypted,clear_encryption}
helpers for Realms. Please note that the VMM needs to similarly make sure that
the SMMU Stage2 in the Non-secure world is setup accordingly to map IPA at the
unprotected alias.

Cc: Will Deacon <will@kernel.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Steven Price <steven.price@arm.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/mem_encrypt.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/include/asm/mem_encrypt.h b/arch/arm64/include/asm/mem_encrypt.h
index f8f78f622dd2..aeda3bba255e 100644
--- a/arch/arm64/include/asm/mem_encrypt.h
+++ b/arch/arm64/include/asm/mem_encrypt.h
@@ -21,4 +21,26 @@ static inline bool force_dma_unencrypted(struct device *dev)
 	return is_realm_world();
 }
 
+static inline dma_addr_t dma_decrypted(dma_addr_t daddr)
+{
+	if (is_realm_world())
+		daddr |= prot_ns_shared;
+	return daddr;
+}
+#define dma_decrypted dma_decrypted
+
+static inline dma_addr_t dma_encrypted(dma_addr_t daddr)
+{
+	if (is_realm_world())
+		daddr &= prot_ns_shared - 1;
+	return daddr;
+}
+#define dma_encrypted dma_encrypted
+
+static inline dma_addr_t dma_clear_encryption(dma_addr_t daddr)
+{
+	return dma_encrypted(daddr);
+}
+#define dma_clear_encryption dma_clear_encryption
+
 #endif	/* __ASM_MEM_ENCRYPT_H */
-- 
2.43.0


