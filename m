Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4B8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 05:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KItQAwfKrSXaptFgH3Q4JzARnumpua1BM8wFI0HGWQI=; b=xJ4GKJtl+s246YtYwSGpyVz0ho
	EDGhFpQ45qsTUODRz+aelrx+bMqQBHkYALh50Yldjk9vP9+DzGatum/Jny45y6SIdRj+UOm80eJgW
	5m9wpTwCJSeoKHLA8VX5Axjv5YGZDUfKGZwjr3uFNo/YvwGtzMB2tot6+RfZ6dQZxJ23D0kuzz0IG
	z2qgh7297zrRbgzlX9UMVLQmgw6ByZ7WwPzCMd8iDzq0TAKm08BcqUs2GDqHbbpfnOEiZ3vziS5aH
	twif+ILXotk9EvaS+BmT+n0GO0NYE7hBri2uI9Myk1mO1ptskjzHSSoce6S+18pDUp3WWXXhEYIUE
	tSbMl1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtGg-0000000AL8u-04Vc;
	Tue, 10 Dec 2024 05:58:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKtBm-0000000AJkZ-3Gpj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 05:53:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 400A0113E;
	Mon,  9 Dec 2024 21:54:10 -0800 (PST)
Received: from a077893.arm.com (unknown [10.163.48.173])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C1F93F58B;
	Mon,  9 Dec 2024 21:53:37 -0800 (PST)
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
Subject: [PATCH V2 04/46] arm64/sysreg: Update register fields for TRBIDR_EL1
Date: Tue, 10 Dec 2024 11:22:29 +0530
Message-Id: <20241210055311.780688-5-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210055311.780688-1-anshuman.khandual@arm.com>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_215342_878278_4B9746BA 
X-CRM114-Status: UNSURE (   6.56  )
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

This adds register fields for TRBIDR_EL1 as per the definitions based
on DDI0601 2024-09.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/tools/sysreg | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 59351931d907..10b1a0998d99 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3295,13 +3295,24 @@ Field	31:0	TRG
 EndSysreg
 
 Sysreg	TRBIDR_EL1	3	0	9	11	7
-Res0	63:12
+Res0	63:48
+Field	47:32	MaxBuffSize
+Res0	31:16
+UnsignedEnum	15:12	MPAM
+	0b0000	NI
+	0b0001	PMG
+	0b0010	IMP
+EndEnum
 Enum	11:8	EA
 	0b0000	NON_DESC
 	0b0001	IGNORE
 	0b0010	SERROR
 EndEnum
-Res0	7:6
+UnsignedEnum 7:6	AddrMode
+	0b00	VIRT_PHYS
+	0b01	VIRT_ONLY
+	0b10	PHYS_ONLY
+EndEnum
 Field	5	F
 Field	4	P
 Field	3:0	Align
-- 
2.25.1


