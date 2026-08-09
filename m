Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EC2C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 18:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YhvKoEmbzO9xRY347E/hep7IU+OetLnrtlwgXtGEXas=; b=nq5XFcfHYPqjG2W/EKETjE+73T
	x7JZ/0C3b3WyPSY/ZgVSgguI30HhaON13K9JZTSwctZJdsVvgSlHILMJADXquw7vRPs3C8pz/Kt1/
	uLKpI4ru20oUJCm//xQaR/cC43OSMrrOLZK5gxmFo6uHXMOt3yyF+HWE2NtbeZW/BJltmvz6oRwOZ
	cinMsMJi1I7vjuu0RiXKFGUZkCASaRaeWW8ZyYUFHIASXK87AkixBWg0S93xyOZJlCx4s8qLqo8eH
	v7kTKxAI4v97Xi8cX+xSiEbhLsNS33bVa9Tems5aQ9fKJxM0KSk7o4sO9okjMuUkmGVYGG0CJDcNd
	m/xfOFsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7uW-0000000AZE8-43ld;
	Sun, 09 Aug 2026 18:06:12 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt7uU-0000000AZDn-0dio
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 18:06:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so318488f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 11:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786298768; x=1786903568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YhvKoEmbzO9xRY347E/hep7IU+OetLnrtlwgXtGEXas=;
        b=FC9/XVr8bKN5V1ZgHbAKuuTMc2VUOVSliAOl7zpXMl66vj4CKksoFDszVAzC82vxvW
         oj79cffzd0bGxEL51+d2CL79oWZIkhOh1u0ndHTRLfjMiR6X4oycSzyGurIIcU3z6dkd
         xMsxw/8M98kLCirsMacBs9kYO1KtTLemxscxmqOc+ljqOQWYIYUKF1gXaEAwg6xlm/LV
         8cNHM2NrXKXBeEEHCr9W5EyrP9TBMxCBgkfL64+eE3yuDpeezlzSRa35YE595KRY4cRi
         xZRJFLhSURMl3Uo23p04aJerRF7/yVu2v8r6iOUmZF1HIWRdWSNj8NuzCrQiTHHYkBu7
         RI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786298768; x=1786903568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YhvKoEmbzO9xRY347E/hep7IU+OetLnrtlwgXtGEXas=;
        b=DYId2Q2Vy3BL8iCyViOisvE8tc6psUv0gh7aUqfILDuFxX1Vtg/b3GRC1VROnwSdnT
         FemU3hmDl4EvX/LbxImVRIIXK7Jv1AP2NSBNafXvMLVBwiMTJQBX6n3vRyrHrH1jn8oW
         MtLdH+Nt+Ia+czA/og20sckJTcjr+aS7vZ2LTYPVn61+vW1lnVuYbXW/T7DDVlvJuWIB
         RMbs3WYYa300QkOhO8hEXWnLjyTGGnxSIkaGodLB/RSyY4gilCfw4mhb7hJRGHi3yWaf
         X5S0FjtgggBr3Qy4cY1ayZb08ZZ9g3KhjeTRsd8ZUWiUYtfGaSqQ4UdzuxTFaXPRm1bA
         ZGtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoqZ8rXH/KDIu6hLk1DnBZ3KfVc47sIOUpBSPXrqjzy8Z6LuPhK3cZpHKLQY64vTXiy+4SZv+ZR2Pue+8HLNORN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf82RPAJe2ByTLknN6yNuOGc27hG3K5pL1aD6V7xD6pcMNbwvo
	8FFlm5x4Io47Cz3PbFqkQmzLxgzBH4nGOv9vtYi4pKZNn3qguq615ob9B4wDokxj
X-Gm-Gg: AR+sD10ggYafL7pWUJhuih+hdvalyz7yKIzPeqRfe+omGeIQsIL2EeziWpxzs+HB1ZJ
	IiG9z+D07rFxXaueA/51nny7L1uay9VRmeAk3F5Oyk+C7wIT9QwdrV7rgGGkY++BcOCyERC4YsR
	cnui5ahPn1Pmem7nvx1s+FikeR21vHbiexX1lQdgG1mLR1GZJnTkuhA0fOxENo1pD2Jk+mbfHP/
	1noDQYu1DgbhGeDB9lMYSJZSI/0fRoSTEnyqcK/u/+dP5ayoQTB0yRK8/tJfFlTx/4sgAm/s74/
	AfBgU1rviviHWGuoTMPRK3B4gIvJIqXfwipi6kVse7Hk37pzdEu9qAN29aCl9LcpG5oWn3OfSA1
	UojOLiERqj4jc5WLNVUjsNHykOw7m2ISAbaxNRxOku8Rf6Ff/Z8ANLu49dKMMEDv6GjtHzw8EUY
	vDuw4+kAOpFX//lruFEUHSun1js9QoYLG+VUG2AsOzug9QB6XbwXks0DkbvzQUe0O65h6iPC+yS
	n6Hn4Two4SDeOvWxZOew/2TYm3O83PJzln4mwlq478ejtzF33At3pRBJDqv55XZmKEi1eJ1rzUQ
	Cji81pz1jFQUoQUbtOlW8DGWODRoBVJ91PyCB9sqZHtirhysjwUdIdC7V5yPmMkE96qtERefT9A
	RvVQIOw7sdxuyeHet8bzgqOU=
X-Received: by 2002:a05:6000:4615:b0:47f:81c4:36b4 with SMTP id ffacd0b85a97d-47ffd91871fmr38818849f8f.14.1786298767462;
        Sun, 09 Aug 2026 11:06:07 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-ac88-a501-9c5c-9666-3a00-3cdb.310.pool.telefonica.de. [2a02:3100:ac88:a501:9c5c:9666:3a00:3cdb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8d50sm25089629f8f.24.2026.08.09.11.06.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Aug 2026 11:06:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: asid: Do not replace active_asids if already 0
Date: Sun,  9 Aug 2026 20:06:00 +0200
Message-Id: <20260809180600.6049-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_110610_226531_3E42A891 
X-CRM114-Status: GOOD (  19.96  )
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

From: Catalin Marinas <catalin.marinas@arm.com>

Under some uncommon timing conditions, a generation check and
xchg(active_asids, A1) in check_and_switch_context() on P1 can race with
an ASID roll-over on P2. If P2 has not seen the update to
active_asids[P1], it can re-allocate A1 to a new task T2 on P2. P1 ends
up waiting on the spinlock since the xchg() returned 0 while P2 can go
through a second ASID roll-over with (T2,A1,G2) active on P2. This
roll-over copies active_asids[P1] == A1,G1 into reserved_asids[P1] and
active_asids[P2] == A1,G2 into reserved_asids[P2]. A subsequent
scheduling of T1 on P1 and T2 on P2 would match reserved_asids and get
their generation bumped to G3:

P1					P2
--                                      --
TTBR0.BADDR = T0
TTBR0.ASID = A0
asid_generation = G1
check_and_switch_context(T1,A1,G1)
  generation match
					check_and_switch_context(T2,A0,G0)
					  new_context()
					    ASID roll-over
					    asid_generation = G2
					    flush_context()
					      active_asids[P1] = 0
					      asid_map[A1] = 0
					      reserved_asids[P1] = A0,G0
  xchg(active_asids, A1)
    active_asids[P1] = A1,G1
    xchg returns 0
  spin_lock_irqsave()
					    allocated ASID (T2,A1,G2)
					    asid_map[A1] = 1
					  active_asids[P2] = A1,G2
					...
					check_and_switch_context(T3,A0,G0)
					  new_context()
					    ASID roll-over
					    asid_generation = G3
					    flush_context()
					      active_asids[P1] = 0
					      asid_map[A1] = 1
					      reserved_asids[P1] = A1,G1
					      reserved_asids[P2] = A1,G2
					    allocated ASID (T3,A2,G3)
					    asid_map[A2] = 1
					  active_asids[P2] = A2,G3
  new_context()
    check_update_reserved_asid(A1,G1)
      matches reserved_asid[P1]
      reserved_asid[P1] = A1,G3
  updated T1 ASID to (T1,A1,G3)
					check_and_switch_context(T2,A1,G2)
					  new_context()
					    check_update_reserved_asid(A1,G2)
					      matches reserved_asids[P2]
					      reserved_asids[P2] = A1,G3
					  updated T2 ASID to (T2,A1,G3)

At this point, we have two tasks, T1 and T2 both using ASID A1 with the
latest generation G3. Any of them is allowed to be scheduled on the
other CPU leading to two different tasks with the same ASID on the same
CPU.

This patch changes the xchg to cmpxchg so that the active_asids is only
updated if non-zero to avoid a race with an ASID roll-over on a
different CPU.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Tested-by: Karl Mehltretter <kmehltretter@gmail.com>
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
This is similar to the arm64 patch [1], with the difference that
non-relaxed (cmp)xchg is used as in the existing ARM code.

This is a resubmission of Catalin Marinas' original 2018 patch. The
original submission was not merged, and the ARM32 equivalent of the arm64
ASID rollover fix remains missing.

Changes in v2:
- Rebased onto v7.2-rc6-429-ga7c7074b58d2.
- Corrected the function name in the commit message's race diagram:
  check_update_reserved_asid(), called by new_context().
- Added my Tested-by and Signed-off-by trailers.

Tested with vexpress_defconfig on QEMU vexpress-a9 using four Cortex-A9
CPUs and four batches of 320 processes to exercise repeated ASID
roll-overs.

v1: https://lore.kernel.org/r/20180104180405.37596-1-catalin.marinas@arm.com/
[1] https://lore.kernel.org/r/20180104111721.33834-1-catalin.marinas@arm.com/

 arch/arm/mm/context.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mm/context.c b/arch/arm/mm/context.c
index 4204ffa2d104..7c4e1e4ba77b 100644
--- a/arch/arm/mm/context.c
+++ b/arch/arm/mm/context.c
@@ -238,7 +238,7 @@ void check_and_switch_context(struct mm_struct *mm, struct task_struct *tsk)
 {
 	unsigned long flags;
 	unsigned int cpu = smp_processor_id();
-	u64 asid;
+	u64 asid, old_active_asid;
 
 	check_vmalloc_seq(mm);
 
@@ -250,8 +250,17 @@ void check_and_switch_context(struct mm_struct *mm, struct task_struct *tsk)
 	cpu_set_reserved_ttbr0();
 
 	asid = atomic64_read(&mm->context.id);
-	if (!((asid ^ atomic64_read(&asid_generation)) >> ASID_BITS)
-	    && atomic64_xchg(&per_cpu(active_asids, cpu), asid))
+
+	/*
+	 * If our active_asids is zero, we are racing with an ASID roll-over
+	 * on a different CPU, so skip the update (using cmpxchg if non-zero)
+	 * and take the slow path.
+	 */
+	old_active_asid = atomic64_read(&per_cpu(active_asids, cpu));
+	if (old_active_asid &&
+	    !((asid ^ atomic64_read(&asid_generation)) >> ASID_BITS) &&
+	    atomic64_cmpxchg(&per_cpu(active_asids, cpu),
+			     old_active_asid, asid))
 		goto switch_mm_fastpath;
 
 	raw_spin_lock_irqsave(&cpu_asid_lock, flags);
-- 
2.39.5 (Apple Git-154)

