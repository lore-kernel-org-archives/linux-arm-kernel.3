Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FE2CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLGcj7/Q1TNmma4fA/m9uysTtoYsuzbQbqU32l2LFZs=; b=z+lvo17IvJ/HOHWgzafPpqH5tB
	PJlgNIZpKtMJ1OzzEIYszcJGRHWaIeB9ircP0cp+4NY+1zSFSISYrE6/Pxq6yealfCzEFLc0jPSUy
	PtSwUw4UvGafgKCvwg+ppXwi4yyqbMd0JHmBuGShqHhwcCGj2bDvvbL1Uxj+4nQYGq8i0ghzs/LnI
	Pu6Ib0RfyB3J6SMz6a8UuHHnSOXay0RundEkOLEMFfUs3WM0UblmRgt9DCOsmWCqkSkACVEqBQ2HN
	dzocnrv724uIfLDhzWujZibS/NIaXrPsfFy3tmFTk3bzTiv0OQjXgCf+Dd4OeiDV+XougeCmiEbRy
	cNPACAfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBW2G-00000002U2s-1gb5;
	Wed, 22 Oct 2025 10:25:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBW24-00000002TyK-1TsQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:25:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1FD911C00;
	Wed, 22 Oct 2025 03:25:20 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.33.8.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39D653F63F;
	Wed, 22 Oct 2025 03:25:27 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Dave Martin <dave.martin@arm.com>
Subject: [boot-wrapper PATCH 4/4] aarch64: enable access to FEAT_RASv1p1 system registers
Date: Wed, 22 Oct 2025 11:25:03 +0100
Message-Id: <20251022102503.2878048-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022102503.2878048-1-andre.przywara@arm.com>
References: <20251022102503.2878048-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_032528_427018_40A6B03A 
X-CRM114-Status: UNSURE (   9.00  )
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

FEAT_RASv1p1 introduces RAS error injection system registers, access to
which is protected by an SCR_EL3 bit.

Since boot-wrapper has no business in limiting those features or trapping
access to those register, set the no-trap bit in SCR_EL3, if we detect
the respective CPU feature bit.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/aarch64/include/asm/cpu.h | 1 +
 arch/aarch64/init.c            | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index 9c794be..f4b7818 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -68,6 +68,7 @@
 #define SCR_EL3_RW			BIT(10)
 #define SCR_EL3_APK			BIT(16)
 #define SCR_EL3_API			BIT(17)
+#define SCR_EL3_FIEN			BIT(21)
 #define SCR_EL3_ATA			BIT(26)
 #define SCR_EL3_FGTEN			BIT(27)
 #define SCR_EL3_ECVEN			BIT(28)
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index 05637d4..704471f 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -133,6 +133,9 @@ static void cpu_init_el3(void)
 	if (mrs_field(ID_AA64PFR1_EL1, THE))
 		scr |= SCR_EL3_RCWMASKEn;
 
+	if (mrs_field(ID_AA64PFR0_EL1, RAS) >= 0b0010)
+		scr |= SCR_EL3_FIEN;
+
 	if (mrs_field(ID_AA64PFR2_EL1, FPMR))
 		scr |= SCR_EL3_EnFPM;
 
-- 
2.25.1


