Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEE8CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ekOHRYwUdbmBnqcrDc1xD1DipFxSjpRCfMEwPjXrUwY=; b=pcIDveVoHSXLpXBMCqZXOp0qC6
	lkHVL1APcbM0XxEn2EG1DxoxPyl3zYLnDkJCAc3dwVcnQTiZM6DkHbSkUxE3//OXQKuj0Ak5eVk+j
	9vQlQJ8qnrFW+yZr5UcSjVPntexMaD6Q8AMNYnuXsTEYtF+POyOFzvukhYlzNzfaWNouPLBijh5Yw
	NKx3bmWITjQuage3vVgvzkEpFyF3GqXJ7Wnr1arZ1mLP4tIkxXV6O5+ceEjXsa+cWhGijss1enFbZ
	JzGQT2fhznp5nvdV1/aRgE11ZF0kDnGYMCRvbbKNNkLqwLtnVTuL5MeFtqWZt+Q79BaY37YTes70W
	yOR/e+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBb9c-0000000472Q-44UA;
	Tue, 29 Sep 2026 16:58:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBb9T-000000046ze-2eMI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 16:58:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0FD0152B;
	Tue, 29 Sep 2026 09:57:53 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09A843F85F;
	Tue, 29 Sep 2026 09:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790701077; bh=XfDgJmGYICDOe9Ai/FZY7rOqKEBndkXwEBVMMTF7oaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S/MpD1agFuDdA0Zgws+0GEIl2nHqtV1Y7Fc/AQdNBZfh71yQr+FWoNxRY0NxbrK8a
	 gYciFhgFWH+09hGJ+suYq/Pn+z/Pn+5sktZ3EONCa14OiFmZnPV9cZBf58zyqmDqxM
	 vgBDorpYn59j3dsD3VYTBEXDnTR/epbWVF3KUxWc=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 29 Sep 2026 17:57:47 +0100
Subject: [PATCH v2 1/3] arm64: rsi: Add helpers for Arm CCA measurement
 register operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260929-arm_cca_mr-v2-1-1d98bba187fd@arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
In-Reply-To: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Suzuki Poulose <suzuki.poulose@arm.com>, 
 Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, 
 thuth@redhat.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4659; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=sGvQOz5lECO9vLH19hyUDcJmT3dVT6BEUF7G+adhVhM=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqu+4QBmrngQ650o+mNu4qc7AqTjYiT2inqh/lJ
 0PcLA9Wu3eJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarvuEAAKCRBt1cPRWsUx
 M7f3C/4unqdJSZ13fAYI+OsXCqt5GBtcWhcYndyBSDy5rIfmHRxYOtxY9ckzkkcp5hGDWS2IuLd
 WjfMoIl/lSE8lm+j7GwRYtbPQSZBF/47zUnoo4S5yQZJPToPiz+nFhU+tvOpNIQXKi8QDHY7TEv
 KxNJ7SCw48IfJKmNn8qwrFA4SguKZSiLz9RYhAiO5PBe0IDRqfw3mvFaK1EiQ7p9vKHx87UUVFX
 cTCwORsyDSN5rLZgJSgDrtS3TJVID10XoDVPx3CWyP9F4PqnyyvMBvKiPY69UsN7UtLc0muQM1d
 9C9rhZhdU2iTDwwpdaDDPiemXE8VTy213WOs7HWrGirWcrRMiX3oU/fM5im0Q+ZarDNJgDHPfCq
 DnPGHYNw8w8zTE5ciSW4kIyRkHwgy/6tgVToPwmGn7oxFj7TcbFEDpuNW4QlYAf4JUWLtb6t/0R
 4F0BU8QVPJADt9ey9KWJgMyFEIPd0x5J631LTa2N/kL3I8JWXEJC5ijbtyKs3I9q0HSIQ=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_095759_751732_D31AA30A 
X-CRM114-Status: GOOD (  19.03  )
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

From: Sami Mujawar <sami.mujawar@arm.com>

Add static inline helper functions to support reading the Realm
Initial Measurement (RIM) and reading/extending the Realm
Extensible Measurement (REM) registers.

The indices of the Arm CCA measurement registers, as defined by
the Realm Management Monitor specification, are as follows:
    Index    Register
    0        RIM
    1 - 4    REM[0 - 3]

The rsi_measurement_extend() function allows extending REM[0–3]
registers with a caller-provided digest (up to 64 bytes).
Index 0 (RIM) is read-only and cannot be extended.

The rsi_measurement_read() function allows reading measurement
values from RIM (index 0) or REM[0–3] (indices 1–4). The returned
digest is expected to be 64 bytes.

Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
---
 include/linux/arm-rsi-cmds.h | 105 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/include/linux/arm-rsi-cmds.h b/include/linux/arm-rsi-cmds.h
index 3f7a6a833993..608343266d81 100644
--- a/include/linux/arm-rsi-cmds.h
+++ b/include/linux/arm-rsi-cmds.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2023 ARM Ltd.
+ * Copyright (C) 2023 - 2025 ARM Ltd.
  */
 
 #ifndef __LINUX_ARM_RSI_CMDS_H_
@@ -36,6 +36,26 @@ static inline bool is_realm_world(void) { return false; }
 #define RSI_GRANULE_SHIFT		12
 #define RSI_GRANULE_SIZE		(_AC(1, UL) << RSI_GRANULE_SHIFT)
 
+/*
+ * Maximum measurement data size in bytes.
+ * According to the RMM Specification, the width of the RmmRealmMeasurement type
+ * is 512 bits.
+ */
+#define RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES  64
+
+/*
+ * Indices for the Realm Initial Measurement register (RIM) and the Realm
+ * Extensible Measurement registers (REMs).
+ * According to the RMM Specification, Realm attributes of a Realm include
+ * an array of measurement values. The first entry in this array is a RIM.
+ * The remaining entries in this array are REMs.
+ */
+#define RSI_INDEX_RIM		0
+#define RSI_INDEX_REM0		1
+#define RSI_INDEX_REM1		2
+#define RSI_INDEX_REM2		3
+#define RSI_INDEX_REM3		4
+
 enum ripas {
 	RSI_RIPAS_EMPTY = 0,
 	RSI_RIPAS_RAM = 1,
@@ -236,4 +256,87 @@ static inline unsigned long rsi_attestation_token_continue(phys_addr_t granule,
 	return res.a0;
 }
 
+/**
+ * rsi_measurement_extend - Extend the measurement value to the Realm Extensible
+ * Measurement (REM).
+ *
+ * @idx:		Index of the REM register.
+ *				Where:
+ *				Index	Register
+ *				1 - 4	REM[0-3]
+ * @digest:		The digest data to be extended.
+ * @digest_size:	Size of the digest data in bytes.
+ *
+ * Returns:
+ *  On success, returns RSI_SUCCESS.
+ *  Otherwise, -EINVAL
+ */
+static inline unsigned long rsi_measurement_extend(u32 idx,
+						   const u8 *digest,
+						   unsigned long digest_size)
+{
+	struct arm_smccc_1_2_regs regs = { 0 };
+
+	/*
+	 * Index 0 is for RIM (which is Read Only), while
+	 * REM[0-3] are indexed from 1 - 4.
+	 * The digest size can be at the most 64 bytes.
+	 */
+	if (!digest || idx < RSI_INDEX_REM0 || idx > RSI_INDEX_REM3 ||
+	    digest_size == 0 || digest_size > RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES)
+		return -EINVAL;
+
+	regs.a0 = SMC_RSI_MEASUREMENT_EXTEND;
+	regs.a1 = idx;
+	regs.a2 = digest_size;
+	memcpy(&regs.a3, digest, digest_size);
+	arm_smccc_1_2_smc(&regs, &regs);
+
+	if (regs.a0 != RSI_SUCCESS)
+		return -EINVAL;
+
+	return regs.a0;
+}
+
+/**
+ * rsi_measurement_read - Read the measurement value from the Realm Initial
+ * Measurement (RIM) or the Realm Extensible Measurement (REM) register.
+ *
+ * @idx:		Index of the RIM or REM register.
+ *				Where:
+ *				Index	Register
+ *				0	RIM
+ *				1 - 4	REM[0-3]
+ * @digest:			The digest data to be returned.
+ * @digest_size:	Size of the digest data buffer in bytes.
+ *
+ * Returns:
+ *  On success, returns RSI_SUCCESS.
+ *  Otherwise, -EINVAL
+ */
+static inline unsigned long rsi_measurement_read(u32 idx,
+						 u8 *digest,
+						 unsigned long digest_size)
+{
+	struct arm_smccc_1_2_regs regs = { 0 };
+
+	/*
+	 * The digest size can be at the most 64 bytes, if less then 64 bytes
+	 * it is zero padded.
+	 */
+	if (!digest || idx > RSI_INDEX_REM3 ||
+	    digest_size == 0 || digest_size > RSI_MAX_MEASUREMENT_DATA_SIZE_BYTES)
+		return -EINVAL;
+
+	regs.a0 = SMC_RSI_MEASUREMENT_READ;
+	regs.a1 = idx;
+	arm_smccc_1_2_smc(&regs, &regs);
+
+	if (regs.a0 != RSI_SUCCESS)
+		return -EINVAL;
+
+	memcpy(digest, &regs.a1, digest_size);
+	return regs.a0;
+}
+
 #endif /* __LINUX_ARM_RSI_CMDS_H_ */

-- 
2.43.0


