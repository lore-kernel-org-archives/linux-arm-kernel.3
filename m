Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4D0E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 05:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdJvNVRdYYYmN11swr/Bve7GZNGWIcXTd6no6iyW64Q=; b=og5oVinJrFn9aIyEl3XnOMuKk/
	aOQgZVZ7uy1KthNuEgog9wVH6MRwDwJNEgdXlK8K7QsgwD0QUaFHjg1EVE+O7U1s5SPaMChIldIpc
	XfEsGXcB3aA+TQabmwBB96ebcICH3v5RbQcEYlg5hodCesYczRRHzsJDIN/BFUXqRjR7ZHnBC13vF
	ofJEldehy8dHQNLsYKELZ6JayrAP46pTqbK4fOXOrwklynF9Q9j3n5ddRLrKr/Br4M/SA2g8A2NtM
	Jm724lwmPbUDEjdAB/1OHkA6AS1XAPqPZzc2vMvs5uyMTq2ro+OliEJscHqGjxl+uZ6WNdvz7hMSu
	zp7dmr4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtFe-0000000AKsu-1lVm;
	Tue, 10 Dec 2024 05:57:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtBi-0000000AJjF-0Ad6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:53:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84A7F113E;
	Mon,  9 Dec 2024 21:54:05 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6BD013F58B;
	Mon,  9 Dec 2024 21:53:33 -0800 (PST)
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
Subject: [PATCH V2 03/46] arm64/sysreg: Update register fields for ID_AA64PFR0_EL1
Date: Tue, 10 Dec 2024 11:22:28 +0530
Message-Id: <20241210055311.780688-4-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210055311.780688-1-anshuman.khandual@arm.com>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_215338_118763_D9AD03E3 
X-CRM114-Status: UNSURE (   6.41  )
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

This updates ID_AA64PFR0_EL1.RAS and ID_AA64PFR0_EL1.RME register fields as
per the definitions based on DDI0601 2024-09.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/tools/sysreg | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index b5bda7c94689..59351931d907 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -873,6 +873,8 @@ EndEnum
 UnsignedEnum	55:52	RME
 	0b0000	NI
 	0b0001	IMP
+	0b0010	GPC2
+	0b0011	GPC3
 EndEnum
 UnsignedEnum	51:48	DIT
 	0b0000	NI
@@ -899,6 +901,7 @@ UnsignedEnum	31:28	RAS
 	0b0000	NI
 	0b0001	IMP
 	0b0010	V1P1
+	0b0011	V2
 EndEnum
 UnsignedEnum	27:24	GIC
 	0b0000	NI
-- 
2.25.1


