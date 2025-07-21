Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA12C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=58/apG919MzAEhvuWxJriNjU0gqcpf1GWX4IKunwUcM=; b=DetDdWRSrrgcXu
	tMLyQ0LTOmkw3Eec9DtYrWjF8hXDo/vKb0VIdPZn5LhCkYNsQMyooOoFVD6RnnZ+QDFOkhvKIYmKS
	dg1HrOSmiXWlsNK4gXDRgzXC7RVeq/wS/R9ivW8lRI4ZDwRsCsEseAf3e3gVt4hq6LE690Mu7delq
	mXkMxi2UnGC8fRfcZCbyQydty2uI6A6qxHbzUXW0b8gsgvmz65VtLn8qnzWnoykE4M8QvpLMCTJYn
	brAj5ESZJJzZbD+iVJCvlPa+6BbP7cTfL626X4maTNwGrT2LYJ19wRpZkifhCl8SuUc18MXBP3VmQ
	gw6yj09n21sZyAFqiR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqwl-0000000HR7w-0Fnd;
	Mon, 21 Jul 2025 13:52:51 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqCc-0000000HKkC-2fQU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:05:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so3266694f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103109; x=1753707909; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=58/apG919MzAEhvuWxJriNjU0gqcpf1GWX4IKunwUcM=;
        b=fh/YYd5y/lxo5em2BNIyx3hxL/GUMUhg1u7JIvJKxHD5wcZw759A3aqMSKLEl/4sx9
         TzEL2WuVhY3Z03M42ghge2sZVVLv6dnfZWMf3HEQoIjvBQXr32fuo4C4pDU0qBgQ94Pv
         zuWgEIVLCK/9eGKXNYgK739boi4lAVwNBh81nCObVVz2R+Rlp5xUc8SxKRUfZy88CAnC
         /DOgjcytTxGiyhG8/pY/gAekitV9Hf9TXk6eTpCJ16nW1bujU/v8nI7cOpq9SUMb+QhU
         Vuud7B/FTU3g2c8FCVtn4WnCzcVhTN5ys7v6RAU9g4gFtq09oBDJZZaiOyfHP498NL2d
         t+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103109; x=1753707909;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58/apG919MzAEhvuWxJriNjU0gqcpf1GWX4IKunwUcM=;
        b=kL49ROpLud++vGkrsNozz/SGMkSAoEZA1nkKBqPPYkNoWiiMexBUhwhqMCbpPQD49d
         IgSmeJ67kxFJabc9hWCUZgmXP6rRtr+SNcHPUpmAgDJnEqoZlMUhEvmzYXvcU9XZH2i/
         VkHiajMcn5CSNRX03OMXUvI86ztWuVqfVG5T92BK06x0np1WnjIj7UngZa7BktbY3eLU
         pj1oa86OTbk0oTL1a6kdRiTGtfscX3iPvD12LthEnDezA0j+z7TGk35s/+4WJtVZNfP0
         7NQGWlFzj9ZSX09vNSrViqYecb2FMoNirw9jfJZnqpR00scfycsRTyMLG3Zf6+n1O5mN
         kT7w==
X-Gm-Message-State: AOJu0Ywja/tk228iAhq30HKVtt28j1oaO+yO38udKgKK+uuEya3cnntc
	+60vAbmFfSGlBdgTmGnFwz6f8pxWGutMjoHQ4/ysvzThDTqNu0w2alM0FY0d1Uyj+A4=
X-Gm-Gg: ASbGncsnAYD3tVsC9gjwzrv0q30XL0Y3wCMb/S8R7Pw0Wl/Y6uXOP4HkOxEXQDbgOjx
	p8MJNob5PXPvyf//FXKkATfys5v/TMmZxcKugg7uKML0P+XqzDh+X0hrLeBsx+d8wmfJhkwdu65
	s2hnNACfn+0DooFBJ9KJez/RFtza+zXdhEDCrodkg9N2vqotLUw5En0PkgiFPlJ/g8Avk8UC3Wv
	wJ36SGSZBeg9r1d40Mcr9AnrzK3Q3HMGwijDa0Vou612/NLISp/wgPb+L9ltfQL9W//jZKpXwqx
	NWP0pzaB7dKxQEKEm1HNyEWms5ZKoLvy7lqg95jaEGjhtr1L9l8JuFxhsmsDWc3Jzvy8MqsHt+c
	y7F7QCKSxSwGYIkUiPmMFFopI4Pil2wE=
X-Google-Smtp-Source: AGHT+IEZxYSbFxrrmP7cZP+9xTts1CuqTjmAYcW5ZBGc70QshBzfW0k8oadRGMw1/lOur4xQKdph0w==
X-Received: by 2002:a05:6000:288a:b0:3b2:fe84:a10 with SMTP id ffacd0b85a97d-3b60e440dddmr14665497f8f.0.1753103108852;
        Mon, 21 Jul 2025 06:05:08 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:08 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v5 00/12] perf: arm_spe: Armv8.8 SPE features
Date: Mon, 21 Jul 2025 14:04:54 +0100
Message-Id: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPY6fmgC/33OTWrDMBAF4KsErasy+rOlrnqPEsJEGiUqrW0kY
 1KC717ZUNwS3OUbmO+9OyuUExX2crizTFMqqe9qME8H5q/YXYinUDOTIA0oIfk7flLhA+XII+F
 4KgOdKI68aXyIOthIzrH6PWSK6bbKb8ear6mMff5aiyaxXH9MtWtOggOX6CUEDa339vUjdZj75
 z5flo4VMND8D4SgLZAlbY34DSyrJrktMdLtQ7JCCALdGTFAgw+Q2qAGzD6kKtSKM3gXnQWnHiC
 9Qa0U+5CuEKCRrRYQbQx/oHmevwHl8SAc2wEAAA==
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
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_060510_836708_8A881CD3 
X-CRM114-Status: GOOD (  15.57  )
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
base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>


