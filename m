Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0306CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 03:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JpBrYi8OaSK64ZsI47g3j0U1q75t5NwItcJ4jghSQ6k=; b=ojzShkHCeGo7e5mbLgox+/QJux
	YmlsP5OzCk0vjYv5gNhJYVP/O1RVpENEXMcxxrXlI9e9GT1BqGF8G5+T5HnrLqGZZY81OJIwemoCA
	HKqVTk3TlaGURUn/CoAU8JuTiEXCKjIlH0/eFxE6fSDmhOFOVBGeIJCkpHEoJF9lbpto8WZKbhlZW
	zTA58NUwweqBcNn+P+fnqR96Hq+zU572hiiI7G7K+X8GIn+IuG6ncbnlz+FXXtjN10tWItYvnPCZQ
	BW9i7yZRy1NYt4Y0FX6pTq5097GrgE4HXsUWD31owpFSKc547N/sEPE6TT3ldelzEVdPVn//nvERy
	R9SLXT7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hLM-0000000560v-3ZQH;
	Thu, 09 Oct 2025 03:29:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hLK-00000005602-3umQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 03:29:28 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-793021f348fso419956b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 20:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1759980563; x=1760585363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JpBrYi8OaSK64ZsI47g3j0U1q75t5NwItcJ4jghSQ6k=;
        b=f/sjDDhbbajUMNtd54vKX1hM0Wxzx0xJNA4GiHB9/U+1LbdWYPRw+YTr7SyUu1rpsC
         muH4Qdx7XKOshNqt3Q8bVfXfcgd0QDjuAoFDiBi94Yvt07ITgNqVTVThhU556I9UI+bY
         L+yOi6QuWJ555WlvzOLUz5baedQKcF5bYR2M6qdQWIUeMRlEgnlSSLHjcgpMAsA/t7uN
         /i1NrTqvnllCSwZFBmHm+DF4AA4nnoBfEIIKBT9UHpChvAU5fzLu7eQzg2bN5bevOwKP
         QUyc8b0/chSpeSsggDV9xDGH/iX/cvbZDvHObihL/EVM6EbUYrGlflNKtXO4/XBp9e+2
         l1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759980563; x=1760585363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JpBrYi8OaSK64ZsI47g3j0U1q75t5NwItcJ4jghSQ6k=;
        b=gyeF3ApI6bdSxYuakklj8L1yDMa+UxfQcgU/UgvgO2wDxCnft2ljmcumAKTWu5nAOz
         Rhmy/A77nRWUZxlpFNOk+SStyKQOlPbmuP3eyRNigcR0B+CsgvW5jeq2ZYekhetkVD6m
         5a+xQtPVvOKBtKVHhgxtlNLT0+4tpzXBf3nJywKDjw3WYxzfmexMrLd9tb0LBOb/t4sg
         WNHow1gF5E2yTCEb+GSSScp0ddhKlp89WS/GuwY09ZzszvVGRejXqOt9ikpWPJlL5kI0
         sHNsW21ptPIcp1y2eKKKJlLPKao2Xtr7oHojBTslCgWC3H+Gu40K8XOOsHAKNjZDoGka
         ovmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX3laUkMWVLUKQo1U4xcJnCpau1immtrFzgbiAg3Y7vA0bJckgvVavV5X2r7/1dlvA1oTczIF7j7OEMAzJ9/4s@lists.infradead.org
X-Gm-Message-State: AOJu0YxVjS2+81tARws5A+zttvPYSrp4bscPBUoRP+F7EP+NZ5DQGWDL
	qX25s9Whp5qJA28wijjAny4jbaNi8CjK4PWAyjmpq8O+v3TmKtaDe3RJK2q73t2pw9U=
X-Gm-Gg: ASbGncvDB+miVxqMmIEViHSK/YnDODwXlgNOPwDbm5T6wUCqX8io0YWvyM8N9V2324h
	IqK4SFGdrq+Q9jwIMdqBj9GLxCA8M2ZL5WGsne16qbWDt1SnQCi70CxT8ba6Ttqa0BKdGSGp/3J
	Nqx7zoW6a/LqgtBfIHl1X/7me+ZGPoKUneunkMNuvnnCurSPUXxMq1Fom3OK8ZX5KVZJYjgQx7B
	wkOgR3c11LCJ071a22IdX+sr1TAHuA9EzJWSIGvRuvw9nQTzlQX0JE4hlOveF5NeZC7XAvu4h8h
	94R1OHDEmA5yFeL3P6MNUTkA54OQgFOmEppW/IciJ6hfHMXKXTaIwal5AMysI/Rgpae/JpM+mUx
	XT+SYjQunsPASCqiVY2pIVmfuw9SSTBQ8KRTkm/VjLQ7gAh2Z/kE+zZg2MWBv2rPXPgkucnaXVX
	IeU8kYB8l5F9ox+fCVCa2ntw==
X-Google-Smtp-Source: AGHT+IFRlFMSgpyV+I+rT5AczJyjaNpsL4H8TkyxvKqiDHtqjU3VLps9m9B9k3wusNgIZV/khJ/OsA==
X-Received: by 2002:aa7:88c8:0:b0:77f:143d:eff2 with SMTP id d2e1a72fcca58-79387c191fcmr6789523b3a.28.1759980562388;
        Wed, 08 Oct 2025 20:29:22 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794d4b39400sm1271306b3a.15.2025.10.08.20.29.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Oct 2025 20:29:22 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
Date: Thu,  9 Oct 2025 11:28:36 +0800
Message-Id: <20251009032838.63060-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_202926_998734_5C948DA2 
X-CRM114-Status: GOOD (  11.27  )
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

Link: https://lore.kernel.org/all/CAD=FV=UEhVCD6JehQi1wor2sSmtTLDyf=37xfo-DOTK1=u1xzA@mail.gmail.com/ [1]
Link: https://lore.kernel.org/all/20250916145122.416128-1-wangjinchao600@gmail.com/ [2]

Yunhui Cui (2):
  watchdog: move arm64 watchdog_hld into common code
  riscv: add HARDLOCKUP_DETECTOR_PERF support

 arch/arm64/Kconfig               |  2 +
 arch/arm64/kernel/Makefile       |  1 -
 arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
 arch/riscv/Kconfig               |  4 ++
 drivers/perf/arm_pmu.c           | 10 +++-
 drivers/perf/riscv_pmu_sbi.c     | 10 ++++
 include/linux/perf/arm_pmu.h     |  2 -
 kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
 lib/Kconfig.debug                |  8 +++
 9 files changed, 116 insertions(+), 98 deletions(-)
 delete mode 100644 arch/arm64/kernel/watchdog_hld.c

-- 
2.39.5


