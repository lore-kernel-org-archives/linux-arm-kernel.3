Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A354CC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dh0ufcKS18VIeF3hRD5OYNulmhznnE/kIuknIcgeqYI=; b=KCIr5mxs+wkLVo
	DgeLTcyVfZ6cggYiNEgBTQIcsOC3XIQCikjEo9R9WYXds8JdX0ZLCtZ03sv9/L0vQYO499NL21nTz
	RWVp/OxAKP/pOIkyB0du4AgKe/zN4ntCJvytbkLYp7fFkAPbK5CyWn5CdfaEQsPsq8zVYd3vGo50f
	5mNmSTCDyZA8oDv1kmcvHr/myqgXXJAZcGAzURly4qQxpN/I2DHCTwVQx7yn/uOe9x+Jw2VudLO2T
	03oRyFQ9NEtZDhSSRESZ37pYzZTCdQZQdow+SuIdXr91WzJSYrbFZ8/j5nOhFt1v+eo+nNWyAseGr
	DFK5LE/+hcQwR2MCSfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrtC-000000000IQ-2GIk;
	Mon, 21 Jul 2025 14:53:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq20-0000000HIba-0pXQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:54:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so47346955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 05:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102450; x=1753707250; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dh0ufcKS18VIeF3hRD5OYNulmhznnE/kIuknIcgeqYI=;
        b=tVs4K0e/EokAeUAsVmJgxRI1jd4S62jspJ/HNPJRDSCv671r4SiDvXHSCXb5JlAHey
         KSdxbVIYwMGyGPTdgmyqBXzeDUFXHu0mK7p8kZIpOzu42yxjoMniFofF5iHGjnWSQEO5
         PCPs6r+IMpvv0EDEStStkt1BBDfMUUxeEiT98vWMqewsB81kwFO9DOF2CjfCyB2nAzkZ
         m2PEj1xzimJj3p2FTJ4OmiDIEh8UEuzvkDRIGvKcDTh307IxSU0HBW0+nVWL8wpWlpMo
         Q1FyjEWlGCENgUBGhPETe1IX2R97laISJ5DFVc9xVMUn8u2CZ2GDol/Y8On6aTVBnm/z
         HAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102450; x=1753707250;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dh0ufcKS18VIeF3hRD5OYNulmhznnE/kIuknIcgeqYI=;
        b=K64XWu/jFBy4lggZ0oGz7/7jl0LXpCzfQ5bJFpjxTzZfQxwDJULn9teizg2WhEdMWv
         OKzF/zS7hjgZBCB65TIoXBwc8irB0+HYqfZcYMRwkkkXbG60pCM1/oHRXiIkPFUjz5VT
         E5f4EnvlSMd+JcRQujrw/7snz1ttDX1+ktDtl2WAaQq4tjbtD5fyeEbc7DVq7t/LE0pz
         LTZvrO7ukvRlg8xuFbgw5QigpoTgtd3KPf93X0bCjdcy/t29GF7y79noWGgCSur1NUS+
         MtVBobyRHPvBe8+5zecInbAKtAR1IrFNLzUOtJKIletyU2VIMYRUEjMgKy7vEyHVEmJO
         21iw==
X-Gm-Message-State: AOJu0YzL84yv7TT7y193cnaJH1xb8ZBnXdRRQXAH8fyf1Zuw67t66U3R
	PCidU9kH+b4OhiKQeN0F2RhRv+mbdRKN0MT0JuPswnhSz85RMBz/zIkoMcqk+XaJZdU=
X-Gm-Gg: ASbGnctx9cNYxlPr8QWUKyANArISCzrBP3zHQnXKlHGXTWFjXZlECSA9xoA2EtXxtcm
	Cg68HVQ3fQgOfBAYXsSp7Ut4qkW6d5pKYo7o+WaDqo4JoTiYGQ44TAz8QGtiy0zidfaxCF047m8
	FxCn1RQcmB8GGjZ3AbabR41w/eUBs0ssg2nReer04MgS/EFJf8gLGAQBw+nNK879MRAg7+eGYuZ
	9J6l7uekUTvsAhXu8nGnkO9BnSymxWUiGMkcBZMubwQmaK8PsgQF1DC87qTffPHYrqASUF5Zvvv
	obs+iZgkIGlbpESFQOuxLKXFR0TxuG35NU02SYAnP+b5z2PgKs/WWIL81eJtK1/ZNBwAjpScj49
	ugyIqS7vRNhzBe9yviWCgVejNdpU/4HE=
X-Google-Smtp-Source: AGHT+IFUoGCCuAibze/2hAjDtbuuTcPZpLvl7q6yRHYVPgV8MyrgagaFMVGFjW5NAfaFTq5/JkuhlA==
X-Received: by 2002:a05:600c:3acf:b0:456:e39:ec1a with SMTP id 5b1f17b1804b1-456348e70f4mr173638145e9.14.1753102450039;
        Mon, 21 Jul 2025 05:54:10 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:09 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 00/12] perf: arm_spe: Armv8.8 SPE features
Date: Mon, 21 Jul 2025 13:53:31 +0100
Message-Id: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEs4fmgC/33OTWrDMBAF4KsErasy+o3UVe9RSphIo0SlsY1kT
 ELw3SsbSlqKu3wD8713Z5VKpspedndWaMo1910L+mnHwhm7E/EcW2YSpAElJP/AC1U+UEk8EY6
 HOtCB0sitDTHp6BJ5z9r3UCjl6yq/vbd8znXsy20tmsRy/TbVpjkJDlxikBA17ENwr5+5w9I/9
 +W0dKyAAfs/EKN2QI60M+InsKya5GOJkX4bkg1CEOiPiBEs/oHUA7JgtiHVoL04QvDJO/DqFzT
 P8xf8IelskgEAAA==
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
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_055412_247206_5C3AD884 
X-CRM114-Status: GOOD (  15.43  )
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


