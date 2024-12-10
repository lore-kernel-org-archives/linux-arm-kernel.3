Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA39E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 06:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ip8VNTVMvKeu/Wsi2ZdWI7MfkPX+ShYOvbDJf9zh67A=; b=urMi8GOIea/8+YIpfIAuVwS/xM
	R7vOICxOxrGGCMiKsh9JoJmoV2PXJb6ReOLtgPaAY5/3iYFudoXUtiOu2Bzq+m5T16464sf/dVrQN
	YXIi4rVeLVF9cyTDchIm9d5Lr4oIYK4CTWcKVgQxuQjKIpXuOzQZb6I6U8uKsn7NEK+zleL7Vnxm7
	YpQv5ONIrVHQnERwzq0IljjmXLdCw1YP1ztrNhTu3JiVnauUeWvgBUzZROz0o9BDRUuXyS8RDvSe5
	jQ0VSZ087pONgS6//n8HIVByUb8mBFy2o3gvVt1ifSSJFrhmAUEjrLb7kZzTqZ4n9b9Ts+Jcmed8I
	s6drcIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtkJ-0000000AQDA-3RCY;
	Tue, 10 Dec 2024 06:29:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtEC-0000000AKSe-2ALA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:56:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FF59113E;
	Mon,  9 Dec 2024 21:56:40 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8B2563F58B;
	Mon,  9 Dec 2024 21:56:08 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	maz@kernel.org
Cc: ryan.roberts@arm.com,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH V2 33/46] arm64/sysreg: Add register fields for SPMIIDR_EL1
Date: Tue, 10 Dec 2024 11:22:58 +0530
Message-Id: <20241210055311.780688-34-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210055311.780688-1-anshuman.khandual@arm.com>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_215612_623450_015D0B39 
X-CRM114-Status: UNSURE (   6.48  )
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

This adds register fields for SPMIIDR_EL1 as per the definitions based
on DDI0601 2024-09.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/tools/sysreg | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index b19b8e594524..3b217ce3fe28 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -149,6 +149,14 @@ Field	3:2	P1
 Field	1:0	P0
 EndSysreg
 
+Sysreg	SPMIIDR_EL1	2	0	9	13	4
+Res0	63:32
+Field	31:20	ProductID
+Field	19:16	Variant
+Field	15:12	Revision
+Field	11:0	Implementer
+EndSysreg
+
 Sysreg	SPMDEVAFF_EL1	2	0	9	13	6
 Res0	63:40
 Field	39:32	Aff3
-- 
2.25.1


