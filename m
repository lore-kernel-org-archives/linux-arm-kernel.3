Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A588C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jb4y8lZ/B27999//+jP+UBvYkfjYbUtLvRMfki+Dy0w=; b=mjhnGju0XHBvXNunZCf0gaeZ9G
	j9y8Jv17NIlxW3vSBBRSGUC49qCrLW50f7aj0l2liZGI6HBybd5bG++03OXi5LAqIzHATd7XbuAMk
	270FLCqP47MwtaA6ixLu+qoCOb/qn+38cQ1ePJ8XB3PQaSdUkxdGoDKSWb8Ha/eY7/9jLA57YKtn9
	hujPOcSDPxZAkxq1pVKv8eF6d6dSuiDkWOaC2/UNt7haTEAsuOI5LjXjUS86dWj7cRcSKjbAWghNL
	h5dhNj2OIwwQJcEKMzGPK1A86hDXUStRJlF7/YE1C8ZxeSj7L42+/jvdbuDQcPg+IGWgy28HeOs8l
	iIgZRvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjAm-00000002Ady-0TAd;
	Mon, 07 Jul 2025 10:34:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiYi-000000023vF-2fUj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:54:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBBC8168F;
	Mon,  7 Jul 2025 02:54:32 -0700 (PDT)
Received: from e134433.budapest.arm.com (e134433.arm.com [10.45.25.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C33E63F6A8;
	Mon,  7 Jul 2025 02:54:44 -0700 (PDT)
From: Tamas Kaman <tamas.kaman@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>,
	Tamas Kaman <tamas.kaman@arm.com>
Subject: [boot-wrapper-aarch64 PATCH] Enable GCS if it is present in the HW
Date: Mon,  7 Jul 2025 11:54:30 +0200
Message-Id: <20250707095430.3821373-1-tamas.kaman@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_025448_714183_5F88F824 
X-CRM114-Status: UNSURE (   9.40  )
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

Signed-off-by: Tamas Kaman <tamas.kaman@arm.com>
---
 arch/aarch64/include/asm/cpu.h | 5 +++++
 arch/aarch64/init.c            | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
index ac50474..9d6f0fc 100644
--- a/arch/aarch64/include/asm/cpu.h
+++ b/arch/aarch64/include/asm/cpu.h
@@ -70,6 +70,7 @@
 #define SCR_EL3_ECVEN			BIT(28)
 #define SCR_EL3_TME			BIT(34)
 #define SCR_EL3_HXEn			BIT(38)
+#define SCR_EL3_GCSEn			BIT(39)
 #define SCR_EL3_EnTP2			BIT(41)
 #define SCR_EL3_RCWMASKEn		BIT(42)
 #define SCR_EL3_TCR2EN			BIT(43)
@@ -125,6 +126,7 @@
 #define ID_AA64PFR1_EL1_MTE		BITS(11, 8)
 #define ID_AA64PFR1_EL1_SME		BITS(27, 24)
 #define ID_AA64PFR1_EL1_CSV2_frac	BITS(35, 32)
+#define ID_AA64PFR1_EL1_GCS		BITS(47, 44)
 #define ID_AA64PFR1_EL1_THE		BITS(51, 48)
 
 #define ID_AA64PFR2_EL1			s3_0_c0_c4_2
@@ -133,6 +135,9 @@
 #define ID_AA64SMFR0_EL1		s3_0_c0_c4_5
 #define ID_AA64SMFR0_EL1_FA64		BIT(63)
 
+#define HCRX_EL2			s3_4_c1_c2_2
+#define HCRX_EL2_GCSEn			BIT(22)
+
 /*
  * Initial register values required for the boot-wrapper to run out-of-reset.
  */
diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
index cb24f4e..f815e6a 100644
--- a/arch/aarch64/init.c
+++ b/arch/aarch64/init.c
@@ -118,6 +118,13 @@ static void cpu_init_el3(void)
 	if (mrs_field(ID_AA64PFR1_EL1, MTE) >= 2)
 		scr |= SCR_EL3_ATA;
 
+	if (mrs_field(ID_AA64PFR1_EL1, GCS)) {
+		scr |= SCR_EL3_GCSEn;
+		unsigned long hcrx_el2 = mrs(HCRX_EL2);
+		hcrx_el2 |= HCRX_EL2_GCSEn;
+		msr(HCRX_EL2, hcrx_el2);
+	}
+
 	if (!kernel_is_32bit())
 		scr |= SCR_EL3_RW;
 
-- 
2.34.1


