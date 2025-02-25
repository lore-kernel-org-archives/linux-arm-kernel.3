Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145F1C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iwf1xvRSVQSvyLgyTDGIPl/rOaPb76Brw5mA3SwiGn0=; b=l4kG9XpogYOy3yPTl8rpI3Yqp/
	0FtDZy1SLU7D4tmuWvh47EJK5etObnTPpXGn48FSUt0Hkpip8s72lscRSnvSrXB4ZYNHMcBuoMyqJ
	VnP/Dvzn7hcGqLAV3vrwdnsmGiBzI5B4YMEjdXbMbgaSfuCSs9MJ5SP6RjU3hTBQrFedssp2hAxp8
	OUi/yjdYsBoyoXB6zxdhxua7S64n+kDrQDSGaPYv2jE89AFyXXWkXenGCfiAknNgOjhjcPIOzYysU
	QVesy6Tu5wkavPzl693l28zw89qMQxG6i/cOFay8DOFY1164RVUpppMdYFi9JHSt91a5IlbeSLYub
	B5GzlqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtzE-0000000HChr-3D0i;
	Tue, 25 Feb 2025 12:24:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmtOj-0000000H5Eo-1NKL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 11:46:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E6031516;
	Tue, 25 Feb 2025 03:47:05 -0800 (PST)
Received: from e125769.cambridge.arm.com (e125769.cambridge.arm.com [10.1.196.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D51453F5A1;
	Tue, 25 Feb 2025 03:46:47 -0800 (PST)
From: Ryan Roberts <ryan.roberts@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Luiz Capitulino <luizcap@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64/mm: Fix Boot panic on Ampere Altra
Date: Tue, 25 Feb 2025 11:46:36 +0000
Message-ID: <20250225114638.2038006-1-ryan.roberts@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_034649_456688_35568F93 
X-CRM114-Status: GOOD (  15.55  )
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

When the range of present physical memory is sufficiently small enough
and the reserved address space for the linear map is sufficiently large
enough, The linear map base address is randomized in
arm64_memblock_init().

Prior to commit 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and
use it consistently"), we decided if the sizes were suitable with the
help of the raw mmfr0.parange. But the commit changed this to use the
sanitized version instead. But the function runs before the register has
been sanitized so this returns 0, interpreted as a parange of 32 bits.
Some fun wrapping occurs and the logic concludes that there is enough
room to randomize the linear map base address, when really there isn't.
So the top of the linear map ends up outside the reserved address space.

Fix this by intoducing a helper, cpu_get_parange() which reads the raw
parange value and overrides it with any early override (e.g. due to
arm64.nolva).

Reported-by: Luiz Capitulino <luizcap@redhat.com>
Closes: https://lore.kernel.org/all/a3d9acbe-07c2-43b6-9ba9-a7585f770e83@redhat.com/
Fixes: 62cffa496aac ("arm64/mm: Override PARange for !LPA2 and use it consistently")
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
---

This applies on top of v6.14-rc4. I'm hoping this can be merged for v6.14 since
it's fixing a regression introduced in v6.14-rc1.

Luiz, are you able to test this to make sure it's definitely fixing your
original issue. The symptom I was seeing was slightly different.

I'm going to see if it's possible for read_sanitised_ftr_reg() to warn about use
before initialization. I'll send a follow up patch for that.

Thanks,
Ryan


 arch/arm64/include/asm/cpufeature.h | 9 +++++++++
 arch/arm64/mm/init.c                | 8 +-------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e0e4478f5fb5..2335f44b9a4d 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -1066,6 +1066,15 @@ static inline bool cpu_has_lpa2(void)
 #endif
 }

+static inline u64 cpu_get_parange(void)
+{
+	u64 mmfr0 = read_cpuid(ID_AA64MMFR0_EL1);
+
+	return arm64_apply_feature_override(mmfr0,
+					    ID_AA64MMFR0_EL1_PARANGE_SHIFT, 4,
+					    &id_aa64mmfr0_override);
+}
+
 #endif /* __ASSEMBLY__ */

 #endif
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 9c0b8d9558fc..1b1a61191b9f 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -280,13 +280,7 @@ void __init arm64_memblock_init(void)
 	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE)) {
 		extern u16 memstart_offset_seed;

-		/*
-		 * Use the sanitised version of id_aa64mmfr0_el1 so that linear
-		 * map randomization can be enabled by shrinking the IPA space.
-		 */
-		u64 mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
-		int parange = cpuid_feature_extract_unsigned_field(
-					mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);
+		int parange = cpu_get_parange();
 		s64 range = linear_region_size -
 			    BIT(id_aa64mmfr0_parange_to_phys_shift(parange));

--
2.43.0


