Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7215AC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 19:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbnJYyoVJc3D9vRYHg6DaJudE2uBzpyQ/LXCAOcJbR0=; b=saekdh8Dsi9FtcVyMQG63U9mM7
	NaTiaKQJNdpnizgVvFvNR0/BWjg5qmvwHL5KkTw0bYFsSI0eaQhwZaxtNhEFl1pd4SMqHD88cx0DX
	mWKzCCGfW7bLjg1v16GeCyYc6dFAxVh7iz+6dSMVgyJe95qTel2ykLy0d/THbCwiH0beuzqEai0jR
	JLDWGzMqdinWjGjXK/JyOx4+DJ8VEK4bKaK2gaW703lxVcNkbwsuMds2fbdj42p8DmG+MNSfs22MX
	W9lUVnKTY6/xhxRORgmEP0v0qJJ2tntME7/JTLiF9dUWdLxDEBDS+FR5/KmQKwpqVjLopqEC6pNgU
	P4ewZ8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tieby-0000000CLiE-3gf0;
	Thu, 13 Feb 2025 19:10:58 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tidaU-0000000C8hc-3Jwd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 18:05:23 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-3f3df5dfbd2so380669b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 10:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739469921; x=1740074721; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bbnJYyoVJc3D9vRYHg6DaJudE2uBzpyQ/LXCAOcJbR0=;
        b=A/Q/PF1zBKSpDKCVGao0d42r8HKsFGlWkjI/A28MCDwvj6eFrfDrKd+tWpDUjk0Su/
         EaVVvFdvRboQWPdqyHaHu8SjBgczk39nBxJQEwuBRMGt3/evWnFlmYoUMo46EdW2qai3
         DesrPyG7O/ImUqKJDae7f2EEj2U19OpRZCk6O4xHPles7QNL/eMpFL+QW/rKkjSqfLvW
         n9lu3/rzBYSkuRVN6vi/J65bMjlyp3UqVzjnhNI8LTQ0uzkSz+sjnhtm7UvZri1E+rED
         6sXLdgLLm7vbd2Jlt3Oj4Gqksle3l/MT3km2ZdLHf2PBPhoDmRWEILwyQcqMgS8FmTIF
         4jJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469921; x=1740074721;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bbnJYyoVJc3D9vRYHg6DaJudE2uBzpyQ/LXCAOcJbR0=;
        b=ITDJWQMzVKeyi5ACIrwBsCKbZaFQRdW/JGRXqx57D/2NffWr0rJh00aYPpla++f3ep
         Yb5W5m4v6tJBZxYxljk38kZBbUnoN4gTLGluIEio58hRLOyToLqcnaIuzT3wnbvTtA/d
         ewbB3sz1FZRu9vco/08F5LxATlZYU5ypCrhwgWXhRf6hvIGPRTdJlGIfPcNAwO5fZtJF
         4q2LS/dMGw9fIOWwaEIw3TSDNZWNWDsmrhk/zTZYq5JPNiHr1eF50KMzZdFFg13AlR2B
         TWYDQlwnykY73/fWY7hufH5kcecyHSNOx0KsJYE1J+flUcXZEnkbNj21bvRr/rHU2Dl1
         yPzA==
X-Forwarded-Encrypted: i=1; AJvYcCWKWnvy+IkxiscpfysjsW5bT/0Jdeg/NRxHyGBdIVgr4Lh5gVejASIXYd9u8y0JwAb1mI25f2dxypZPO+7+kSrs@lists.infradead.org
X-Gm-Message-State: AOJu0YyuRwoH5u4Zj8kVL5VkoeCj77X9AmsVynAJQ7qJwId5wnA29OKY
	Yiq3KDOQl+d3ZGwtxfLInMPNQJkKPUwvGrt0Ij0n/oHRXNKp9sLmTJ2Huhnt1Qhngh+HRNA09Xx
	vK2wV1z60e74qCmRgaF+rcQ==
X-Google-Smtp-Source: AGHT+IF2I7xGWAZbPu73m/0jZgOAhV4gawbbUKrOiVZZ7yZX4HGebgHLSfWQvDaf3SHQjpSi0BuBMnr+ogGJwijyPA==
X-Received: from oiww6.prod.google.com ([2002:a05:6808:4d06:b0:3f3:ca1b:13d8])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3c88:b0:3f3:ca45:4315 with SMTP id 5614622812f47-3f3d8dcbdabmr2920400b6e.9.1739469921296;
 Thu, 13 Feb 2025 10:05:21 -0800 (PST)
Date: Thu, 13 Feb 2025 18:03:15 +0000
In-Reply-To: <20250213180317.3205285-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250213180317.3205285-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250213180317.3205285-7-coltonlewis@google.com>
Subject: [RFC PATCH v3 6/8] perf: arm_pmuv3: Generalize counter bitmasks
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
X-CRM114-CacheID: sfid-20250213_100522_831900_0058C39D 
X-CRM114-Status: GOOD (  10.83  )
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
2.48.1.601.g30ceb7b040-goog


