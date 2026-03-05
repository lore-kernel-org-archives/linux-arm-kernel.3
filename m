Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD13F33A77
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEKw1zpuoWo0khurYkWYWPORDpDZgloEuPR7t7VEd/8=; b=LglalDUmnkbsG0x9f+3/X0Krzx
	EDy8Oha99w4V6oUdSQEuX1M7pGuOz6sW3tosKWRpoa26DEG9guDzjBO9uWV8kMx4ajQJ5bboIMmQf
	KF4FJXbmJEZ5+1eDq1/e2SBofPG2zNFAVkkQzfLuG0D5b2z6O4Ba6I5mKrr3CdCJ5RrkJhUrZgySY
	44B+DlIm563sBF05P8wMFt6ZKmmaGO5WCW3XwH0livb/KG5NlyiECYiMweDYye5eZBmbVsMhsqStd
	Z6faFAeF/hnCEbzimUk2uFDAS/jBRPmrwl7OHKM9lzOcUjOdQB8lLbAMUNN2lAHmXGI335xbgMwA2
	KLffuZGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wE-0000000217x-2mZs;
	Thu, 05 Mar 2026 14:44:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wD-0000000216y-0szt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:44:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A48F961852;
	Thu,  5 Mar 2026 14:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73393C2BC87;
	Thu,  5 Mar 2026 14:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721868;
	bh=zLj2vrn57hkwZ2s36BzueBZyzRGMePMFsUk6UVWwqkI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uu7QkWPbCWfOVvqY7ezBSO5ypdIpegG1NWiUBNq0LvdfrREFXig5zwCmEnKyy2Nq/
	 I9aaWMetAGqiV70sSrdmBbCz3r6V7K7GXYoOSW2j3vnwSyeBAHMNyEuUWZOG+lOYb8
	 TzGcieEm+ljGlzjLmIbeR0+T0pBvOHiDu5W+b+WinGPl3yltjcyft3q1aGc4gaNCqy
	 2IDWEiwirxMwaNxvy41VUPykCdRiN6DDxcrPmznF3n0FB/nDXvTqz52iCD3VAp62Ve
	 hEXa8IpI90hcUbWjGyZ1ieE+ywRXj1LNbb0QGbx4o8sBKX+ILBVe/XM8dqntlfVXpv
	 4WD5s9yLVFTpg==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v3 05/36] KVM: arm64: Expose self-hosted debug regs as RAZ/WI for protected guests
Date: Thu,  5 Mar 2026 14:43:18 +0000
Message-ID: <20260305144351.17071-6-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
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

From: Fuad Tabba <tabba@google.com>

Debug and trace are not currently supported for protected guests, so
trap accesses to the related registers and emulate them as RAZ/WI for
now. Although this isn't strictly compatible with the architecture, it's
sufficient for Linux guests and means that debug support can be added
later on.

Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 06d28621722e..0a84140afa28 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -392,6 +392,14 @@ static const struct sys_reg_desc pvm_sys_reg_descs[] = {
 	/* Cache maintenance by set/way operations are restricted. */
 
 	/* Debug and Trace Registers are restricted. */
+	RAZ_WI(SYS_DBGBVRn_EL1(0)),
+	RAZ_WI(SYS_DBGBCRn_EL1(0)),
+	RAZ_WI(SYS_DBGWVRn_EL1(0)),
+	RAZ_WI(SYS_DBGWCRn_EL1(0)),
+	RAZ_WI(SYS_MDSCR_EL1),
+	RAZ_WI(SYS_OSLAR_EL1),
+	RAZ_WI(SYS_OSLSR_EL1),
+	RAZ_WI(SYS_OSDLR_EL1),
 
 	/* Group 1 ID registers */
 	HOST_HANDLED(SYS_REVIDR_EL1),
-- 
2.53.0.473.g4a7958ca14-goog


