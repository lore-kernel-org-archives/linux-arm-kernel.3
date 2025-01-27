Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2945DC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 22:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eB/WXdYtPvN5Ab5ru245YZuFbSt2Wl8WSfh8CIWhE9E=; b=l3gzOxg3+E2//GuEUu5krTVOAF
	7PK/Vj4LMQr1PsdJJi3S+vKFiEcPIknFiArEa4rT4qRXK+ejw02Yv/MHGdgLHljInOHCyHdq4Xmi1
	WuOl4PzTEnxlsz7FM6LdINLPA0RxmLFFkbp+M7CPnDcxURum4BrQ5QOQMN+XwYNuXLLZ6/AU7LuiH
	8bXbLuWYHOOkATFfeP5I8f1nJh/176EFFlAEMVuvGTWYp2hm5JStLHucl8CGYWRghVhkCBcWkRIkl
	MGeTmxPENLNDtnBr06hlQ3IJ7QAaqpmk904K8CrGbkQDm47y7MDAm3OZ8PCMV8uDeiFdDNffUNkx9
	fPWFSvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXb9-00000003PO5-1fQB;
	Mon, 27 Jan 2025 22:28:51 +0000
Received: from mail-il1-x14a.google.com ([2607:f8b0:4864:20::14a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcXTT-00000003Ndi-1iy1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 22:20:56 +0000
Received: by mail-il1-x14a.google.com with SMTP id e9e14a558f8ab-3a9d57cff85so93449395ab.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 14:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738016454; x=1738621254; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eB/WXdYtPvN5Ab5ru245YZuFbSt2Wl8WSfh8CIWhE9E=;
        b=kgqsuQ14lP+4ooITpHUzYBXO5hNNr+JqiWovnYqB885K80qIzzYEf+UMIbD5bdKsPO
         QBDPd9Z3XGd5w7pP9VZpKSGAvOCd5B8FB4s5fJ23X26WPH77J5z/cLtiRcxoBszsj+DU
         pJk9GVVA6Mf+WHbFyFEUS7qLPXxdyIoBacZdc7XTLzENK9brxuDUN+Uk2dWX0CqemAfd
         e7Ry3o0IOqct9EXNoRrTu2WTKoSVNALDHzkAGLn+GKxPcDe2DCxMi3Bh5HUUYh2ALykp
         T0HLStIk6yufdLCC1SnRzK+IPcALUjp5Y5zj1Gx2FICxH+Q1ETyLZFlcyr/VPyNsXk8J
         PMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738016454; x=1738621254;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eB/WXdYtPvN5Ab5ru245YZuFbSt2Wl8WSfh8CIWhE9E=;
        b=inZDFqPryU1oi/Ptp0a1Q+M1wUydzyfFaN3ahNePzAjaFdGUsx5eVWSbPyelzWYvab
         tgjx/lXGjd9Ydl3g2skOnLnrLSYu8+vsnZoN71o44NEZK9ONBtXLw8WIgzIGkWb7su3W
         Eup/nuySvJ0+HgOQKmVLhdfg5xZupZcrGeye/cSEJi6kSMgPMeP4LN9RmfmLP5qyYYVb
         ZdBIDXZ79R5t1XZsy5awhQN8SFZ1K9hfvoC12uhBP2nTG8IIWcEIjuFt6IY30kZqg15F
         exkFpKvzGqfAumblyGcCiUgM3QdoaMVgbEM8pSXcWpSdIzQz1X7tPVuA3rqfoX7G8/QO
         Xfzw==
X-Forwarded-Encrypted: i=1; AJvYcCWNx0A3WQgVbFS0jbxhLXXAdgjNtFpZQJWu69IJdqt0mBryTZok7gCHYQUdhTZCzI56jKWGwQqAE37PrlBFDsfj@lists.infradead.org
X-Gm-Message-State: AOJu0YwlLcaSuk+WijcNlWpCVccKC2AXcsjXe5au08ugVwoka1b3STC5
	EUfb7YRdbEA6NDnSESwX5LxVOzp/amy/L69Vu9PjSSHhibuKqsvc4TnK3jbZo1Rc7JHZbYu4sdl
	OvHx3pyKEdvU9kqbl11acfQ==
X-Google-Smtp-Source: AGHT+IHlnPj0B51G4F3gaUMK8xZM3/o5eoR0afyVhEDX9mUYzTDBYrn3lVxOBnfUacMgZ4+x5YUCgf5OnSaiN01GgQ==
X-Received: from ilbdz9.prod.google.com ([2002:a05:6e02:4409:b0:3cd:deb8:6a64])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1fc9:b0:3cf:c88f:7555 with SMTP id e9e14a558f8ab-3cfc88f7680mr123300885ab.17.1738016454065;
 Mon, 27 Jan 2025 14:20:54 -0800 (PST)
Date: Mon, 27 Jan 2025 22:20:29 +0000
In-Reply-To: <20250127222031.3078945-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20250127222031.3078945-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127222031.3078945-4-coltonlewis@google.com>
Subject: [RFC PATCH 3/4] perf: arm_pmuv3: Generalize counter bitmasks
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_142055_447164_03DDE40D 
X-CRM114-Status: GOOD (  11.48  )
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
index d399e8c6f98e..115ee39f693a 100644
--- a/include/linux/perf/arm_pmuv3.h
+++ b/include/linux/perf/arm_pmuv3.h
@@ -230,16 +230,23 @@
 #define ARMV8_PMU_MDCR_HPME		BIT(7)
 #define ARMV8_PMU_MDCR_HPMD		BIT(17)
 
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
2.48.1.262.g85cc9f2d1e-goog


