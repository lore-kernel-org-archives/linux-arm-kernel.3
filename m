Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7C6CA100A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cW1RMJBgq8+Ixb2ud74sehWUJPMSoTNgKWq1D39aVBM=; b=OZ6VNB5XnPktJY
	1/RgP0KZtxYjEKUGgwCkRCx/I6G6Ad8h5wfNCl5sOGpzWQGqz4mLdEtxkjJlxRRaitmLhrSNm2RX3
	5Vf/HnNoHQ8h62Y5MQIvi8QUbmeuffy/CNx98C4jQj22xFe/BCiQi8aLe3YtDEs2yg7bMclbM7pVM
	StMwivofM5CjQHRchMaRDYLCpxPGQt/4lGTjuyKZJvguDHXgf8C0MqJqJCn/hi1CMnPuIrHXCtFx/
	CmfH53C/zAEolQJEHxI9rIVU/CJ9HEjT2SNLNIqBu87KocmAgL/ZUrhw4T+wK4lGNzW/lRCrojTTC
	yljAigJDGGDUL/p3hPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VM-0000000DGuN-2GE8;
	Mon, 01 Sep 2025 16:35:40 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3r4-0000000CYu7-0Ajz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:41:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45b87a13242so14705075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730508; x=1757335308; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cW1RMJBgq8+Ixb2ud74sehWUJPMSoTNgKWq1D39aVBM=;
        b=XSYtx5x0pLUYntDbs/sdOvNjAIUw89wbuzPUec/QHYo6a8FlsW3M1vvC+zrOhSlTsz
         raxB3x/+mPTE6quDSoX6O0vB+3vAAJDiEEJcbCPCbDnxQ7s3uaqFAfrkzYotDtx7Pm7v
         OPGvVMvFj0gAG5/U1plUa/rikhF+W6+j1z9gIWFMnOnLOOC+xYbeKgmDpob0fK3V/BAE
         p4WHzY+wsLrDcRMKeUnVGOEdZYsCLToVcAFArK57zNeUJeL87dhD6vsNhKHSJzVBB2kE
         BbqiGHikp52putmciKVdH88Qttpk7HlCDModYLccXxSIWEWYXSr3bPcVtpwBNi27Hdhi
         zfvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730508; x=1757335308;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cW1RMJBgq8+Ixb2ud74sehWUJPMSoTNgKWq1D39aVBM=;
        b=WXXAIzZV3m5PM2n4SnWbraY1/JGVwY2ERpKq+Mt2W6PXZZEzz4qU+FIfSPbzUBm8Xg
         wdQMabTZ53MupTTJAOsplQE5ltTCAhWlUZCA1dY4xXIGKmisDPKDDlVXOU/90M0d38oo
         gku+96aHyjlCb+Hl3xZHUrSxgpaZ5CrRkLSmIgEvQI3NmgkoF81zGD/uXvqw2Fg2DIjV
         sqo4s6vH6ULfzf5T/NPLMnAFiKhCC4QYza1X81Qqc4L/djKALwWHmy1+pjB4Kip9BziT
         EyU2axhL9XN77dWx1eeZ9QFulC2tXn/7hCtKADzbXNqeURvctmgpwMs1r74yng69Tr3O
         5/Tg==
X-Gm-Message-State: AOJu0YwEhQ57DL6/phBVw33wgZIEl+ZNw9/WnRBiIGb/FNBSrcm9x27O
	XGVJBI7o9rxmqBlkOZdBmPD9OvHBpw/d6Cf+E+TtgUeOBFxRBTnicxM8uDSP/RvgepQ=
X-Gm-Gg: ASbGncuL7DK6obPcBokVJs5S+yZ3fAjtOm3/oLoOaOYcF2j6gC+ruU/cY0KttkzDYKG
	PpdzVSq1BDBejkUjSJa5gDUrUn4Xv2WVwKtBrI+/8O76KRUdWWlO9if+vjrQwi2CNglDkgeUoQj
	JFFoEYWdoffXK10nknO0tQmQiHEKGZhdVkTR+ny2PXleAkuV6NUfyWFk9o6KixKp85QZrqAo8HP
	j5798Mxea3QYlBuyrJF/XC0Fic9dbMy3xFtn6GS523tGVtF8Pvd5w2tyJlXJoPYfQIimyWBgp5E
	4dK1v4U7eC/Z70eTPsjrB2LY19CnWEe7qmtPaN8pSeB6vHx82eupjtAxe1oJ1ghGj6+ASsgRlgP
	UgscmYPJp1oRagUQNnsoCc8zWwlhTbuw=
X-Google-Smtp-Source: AGHT+IFE6fow3O8KM0rkY3i62xaP7WMDS4u/5CNiqOy4n0CRCf5rIl/7BP/8REZUAe6hCUgpCinnrQ==
X-Received: by 2002:a05:600c:4f8f:b0:458:b01c:8f with SMTP id 5b1f17b1804b1-45b85550a68mr69628025e9.8.1756730508401;
        Mon, 01 Sep 2025 05:41:48 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:41:47 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v8 00/12] perf: arm_spe: Armv8.8 SPE features
Date: Mon, 01 Sep 2025 13:40:29 +0100
Message-Id: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD6UtWgC/43RS2rDMBAG4KsEr6syektd9R6lhIk0SlSaOMjGt
 ATfvbKhOMG4dPkL5puHbk1HJVPXvOxuTaEhd7m91OCedk044eVILMeaGwFCg+SCfeCZOnalklg
 i7PfdlfaUemZMiElFl8j7plZfC6X8Nctv7zWfcte35XtuNPDp9deUm+bAGTCBQUBUYENwr5/5g
 qV9bstx6jEDGszfQIzKATlSTvN7YJpqEMskWvhtSFQIgaM/IEYwuILkAhnQ25CskOUHCD55B16
 uILVAVvBtSFUIUAurOCSX4grS/4T0tJo9BC1lPRGub2QWyIHbhkyFTMSkvNPWPf7WDNk7iKtty
 E4QWiWTTSi0f4DGcfwB/4UI2rYCAAA=
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
X-CRM114-CacheID: sfid-20250901_054150_092539_32B9E3A0 
X-CRM114-Status: GOOD (  16.61  )
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
Changes in v8:
- Define __spe_vers_imp before it's used
- "disable traps to PMSDSFR" -> "disable traps of PMSDSFR to EL2"
- Link to v7: https://lore.kernel.org/r/20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org

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
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>


