Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FB5CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caGbmj3zJYE/3KlPTGEHtJ/5HC5tHFkncM3G2rRd7Co=; b=G06GbfPtk5GFDpytdCc7FEt5b4
	nLBvKWVNzGU2hLqyTGJHdSu1QkEfZFOlo3O6VnZk6Jh7bKzKyULylZnlGz6wiLCt29d8tttfLu7PR
	Ij0D+B1gld9lJOkMKjUP3IZLN0cyMSjZKSKvlhzq2wCfT0MU4RkFaxS7JfP68LKTtcmfVLTP3OLVu
	51Www5IADdAlJtMLfMxKPfCnwuQG3aRQ0UYzpFBaxrUJ1aVxRmbGDfjnvQlYDI6v1h9kDRsSWmRR4
	CnEIsixm2chYDQtDWRgpfqadDZ/B2vqQzBCJircYQgtBYpUvyKvU3Tc6eQmioy1DtDu3BQFMxRWqz
	y6JW0Cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBW2G-00000002U3o-3JUE;
	Wed, 22 Oct 2025 10:25:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBW24-00000002Tx6-01Yw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:25:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EAF71655;
	Wed, 22 Oct 2025 03:25:17 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.33.8.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3540B3F63F;
	Wed, 22 Oct 2025 03:25:24 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Dave Martin <dave.martin@arm.com>
Subject: [boot-wrapper PATCH 1/4] aarch64: do not trap MPAM register accesses
Date: Wed, 22 Oct 2025 11:25:00 +0100
Message-Id: <20251022102503.2878048-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022102503.2878048-1-andre.przywara@arm.com>
References: <20251022102503.2878048-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_032528_090426_2C3DE760 
X-CRM114-Status: UNSURE (   9.55  )
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

The architectural MPAM system registers in lower ELs are controlled by
an EL3 control bit. To allow access to registers like MPAM2_EL2 or
MPAM_EL1, clear the TRAPLOWER bit in the MPAM3_EL3 system register, to
avoid an unhandled trap into the boot-wrapper code.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/aarch64/include/asm/cpu.h | 4 ++++
 arch/aarch64/init.c            | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index ac50474..0f6e2ce 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -29,6 +29,9 @@
 #define HFGWTR2_EL2		s3_4_c3_c1_3
 #define HFGITR2_EL2		s3_4_c3_c1_7
 
+#define MPAM3_EL3		s3_6_c10_c5_0
+#define MPAM3_EL3_TRAPLOWER	BIT(62)
+
 /*
  * RES1 bit definitions definitions as of ARM DDI 0487G.b
  *
@@ -120,6 +123,7 @@
 
 #define ID_AA64PFR0_EL1_RAS		BITS(31, 28)
 #define ID_AA64PFR0_EL1_SVE		BITS(35, 32)
+#define ID_AA64PFR0_EL1_MPAM		BITS(43, 40)
 #define ID_AA64PFR0_EL1_CSV2		BITS(59, 56)
 
 #define ID_AA64PFR1_EL1_MTE		BITS(11, 8)
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index cb24f4e..99e43cf 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -198,6 +198,9 @@ static void cpu_init_el3(void)
 
 		msr(SMCR_EL3, smcr);
 	}
+
+	if (mrs_field(ID_AA64PFR0_EL1, MPAM))
+		msr(MPAM3_EL3, mrs(MPAM3_EL3) & ~MPAM3_EL3_TRAPLOWER);
 }
 
 void cpu_init_el2_armv8r(void)
-- 
2.25.1


