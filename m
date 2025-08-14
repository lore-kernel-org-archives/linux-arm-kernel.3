Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A8DCA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 09:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=caKBHp5j7/gqOP8pJYBB+m+OwHzfEzblmPGpxjdh1VA=; b=MmHVfCap3RZAym
	kFYOqISERH9Jb/Q9sc8x8FnlEXwOq9GStO5081ix6Djgr6NwC0jP5FPB0UoLQ62ea37hwRvD/+gpy
	HQghTbM8NJKqPsWT6jFGBsfff0oQp49q5ywBu57drCvuS+pBynAkq/rRvQhXiziALsCRQBprncxzg
	m5AB5rNGLDvIvTWQQthFqkUl2s1FgsNlbkAXibv/G9d4kTUr2G/VF93G7MU8eVo0xNC4fTc/sLGja
	8GuZZihjqCmeH3w5QNbDTr6rdYJVgCDjxHVKw1o17Yq3mTwNYXexolmTUJf+MPGWee9mYEFGkW8TB
	UdcRTGLMDbN5f7YtGd8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUjh-0000000GVau-07fw;
	Thu, 14 Aug 2025 09:59:05 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umUDf-0000000GOfF-0HqJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:26:00 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45a1b066b5eso3225115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755163557; x=1755768357; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=caKBHp5j7/gqOP8pJYBB+m+OwHzfEzblmPGpxjdh1VA=;
        b=iZvSS4zaqxez8nGQ1h5TT1HqkFie7dW+pL0ETYtLTJ/6VFOmaQtpFhj+ZENHTJnKap
         QqFKOPbgx2PaQLCA9RZTky71wz9HK9dkci2IeCH/Hc5g9cnIg2tkgesQLd+6lVeDfKaW
         FqBVnHaH6/KIq6/u0mTa+vdAsoO48YmqyM64SjJz9ZoEt3Inu5/3HRnCtqUU12A03w7L
         eLwmIrM5GQ1d7ptKv3QtV4MhsbBpJzowD6RULqSc0/sLO0LdSF5uekaxApJia8Q2clRx
         MgJUlQ5AIjOiUz0OIpdIdWsPJZPtKHiO19Yk2ylFYg4cjqISqP7Fx8QXbxNLYG4Vomi8
         tYyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755163557; x=1755768357;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caKBHp5j7/gqOP8pJYBB+m+OwHzfEzblmPGpxjdh1VA=;
        b=uzZtn8oCZ/bmvP043IzEIqDK27BsVR48oahVpLs/yBSJQkQqJGLklwYvdSysOwXDoC
         3Ft80N+Fm/zSoe55rig1/3iEPelpgeTgMiYplSvjVY81VdSmp7qBSGKa3XAHjeedhu2R
         8o8hksmYh8yrsdi+omqsmcYdt7MRYbe8DNvRgRcufKzCJMDVxki8LRzVSO9v/Vv/v7h5
         CeNKKFqR7y5lnbKEnJgOP2nqr7qUvhnyQZZ3pw9Q2blOr1YRnHVS0ID2RcjVgMmyULvj
         LB2T1oD/7gsSpg59hQPRI0MaGxE5hZ/b28UYXwFz+vVSKZDQ8/a9nIXLmrxuKT93X9KB
         qbLg==
X-Gm-Message-State: AOJu0Yz9GayB1UHQv1VnqXtQLDx3bPG42Ls0yORdpNFvnTjnR/dBBllP
	G+pF9YHdX1sgVWO7u73p9Soq3zrJ3gzHfQBHE9Xif3mNPg8MzlVP1doX22lFD1Udnvg=
X-Gm-Gg: ASbGnctrFOJTAHHW5shx7GlTa0uz/emgPjElOHLszYkSSFfiPZjI4aRh3wdQ7vo1jAP
	+2cOejrOQiOmE3Bu7HrbsIipEef7W3xC3IpDPiWwtFvKmyHTl+UZz8Nt/bxd7t2hUfy3/n4EGmj
	DoIiWb8VKwsVsdEyPPC8KoPzhNoAJIP+4hTlse1hkjL0Km57NG4NDtYWhFa0qG7dn2MbZmoXSki
	7RnfLUsGaWMX2mDo/L+CCZLK/snsvwWkGLGCq9YOD0EPH3ZojOx0AZPjDqdWdba1Jwh0/UpYmoP
	1Tiw5wh+RbdtMZ7k5Ujdeg5uhm/h+0lmXXuWKFOaa7bmQywB7BWIG8fiALuxG5Mgj1WJOUa8RXr
	ymVPgbLrKN+VFpGh8oyG0CQiM30B3xqg=
X-Google-Smtp-Source: AGHT+IFFjX/pyxO97kvg4fUgCnvfBjzIV9RmUUCrFRLJzwl3KMUkNYunWOuq124cI/SZDDfNBj88iQ==
X-Received: by 2002:a05:600c:450e:b0:456:496:2100 with SMTP id 5b1f17b1804b1-45a1b6753a2mr19665655e9.31.1755163557196;
        Thu, 14 Aug 2025 02:25:57 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c76e9basm14536775e9.21.2025.08.14.02.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:25:56 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v7 00/12] perf: arm_spe: Armv8.8 SPE features
Date: Thu, 14 Aug 2025 10:25:22 +0100
Message-Id: <20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKrnWgC/43R20oDMRAG4Fcpe21kck688j2klGkyaSO6uyRlU
 Urf3WxBVllWvPwD880h165SyVS7p921KzTlmoe+Bfuw68IZ+xOxHFvuBAgNkgv2iu9U2UglsUR
 4OdSRDpQuzJgQk4oukfddqx4Lpfxxl1/2LZ9zvQzl895o4vPrtyk3zYkzYAKDgKjAhuCe33KPZ
 XgcymnucQc0mL+BGJUDcqSc5j+BeapJLJNo4bch0SAEjv6IGMHgCpILZEBvQ7JBlh8h+OQdeLm
 C1AJZwbch1SBALazikFyKK0j/E9LzavYYtJTtRLi+kVkgB24bMg0yEZPyTlv3+7f2t9vtCzTYw
 CptAgAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_022559_128685_C020CB94 
X-CRM114-Status: GOOD (  15.32  )
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

Support 3 new SPE features: FEAT_SPEv1p4 filters, FEAT_SPE_EFT extended
filtering, and SPE_FEAT_FDS data source filtering. The features are
independent can be applied separately:

  * Prerequisite sysreg changes - patch 1
  * FEAT_SPEv1p4 - patches 2 - 3
  * FEAT_SPE_EFT - patch 4
  * FEAT_SPE_FDS - patches 5 - 9
  * FEAT_SPE_FDS Perf tool changes - patches 10 - 12

The first two features will work with old Perfs but a Perf change to
parse the new config4 is required for the last feature.

---
Changes in v7:
- Fix typo in docs: s/data_src_filter/inv_data_src_filter
- Pickup trailers
- Link to v6: https://lore.kernel.org/r/20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org

Changes in v6:
- Rebase to resolve conflict with BRBE changes in el2_setup.h
- Link to v5: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org

Changes in v5:
- Forgot to pickup tags from v4
- Forgot to drop test and review tags on v4 patches that were
  significantly modified
- Update commit message for data source filtering to mention inversion
- Link to v4: https://lore.kernel.org/r/20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org

Changes in v4:
- Rewrite "const u64 feat_spe_eft_bits" inline
- Invert data source filter so that it's possible to exclude all data
  sources without adding an additional 'enable filter' flag
- Add a macro in el2_setup.h to check for an SPE version
- Probe valid filter bits instead of hardcoding them
- Take in Leo's commit to expose the filter bits as it depends on the
  new filter probing
- Link to v3: https://lore.kernel.org/r/20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org

Changes in v3:
- Use PMSIDR_EL1_FDS instead of 1 << PMSIDR_EL1_FDS_SHIFT
- Add VNCR offsets
- Link to v2: https://lore.kernel.org/r/20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org

Changes in v2:
- Fix detection of FEAT_SPE_FDS in el2_setup.h
- Pickup Marc Z's sysreg change instead which matches the json
- Restructure and expand docs changes
- Link to v1: https://lore.kernel.org/r/20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org

---
James Clark (11):
      arm64: sysreg: Add new PMSFCR_EL1 fields and PMSDSFR_EL1 register
      perf: arm_spe: Support FEAT_SPEv1p4 filters
      perf: arm_spe: Add support for FEAT_SPE_EFT extended filtering
      arm64/boot: Factor out a macro to check SPE version
      arm64/boot: Enable EL2 requirements for SPE_FEAT_FDS
      KVM: arm64: Add trap configs for PMSDSFR_EL1
      perf: Add perf_event_attr::config4
      perf: arm_spe: Add support for filtering on data source
      tools headers UAPI: Sync linux/perf_event.h with the kernel sources
      perf tools: Add support for perf_event_attr::config4
      perf docs: arm-spe: Document new SPE filtering features

Leo Yan (1):
      perf: arm_spe: Expose event filter

 Documentation/arch/arm64/booting.rst      |  11 +++
 arch/arm64/include/asm/el2_setup.h        |  28 ++++--
 arch/arm64/include/asm/sysreg.h           |   9 --
 arch/arm64/include/asm/vncr_mapping.h     |   2 +
 arch/arm64/kvm/emulate-nested.c           |   1 +
 arch/arm64/kvm/sys_regs.c                 |   1 +
 arch/arm64/tools/sysreg                   |  13 ++-
 drivers/perf/arm_spe_pmu.c                | 148 ++++++++++++++++++++++++++----
 include/uapi/linux/perf_event.h           |   2 +
 tools/include/uapi/linux/perf_event.h     |   2 +
 tools/perf/Documentation/perf-arm-spe.txt | 104 +++++++++++++++++++--
 tools/perf/tests/parse-events.c           |  14 ++-
 tools/perf/util/parse-events.c            |  11 +++
 tools/perf/util/parse-events.h            |   1 +
 tools/perf/util/parse-events.l            |   1 +
 tools/perf/util/pmu.c                     |   8 ++
 tools/perf/util/pmu.h                     |   1 +
 17 files changed, 312 insertions(+), 45 deletions(-)
---
base-commit: 0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>


