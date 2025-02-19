Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E03EC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 16:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OM3GpkfDimErD5d6W2sgRWJQgIw6Jo7DPIi2NXnUbs8=; b=KQ7UfE2R6NrToVyijW5rWU991t
	GMJ89JmZoWt/yp5VWCN5q0FtOaYn1kCns5BsyYYQfSWlmW2BlrCUDv7zZLbdu7eqd+MxIWctYDmTl
	agohMTrA3APWZRQjKs9Hil+qSSDY+lmd06vPBqEd3/UbYlclHKBExf1EJtND8/SKeb3x0jWWAQyIP
	GRAAoSuBeKp/pIphZaa2kszBQL7Xlgg61MfebX/Q1iLFQtDkdhncsM4l+i1KGtg49UGwFw3mbMA0c
	JrlAuaWjgZbckdSOu7gzH22NwJ9x/kILzYha7Ts5KWnF5IiifjEZ29UBnAayL8GT2V/cdJ3zTmAt9
	Y5v0IEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tknCr-0000000DuJA-3Csw;
	Wed, 19 Feb 2025 16:45:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkn8S-0000000DsUS-0U7Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 16:41:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15736204C;
	Wed, 19 Feb 2025 08:41:38 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A424F3F6A8;
	Wed, 19 Feb 2025 08:41:18 -0800 (PST)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 3/3] arm64/sysreg: Move POR_EL0_INIT to asm/por.h
Date: Wed, 19 Feb 2025 16:40:29 +0000
Message-ID: <20250219164029.2309119-4-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250219164029.2309119-1-kevin.brodsky@arm.com>
References: <20250219164029.2309119-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_084120_230185_F38C8FC5 
X-CRM114-Status: GOOD (  11.09  )
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

The value of POR_EL0_INIT is not architectural, it is a software
decision. Since we have a dedicated header for POR_ELx, we might as
well define POR_EL0_INIT there.

While at it also define POR_EL0_INIT using POR_ELx_PERM_PREP(),
making it clearer that we are setting permissions for POIndex/pkey
0.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/por.h    | 2 ++
 arch/arm64/include/asm/sysreg.h | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/por.h b/arch/arm64/include/asm/por.h
index e6bf00bd0500..d913d5b529e4 100644
--- a/arch/arm64/include/asm/por.h
+++ b/arch/arm64/include/asm/por.h
@@ -8,6 +8,8 @@
 
 #include <asm/sysreg.h>
 
+#define POR_EL0_INIT	POR_ELx_PERM_PREP(0, POE_RWX)
+
 static inline bool por_elx_allows_read(u64 por, u8 pkey)
 {
 	u8 perm = POR_ELx_PERM_GET(pkey, por);
diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 034e0576de5a..e3252f8bb465 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -1086,9 +1086,6 @@
 #define POR_ELx_PERM_GET(idx, reg)	(((reg) >> POR_ELx_PERM_SHIFT(idx)) & POE_MASK)
 #define POR_ELx_PERM_PREP(idx, perm)	(((perm) & POE_MASK) << POR_ELx_PERM_SHIFT(idx))
 
-/* Initial value for Permission Overlay Extension for EL0 */
-#define POR_EL0_INIT	POE_RWX
-
 /*
  * Definitions for Guarded Control Stack
  */
-- 
2.47.0


