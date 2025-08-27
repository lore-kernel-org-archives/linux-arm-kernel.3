Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC701CA0FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fBu9j6IaTs08Cy0/naQSIbDYy/Ds97IIeYDx16xjQz0=; b=3B2bUSDwkubNPAgNg+zzCTGCN1
	cREYFzPZ3anA/e2xvZ+1lJvcJDAUEy/mDWMeh3VlJOb33Hj/6zresMIk1nP8DUuNBLlKm9rjiT6dS
	c9eNAsHe2yDkpJTpCksuPhlDPKl9jIRIuhlJUOnqdujESv9iTCY8+s5Ffl8p4A/sOr83gD9Uk9ozG
	uyscG8RjZNKwGB6OAwKhwInTaf7tIzvm35/rzRlg1vvh1EO4SoPy1yM3DyTlh+L3aT73VTAz3p556
	oetZuEwndLyMQHk6DcYK6AV6bkO7CuU5Q3a0VYv6lWdYUOC3uB0/okI+GDxRWQkP3Skqyb8kdQ0t1
	7+/tuDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE0N-0000000FAzM-0CfM;
	Wed, 27 Aug 2025 11:07:51 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urD6o-0000000EzsO-1qR1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:10:27 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso5755580a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1756289421; x=1756894221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBu9j6IaTs08Cy0/naQSIbDYy/Ds97IIeYDx16xjQz0=;
        b=Oh0qxLWzqEHBLTO7I0jwISzYIcphzIImP6TWp/LCMVmnc28cdNV2JBmgH+DsYX9RZJ
         8xOTCHFksgOeyN49GDym2K9HeyxdpN8BhF9R5HkNLEwGUkICDxIqbIfR5TZ6J/i4sR9N
         SafVk6hbcRslYMrBM2dhopHCapOrpltF5IK0rNJlJSVbOL3Stp87bJ2Fp1durK3cJyvl
         0jEerYhESZrsC6zZ6RCh2b7lRGwiOMD/968jtg/N9R/3O0LcLlzfdsuU8XKRvOZ2N0M2
         Oe0+oGcW38swOQFJkbmeJmZJ5lxH4hY2LIw7zDyAaU8QVFUGaTetW3+N0wd4nwHAPDK8
         H9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756289421; x=1756894221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBu9j6IaTs08Cy0/naQSIbDYy/Ds97IIeYDx16xjQz0=;
        b=T+iHKGIx6DxTMLdK4Q1g/d6ut1NBucPgoBfLuGYRtGjd0oXDmKXr3KU2OFy5vlxgbP
         DmXjtp7cbUBFvn2Hzj/LnRauCXoJcs56nXZ12wTf3xNB7Jf/c6IkTO6Bwa9Y6zY081sW
         0rH4V1SH9dgdvDnBr1vvvEAyIKqDkpkl9n0C9ODIacuOOCaGZw8yY5zQ8uI1iwCyRbhG
         fFixFsayY6uNb0E27SOfODwim2EEIw2syWrOjEMN6kSxl/ekESU4i3yXBIyrqi0GxfGE
         kJsQtletYrdcSRM4KNcKVQlCbZDWUBkXqpauUlDAUsokb0lW+OMk3U/IKyGNwhzKSlCl
         xWkg==
X-Forwarded-Encrypted: i=1; AJvYcCWxya+DB6zogmX3BHevlTs2xpMunqkRame2i7TTZyRh1qSTOVBrj37DBtek0+jvr8vQqyGELjvKANKu56CsxREM@lists.infradead.org
X-Gm-Message-State: AOJu0YzdK2stvVBpjDqSNRzFnHBnKZC/L+YTOXJQo95SQJxrvsXyJKzu
	1iB9PKMeszaOpzErNuTRFw5XHpiYDhcS49GjBuk03fCCbfK82dFNcPIwI36iAsXJggI=
X-Gm-Gg: ASbGncsi/10Z5i4oLmX5hjxBhrwVXKa3K7/JijCtFb0bKj2HC5dxhR/wgio6nBKhVUI
	SdjRMD9FHI2quO30rm1CrXCxi0PAb6hD/eQwJOkNHBWv7Min/5Zbwb6yr/k4mlw6qUYItYrIRMZ
	VhYnFmSgwfW7BzRL9vdcVK0eXah5gaI6w6UTTYlv9fgrQb6Ej4IualNZhRtOUslnyxx7ycaHYtx
	eOm4odpVS8k3ODTgyYkkMZBgwqsSTP7E7WPO7HOvR6FGDRMnBkCfxTB6ort5/PxniXl801050te
	K19Cp0U+9PQFtMnYGUo8h5J8/i5SDg+V2WOKO2rlFYTeSvfaeUMw7fIKKuTn95orENHOeixEvk0
	KVx0PGZFACXsYrN3RbRqNoA5tDgV2PBrioltAUS4sbkEUHuyn+LBFt7DdXZg+sAMY4aTHCipH4Q
	==
X-Google-Smtp-Source: AGHT+IE247z+6IbaCQjI/JRybcT+dCJSxuMKhLrRKRCY3vXFrDNcNNm2FeQS/0dKWf+BL5aq7dNmLQ==
X-Received: by 2002:a17:90b:538b:b0:325:cce7:f65b with SMTP id 98e67ed59e1d1-325cce7f86emr11644260a91.29.1756289420620;
        Wed, 27 Aug 2025 03:10:20 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm12813462b3a.79.2025.08.27.03.10.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 27 Aug 2025 03:10:20 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	anup@brainfault.org,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	masahiroy@kernel.org,
	suzuki.poulose@arm.com,
	cuiyunhui@bytedance.com,
	maz@kernel.org,
	zhanjie9@hisilicon.com,
	yangyicong@hisilicon.com,
	dianders@chromium.org,
	mingo@kernel.org,
	lihuafei1@huawei.com,
	akpm@linux-foundation.org,
	jpoimboe@kernel.org,
	rppt@kernel.org,
	kees@kernel.org,
	thomas.weissschuh@linutronix.de
Subject: [PATCH 0/2] Add HARDLOCKUP_DETECTOR_PERF for riscv 
Date: Wed, 27 Aug 2025 18:09:57 +0800
Message-Id: <20250827100959.83023-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031026_471011_9DC7C6EE 
X-CRM114-Status: UNSURE (   8.75  )
X-CRM114-Notice: Please train this message.
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

This patchset is mainly based on RISCV_SSE, and the enabling of the
hardlockup perf feature depends on RISCV_PMU_SSE.
Link: https://lore.kernel.org/all/20250808153901.2477005-1-cleger@rivosinc.com/
patch[1]: Move watchdog_hld.c to kernel/ to facilitate reuse by RISC-V.
patch[2]: Add Kconfig selections for RISC-V.

Yunhui Cui (2):
  watchdog: refactor watchdog_hld functionality
  riscv: add HARDLOCKUP_DETECTOR_PERF support

 arch/arm64/kernel/Makefile                   | 1 -
 arch/riscv/Kconfig                           | 3 +++
 drivers/perf/arm_pmu.c                       | 2 +-
 drivers/perf/riscv_pmu_sbi.c                 | 8 ++++++++
 include/linux/nmi.h                          | 1 +
 include/linux/perf/arm_pmu.h                 | 2 --
 kernel/Makefile                              | 2 +-
 {arch/arm64/kernel => kernel}/watchdog_hld.c | 8 ++++++--
 8 files changed, 20 insertions(+), 7 deletions(-)
 rename {arch/arm64/kernel => kernel}/watchdog_hld.c (97%)

-- 
2.39.5


