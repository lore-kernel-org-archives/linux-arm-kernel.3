Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A86C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 22:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4zfXIYPHDxB6mlQBLTG1Xumxp4uXISSBV6uk4ectpuQ=; b=BTTaywWxdjA/ITUvHOy/21Dq17
	kHl0cjlgU4kgpQwIZRbN4LXjz2OaMXRJx/wKYHXIjZB75vvyx8p44abHIAzsRx02kpbkoeS1ITxnK
	xZriarMT5fg0IS86sZdp+FWtRtOhRLswp+uoFH25ktSu4oyrsZ42kCaZTgH8RmAMqc48zVv8lCHKm
	Lom1xHDSHnqz4A1XadqJtDCCb2qHO4LHlw6QKTaanF2GO8rXU+zgW+8NtPGACUCFuM+01tSD/5PbM
	53FW3aL8w++o3wDTUFLjI7WbbnHhjE3GyyT1LcOUvZPXzbBt8jKCJUGmIQPZ4gyNahiE72Ro3hGCo
	RTwdkZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdxfK-0000000DR9N-3tis;
	Sun, 28 Jun 2026 22:07:50 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdxfJ-0000000DR8p-15zs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 22:07:50 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-8dcc3f14b93so32841806d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 15:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782684467; x=1783289267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4zfXIYPHDxB6mlQBLTG1Xumxp4uXISSBV6uk4ectpuQ=;
        b=I8zi5yTWTzy1SJfnTGZ9364S8TAqOjoCNpSiW0h+lGlvGWtfRoFXTq13rVurjRJzj7
         LDfmk3Z8QFvOVIZ12xqykB89boRGwR1j16wAmEuxBd/8bdPhcrZi6eVfudqbJzqgsCRP
         CIZFT+O625nKA0T2pZ7Tixaj36ZgHQF6qh7e12swzi9WMesb3AiLPfvi6Gk4/q35hqxn
         6TJ3MzgW8pFNIPP57uRCF09PxWbHLqEc9dQuLU5U48xZs+Hf78utMD10NDVnwqrMRwk2
         LrDY4/BDrCnCUilgvL+NMAjKdVq2i7zVoe4oayVhhLk/TDm2e0mUHXIZirpMOi0zs4rE
         o4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782684467; x=1783289267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zfXIYPHDxB6mlQBLTG1Xumxp4uXISSBV6uk4ectpuQ=;
        b=ViihTRDK556weOTR0BCul47dlcUK0ikHE2fhXKvjN9//LasNncUkXFj/BgVu/gOpUn
         XEgSprG6lb8oNav8bZM6T7c0ITYOhjImF5quVpCBntREiqgVAvoEX6fDhh5jvF/zueef
         wh99G04tYcWMbYNdy63x9qzmYgP0cWbbJvOFjedqIMYnTZCOQ0EnyyHFwmQwr/JkIwl+
         2nYTCqVF3vE3dc3pwF4Y85AZEP4yX7ToX8fR63GfbEpT8gEU/4s3cMvxlP1nIx2sARgx
         H6tGmOgUOhqtlTky1MPC7CQZMcsRccuIy0uZr72Gy0UgcGt1+/hHZzGddeKMD2LSWhdy
         XCTg==
X-Gm-Message-State: AOJu0YzYT5ULZJHF4iyl1POONIShO9Hw+PP0z5a3ybTC1XYHl123fz4y
	abH9QwRUi6w9MPHE/eosZQImrCOITRJJgvHcAG3PDmqWmi529/mtdBbj2NS3o5Jy2Lg=
X-Gm-Gg: AfdE7clbDyrmbMc644TCu3RkVY+4H0yTtIsJfRzr9m4DcR9ryDdQTVpJyIUM5X0RqSC
	HFcJEoRvdcXfmtD3/dR8OIhmvZ0ulFhQg5xHYalBsmKAi714I2jtnkvIPPdb9afRENJcdigat7u
	iJTNf/gptCvbdvUm1EKHJbpZKCne60UXRnoMZ4c0RK23hYpdRXnYmOmHoJ+1AnRYoOfu9nJttPR
	ywlrIABh69rJQUN40DaFEENe6do2vc+smwNDXJQqvBgrJ4cEIiRId6GiPktVj9fhJLAu30cGhD9
	oPdJ6Ld/kG3ipO57B7SHlVz8czJss0PKns1IWXpD3xMMY8cjEuSHQ2J78varjjRrGVLE0+4XEzX
	2wU+K15SbAtlHKIIEDCxr9g2eLv+7WeVMT6ExwVU87WRXcDZirtCo7PPLWNtUabWZfCyUR4Neeb
	SkKQYSzwhVOBh0GvhEPM5cUwHEOWaxzw==
X-Received: by 2002:ad4:5745:0:b0:8ee:ab07:c79a with SMTP id 6a1803df08f44-8eeab07cdffmr83217796d6.33.1782684467524;
        Sun, 28 Jun 2026 15:07:47 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7fbdc9cfsm288158596d6.20.2026.06.28.15.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:07:46 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v3] irqchip/gic-v3-its: Fix OF node reference leak
Date: Sun, 28 Jun 2026 18:07:23 -0400
Message-ID: <20260628220723.1699972-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_150749_300024_9B9A1417 
X-CRM114-Status: GOOD (  12.74  )
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

of_get_cpu_node() returns a referenced device node. In
its_cpu_init_collection(), the Cavium 23144 workaround only uses the
node to compare the CPU NUMA node, but the reference is never dropped.

Use the device_node cleanup helper for the CPU node reference so it is
released when leaving the workaround block, including the NUMA mismatch
return path.

Fixes: fbf8f40e1658 ("irqchip/gicv3-its: numa: Enable workaround for Cavium thunderx erratum 23144")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
Acked-by: Marc Zyngier <maz@kernel.org>
---
Changes in v3:
- Keep the __free(device_node) assignment on a single line.
- Fix indentation in the Cavium 23144 workaround block.
- Add Marc's Acked-by.
Changes in v2:
- Use __free(device_node) for the CPU node reference.
- Correct the Fixes tag to fbf8f40e1658.
 drivers/irqchip/irq-gic-v3-its.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index b57d81ad33a0..6f5811aae59c 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3290,11 +3290,9 @@ static void its_cpu_init_collection(struct its_node *its)
 
 	/* avoid cross node collections and its mapping */
 	if (its->flags & ITS_FLAGS_WORKAROUND_CAVIUM_23144) {
-		struct device_node *cpu_node;
+		struct device_node *cpu_node __free(device_node) = of_get_cpu_node(cpu, NULL);
 
-		cpu_node = of_get_cpu_node(cpu, NULL);
-		if (its->numa_node != NUMA_NO_NODE &&
-			its->numa_node != of_node_to_nid(cpu_node))
+		if (its->numa_node != NUMA_NO_NODE && its->numa_node != of_node_to_nid(cpu_node))
 			return;
 	}
 
-- 
2.43.0


