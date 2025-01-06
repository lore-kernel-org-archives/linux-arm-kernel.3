Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634B3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=frDkP7wrN5lu1V/1dOy9YWa3FaKt1uK0Y/9ScnG6yLc=; b=pycZy5SWD3vUsY2SEHwxymnIsf
	4OKsAQstrl75wWVsShUZzNJspsZ5H2JyIWxXu+ERKhzaOaL0SiZI47HqvuYZNlinjqigsTz/Y1eHC
	2kgL+OW80X33pIthRffG3R++IeHTH7CBFJP8AJEMd04FZY/xkw1KJY31OsdkPhveerzmBKAVZKPUU
	03GknfRNQ+upX7/7gsdU6IpLoKB2O/v/tXs7Q71VMhjTNit+5Mslegfi8VcuuJ5grE2CoQdVH3ZtQ
	r0Wn8NE0ntEHgmOneWfqSMzVmTwHY3O+aKbVUP2c23xhpiyRcjFswlkTn6sL+u5wDOcvPAvKgGVag
	P5pEmIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoF7-00000001bUh-3Mcz;
	Mon, 06 Jan 2025 14:38:09 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo2e-00000001Z0g-2x78
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 14:25:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-385e0e224cbso7172046f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 06:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173515; x=1736778315; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frDkP7wrN5lu1V/1dOy9YWa3FaKt1uK0Y/9ScnG6yLc=;
        b=oxCQ2lSxCK9jYSAlBmAjwY2vuZeKqBu0rYoTqZBvW6tuuv4TfmVmVf32rkMnxMqUFC
         pG5nfO7JBjh+A/umidW5TrsQiET9vlDspWYDuNq8cinlxynYnp00R6j9QRWuf+PyvIjz
         27ETYeI7se4eIyLIRSCO7gixD+YGt4Y5pVqc/lCkECekllLl/ljqrEr5HtzrORevlpAk
         4NJOLw8LXqyzy9ba+afEfcw5b4+HO7zQz7Hj9GPlqDBvfBFayXVs5d4UYvxz2G/ic7jh
         EV3nOnqh30lpp3jGAJYTcyRA1m1RSXIROIxX2uwiXs3gPF90aDnOijEns3rHNtSVZUE5
         mpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173515; x=1736778315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=frDkP7wrN5lu1V/1dOy9YWa3FaKt1uK0Y/9ScnG6yLc=;
        b=HH1Tq64PhpIv5ycWejyr7wVZXGE0wnPB1SazRlxfjRcxWGslykS10gTShKdFtj6gtU
         TBv+rnBiETnyMkMUl+ao8mkatXE1dXwVRAaDZr11swJRCwM9HvWspFxX8f2bxkMU6yg3
         U1qOeMIiFz7vRd6Ny7Rt/tJDCzBTju2kJ2V+O9G6wWXv1ZH2OWmI3K6qSH3u1zfuwNUe
         N3xQ87fVls9vZvtyfiwMlEOcZGEUS2Fr8Syqoa62k2BizPwzgV6qRiUcmHzO7vC2dGSV
         Bd6nxMImfqIMvjaeFbMesyzAGYDFwZRIz2WuT+nzRWlxAyMrAX61Oxci2EwSf0LFyBH6
         ybow==
X-Forwarded-Encrypted: i=1; AJvYcCWBY285S45Kd2kEzOVf9XZ8yM0kg2dBbOtsrODZLpYWtQY2AYcvUAU3Fp/ru1UGIXS27xTfzb19aJl+Wv+GQWdx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3tDsJClKpWAsA3n9yqEMBIS/qTgIZ1znGs9uYIMeDAhyX+WCJ
	rRNa6SpYonwk2GzST1pj/B+LZpM87rKcGqvC8N+laIfEIcXZXRMSggTZ+by/n0I=
X-Gm-Gg: ASbGncsAWw+iSKES/hiA0q6EdZMsawxEuap0z92xS8YYngpzGQdC2XUuX0/KUROcOfa
	vzpHgLhFLLXXnaOhqkeXghlySNPB2h5rS6tPVduE+Ot4waVq+h4VfWi00a+Kuz0WdnroP8DLhBB
	nVDngf1CTIlJR5V7jbBFSwg/SGjSeOuw05otviAZJLKu5jx2yB4SKarQxv4LPabBk6m9mV7al9d
	W/FVgkWAPMgmHheMNjIgvRh5ZoOAzQibxRTuPUZYXgf0rxuTjtJSoOJ
X-Google-Smtp-Source: AGHT+IEnpB8O4fWSxzo19VVdUJnPQYoqomyFj/ktQR5x3FzQ6JUKjsQlMTx7fUPml8xH1TRbIdLC3g==
X-Received: by 2002:a5d:5f8a:0:b0:385:e3d3:be1b with SMTP id ffacd0b85a97d-38a2220044emr52346738f8f.28.1736173514720;
        Mon, 06 Jan 2025 06:25:14 -0800 (PST)
Received: from pop-os.. ([145.224.66.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4365d116d8fsm577295045e9.17.2025.01.06.06.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:25:14 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: maz@kernel.org,
	kvmarm@lists.linux.dev,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	coresight@lists.linaro.org
Cc: James Clark <james.clark@arm.com>,
	Mark Brown <broonie@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shiqi Liu <shiqiliu@hust.edu.cn>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	James Morse <james.morse@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/7] arm64/sysreg/tools: Move TRFCR definitions to sysreg
Date: Mon,  6 Jan 2025 14:24:38 +0000
Message-Id: <20250106142446.628923-4-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250106142446.628923-1-james.clark@linaro.org>
References: <20250106142446.628923-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_062516_743876_6066CD96 
X-CRM114-Status: GOOD (  14.28  )
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

From: James Clark <james.clark@arm.com>

Convert TRFCR to automatic generation. Add separate definitions for ELx
and EL2 as TRFCR_EL1 doesn't have CX. This also mirrors the previous
definition so no code change is required.

Also add TRFCR_EL12 which will start to be used in a later commit.

Unfortunately, to avoid breaking the Perf build with duplicate
definition errors, the tools copy of the sysreg.h header needs to be
updated at the same time rather than the usual second commit. This is
because the generated version of sysreg
(arch/arm64/include/generated/asm/sysreg-defs.h), is currently shared
and tools/ does not have its own copy.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: James Clark <james.clark@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/sysreg.h       | 12 ---------
 arch/arm64/tools/sysreg               | 36 +++++++++++++++++++++++++++
 tools/arch/arm64/include/asm/sysreg.h | 12 ---------
 3 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 2ed33737c7a9..05ea5223d2d5 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -283,8 +283,6 @@
 #define SYS_RGSR_EL1			sys_reg(3, 0, 1, 0, 5)
 #define SYS_GCR_EL1			sys_reg(3, 0, 1, 0, 6)
 
-#define SYS_TRFCR_EL1			sys_reg(3, 0, 1, 2, 1)
-
 #define SYS_TCR_EL1			sys_reg(3, 0, 2, 0, 2)
 
 #define SYS_APIAKEYLO_EL1		sys_reg(3, 0, 2, 1, 0)
@@ -523,7 +521,6 @@
 #define SYS_VTTBR_EL2			sys_reg(3, 4, 2, 1, 0)
 #define SYS_VTCR_EL2			sys_reg(3, 4, 2, 1, 2)
 
-#define SYS_TRFCR_EL2			sys_reg(3, 4, 1, 2, 1)
 #define SYS_VNCR_EL2			sys_reg(3, 4, 2, 2, 0)
 #define SYS_HAFGRTR_EL2			sys_reg(3, 4, 3, 1, 6)
 #define SYS_SPSR_EL2			sys_reg(3, 4, 4, 0, 0)
@@ -987,15 +984,6 @@
 /* Safe value for MPIDR_EL1: Bit31:RES1, Bit30:U:0, Bit24:MT:0 */
 #define SYS_MPIDR_SAFE_VAL	(BIT(31))
 
-#define TRFCR_ELx_TS_SHIFT		5
-#define TRFCR_ELx_TS_MASK		((0x3UL) << TRFCR_ELx_TS_SHIFT)
-#define TRFCR_ELx_TS_VIRTUAL		((0x1UL) << TRFCR_ELx_TS_SHIFT)
-#define TRFCR_ELx_TS_GUEST_PHYSICAL	((0x2UL) << TRFCR_ELx_TS_SHIFT)
-#define TRFCR_ELx_TS_PHYSICAL		((0x3UL) << TRFCR_ELx_TS_SHIFT)
-#define TRFCR_EL2_CX			BIT(3)
-#define TRFCR_ELx_ExTRE			BIT(1)
-#define TRFCR_ELx_E0TRE			BIT(0)
-
 /* GIC Hypervisor interface registers */
 /* ICH_MISR_EL2 bit definitions */
 #define ICH_MISR_EOI		(1 << 0)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 4ba167089e2a..ef8a06e180b3 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1997,6 +1997,22 @@ Sysreg	CPACR_EL1	3	0	1	0	2
 Fields	CPACR_ELx
 EndSysreg
 
+SysregFields TRFCR_ELx
+Res0	63:7
+UnsignedEnum	6:5	TS
+	0b0001	VIRTUAL
+	0b0010	GUEST_PHYSICAL
+	0b0011	PHYSICAL
+EndEnum
+Res0	4:2
+Field	1	ExTRE
+Field	0	E0TRE
+EndSysregFields
+
+Sysreg	TRFCR_EL1	3	0	1	2	1
+Fields	TRFCR_ELx
+EndSysreg
+
 Sysreg	SMPRI_EL1	3	0	1	2	4
 Res0	63:4
 Field	3:0	PRIORITY
@@ -2546,6 +2562,22 @@ Field	1	ICIALLU
 Field	0	ICIALLUIS
 EndSysreg
 
+Sysreg TRFCR_EL2	3	4	1	2	1
+Res0	63:7
+UnsignedEnum	6:5	TS
+	0b0000	USE_TRFCR_EL1_TS
+	0b0001	VIRTUAL
+	0b0010	GUEST_PHYSICAL
+	0b0011	PHYSICAL
+EndEnum
+Res0	4
+Field	3	CX
+Res0	2
+Field	1	E2TRE
+Field	0	E0HTRE
+EndSysreg
+
+
 Sysreg HDFGRTR_EL2	3	4	3	1	4
 Field	63	PMBIDR_EL1
 Field	62	nPMSNEVFR_EL1
@@ -2956,6 +2988,10 @@ Sysreg	ZCR_EL12	3	5	1	2	0
 Fields	ZCR_ELx
 EndSysreg
 
+Sysreg	TRFCR_EL12	3	5	1	2	1
+Fields	TRFCR_ELx
+EndSysreg
+
 Sysreg	SMCR_EL12	3	5	1	2	6
 Fields	SMCR_ELx
 EndSysreg
diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
index 345e81e0d2b3..150416682e2c 100644
--- a/tools/arch/arm64/include/asm/sysreg.h
+++ b/tools/arch/arm64/include/asm/sysreg.h
@@ -283,8 +283,6 @@
 #define SYS_RGSR_EL1			sys_reg(3, 0, 1, 0, 5)
 #define SYS_GCR_EL1			sys_reg(3, 0, 1, 0, 6)
 
-#define SYS_TRFCR_EL1			sys_reg(3, 0, 1, 2, 1)
-
 #define SYS_TCR_EL1			sys_reg(3, 0, 2, 0, 2)
 
 #define SYS_APIAKEYLO_EL1		sys_reg(3, 0, 2, 1, 0)
@@ -519,7 +517,6 @@
 #define SYS_VTTBR_EL2			sys_reg(3, 4, 2, 1, 0)
 #define SYS_VTCR_EL2			sys_reg(3, 4, 2, 1, 2)
 
-#define SYS_TRFCR_EL2			sys_reg(3, 4, 1, 2, 1)
 #define SYS_VNCR_EL2			sys_reg(3, 4, 2, 2, 0)
 #define SYS_HAFGRTR_EL2			sys_reg(3, 4, 3, 1, 6)
 #define SYS_SPSR_EL2			sys_reg(3, 4, 4, 0, 0)
@@ -983,15 +980,6 @@
 /* Safe value for MPIDR_EL1: Bit31:RES1, Bit30:U:0, Bit24:MT:0 */
 #define SYS_MPIDR_SAFE_VAL	(BIT(31))
 
-#define TRFCR_ELx_TS_SHIFT		5
-#define TRFCR_ELx_TS_MASK		((0x3UL) << TRFCR_ELx_TS_SHIFT)
-#define TRFCR_ELx_TS_VIRTUAL		((0x1UL) << TRFCR_ELx_TS_SHIFT)
-#define TRFCR_ELx_TS_GUEST_PHYSICAL	((0x2UL) << TRFCR_ELx_TS_SHIFT)
-#define TRFCR_ELx_TS_PHYSICAL		((0x3UL) << TRFCR_ELx_TS_SHIFT)
-#define TRFCR_EL2_CX			BIT(3)
-#define TRFCR_ELx_ExTRE			BIT(1)
-#define TRFCR_ELx_E0TRE			BIT(0)
-
 /* GIC Hypervisor interface registers */
 /* ICH_MISR_EL2 bit definitions */
 #define ICH_MISR_EOI		(1 << 0)
-- 
2.34.1


