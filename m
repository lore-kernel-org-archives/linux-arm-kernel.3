Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9369C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 08:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YDjbzrOB5bmHreg+FqBLc4W0vkrLgbDl2y8y7mqPbF8=; b=eg+1JFvHSJIY2YBru2bE98EQ5m
	LNQux9FqzR+UsCoN38FbgV11OL7OMSECW2JynNg/FxpG0b5hWCQarI7LG7aNMBdrJDTSNHVgslfoQ
	xK0ZM88d8mvboStZU1/+KTLgXdtjhK2jVW0ge1TREjvvZWbEzhGkWK+YvpykoGu71leY+xdjWyxFw
	/sR9GOwayM53A3I6HxIvO3bjET7CpzvDIOGgHv36zgG9LMDYpIFP0Rke1P+j5wfrmZ/3aDLLQ8PXJ
	HdciDVIpQB9DCJROaykJamp3hDP+C3cBiZL6JrHoj6g741U689HqdvWMHgdQpwcAlmtqY35rcythT
	Dy1ojMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNT1-0000000APrT-38tT;
	Tue, 03 Jun 2025 08:57:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMNLE-0000000AOaO-3pS0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 08:49:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73D8812FC;
	Tue,  3 Jun 2025 01:49:33 -0700 (PDT)
Received: from login2.euhpc.arm.com (login2.euhpc.arm.com [10.6.38.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 625A83F5A1;
	Tue,  3 Jun 2025 01:49:49 -0700 (PDT)
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com,
	vladimir.murzin@arm.com
Subject: [BOOT-WRAPPER PATCH] aarch64: Enable access to MPAM by EL2 and below
Date: Tue,  3 Jun 2025 09:49:23 +0100
Message-Id: <20250603084923.92311-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_014952_992252_19B3BCF7 
X-CRM114-Status: UNSURE (   9.56  )
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

Disable any EL3 traps for MPAM and reset to default PARTIDs and PMGs
by clearing enable bit.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/aarch64/include/asm/cpu.h | 3 +++
 arch/aarch64/init.c            | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index 2b3a659..ff38bf8 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -143,6 +143,9 @@
 #define HCR_EL2_RESET		HCR_EL2_RES1
 
 #define ID_AA64PFR0_EL1_GIC	BITS(27, 24)
+#define ID_AA64PFR0_EL1_MPAM	BITS(43,40)
+
+#define MPAM3_EL3		s3_6_c10_c5_0
 
 /*
  * RES1 bits,  little-endian, caches and MMU off, no alignment checking,
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index e1640a9..b31c4f3 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -194,6 +194,11 @@ static void cpu_init_el3(void)
 
 		msr(SMCR_EL3, smcr);
 	}
+
+	if (mrs_field(ID_AA64PFR0_EL1, MPAM)) {
+		/* Use the default partition and disable lower traps */
+		msr(MPAM3_EL3, 0);
+	}
 }
 
 void cpu_init_el2_armv8r(void)
-- 
2.34.1


