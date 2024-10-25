Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501B5D149E8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 19:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X+s7YOZIeIWAs/5W19BCTzijIhqnkURfVQCL2Dnr1iE=; b=0LpOp4CTujk3DGnUejkMBU00wd
	GIMs9ETpQcYLfRpdl/eDgvZ8gX2DM9pCmkqZxpUy0aDWljuW7b9JiP3GYcwFAZ80aE7tUic2brrM1
	ILz0z0T2HFVL83chVFn5nOBjsJ74Cm/329ymz2xotk05EP7fjuXm0ZEQYLkTD8uyS/S9FHoi8avPg
	1DkOxWw0z2YrH+CDvSCs7P1gxUm5I1EfCyfe7FIRiFqv+salheEp+DkSEh2hq4IG7siG9EcICJE7Q
	/9SKmo0yGkyIQokM5Rk+hxOHGNW0cyhrdTeAkSOGvOuWCJYifaMQc/Z1vvpCWpcjPWGvP4yvABAkn
	nVkw73kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Pbx-00000004tQt-1RQg;
	Fri, 25 Oct 2024 19:04:37 +0000
Received: from out-185.mta1.migadu.com ([95.215.58.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Oyq-00000004mmo-40eN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 18:24:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729880650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X+s7YOZIeIWAs/5W19BCTzijIhqnkURfVQCL2Dnr1iE=;
	b=I5ZziLi59uBxmOn9KsacgP2NIz3Ie6Lhy8SqDAM6jRPm/4eud6+Qlq9lUmhzo3O9N+ZgaV
	WTsy494La1HGQqrXB5hEpsrZyYNGl1xECZ9hCyu+E336CwQCBpjSDKC/H61OjALXM3OWJv
	6dHXKahNrismibLkAD5VTxOFypxi2GQ=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [PATCH v4 02/18] arm64: sysreg: Describe ID_AA64DFR2_EL1 fields
Date: Fri, 25 Oct 2024 18:23:37 +0000
Message-ID: <20241025182354.3364124-3-oliver.upton@linux.dev>
In-Reply-To: <20241025182354.3364124-1-oliver.upton@linux.dev>
References: <20241025182354.3364124-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_112413_160874_19B6FF01 
X-CRM114-Status: UNSURE (   6.08  )
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

Describe the new ID register in line with DDI0601 2024-09.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/tools/sysreg | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 8d637ac4b7c6..5670e51a6f90 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1287,6 +1287,32 @@ Field	15:8	BRPs
 Field	7:0	SYSPMUID
 EndSysreg
 
+Sysreg	ID_AA64DFR2_EL1	3	0	0	5	2
+Res0	63:28
+UnsignedEnum	27:24	TRBE_EXC
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	23:20	SPE_nVM
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	19:16	SPE_EXC
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+Res0	15:8
+UnsignedEnum	7:4	BWE
+	0b0000	NI
+	0b0001	FEAT_BWE
+	0b0002	FEAT_BWE2
+EndEnum
+UnsignedEnum	3:0	STEP
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+EndSysreg
+
 Sysreg	ID_AA64AFR0_EL1	3	0	0	5	4
 Res0	63:32
 Field	31:28	IMPDEF7
-- 
2.47.0.163.g1226f6d8fa-goog


