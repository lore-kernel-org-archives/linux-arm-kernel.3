Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AAAC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orZ7Qmcs51W3nFHTK+mUbUrpiPUxZw4Cs1hW3hDbDyo=; b=TVJV/vRbpky7beD59ROFAmxyxq
	w0Nz0hjm7iOHckjqC9DoXXNhCtoovH8ZPsKbyKu2IoYL9CPFQMRNbWFGdeLvBYWT8BVKMpqGUZiWm
	TSjYbSQNCOMvU4V6mR8nonr5BFhTC5H02vZN1tY9yx1xTdc+FivaR65Aeqj/dcrjvjschyQEvK9DI
	QBXkR6JuzO7Vk83T/MC0gJZabQUsmWoHt/ifkUWX+wJh101AKCRHNXcNRmexfckd/zaeWlIROxq9e
	lSWZMONDcDMCwSeouoS5GuDOG8Y1apZJ8aFyBzNLmKN1D3XbRjy1tsvP02ICz/S7idNHGqcKpn4xA
	Zz8xiFZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJkT-00000000Hir-3EaQ;
	Sat, 15 Feb 2025 15:06:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjJgC-00000000H1K-16Fq
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 15:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 705A05C5409;
	Sat, 15 Feb 2025 15:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F435C4CEE7;
	Sat, 15 Feb 2025 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739631722;
	bh=L6EHvmUXku+zPzqhvJf7wREo7z6WQPXzllEkBP1EVWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nBLgBNiuTLicbb+jpgK5xvLTiH6BdAdE4hReHFznoGu/xvUZMvCss1mnaZ9QtjIhl
	 eiiXFu85fT2oS92HgqnzGaRteEFiJKZcFTKSKIgQXWfi/k26JgvRnfrlkql/Psvy1U
	 ENfwRtKMY1GACFcXzhzH4MDR47+eHNRqARwqM22iB1gCchK6xrnuzYz9WFlOKrhR3K
	 HJs3Xdmkv6DFrBFawE86DT5Cbeo+k99A/1jZdNk2DOvFQ2nf6vk+8CPx7R5gt4Iu4h
	 FY6e4i8ErvlviAZrS/XwKsUiXAyiXVe+Wx39zWL3IqAZFHgbuQ2VPqArO3SBBKll8W
	 GO5jnR8cdexHg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjJg8-004Nz6-D1;
	Sat, 15 Feb 2025 15:02:00 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 01/14] arm64: sysreg: Add layout for VNCR_EL2
Date: Sat, 15 Feb 2025 15:01:21 +0000
Message-Id: <20250215150134.3765791-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215150134.3765791-1-maz@kernel.org>
References: <20250215150134.3765791-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_070204_341834_4ACCEE03 
X-CRM114-Status: GOOD (  10.33  )
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

Now that we're about to emulate VNCR_EL2, we need its full layout.
Add it to the sysreg file.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/sysreg.h | 1 -
 arch/arm64/tools/sysreg         | 6 ++++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 05ea5223d2d55..0a18279dc4dfe 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -521,7 +521,6 @@
 #define SYS_VTTBR_EL2			sys_reg(3, 4, 2, 1, 0)
 #define SYS_VTCR_EL2			sys_reg(3, 4, 2, 1, 2)
 
-#define SYS_VNCR_EL2			sys_reg(3, 4, 2, 2, 0)
 #define SYS_HAFGRTR_EL2			sys_reg(3, 4, 3, 1, 6)
 #define SYS_SPSR_EL2			sys_reg(3, 4, 4, 0, 0)
 #define SYS_ELR_EL2			sys_reg(3, 4, 4, 0, 1)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 762ee084b37c5..e8dd641e7625c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2868,6 +2868,12 @@ Sysreg	SMCR_EL2	3	4	1	2	6
 Fields	SMCR_ELx
 EndSysreg
 
+Sysreg	VNCR_EL2	3	4	2	2	0
+Field	63:57	RESS
+Field	56:12	BADDR
+Res0	11:0
+EndSysreg
+
 Sysreg	GCSCR_EL2	3	4	2	5	0
 Fields	GCSCR_ELx
 EndSysreg
-- 
2.39.2


