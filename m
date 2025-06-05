Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0952AC5B559
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 10:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MOtEpU/QTXhqeOr4QGO8o+Hgp7yMZJ+Usq43ricq8a4=; b=whHqMPdvFiRQrR
	5iHW3BshYwZNl5ZMeZ5ygmyXCvQXFs/czYqnwWhLFSBIZo3kw0ZZZL1wlR1u//v69xixpu0pCyFjN
	CUigVE0OXet4s+cOL5/PQWbFdVf915KXEtqG3e8nPmKNdtE3vW9/u6tBqIaH78DOhPa6BLUJrhJTO
	tNrufaV8vcX6oMMn6q4kjaL62q3HvI2DfA2S2LzO/dI21TaSV+aHICnZFlVUYiWKsi1Ygougka73V
	RA+EcxFfSgWIroptYbRM5XqGAbDAvPREfSKK7bqs6nOipBsKWUyUsWnibJELgB58aRp2Un1zRVV1+
	nwgONsG8tscI/TmISW6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8DG-0000000FJ6J-3fjw;
	Thu, 05 Jun 2025 10:52:46 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8Ae-0000000FIC5-008g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:50:05 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-3a375888197so462076f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120602; x=1749725402; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MOtEpU/QTXhqeOr4QGO8o+Hgp7yMZJ+Usq43ricq8a4=;
        b=XoZjGdbEGtt/AvLpqBl7gl+/6Jnzr30c7KIvWich4dZttIJGlyhN9/sh0qactiqFaq
         BdvRNdehSHdYPheZUysCIPeV2+IWl4MSfOchzlggkRtSo3OvA/FonY6WT5OzYuHnyPW+
         SUc9imoY4oOCTYEGB6ZB3hl7Uoy1hYmYklZe5xqDr12HuUoVDTtu3DkF0jxeVJYFkLVc
         WxgfNVRm00Yp3m9SxsA25Yk9QOhreyRA4eaLq4WN1rYk0YPu2v/1qcC8pcQJWc8ypYbO
         Q2jYrG3zFPYKHs+B3tKOyLx98QGgDKpd92mt7y2Drk2FyH2t3Ad8tiI3DqYC8bIfAZTT
         ysSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120602; x=1749725402;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOtEpU/QTXhqeOr4QGO8o+Hgp7yMZJ+Usq43ricq8a4=;
        b=W15MXLfL1Ggqm/kL5Xb7VMJ4Mi7An21/3TR5w00WoUJwBz2bAtJa/1lZKqy/hQLkQS
         AiyNrqc68WAYhrJWjGqneLS+bojmgyyaG46PiXJzK8mVADd4R0uXCeiCngaF5jkoxO9z
         tuAkzr5JrCQoiQXLaiqIb7zrGfEoxVI1Cxm1fv5ICccRgRyJ2U95OWICHjTWqQOOeZBW
         xo11u3Mokr9iQnyotArAzUpzcKbF2SfSDRbGFe1AztzHN8QOlL9tj5K1bK/oJdAgYQ0F
         3DLYudLrKac1+nX5cICHxtdT+AooOHDkX48rSINDqvREPg1CoUYdvoKAgNkkvSSEwErV
         ydpw==
X-Gm-Message-State: AOJu0YxrvkJaaLQqSfjnW0YtORWkqjtL1AmxgDh1iU31hSfQ7u5J0Zjx
	HU6eWhwwNB0jSnKcITBaFgSsuSFTk41y8lFCxttdqC/YN1NEE9BNnK9ujrKVAktmxzo=
X-Gm-Gg: ASbGncvwSfxqYsW8aXvuRMeqQyQ8ddm2XWX+92ftEZgJiycNqKU5+U1kbiGDHhnRmAd
	WKc7ygKBTDi+o7kx/W9JMoZIOMOhlhWDI72ip2MEFrDqC282If0dcTN3RXkQAwJpgziMXmTUbqz
	Nmuqvc2hJHyGzXMrWvlTuZ1vyRjLy+EXzONMCbQzi1ZWfzHJu3g6F+N5+eDAJ6xGZliBokk9Zfe
	FFg5wZGYw2ESOmwhn5GCnjLb4UOGUUpUoDL8s8/KqKSX9x/SHY3yB72MTWjOW8AqAbBjmVr8cIK
	a+ZZ/gIu6BNJ1Rfw25g1KFYkFkPl/YEysU2VraCMzwrdBfnguB7gRjDPAzda
X-Google-Smtp-Source: AGHT+IFIuwqPu0X5eoCscdhdRejVlPb11XtHePijaNQ8MuQwLUyBUWJS/pTWuyRwgt/m/n/fycau1w==
X-Received: by 2002:a05:6000:4009:b0:3a4:febd:39f2 with SMTP id ffacd0b85a97d-3a51d9661b7mr4769796f8f.37.1749120602299;
        Thu, 05 Jun 2025 03:50:02 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:00 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 00/10] perf: arm_spe: Armv8.8 SPE features
Date: Thu, 05 Jun 2025 11:48:58 +0100
Message-Id: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABp2QWgC/33OTQrCMBAF4KtI1kYm6Y+pK+8hUsZk0ka0LUkpS
 undTQuiLuryDcz33sgCeUeBHTYj8zS44NomhmS7YbrGpiLuTMxMgswgEZJf8U6Bd+Qtt4R9GTo
 qyfY8z7WxqVGWioLF786TdY9FPp1jrl3oW/9cigYxX99msmoOggOXqCWYFPZaq+PNNejbXeuru
 WMBMsj/A8akCkhRqjLxDcyrBvlZksliHZIRQhBYXBAN5PgDTdP0AtFtJ35JAQAA
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
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_035004_059725_C56EF368 
X-CRM114-Status: GOOD (  13.49  )
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

  * Prerequisite sysreg changes - patches 1 - 2
  * FEAT_SPEv1p4 - patch 3
  * FEAT_SPE_EFT - patch 4
  * FEAT_SPE_FDS - patches 5 - 8
  * FEAT_SPE_FDS Perf tool changes - patches 9 - 11

The first two features will work with old Perfs but a Perf change to
parse the new config4 is required for the last feature.

To: 

---
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
James Clark (10):
      arm64: sysreg: Add new PMSFCR_EL1 fields and PMSDSFR_EL1 register
      perf: arm_spe: Support FEAT_SPEv1p4 filters
      perf: arm_spe: Add support for FEAT_SPE_EFT extended filtering
      arm64/boot: Enable EL2 requirements for SPE_FEAT_FDS
      KVM: arm64: Add trap configs for PMSDSFR_EL1
      perf: Add perf_event_attr::config4
      perf: arm_spe: Add support for filtering on data source
      tools headers UAPI: Sync linux/perf_event.h with the kernel sources
      perf tools: Add support for perf_event_attr::config4
      perf docs: arm-spe: Document new SPE filtering features

 Documentation/arch/arm64/booting.rst      |  11 ++++
 arch/arm64/include/asm/el2_setup.h        |  14 +++++
 arch/arm64/include/asm/sysreg.h           |   7 +++
 arch/arm64/include/asm/vncr_mapping.h     |   2 +
 arch/arm64/kvm/emulate-nested.c           |   1 +
 arch/arm64/kvm/sys_regs.c                 |   1 +
 arch/arm64/tools/sysreg                   |  13 +++-
 drivers/perf/arm_spe_pmu.c                | 100 +++++++++++++++++++++++++++++-
 include/uapi/linux/perf_event.h           |   2 +
 tools/include/uapi/linux/perf_event.h     |   2 +
 tools/perf/Documentation/perf-arm-spe.txt |  97 ++++++++++++++++++++++++++---
 tools/perf/tests/parse-events.c           |  14 ++++-
 tools/perf/util/parse-events.c            |  11 ++++
 tools/perf/util/parse-events.h            |   1 +
 tools/perf/util/parse-events.l            |   1 +
 tools/perf/util/pmu.c                     |   8 +++
 tools/perf/util/pmu.h                     |   1 +
 17 files changed, 273 insertions(+), 13 deletions(-)
---
base-commit: ec7714e4947909190ffb3041a03311a975350fe0
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>


