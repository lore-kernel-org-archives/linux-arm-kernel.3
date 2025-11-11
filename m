Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BB9CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 07:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=533MpmlhqTKJtLtKqvZVG6ekGMT1k9z8ZUML8V8gWiY=; b=0idw0LyyOajbe2gLPrhTU4Jzu5
	wQw0Cdki+R742FcdcpBE0pj60wQZj9SmZCVawRlD0PYvsHnZuuTvBTbAhnGv6D70fERB84phftR5l
	4hrLWct8XoZDpak5iIaVBbV57PlB4AF5u8D8zWUxSGOta1w5ohKufvipmCIqlP1UPCAkVzZlG01uS
	AOGpcPlZQLp9bGGgoy762rsOT5y4A1x0mLAMdEXFGR/Ls5EzR3r1Tcwd6/aXDPWcOc70IwxcbkB5p
	feelPcD3rNxy9o6gQG0MNOVF/Imw1y/crMNr0FpAT/dxFIq7p8s+uWtjaGTHHSGzE9m9qGcgnOV95
	EJ3PV3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiuV-00000006h3t-0sXJ;
	Tue, 11 Nov 2025 07:35:27 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiuS-00000006h38-3XMK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 07:35:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-29516a36affso38208165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 23:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762846524; x=1763451324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=533MpmlhqTKJtLtKqvZVG6ekGMT1k9z8ZUML8V8gWiY=;
        b=grs8J0X8Pn5D+xmWvhnzJbhqNQCidXcBilb87CCUwIT/Fg9l+9y3fbtLvVK5m2rWX1
         h78zPT/uu9dDxzUtW1Vk/8bLiZCaZPQb4d0tsqtUOnq98JpqeFhViQ0W/NNZkv0KwYeJ
         AtouCHhvJRcFoPc7SihDboz6/hw1rST7AMXrJJBz5lgfU9t35YMgfd7BLQE4+QbPixqm
         T2k37LyW/weeE227S4woFQSZeEhthsaPz4oo8yOzh+iXV+BYMMWLLUYsqbfuyNq/NYa6
         lp+hZQindKOH33AqWyGDIsnYl6cXOuHxGQzfNc2rpz0HuT8BYM3Vf+cz/gfCMBjuBJLI
         0vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762846524; x=1763451324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=533MpmlhqTKJtLtKqvZVG6ekGMT1k9z8ZUML8V8gWiY=;
        b=Mbe2LohOlOv3XWr5GaAYp/x6KpEnAVoxYpujZvloDV/Gmerd9IHxitXsaTQEbQ+UnZ
         VIt+kG+9bupR/EchviLEY4+2oC6mOteo4RYn3qcaScJZwTaqEWIQF0dc0itIHc2bk6Ac
         U2PKsth1Br0HKrPC3zGUSRcAhwLRLGrRr83ArJExtrRaH9oY2qsLpgnqDJkMSY1UzUxj
         G4YTAPoM6ibFPnxu6417EU9SDoo5aUlNA1E4YDZkxYzUuUDk98J9rGD1nHCsMIrsMoik
         oNMszSa5QPxLwIWzbVp8nIQdrf5MIF8k0Tr4W+kCg6zQz3dY1ybZ5pBm1n+qNnRTw5ms
         Uxiw==
X-Forwarded-Encrypted: i=1; AJvYcCVJM+mxr/LYryVjCL8qQEXR/3Ywfiy8seVef2OXlOQo4z18kZu9YRHV17C9wTVVhg8ZBq3QojgFPxzK97RWg7HY@lists.infradead.org
X-Gm-Message-State: AOJu0YxntmmlmOFo/di6mjdpaXbbrELI5bN0NfY5YTHRiM4uOZvVp7z7
	F0HDtgdCgIHMI22jlsxtHtNWugPBomYQZ3scQTj2Q0Do2IqVOpmIG6FGogJxkhLjl9I=
X-Gm-Gg: ASbGncucGg3fPIGoONOUs0e3b4ZkFS9WUUsFhks3jLajzoApZu/bxQKBLE/JwMz2nGb
	mE9/1vhIo0p+UxE+bpgBpF3vsFeYBqLsbrUtwIt8XQveGLDttuRaaBq1uFm1w0504qJpmtYtgbD
	fl4HXwre95132uxSXg9neCwhaDKQ8tBcy8lwHwO+nT/gEaVwotVxrCm/c9+0x/zKIOMzyL9PGfF
	6rNPX5cRSLPPg8XYR9mXz/0jJJ0kVs+ST9c9q8uod9V1uVUjIi8wsUjOeA/Qd+rUEAXisHmvrXd
	IurD40n9gYcX/o2iHDQ6X4pbgFeYGRFuajLI193IJkeicRnUbbFA6Q0B88CJrNsgRRFNf+i9t76
	B0qisD+Ac7MgbzTpHlwGIPNNhqL+RLWDPa3QwYna42V/vWN1ls8xJm4FTCTXSSu4b6TTLb/UOP0
	seFTXK2T0g8j5tCSGvjb65DSeBBtafgJc=
X-Google-Smtp-Source: AGHT+IHc4/svjuXEJqiJPblrTTMmTzjo8sWSLvFxa7A/n/1dDjeXQeMDKykLsDl5TXqJ0t2zOlW8CA==
X-Received: by 2002:a17:902:f684:b0:295:987d:f7ff with SMTP id d9443c01a7336-297e56df951mr138535025ad.42.1762846523563;
        Mon, 10 Nov 2025 23:35:23 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c94abasm172928885ad.82.2025.11.10.23.35.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Nov 2025 23:35:23 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	catalin.marinas@arm.com,
	cuiyunhui@bytedance.com,
	dianders@chromium.org,
	johannes@sipsolutions.net,
	lihuafei1@huawei.com,
	mark.rutland@arm.com,
	masahiroy@kernel.org,
	maz@kernel.org,
	mingo@kernel.org,
	nicolas.schier@linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	suzuki.poulose@arm.com,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
Date: Tue, 11 Nov 2025 15:34:57 +0800
Message-Id: <20251111073459.44030-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_233524_908529_A0804F37 
X-CRM114-Status: GOOD (  11.13  )
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

After discussion [1],[2], hardlockup_perf cannot be completely replaced by
the hardlockup_buddy approach, so this patch is still being submitted.

v1->v2:
The contents of arch/arm64/watchdog_hld.c are directly consolidated into
kernel/watchdog_perf.c.


v2->v3:
Add CONFIG_WATCHDOG_PERF_ADJUST_PERIOD to enclose the period update logic,
select it by default on arm64 and riscv, without affecting other arches
like x86 and PPC.

v3->v4:
Place the line "select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF && CPU_FREQ"
in the Kconfig files for arm64 and riscv in one line, with no line breaks.

v4->v5:
Remove __weak from hw_nmi_get_sample_period()

Link: https://lore.kernel.org/all/CAD=FV=UEhVCD6JehQi1wor2sSmtTLDyf=37xfo-DOTK1=u1xzA@mail.gmail.com/ [1]
Link: https://lore.kernel.org/all/20250916145122.416128-1-wangjinchao600@gmail.com/ [2]

Yunhui Cui (2):
  watchdog: move arm64 watchdog_hld into common code
  riscv: add HARDLOCKUP_DETECTOR_PERF support

 arch/arm64/Kconfig               |  1 +
 arch/arm64/kernel/Makefile       |  1 -
 arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
 arch/riscv/Kconfig               |  3 +
 drivers/perf/arm_pmu.c           | 10 +++-
 drivers/perf/riscv_pmu_sbi.c     | 10 ++++
 include/linux/perf/arm_pmu.h     |  2 -
 kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
 lib/Kconfig.debug                |  8 +++
 9 files changed, 114 insertions(+), 98 deletions(-)
 delete mode 100644 arch/arm64/kernel/watchdog_hld.c

-- 
2.39.5


