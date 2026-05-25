Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F98CD5BC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 03:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R9RwqYB7r6bhFVqkJhACAFbElSFPJqjemhMeBFLCqnM=; b=udInozsdFXl4ZLJVZcH96sQN8M
	nF6ww86ZUkqDfgdCJu5gADk04vVBCG+gLYUnwmj/bTiLvSO2oZXw1fVGayliw3Zmyrxn4Yw6Kes77
	I6QnqhXmLXiD+PoZmCUFBxLIGeby50J2qORS3LjtATU1X5V30Gd8b2nkkJFI/Vr/rBjI2hTMsaktk
	dZUW/fFEYL129zfAjjQo5KoX6v/vQT1XkZb3khhDQTQ2Oix7FMUOJr7V+cbw/SAm2BHopf/pgSQ0o
	YzIdeQiyFR4VaHiaD+UJNdyBBmRupT1nHo2bnwu5oHB6X7Wk+UN6Hk5L3csJWyVJx4iG3vrX+Bu1j
	uzJBdn2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRM9W-0000000GCjW-2C3x;
	Mon, 25 May 2026 03:38:54 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRM9T-0000000GCis-1pwQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 03:38:52 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-50fc496c8baso105290101cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 20:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779680330; x=1780285130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R9RwqYB7r6bhFVqkJhACAFbElSFPJqjemhMeBFLCqnM=;
        b=lip/btzlx7RP2in87m6S/Vdy9sYkg0zkxEoI9GooE6i1TkKEUFse/awL8m2AT5T2Jh
         /yumXVs06w4gl6qIVPY9nWnnUaCAu3aALfKxGfzYS7mh68lMKVZIVvkEED4WRiLrUGX1
         7TfqhW7ylOeDl1W24t7AlCieDsN2WgIGnkL1OFy3JKRtR7stOcydmp+gaKBdbnMxQC1N
         DJEISvwUGdJMEuQCddkL06pVm3rcZ4d9ESMw4GZHgmedwV/3LwLAagg4xJQe+rZsocx+
         tV6Wh6DLX6u4dLqO6+ZqU7BESGLz5MKRidXWNoBh5rNR54uqM2ZFK+cch/VL1MiuaBWh
         FBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779680330; x=1780285130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9RwqYB7r6bhFVqkJhACAFbElSFPJqjemhMeBFLCqnM=;
        b=niTuWxNg2UW3zhvVZBicLWRb4mqNhXKUkszdb3TeEExknCdFRMJtLQwloMZVAB7V//
         oKl/Pb8sLQpN0zvGBAEOggQsl/HlKQFRzNxibpHJJrbMXbjcu6Ha0QqM6MRIo5vWeUBy
         e3ujxEd6+o9ir3JKOelG8brMd+66phGUyctiGQYMnPcb3hNpGQucenTofO1/nr3EbUQl
         Ac5WWzjQcX8BwoslUE9oXem0/hfPbpjJN3OCdES0k4ht3u7n58Qe2X8BIR6I080EmmlW
         cAmMfP97V/C02A6dOcGoO9nhG5vQsCy12DJpjpwU6NGKRP3piEWlFRFjaLu54NmuBPbs
         7eMA==
X-Forwarded-Encrypted: i=1; AFNElJ8OTk+bR9LSV1/cUh1e/KzgJa/Yt2Jnf7LEvc9dgCJY7KE8dOUrVkx7mZpubWXcKbL/C/0e1I1AMOf5xsnkfc4a@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/r6khJjS5JZ2jmbWGUPpmlPquzifOoz1I1zkeZNr+y2DHLfUY
	JBHjdfn0Dc6EnngVOUW/MhiZPO7aA/lB84W/KfgRJ3/m87VFXtwKmd3X
X-Gm-Gg: Acq92OEPHC1ggMO8YqME2hydAHNWnDwe1ecxy1g5H/R10PaNxDxukGJbDEZhb0Y8bK7
	b04uFiLmTrpIk4O/EBlwHch/IJVuOPtdAroSfPeFsWZE5gBCqWLvDOmE/qiFGY97QhMzxnf0+VR
	kzwu6FOCOi6nPfesVDh3yndCuuu34TRpvg5qnifBavuJQMOauWMcXVuPKVhDbj1/ZRXYz4XovRy
	CvwJBTmH9C6JY6XX7pjPVXoLyJj3Assglfngu0FpNecppYBE3jAkhKidnlYzYylh6AB1zo1KS4e
	z6BZ6lJ54pRwtHy2YkImRJng8xxCConHMXiY/+0kqmRE/6qMW8NMIHN88pgWqU3UJoxG+tNsFMt
	Zupud+crkb/5zWqT7TaEQ++Dnvs2KI6+IJF+rjTqGZAxL5ZKWpI+8Z7gYWkNMXNQM8naXlazbbJ
	52xR6YuRP9a2+5d8Iju0soamcBkvujfLZpK1mfNcYNCFIFrE6ztj8=
X-Received: by 2002:a05:622a:110c:b0:516:d83c:edb8 with SMTP id d75a77b69052e-516d83cfc3dmr157369111cf.27.1779680329955;
        Sun, 24 May 2026 20:38:49 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516d8cb8da8sm83104691cf.20.2026.05.24.20.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 20:38:49 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>
Cc: Patrick Venture <venture@google.com>,
	Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Russell King <linux@armlinux.org.uk>,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: npcm: Fix OF node refcount leaks in SMP setup
Date: Sun, 24 May 2026 23:38:46 -0400
Message-ID: <20260525033846.1346744-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_203851_479091_9D3DA638 
X-CRM114-Status: GOOD (  12.01  )
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

npcm7xx_smp_boot_secondary() and npcm7xx_smp_prepare_cpus() look up
the GCR and SCU nodes with of_find_compatible_node(). The returned
nodes are used for of_iomap(), but the node references are never
released.

of_iomap() does not consume the device node reference, and iounmap()
only releases the MMIO mapping. Drop each node reference after the
corresponding mapping attempt.

Fixes: 7bffa14c9aed ("arm: npcm: add basic support for Nuvoton BMCs")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-npcm/platsmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-npcm/platsmp.c b/arch/arm/mach-npcm/platsmp.c
index 41891d3aa124..4c1fc9983746 100644
--- a/arch/arm/mach-npcm/platsmp.c
+++ b/arch/arm/mach-npcm/platsmp.c
@@ -32,6 +32,7 @@ static int npcm7xx_smp_boot_secondary(unsigned int cpu,
 		goto out;
 	}
 	gcr_base = of_iomap(gcr_np, 0);
+	of_node_put(gcr_np);
 	if (!gcr_base) {
 		pr_err("could not iomap gcr");
 		ret = -ENOMEM;
@@ -60,6 +61,7 @@ static void __init npcm7xx_smp_prepare_cpus(unsigned int max_cpus)
 		return;
 	}
 	scu_base = of_iomap(scu_np, 0);
+	of_node_put(scu_np);
 	if (!scu_base) {
 		pr_err("could not iomap scu");
 		return;
-- 
2.43.0


