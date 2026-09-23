Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9656C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 12:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RF8RC7IjE1/9gCOu2HQ6jsvEvLwCTuZHEcAfKn1Gzmk=; b=koQAT53J1nGBszsiXa1NNwbAje
	7uBhrLm63lnC4uyyiq26gkIYAF5OZAPIbp0wjq5smjr2KC8QaX1uel/V2VoMlwnBASEcWANHNxx9F
	H3UDQIDqy76JdiAl9y6nKTybhldl78H4wnBwxJp1EZz5VNdFdwGXVGowHfDJNXrGGdUTibgNvAfSn
	Q0q2FWXczuwHzMGkMuarUY191G0tACXhfgePbWGQHguO5ohk+rRO4VTKiWBLg7gFJX9uUr8wTc1WA
	6w2apO+hcNALAWQjyignkXCVKeE3AIVJGJvuCxj+OgXeI3TwjIj8Y+hSEdealLWePK+OGrSJ5MyGq
	tJAYYViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MWI-00000008Jcj-3PNJ;
	Wed, 23 Sep 2026 12:56:18 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MWF-00000008Jc0-3FY0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 12:56:17 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ccff31419so7496015e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 05:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790168174; x=1790772974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RF8RC7IjE1/9gCOu2HQ6jsvEvLwCTuZHEcAfKn1Gzmk=;
        b=SBquUUFEU2u5cbnTffVwKGQm+c7l0+TuDy9+py7OisrO/qd4Xwp7oZ7QPldGe31DIT
         WjVQZIuiuvYXE2foSRna88USI1EJAtg9L2KN1O4EZ4uo892LR6W2xv+z3p01HOEf0zw8
         miXjXWrGeMX5MLAMFntcV6BXFL3029DEq8Q3v/oCrm600TcNXTGiliVciaUhmo4gAuBS
         NAO9zlXVCqh+ua8kHNxeKmoa9QZYWlgpu8uU9crEn9thMIJayWdBnX2Ke+5LjigJbp9L
         0Z+Ax7m/9uwDq84bF3/X3hRTjuGYqBu9KZNKK9ofgthU3mVDWh5irPvV0sHpdxovqeum
         5WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168174; x=1790772974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RF8RC7IjE1/9gCOu2HQ6jsvEvLwCTuZHEcAfKn1Gzmk=;
        b=jVa0FRLgIgLnAwWep4MK+zYJfkMU0ONj2EA/9WxGuT27CXf7704FrfZ3Aq+Px7yarI
         MByDBBEiP0HRxZEk79lVufwiuzjqjNQUm0x7QobrXib4af2zwmturN2U97yXSROH6odZ
         heR37WteZNUFLzphyJJw0sDWSbnjATFuOifJCpzd0nnMKOY7UBQpbwUzL6ToRp95SWU/
         xe4vFV3/iiWYSuiFhS9J0Z034l85JT9K0O4vUacln/VLKc9t2l1xwS7LJFTfKTwazLvF
         nch1qizXxmWIDPojdNl7eur2HgtV5Zo9WlaDk0OrD0E6TBj9TNEtFekKeOewIs8B2RzJ
         P+ZQ==
X-Gm-Message-State: AFuF++l+ksJXoOHWw6eTErKDSXF+AaBSm8n0BXOcsD2AbADrzzcp7DlQ
	LryjV1Ksv/0B/kRJeGcUzdU88xo4KgXfR9NiJqcFn691p/e+3gnrnhUN+kfDAcZoVrY=
X-Gm-Gg: AYBFou2k8VLPLESEXb/Zn3rU5S74JmUSechP7DOTf2LbVg/APvJgSI8uXuWuHSxShxu
	MbyhjkufZr6AmAoFM0OyKRASVv13vOz0X/6apzOWF2Cvi96QMNbCZgwSowjXAkbBNlEWaxCw7Pk
	L4QykskwPin3OaXkWpNJSWDbNDmjUcPylYLGSn2QN58TVkiHMwwphyAzKP6NduzM5tYxL8ws+xB
	aNSCblhAnavTTib6xcG8pOsBbQIvkYNrf7YJiKmB36+s/nOXg4QGjtw52WRsKC3y7/YRbGqZpjU
	cPuVvuKrjFBaR80grpsCVGZvTKs7cyjG92xMZI/vlW8QIkE4Ls6W6IIQCfFwjjO+pGIHWhDkeZN
	iLVYXg3FQNpmtCr/XBx4NLEPKWy9oQ8um/ek85RPFtyOQPDRz59fU3EwOhjPKjq/BgDOq6jW2o1
	aWDPKfrzteuB1OGDxV6/OSDXz+/YMi30miYKrt0Rn17cbxx7UWJfQ4WoIXLIPSRPASQU82PMhCv
	mgxaa7zaA==
X-Received: by 2002:a05:600c:3511:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49fdf101c26mr33109085e9.13.1790168173666;
        Wed, 23 Sep 2026 05:56:13 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fde18093csm86935825e9.3.2026.09.23.05.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:56:13 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>,
	linux-pm@vger.kernel.org
Subject: [PATCH v6] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed, 23 Sep 2026 14:56:04 +0200
Message-ID: <20260923125604.2482-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_055616_222342_AF351115 
X-CRM114-Status: GOOD (  15.27  )
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

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Shift the u64 product and narrow only at the return.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
Changes in v6:
- Drop the cap_scale() change. As a u64 static inline in a shared
  header it would cost future 32-bit callers a 64-bit multiply that the
  macro did not (Will); the truncation is the unsigned int temporary, so
  drop that and leave kernel/sched untouched. Will's Ack on v5 not
  carried since the arm64 hunk changed.
- v5: https://lore.kernel.org/all/20260917182059.2851-1-okerixx@gmail.com/

Changes in v5:
- cap_scale() as a static inline taking u64 in <linux/sched/topology.h>.
- Patch 2/2 of v4 dropped in favour of Ananthu C V's series.

 arch/arm64/kernel/topology.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 55bd8fa3e95c..928079332fe6 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -186,7 +186,6 @@ int arch_freq_get_on_cpu(int cpu)
 	struct amu_cntr_sample *amu_sample;
 	unsigned int start_cpu = cpu;
 	unsigned long last_update;
-	unsigned int freq = 0;
 	u64 scale;
 
 	if (!amu_fie_cpu_supported(cpu) || !arch_scale_freq_ref(cpu))
@@ -245,9 +244,8 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
-	return freq;
+
+	return (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
 }
 
 static void amu_fie_setup(const struct cpumask *cpus)

base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
-- 
2.55.0


