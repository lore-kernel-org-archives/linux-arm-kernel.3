Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C828C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 08:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y6FPOvM23OlPkDouxPQ9OlptW9eXBsYBVcbdP2w7Tj4=; b=U37sajQ+MNtkZUhEZhQUc9bfLA
	/ZxLWHBWl9oPO9bA3hOVAvNV1RPOWzXmMOUXy6uyxzeYiLLF4tr4i67QtqfFMnrHXNrKdQDBPpe/Z
	hy+e2UArkQvRz3N7V/fYrekKwM5OLaJaLrPkWYylNXqYNd8xxiAdsfbHOogcMnaJ6WUlz+pzD5xiH
	ODsl4+klYnl/Eg9KaTMK7itLmcmELpRU5e8QRb7TAy5bNbMg26IHDgiVcmi8RaS4Sb/AkXAKBwVrC
	Ik8PIXWTqloWoAX8P1PNP2+GZqB3jTKTz0KMTgVHpBmoRsrG3UqMqsxhg/QbBjCgH4vs0WW4sQWDp
	HcTlI/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ii9-00000000gCP-2VAW;
	Sat, 12 Sep 2026 08:03:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5Ii8-00000000gCG-18nb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 08:03:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3340960218;
	Sat, 12 Sep 2026 08:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0EC2C2BCF4;
	Sat, 12 Sep 2026 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789200222;
	bh=ILKNp+WUMz7m60Cj2U3b3QKfAIuTdzWdXrka2tpZqXw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=bkZiD4uF5TCVrUKm68zSiu3UsGrSnIROJB8jRqeUX0SgnekRupH45MgAKqAVHFzhn
	 uVOVmxgy4NCSHafnrSf+sICm8tSeYW6jG1ziihWox+nY96AmlBZ+KoA3qf8mjbVBjv
	 o9QcxiNQnyKwSXX9mk6879UnB9WzT8bk658znHSEuh+GX/Rlq5CrUylHVvhYbcKflu
	 +B7KKIAJ3i6EvnaAPvVhmsU+fEiUlAPmfmK2+LIS/3XLuFk+oh9Ah4IiDK/A66yxW5
	 rXGP5taFECRp98rp2yAX8taCg+51fiipg1DhzM03AZTQ2XNlqzV0EW2C//7B6+acKf
	 9YKlDMmbU/0Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2F1C88E4D;
	Sat, 12 Sep 2026 08:03:42 +0000 (UTC)
From: Myria Sarvay via B4 Relay <devnull+myrialsarvay.gmail.com@kernel.org>
Date: Sat, 12 Sep 2026 18:03:35 +1000
Subject: [PATCH] drivers/perf: apple_m1: Add macOS 27 M2 Event
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-m2-9f-pmu-name-v1-1-da682557453c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB3QKajjVYoLm07aEZJKYkQQ7
 96oy7f4f4coQSVCX+wQZNWoP59RlwWY7+g/gvrOBqqoqbgmdIRscXYJ/egE246NbejBtmXI0Rz
 E6nYNn8PtmF6TmOW8wHH8AWdXnI5yAAAA
X-Change-ID: 20260912-m2-9f-pmu-name-789cf6239f79
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 Myria Sarvay <myrialsarvay@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883;
 i=myrialsarvay@gmail.com; h=from:subject:message-id;
 bh=WE/9S0PEWj724ZfvllqIPRhYse7Qz5ha7AiDrC/FTsg=;
 b=owJ4nJvAy8zAJRbk4iixYu2/l4yn1ZIYspayxz65P616LZ9MUu9hz417PhrzyN/98Wr2pZPXq
 g4Kqv4IMn/eUcrCIMbFICumyKJvmqY9ma3hUuky1y0wc1iZQIYwcHEKwET0rRgZlv4v+ytisH/V
 bqWbC7UP50ttuHTvbs7Vdjcvb+b+oMU3lBgZdvy9F5kzfcrGTY6/DLfXWXYdFnbz/DBZV4Jt0QP
 NvyEKzADqTksT
X-Developer-Key: i=myrialsarvay@gmail.com; a=openpgp;
 fpr=2F35662B930680D275A645B452444118A8ADFEE9
X-Endpoint-Received: by B4 Relay for myrialsarvay@gmail.com/default with
 auth_id=1027
X-Original-From: Myria Sarvay <myrialsarvay@gmail.com>
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
Reply-To: myrialsarvay@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Myria Sarvay <myrialsarvay@gmail.com>

This patch adds another known PMU event that can be found under
/usr/share/kpep on macOS 27 for M2 macs. INST_SIMD_ALU_VEC purports to
count "Retired non-load/store vector Advanced SIMD instructions", and as
we already noted, can only be registered on counter 7. Though this event
only shows up on the M2 kpep records, it can be set on M1 CPUs, and
records something.

Link: https://github.com/0ax1/apmc/blob/9cff99a9df2ae055f1e3065c64f633e38bb6beec/counters/m2.md
Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
---
 drivers/perf/apple_m1_cpu_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/apple_m1_cpu_pmu.c b/drivers/perf/apple_m1_cpu_pmu.c
index 81b6f1a62349..1f73c8a77462 100644
--- a/drivers/perf/apple_m1_cpu_pmu.c
+++ b/drivers/perf/apple_m1_cpu_pmu.c
@@ -81,7 +81,7 @@ enum m1_pmu_events {
 	M1_PMU_PERFCTR_INST_SIMD_ALU				= 0x9a,
 	M1_PMU_PERFCTR_INST_LDST				= 0x9b,
 	M1_PMU_PERFCTR_INST_BARRIER				= 0x9c,
-	M1_PMU_PERFCTR_UNKNOWN_9f				= 0x9f,
+	M1_PMU_PERFCTR_INST_SIMD_ALU_VEC			= 0x9f,
 	M1_PMU_PERFCTR_L1D_TLB_ACCESS				= 0xa0,
 	M1_PMU_PERFCTR_L1D_TLB_MISS				= 0xa1,
 	M1_PMU_PERFCTR_L1D_CACHE_MISS_ST			= 0xa2,
@@ -150,7 +150,7 @@ static const u16 m1_pmu_event_affinity[M1_PMU_PERFCTR_LAST + 1] = {
 	[M1_PMU_PERFCTR_INST_SIMD_ALU]				= BIT(7),
 	[M1_PMU_PERFCTR_INST_LDST]				= BIT(7),
 	[M1_PMU_PERFCTR_INST_BARRIER]				= ONLY_5_6_7,
-	[M1_PMU_PERFCTR_UNKNOWN_9f]				= BIT(7),
+	[M1_PMU_PERFCTR_INST_SIMD_ALU_VEC]			= BIT(7),
 	[M1_PMU_PERFCTR_L1D_CACHE_MISS_LD_NONSPEC]		= ONLY_5_6_7,
 	[M1_PMU_PERFCTR_L1D_CACHE_MISS_ST_NONSPEC]		= ONLY_5_6_7,
 	[M1_PMU_PERFCTR_L1D_TLB_MISS_NONSPEC]			= ONLY_5_6_7,

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260912-m2-9f-pmu-name-789cf6239f79

Best regards,
--  
Myria Sarvay <myrialsarvay@gmail.com>



