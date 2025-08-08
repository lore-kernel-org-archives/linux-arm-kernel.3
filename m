Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228BFC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kRspYZ6QAEJaF7pYavgjx3m5cWsrC6eyWll+Yl4bXuI=; b=sJpxSMeuz9G3GD
	2a4nz+1KtIxEe4GExYrGfy6PlcgQpzO56ksAMEzzSlkqfJyXa2b58ZISCwUX7+ClL0ptbBFPjPbbg
	2dsLHBC1gR8yHrK6qmLL4qs/UkC1CMWbfQa9mQJtCF9E5d3z/WOkbD5e2rwded0H5AkTV7JtPNUp1
	ZbCIw7SQniRi7EiJv0thWSOEzx6yT71NTNECzymuBHdUXePN75olnBO0937+KI0M0jAFWfmyTIqs5
	xmoRfA9tBpmBNrmxGuTO93AcqRMIPwdDOMaAZFawO7niLTdVgQHnHBRY8JvM41xgto7ZCEQV4diad
	sS/4nnZuYCXTWLGXix+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLEq-00000002fUF-2KhE;
	Fri, 08 Aug 2025 11:26:20 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLCL-00000002emH-40VY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:23:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-459ddada9b1so18857235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652224; x=1755257024; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kRspYZ6QAEJaF7pYavgjx3m5cWsrC6eyWll+Yl4bXuI=;
        b=ItqhTbBadwxZbQy8V9ySGMLh7beag1PaJqdS/x01xqN+2qBQoC8+bmDlPRsH43wxjE
         zioBv+TJ4OxNrNquVwx0IQpm/DEB9DBNOM6GYPm5hb6T1F1FsUXuxmMu4gXyJoteyM0x
         yjRmvdwxTg11XH2gU0mNU7pi4Pk41CNdYP2h0Fr+P8tkwkp0sNTXjQrHQi501UMsaSfJ
         D4wu76OSKDan+tHPYX0nnCpieDXurT8Pm2WR6q6yy65Ef66TRwNp6NrkoiTO4YhdzZ7y
         SAcznEn0ox7fOyyAWbDmByd9byekdW8X0iQ1lvf1nutFH5zkoEBKBaK+qmrHjQeDEz1W
         0elw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652224; x=1755257024;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRspYZ6QAEJaF7pYavgjx3m5cWsrC6eyWll+Yl4bXuI=;
        b=aYu2E9ZRxTbJzGLMpNhD7mlIsLssldZdbr4wnOEugBz7sjbH1pxV2Jzz0mlMYtZGjD
         EGgVt9/OVIRyGUGrcl8A1zrUp+jXMbaoSorg31b5za8eJuy9pe8c2ABFVccznD0M34BT
         qOjQh73u+aRVd9n9VJIIzNpFnNnCq6/v00IxLMYqoGBprsLltKTsWCExMhR/24kR65lb
         1+OcYTu07W1dC69q0kktyDYB6Tg0djO6kYilSEb3MBRvtxWjAFJrdANWYpqOPgNxiOvT
         UaYgNLbQYm/W10kvTt/aoKYGg4/IHCF19nWjvI/rsVKNUOU9KC3JkPNjU4ta+d5y61cR
         qf1g==
X-Gm-Message-State: AOJu0Yxs3fuxYeFexIOhe2CxNDGSDRdhjWBBG6TGkeVmS8X/OoTuc5eu
	Rz2+XC+LPZFbBFtHoH2thcIScC8PXMb4jd0PN9xng7XZ0B0IrAwCwMo89Rb1rjgUZz4=
X-Gm-Gg: ASbGncuT5Co3a7eddDQsG7TGxzwBqRqnjJoijFXaq4zmhn+tYqLxwCyOFwVbPdSXyfC
	vo7GciQCKluMQQycz9/NiE/wxZUsyzrLaEfWtp3UH5jwuK0FiomP7ZwFloYeyRtTzE7AnFV7+kl
	ufS9XhZ/MsvHtZAawBCfN83iCmwcCjbc0U4Do2qPJkic9kiP8xRJQjRmnCaP018FJx+V5XUD2Oe
	K+HDCv/e74BHCuWYACl/R3DbcyMbkYnhWEk7qwmLSbk6g230k2crS5rXk8Biz9mWvXrX2+05+Qi
	3kH6G0dJEZNPQw7jVvp1+Skur0C6NW9DrNuCZcOghOLRTGQCN6S3g7Jt4g/8hUr5UE0+k/NASoh
	b7wt21ES90QucnWSyhjx2P3dc3c5Iyq0=
X-Google-Smtp-Source: AGHT+IFCMozOTwE+MxJzqrobvwL8Tio0dUjvbjpt5tE0xDuzGkAjBw2SFMGp7HYlkEU8CksYHLPAsw==
X-Received: by 2002:a05:600c:474a:b0:456:dc0:7d4e with SMTP id 5b1f17b1804b1-459f4f0376fmr25391795e9.18.1754652223952;
        Fri, 08 Aug 2025 04:23:43 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:43 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v6 00/12] perf: arm_spe: Armv8.8 SPE features
Date: Fri, 08 Aug 2025 12:22:57 +0100
Message-Id: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABHelWgC/43Q20rEMBAG4FdZcm1kcmzile8hsqTJZDfitiUpR
 Vn67qYFqVIqXv4D883hTgrmhIU8ne4k45RK6rsa9MOJ+KvrLkhTqJlw4AoE4/TN3bDQAXOkEd1
 4LgOeMY5Uax+iDCaitaR2Dxlj+ljll9ear6mMff5cB01sqX6b4tCcGAXKnecQJDTem+f31LncP
 /b5ssxYAQX6byAEaQANSqPYT2DZauLbJorbY4hXyAFztnUugHY7SGyQBnUMiQo1rAVvozVgxQ6
 SG9RwdgzJCoFTvJEMoolhB6l/Qmo5rWm9EqK+yP3+0TzPX5Op3I8kAgAA
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
X-CRM114-CacheID: sfid-20250808_042346_013705_0CC93AC7 
X-CRM114-Status: GOOD (  15.38  )
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
base-commit: 37816488247ddddbc3de113c78c83572274b1e2e
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>


