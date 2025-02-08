Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13889C02199
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 02:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4O4akjcxYhNwCefv175mmgU5vTvI8B0CXOe+M7wmIh8=; b=IMaYaRNb1rIFf3s36hI5oM2xyg
	1U2hwjCDUhcpY1tcxSeLLZCX4L/74O7bgAqG4h+HOKQYAc+4XhnfqTyrMjjB6G6Dy3mV/vA14yRED
	eHPJNTf3KtnBPbTk6ZCzFtJMoLw0ZB5FGFfEIWWKzZmvX65xxX4HQMr59o1LICdaTShjeFIfjvaMB
	DfKKpBNjiNhDYUCukuLZE+UukGu3VZAofIi8+yZj0qZg01NjV06OXIN6RdfvoMPbeSEWUq8roqHeU
	GOB/U1MtAIDAbG3iEU/D3R+YwUVC4FolUSnGF01vJdBRx7Bi73T0kuvkv+xUsIg4LxYqn0k5paXu0
	Es4pJHUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgaEy-0000000BsOd-0UrY;
	Sat, 08 Feb 2025 02:06:40 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tga9t-0000000BrM6-2jC3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 02:01:26 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3ce7b6225aeso48142325ab.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 18:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738980084; x=1739584884; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4O4akjcxYhNwCefv175mmgU5vTvI8B0CXOe+M7wmIh8=;
        b=ZiEax8uRrXMSx7tnMKwiYq/9fX6Q2Zo9wuLTG5P2hdedb4Dzl9SqIOZRp9/37C8HBP
         KV6+X0GDcU4+8kAaBPpyAcnu0X1ErAorDZZSD+a62AHg2nN+QAhYHO7wlwbrz4c5jG7X
         b34YJqD78EevAgP+lFjlTNbL1XBmeUyGgySGHfbsS7FmfRgJX8i7q+9b0bs2uWZj7CjK
         rR6fqb6xBQDNkdGKZb7NsHs1nFNM6ZgyHGUR7beS/UdRZis1/JuroUmahW5Ke3pWCMFT
         S8Q8HJHCAzo/LDtPYAtkYyNLboevs9E8LufiGtjft8FWeSgFGrjGIckzMUkHT//BoE5+
         8ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738980084; x=1739584884;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4O4akjcxYhNwCefv175mmgU5vTvI8B0CXOe+M7wmIh8=;
        b=j+DPip/3D72GyWDoAprm8rPGRtR7x5AJhr1T2k2PejcbC+OirDh/YvaaqIItBaZd+p
         LOOootehf7D8uHRqIVw6ohn1D/C6A0Tbfj/VKLQh33zt+r3VmcW2fgBuNvfZK3ta2ihY
         CdVd5jBEukQF0PtO18snDRMxZUOV/4WI3ed3qkF4wbRdK2o+Aa2Wqw0RqTyzrsaXckYz
         ACaPHxP12Qbc/7MC4eet1NVV3M0h7A2xMoH7tv71BKyAuKIK3+AFWmn2+5xfMmPc2lHZ
         HbPbeJpal6Bs9UYc7s9xkoUj/O6a9X0yOTJJ+0/Xg8+t/OETPHFJuYE4MeIE1acjDw2k
         8uAw==
X-Forwarded-Encrypted: i=1; AJvYcCXdytQtz1gvUf4G56xWH68lykCGeQfmC5UV5w6XwCbyvAY3bm6UskITtm2IRe+/WO4SdA02hIhLp3Y4lldej4+C@lists.infradead.org
X-Gm-Message-State: AOJu0YxOH9feBb8xRWn4ROS059Tob+5GIP2hSlNeVG22hNJwz9vrTOJz
	gx8ykwqZxhYLRJ+MBrmtFzCFNW60Ea0JZtob76tjJvixcEGvR3Q6ezjwJj1FJrPnpjoif0fIzGM
	bwouMqTU2xJi9Fdop4daFSA==
X-Google-Smtp-Source: AGHT+IGWeZpc2qa1ckU4PjgV51Y7Hx9W1wQ1TYRDVmT/vQly3n2guK7Orb67xhImPnqLeWrkenED8+oum8nOVfQ3mw==
X-Received: from ilbee27.prod.google.com ([2002:a05:6e02:491b:b0:3ce:69d1:ce53])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:17ce:b0:3d0:1bc4:77a0 with SMTP id e9e14a558f8ab-3d13da22469mr48897165ab.0.1738980083677;
 Fri, 07 Feb 2025 18:01:23 -0800 (PST)
Date: Sat,  8 Feb 2025 02:01:08 +0000
In-Reply-To: <20250208020111.2068239-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250208020111.2068239-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250208020111.2068239-2-coltonlewis@google.com>
Subject: [RFC PATCH v2 1/4] perf: arm_pmuv3: Generalize counter bitmasks
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_180125_708181_1903E324 
X-CRM114-Status: GOOD (  11.31  )
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

These bitmasks are valid for enable and interrupt registers as well as
overflow registers. Generalize the names.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 include/linux/perf/arm_pmuv3.h | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/linux/perf/arm_pmuv3.h b/include/linux/perf/arm_pmuv3.h
index d698efba28a2..c2448477c37f 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -223,16 +223,23 @@
 				 ARMV8_PMU_PMCR_X | ARMV8_PMU_PMCR_DP | \
 				 ARMV8_PMU_PMCR_LC | ARMV8_PMU_PMCR_LP)
 
+/*
+ * Counter bitmask layouts for overflow, enable, and interrupts
+ */
+#define ARMV8_PMU_CNT_MASK_P		GENMASK(30, 0)
+#define ARMV8_PMU_CNT_MASK_C		BIT(31)
+#define ARMV8_PMU_CNT_MASK_F		BIT_ULL(32) /* arm64 only */
+#define ARMV8_PMU_CNT_MASK_ALL		(ARMV8_PMU_CNT_MASK_P | \
+					 ARMV8_PMU_CNT_MASK_C | \
+					 ARMV8_PMU_CNT_MASK_F)
 /*
  * PMOVSR: counters overflow flag status reg
  */
-#define ARMV8_PMU_OVSR_P		GENMASK(30, 0)
-#define ARMV8_PMU_OVSR_C		BIT(31)
-#define ARMV8_PMU_OVSR_F		BIT_ULL(32) /* arm64 only */
+#define ARMV8_PMU_OVSR_P		ARMV8_PMU_CNT_MASK_P
+#define ARMV8_PMU_OVSR_C		ARMV8_PMU_CNT_MASK_C
+#define ARMV8_PMU_OVSR_F		ARMV8_PMU_CNT_MASK_F
 /* Mask for writable bits is both P and C fields */
-#define ARMV8_PMU_OVERFLOWED_MASK	(ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_C | \
-					ARMV8_PMU_OVSR_F)
-
+#define ARMV8_PMU_OVERFLOWED_MASK	ARMV8_PMU_CNT_MASK_ALL
 /*
  * PMXEVTYPER: Event selection reg
  */
-- 
2.48.1.502.g6dc24dfdaf-goog


