Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA91FC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nn7zwwW1+OwGIV0wfJqgAgTa7HI6crOwjPKwSXJSzwc=; b=VItjNEnzxMAYio
	mwN8FknFyHAUHLh6V2x31VqDvTAewlh3KV6OJ19IjxV5nJBhNwybVQy45cPT1uAbfsuFnHsw+VFJY
	9l8BQEkzwVLnIVSTxRRmrM/fpVdkqt9fgzcexNKTGZIqY4RvzAbQz8Bbh+2zdmXTF3ARotmvtedWE
	ZevF/rIb6BP4om31M30als3PJfSGK4nTy8ej5v/kbniILwqLXUN2DpwK9mUVgmV0edbtaHMkIyk1l
	YfgjcZyAM2RnKBoE++BWnoqudYbLTHDIeiTSqWww5F6MKq0CzD+TyZ9Ok0j8lFh5TfZhRpdCWl51p
	9+PX0ozYLcOwfo00r4lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJEX-0000000CJJ3-2Zr7;
	Tue, 06 May 2025 14:25:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGgz-0000000BmLQ-32J4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:42:34 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so46737525e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 04:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531752; x=1747136552; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nn7zwwW1+OwGIV0wfJqgAgTa7HI6crOwjPKwSXJSzwc=;
        b=MegdmJQ/v49OltBl59Vc2p0MJAIRH+/0h24xW3V5XjUCHs+tO3LodPuWXbSQE0q5A5
         a/6vOTsPeoMhM94puUW/YSsOHJR9tkrOYvc5jrJ8VCi/xOcM6/foj2ptrekxSjRmv07K
         TS/5+nw8WJub9pEeD3B8TvRHfFQfhdN/CqxKeAuRjClFI8PEZ7i6nATRVmuFsZ1QoXYz
         s2EcRPNtI/WpFR4evMmqW9Cf8kekL207WL6L81DwS0akLx78liEp5XCiPDpeVrmhEKUd
         boIlvIrRUNpDukObu+XGdDD9Tf2Dfh4etybTF+5QVmrEQJmqHMHaC+ohrxiYzhKDPINV
         0EdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531752; x=1747136552;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nn7zwwW1+OwGIV0wfJqgAgTa7HI6crOwjPKwSXJSzwc=;
        b=ZyTY8I2+EmBLbTnWK/PJoxGYqonNIpLo3yolm2UztPNfTshMiiLfW26JwPvGZdh8/j
         ZNZHSfCOnkCSiJUDu2myihAmqnfJoTeQIXh/UDPHH8YajyWcUr15iiOzL+q8H4eJtXQC
         Car0zSahq3KG0esJM1ueS06hJKGiVof4pv8rh3wV1nV7ICT0zzPZpPssTtjb3ming9q3
         cVJ6SpUk85eX+Jv1f3n8wih2KSA4oKfDZDV+bnErd9hbgrC69b42aJ2NBahF8hdIzuSj
         kx5PangRyxEU/cTs6s9lI4BugF5DFteKflCRvFIVFaJtkhBt5FFOKBHSIjTW+LDgKTKZ
         L7RQ==
X-Gm-Message-State: AOJu0Yzu7ug4elUCH3Z2j/Wt9P3rddtLQu9OsUHF+SQ8i0QS8aSviHLs
	G3vaIqF1xMe1fk7kkKZMfVOAPlr4rQ4+zulFVE8yP/iOCIP939rbczcjep+4rLg=
X-Gm-Gg: ASbGncunLVW2EZ74hXQP9UgwJJDDYsjhY/hbbo1yotdzpp5stZcRQwLMpvu4a9zeiIN
	59/k2q7F24F6VAb+4UY6huaIHGKkKLwPttaJwHsNNZje26xuDu28GXtKtmpUj6I1oA0BlAMpWbk
	eTwV3voq7IhJghv3lqgPUaS6kEEz4pewogx77YnJZhWj7szEzNZTFDm/x7toWu+D3DXRAOIaPny
	WqPp4ZgYcKQGI4cXvI/UqzV44UYdY8MmjgiEf5GxU/vG+6+PDpMjWR5tkpMx9nUOm+kxuA81ZtP
	H1vz0MoC7YdyqJStkqkqeoIE/DwN8AtDhhpOGFRC3CPHdeZ0R/jXDr5FbA==
X-Google-Smtp-Source: AGHT+IFOFC/HYp+b/sLqshfj6fUDhVXxkvGd1k4jKO8z9uXGvrvvByGxLJkY/vukR63GyNj7W/KV9Q==
X-Received: by 2002:a05:6000:2405:b0:3a0:80b2:eedc with SMTP id ffacd0b85a97d-3a0ac3eb337mr2198218f8f.52.1746531752133;
        Tue, 06 May 2025 04:42:32 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:31 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 00/10] perf: arm_spe: Armv8.8 SPE features
Date: Tue, 06 May 2025 12:41:32 +0100
Message-Id: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGz1GWgC/3WNQQ6CMBBFr0Jm7Zi2IIIr72EIadop1GhLpoRoC
 He3krh0+V7y318hEXtKcClWYFp88jFkkIcCzKjDQOhtZlBCnUQpFd71kxJOxA4d6blPE/XkZqx
 rY11lG0dtC3k9MTn/2su3LvPo0xz5vR8t8mt/zfJvc5EoUGmjhK3E2Zjm+vBBczxGHqDbtu0D0
 veHVL8AAAA=
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_044233_768982_603D8C68 
X-CRM114-Status: GOOD (  14.55  )
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
  * FEAT_SPEv1p4 - patch 2
  * FEAT_SPE_EFT - patch 3
  * FEAT_SPE_FDS - patches 4 - 7
  * FEAT_SPE_FDS Perf tool changes - patches 8 - 10

The first two features will work with old Perfs but a Perf change to
parse the new config4 is required for the last feature.

Signed-off-by: James Clark <james.clark@linaro.org>
---
To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Zenghui Yu <yuzenghui@huawei.com>
To: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@redhat.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Jiri Olsa <jolsa@kernel.org>
To: Ian Rogers <irogers@google.com>
To: Adrian Hunter <adrian.hunter@intel.com>
To: Liang, Kan <kan.liang@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: kvmarm@lists.linux.dev

---
James Clark (10):
      arm64: sysreg: Add new PMSIDR_EL1 and PMSFCR_EL1 fields
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
 arch/arm64/kvm/emulate-nested.c           |   1 +
 arch/arm64/kvm/sys_regs.c                 |   1 +
 arch/arm64/tools/sysreg                   |  26 ++++++--
 drivers/perf/arm_spe_pmu.c                | 100 +++++++++++++++++++++++++++++-
 include/uapi/linux/perf_event.h           |   2 +
 tools/include/uapi/linux/perf_event.h     |   2 +
 tools/perf/Documentation/perf-arm-spe.txt |  86 ++++++++++++++++++++++---
 tools/perf/tests/parse-events.c           |  14 ++++-
 tools/perf/util/parse-events.c            |  11 ++++
 tools/perf/util/parse-events.h            |   1 +
 tools/perf/util/parse-events.l            |   1 +
 tools/perf/util/pmu.c                     |   8 +++
 tools/perf/util/pmu.h                     |   1 +
 16 files changed, 272 insertions(+), 14 deletions(-)
---
base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>


