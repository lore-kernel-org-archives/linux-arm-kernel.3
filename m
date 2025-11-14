Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74665CE8D4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7tVuRLj39nPcImLUVFezdz5G89ZUyxgG/9uM2FZtBA=; b=PxHzgV1QJRSvqv7x8brpXKwKI2
	w328kYw0xAg6RqokOjRvFaDsPe/vwXTd+VbBotuPT2UKwBEz2JY8aSloTCQ2LWVMkpvb/f37w0rZQ
	Tb3gFTNgn291dtTfMBuCBUtiAEPkUMmQQNnIX8rANcK2lE6ZfQTCVM0x+cUS7dMVFyDtBDqMyCFeF
	GaIgVJyu+9R0QkBdrryOcbHB2Fc+0MNHPhV3c9RUTUsm7KTf57XKaJb9rr01HVuFL5qmYLElPCbtW
	CaVUoaA2ew4Kzx7oatLfh3tN6VpBUbTZMZtfc3l6zYYMTH2T8V/Ug4id8dgVP65AwuG0gjsclyCKw
	W8Ow70cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwKt-0000000Cexw-2HYX;
	Fri, 14 Nov 2025 16:07:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwKq-0000000CewP-0UXk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 16:07:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDC8F19F6;
	Fri, 14 Nov 2025 08:07:31 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FB8C3F5A1;
	Fri, 14 Nov 2025 08:07:37 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: james.clark@linaro.org,
	mark.rutland@arm.com,
	james.morse@arm.com
Subject: [RFC PATCH v6 02/35] arm64/sysreg: Define MDCR_EL2.E2PB values
Date: Fri, 14 Nov 2025 16:06:43 +0000
Message-ID: <20251114160717.163230-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114160717.163230-1-alexandru.elisei@arm.com>
References: <20251114160717.163230-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_080740_192284_5EA64AF9 
X-CRM114-Status: UNSURE (   6.73  )
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

KVM will make use of the different values for MDCR_EL2.E2PB, document them.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1e7b69594f04..0de8af0e0778 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3851,7 +3851,12 @@ Field	17	HPMD
 Res0	16
 Field	15	EnSPM
 Field	14	TPMS
-Field	13:12	E2PB
+UnsignedEnum	13:12 E2PB
+	0b00	EL2
+	0b01	RESERVED
+	0b10	EL1_TRAP
+	0b11	EL1
+EndEnum
 Field	11	TDRA
 Field	10	TDOSA
 Field	9	TDA
-- 
2.51.2


