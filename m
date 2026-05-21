Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D02ACD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3SkNvCVC215HZ2WJudGuGKOU+j3hSJZIr6Ed6PS25g=; b=fnGi+lfV13NooYyfzlCg+lYlZ2
	uyzMEaa70h6T66MBDPjU5BuOLV2l87wIxZq2WYaKxFMORw4RQUTpK5R8m2WA9emeu5kuhxxFaIGRa
	uIdDK1HMlafa/1Enqs6TmoMapyORdmmahGc2NNghDov99JDO1nDW75Efbw76HkJ6fRpPT+9NaBQRO
	y8VM42CsRHEcWVGuL8EVhB7QSygWkFCfRVZ9ttlmsmCFQctT1klKPhNvbpAzc/u6mbdS0FnVvdYVZ
	V8eCzuVK8soEUSHzLki2HIB13124VqMB5vwAwHRYqTMCCJTq3iAY1OQG7DILgr4w6EKMEETJQGZ8F
	wdjvWo+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzvh-00000007LQo-3hrd;
	Thu, 21 May 2026 09:43:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzve-00000007LOH-1i7i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:43:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 318273D4F;
	Thu, 21 May 2026 02:42:52 -0700 (PDT)
Received: from localhost.localdomain (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 101763F7B4;
	Thu, 21 May 2026 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779356577; bh=/V9dccVTY3QH90sv6TgrxJE8igX/oj1r58vKnvJCNXg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N6Xa6iI4OLKgifdEnhg8spdq0S6+o4M7BzhuWYSEGLEHZg0Tvomlbxd2y5zLmZWzX
	 dd69wuYAnIQDrYmCqXCPYSf4wij1ialB0Tp4JZT0SCCQToe6Vjy9UM5ZYAjUpla49A
	 o6/zP3GgGdVVG+SKuITvcODWSYArr+NhRnlBHlHE=
From: Kevin Brodsky <kevin.brodsky@arm.com>
Date: Thu, 21 May 2026 10:42:30 +0100
Subject: [PATCH 1/2] arm64: mm: Add note about overlays in PIE_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-poe_futex-v1-1-1da286b8f9b2@arm.com>
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
In-Reply-To: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779356574; l=1292;
 i=kevin.brodsky@arm.com; s=20260427; h=from:subject:message-id;
 bh=/V9dccVTY3QH90sv6TgrxJE8igX/oj1r58vKnvJCNXg=;
 b=D7ii9y0mSyz5i96pc6R74x6SA5NXGDpChlIxUyz0trRS1TnFEn9bUAI2ndbsaC6a0AJER80oQ
 n52VPbpEBS2CZnJNAFElJsXzoMCyLPEQS0TJHfiLfGHWHsYPKh060ch
X-Developer-Key: i=kevin.brodsky@arm.com; a=ed25519;
 pk=N2QG+eJKrvkNovwhhwJhnJ4+ScVfsGCHldmqLfcMTFs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024258_513592_FB5D53E5 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

It isn't completely obvious why user page types do not have overlays
applied in PIE_EL1. Add a comment to that effect, to avoid
unpleasant surprises in the future.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm64/include/asm/pgtable-prot.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index 212ce1b02e15..6e2f99820909 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -175,6 +175,13 @@ static inline bool __pure lpa2_is_enabled(void)
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R_O)   | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW_O))
 
+/*
+ * Regular user page types such as _PAGE_SHARED must not have overlays applied
+ * in PIE_EL1. If POE is enabled at EL1, and in the absence of FEAT_LSUI, this
+ * would break futex atomic operations on user memory with a non-default
+ * POIndex; the privileged atomic load/store instructions would be mistakenly
+ * checked against POR_EL1.
+ */
 #define PIE_E1	( \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
 	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \

-- 
2.51.2


