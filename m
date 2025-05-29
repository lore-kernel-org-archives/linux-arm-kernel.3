Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A1EC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9RGEjbS+3C/e9OMoWBvhsdf9eFJydSpRbxivnh7opTI=; b=GU374S5xBCEWrY
	8tPmarFiX4ZFc4AKMq7uTip1WckGdCbuaHtnsY0DxOGjA/49vjNWs0VoNS5TdtJDwiKCrA5GemuNx
	M6Y0ej26yt7EqGHEiTQjVNF6hr82vwXnFKoD+eFIuJGdp0eFj7G68F1Td1FsFB2gB7e2smf+h/N0l
	ap419OSgGm83MkZ4z6UCfcy/YzuF2WuWeupHCT0m2JqeT6By6bRfNTfWuBvFu9n6gOb6K58H3+6Fj
	CB1LdNL6Q0Sx7vETf9pUa2Zwh+SeJx7/u78Swjvn5qv7orP4QNfbi09ZXHW85S8QWlUnPUYcpjYGT
	H/VA5qiw1ZzQEqZUz2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKc9g-0000000Fi9O-1pxF;
	Thu, 29 May 2025 12:14:40 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbVV-0000000Fd8A-3uQa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:33:11 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-45024721cbdso6996765e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518388; x=1749123188; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9RGEjbS+3C/e9OMoWBvhsdf9eFJydSpRbxivnh7opTI=;
        b=zc13VfgF8XUXmEuyK3F9bgegr7V3T6M73WFqqo2pIPFDu0foOYFeWcapiTpxkTNFtx
         KLgZQ5LrdlG8mv9WtNjTJ0yQwm2D3NB8Fnez15rAsaPrTWQ3uRckuyu2O+GgvQJZMmXw
         gAUmdvhGDdMfV2XTsZkEQIl0s55goo3e5B9dZIimSqpEMAoqvh5hcZvTZXToA0y0wdPW
         FNIwaYF38FmQ5iJ0gMEZoC6xC7EMYMxxlKJEbeXjVsFfJ1E0o88I/C0feDzwYJ3cL9a0
         j3BFbYdXEsUio5vrrFv0uuN9J/5O8wQt+EyEZOGRHkAOQ+SoP/xrr0NIIanMDeKnW1/h
         bCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518388; x=1749123188;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RGEjbS+3C/e9OMoWBvhsdf9eFJydSpRbxivnh7opTI=;
        b=AM4MGRsiJ9M7hjMxhHnpWUG9B3O71ZibCik4bVIrgHlPOaXBqecL8ErXA/CK60PRAp
         fXxVdIfOZz3hlGcPYxlCQRpnEWBv37PIGpdnzeQDg0nHrCLwvijr+EAr8ql2XW9TBRCW
         LOMVLjrwMiwSuzVuKVJ3Z1OOM8UQ3TbXT4ysG+ugkTq4G+7IRByA9TnJ0RUYzV3j8fTi
         5ZGqrPNU+ZM8UbWbc0zXfhE21BHPl1BEirpwR4gzYCYYowo1K+keQE6jzkv5A4KBBrLi
         cd7g2tGvey9qOhDogX+EL37T7MgZ9zF/1/21O5jJT+mpYye1iLD0ifmGc3HUfOKZBSoK
         h9zg==
X-Gm-Message-State: AOJu0Yz6okkKvLlG4ni05V1QVT6QuneiDkpkPxGgosCG2QNe3/Hkqctf
	N+CjHJrx6l+ADsNItQ0m7bVekuZyJ6M+I3Hw7wf9VRzessqaohGD5DxYHBWNLlyRpPE=
X-Gm-Gg: ASbGnctkH1KkyX/sSCe7BPcs3zqUErlxWnwfJCUTvBQPnjXhbTcdWxEnPsRb6PLohl5
	n1pz1hwnhfRik8xS9G4Pev34Cwqn8Xao0tYMq1B1vI9a9aOMZiBSrYdCNeYNV30HAyMr4L3cojE
	TNDYfLmo0Qb9F+rPcCnuxPTFDCvBcs2RG5sl/LRkmC7LlYSa3gPwnySAxfRbyCRQ2OIju2PcL+U
	V+iWRJZtQ5+1nKWnquVyKh+tlUS9LNKAEBH/D6iX7Y1KipKeJvTUXHgEOlEwB2bUgb/KkK9JWYr
	xpg1J3ZJtVUVZwoT2k2drf6wkIMzQB/pQFumhqkIUL8YXf8/HXkkzK2tDxdj
X-Google-Smtp-Source: AGHT+IFDz2Nzk5rV8H17aE5jP5Yo1dXjiKY7Wt+ZcHiSvBCRbRuqUmfh+W28PJ1soWP3lufeYbHSmw==
X-Received: by 2002:a05:600c:3482:b0:441:b00d:e9d1 with SMTP id 5b1f17b1804b1-450d055ba9fmr18892675e9.2.1748518388273;
        Thu, 29 May 2025 04:33:08 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:07 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 00/11] perf: arm_spe: Armv8.8 SPE features
Date: Thu, 29 May 2025 12:30:21 +0100
Message-Id: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE1FOGgC/33N0QqDIBTG8VcJr+c4mjXb1d5jRIgey7FpaMRG9
 O6zYLCb7fJ/4Py+hSSMDhM5FwuJOLvkgs/BDwXRg/I9UmdyEw68gpJxelMPTHTEaKlFNXVpxA7
 tROtaGyuMtNg0JH+PEa177vK1zT24NIX42odmtl0/ZvnTnBkFypXmYASctJaXu/MqhmOI/baxA
 xXU/wFjhASUKGTFvoF2Xdc3cIeZJgABAAA=
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
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_043310_006657_ED621DC0 
X-CRM114-Status: GOOD (  12.61  )
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

---
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

Marc Zyngier (1):
      arm64: sysreg: Update PMSIDR_EL1 description

 Documentation/arch/arm64/booting.rst      |  11 ++++
 arch/arm64/include/asm/el2_setup.h        |  14 +++++
 arch/arm64/include/asm/sysreg.h           |   7 +++
 arch/arm64/kvm/emulate-nested.c           |   1 +
 arch/arm64/kvm/sys_regs.c                 |   1 +
 arch/arm64/tools/sysreg                   |  45 ++++++++++++--
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
 16 files changed, 301 insertions(+), 15 deletions(-)
---
base-commit: 90b83efa6701656e02c86e7df2cb1765ea602d07
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>


