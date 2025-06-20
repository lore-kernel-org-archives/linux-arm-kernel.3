Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58301C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8bfLeP3qqrBDCFJ2FU2DOZ6I9ab7gAt7xxGlDeoSjE=; b=UwF3GtSBIkJyE9BOV3cxVkr8rR
	idBf1xUlis3dNXQFA1ovmn0Dh4Cr+mjYqmlH7UtOSBgxiq96yRjjQSAAK2vABvj2xOtyAsdAeY0e+
	LfXa2Qm8ZFNMXDPtsx/h1ES4QAXedGsEqU5sr8lUIou1kc1bHiO+l7uzaZ9omz8b/PYPWz7fT6iHv
	xcPC8FzJPzA3l0kGEwIZ/mngvvhmM5nQyBAgg8GAbgwDVkzx8Kg29/yW67uwir/Vgg5wl7UDEsUZt
	4GnE10b3Fb01RVqTb3InaskcJfDut2KUFVIBjlttpaVtz3duRMoe8szsnHBqMPLZvgIvZKgjWtpXg
	i5W675Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSkQO-0000000Gkg8-3mve;
	Fri, 20 Jun 2025 22:41:32 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSk4M-0000000Gh38-22L2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 22:18:47 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ddc0a6d4bdso26392125ab.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 15:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750457925; x=1751062725; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8bfLeP3qqrBDCFJ2FU2DOZ6I9ab7gAt7xxGlDeoSjE=;
        b=pWMfSLOkEaoxifXa/52XGWHd+4f7REH1gsV52CkgW73yhAL1VpnUS77CkA7z2SiJfE
         fsrJrvFGMLLkppzsDM4kk1lbB51F5JRK2p8PsNAB9gqlFOxUBI4OMhbuWBuIXcNla6QR
         UOGEzdg0r+ksEYnDR6Vn+yC4+rtV81K0ZWWJiSjmNSUXTnwuYSwMoseanY1xfvxR/G1o
         aEpYTQGw5YnJPqow2TjmQdJjP/OjroyuiPjyuUDOOiH1+bXn4nZoJlFpWxZmX/J3U+5R
         GWwhvfltZx2JyvAZ/7mxQObJSpvjej/UqpTm/lKIE5SHhgqFO/MrEo7HsxWvuE+Fu5+P
         4aCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750457925; x=1751062725;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W8bfLeP3qqrBDCFJ2FU2DOZ6I9ab7gAt7xxGlDeoSjE=;
        b=M0BvSmkRNhZdPYzO0/qJK91oyovBNiEvirlHZQrqlrvRy3tYzDWsM84PwLh/QBBCBJ
         ehU70Lg+Ycn1naPOjhHy9NEbCj2+dNi00AcnUFEkSqhGeO4bnGbnWJ9sA/8uYyNIMAor
         I1NvEsfm1drbHcwuTCc04/QgZzUm7+Ty8AizFTSpZMi2dTqm6/UiMvHVB5eypnlVT1YD
         V44kXW6rtsdsR4iWr0tQrTX6bu6dwsaDiWPq2aU2sf9Im7n5Ba5zxHBVJGkB6u4lDACj
         QrrlpgDi8uD0/k45+0H1rzda/4Ind0t/bg4FgzBdQrG1ciCKeIC7JVhSNwvCE/RxYEA4
         BYGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYhTBPRgBEJZNtlit3fNtzCg7UPpdVz4tzC5/mfZxb+h2NHlQCUcaiuyUN//n869T8yicz45O1DX3UEUMw5run@lists.infradead.org
X-Gm-Message-State: AOJu0YwN0DU9bYIT1fbBhSdZH0uWXJUXShYbT1BO0a3kvXhG+RoqMLHc
	DfQoleLEQZDKXOLofCWfZ7D6p6v50DD0hDUggIv4+IkCBVh8w43GWKlNUpEDIYIrDIMqITx1ZFS
	VCCm1liFfjuOOhOeluRRQ1T77gg==
X-Google-Smtp-Source: AGHT+IFNu9JHRQIB7XTy2Ob9SNBqkVdGcONXmzfrAwfGHzD/c/g9AEFFIMXAac8kpjhLkSQL3RhwV1XbrB993VdGhQ==
X-Received: from ilbeb7.prod.google.com ([2002:a05:6e02:4607:b0:3dd:f56e:32fc])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1b07:b0:3dd:f745:1c1a with SMTP id e9e14a558f8ab-3de38c1572dmr55614125ab.4.1750457925391;
 Fri, 20 Jun 2025 15:18:45 -0700 (PDT)
Date: Fri, 20 Jun 2025 22:13:09 +0000
In-Reply-To: <20250620221326.1261128-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250620221326.1261128-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <20250620221326.1261128-10-coltonlewis@google.com>
Subject: [PATCH v2 08/23] perf: arm_pmuv3: Generalize counter bitmasks
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_151846_548108_32271F78 
X-CRM114-Status: GOOD (  12.15  )
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

The OVSR bitmasks are valid for enable and interrupt registers as well as
overflow registers. Generalize the names.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 drivers/perf/arm_pmuv3.c       |  4 ++--
 include/linux/perf/arm_pmuv3.h | 14 +++++++-------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 26230cd4175c..e47f5953928a 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -518,7 +518,7 @@ static u64 armv8pmu_pmcr_n_read(void)
 
 static int armv8pmu_has_overflowed(u64 pmovsr)
 {
-	return !!(pmovsr & ARMV8_PMU_OVERFLOWED_MASK);
+	return !!(pmovsr & ARMV8_PMU_CNT_MASK_ALL);
 }
 
 static int armv8pmu_counter_has_overflowed(u64 pmnc, int idx)
@@ -754,7 +754,7 @@ static u64 armv8pmu_getreset_flags(void)
 	value = read_pmovsclr();
 
 	/* Write to clear flags */
-	value &= ARMV8_PMU_OVERFLOWED_MASK;
+	value &= ARMV8_PMU_CNT_MASK_ALL;
 	write_pmovsclr(value);
 
 	return value;
diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a2..fd2a34b4a64d 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -224,14 +224,14 @@
 				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)
 
 /*
- * PMOVSR: counters overflow flag status reg
+ * Counter bitmask layouts for overflow, enable, and interrupts
  */
-#define ARMV8_PMU_OVSR_P		GENMASK(30, 0)
-#define ARMV8_PMU_OVSR_C		BIT(31)
-#define ARMV8_PMU_OVSR_F		BIT_ULL(32) /* arm64 only */
-/* Mask for writable bits is both P and C fields */
-#define ARMV8_PMU_OVERFLOWED_MASK	(ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_C | \
-					ARMV8_PMU_OVSR_F)
+#define ARMV8_PMU_CNT_MASK_P		GENMASK(30, 0)
+#define ARMV8_PMU_CNT_MASK_C		BIT(31)
+#define ARMV8_PMU_CNT_MASK_F		BIT_ULL(32) /* arm64 only */
+#define ARMV8_PMU_CNT_MASK_ALL		(ARMV8_PMU_CNT_MASK_P | \
+					 ARMV8_PMU_CNT_MASK_C | \
+					 ARMV8_PMU_CNT_MASK_F)
 
 /*
  * PMXEVTYPER: Event selection reg
-- 
2.50.0.714.g196bf9f422-goog


