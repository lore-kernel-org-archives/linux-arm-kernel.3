Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68BBCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OYmI0eokywhHOoY+WBqC2paCFaISLNGO3jCxnQ7GNHY=; b=u7RnmsQqpfoWiG
	d58pvbgOZ94mxVr7t1vQXjGPC1xwhY1Os17xfxtH4jbekJqOLK+NM5x5SCC9v5HXovYFHpSR60Uz0
	Jj+WXU/Jfj06Dkq+x1GRE6Abh+IxcRPDh8IV9626bndoFaJnU4lOpAo4Kcn7cPOKAMYU7QCK8OzJZ
	h38JJZTHBrDC6cSCJcUHzFZidLOnV/iCrCvPDb56QGkky7vyvhni/fWFIY+ESrSA4G535myxXcCg3
	yH4MU4YWKdA0RmiKlNUjynrSWpqEYLOJPZ/zX26kuJl3xKu6/V0WOVExivh3MtrAOZF7ajt0r+IDw
	TEMJqwRirRmDKuxMdhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Nn-00000001qwH-2C9i;
	Wed, 29 Oct 2025 15:46:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE8Nk-00000001quf-3RfX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 15:46:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4710022571cso77202905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 08:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761752798; x=1762357598; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYmI0eokywhHOoY+WBqC2paCFaISLNGO3jCxnQ7GNHY=;
        b=K20dYNvO7t8LOlAD8/QcdR8mzvkQ6QifldDE5sO4AJauX0s0KJEqyIfQT9pjIZGc0v
         tq5e8Z9Qi0ZaX4L8PjIkkdJfDMMSI+xzbw6yuZG8ZVsRZvWKGQ26V7/FLH42yMhZomrW
         yymiPfOHAkBrV+FG8mDlnZ7v+sPC5Srqx/+SYWg5JlUvDoz/uFOVauUo31R6kPeLZH34
         UqT5G3prf/lS7XsIy+DUyRIsa3nNHFQLeAkssXhWhy0/WYUgD/8jpqScVhYYFuM12yWk
         wCCxMBsZqgj0hTamQoyzhXqA19CjSCNf5ZnFWhryvn01uIm8OBl0WHQvj68vqtGKq/So
         UZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761752798; x=1762357598;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYmI0eokywhHOoY+WBqC2paCFaISLNGO3jCxnQ7GNHY=;
        b=ID4E1K7HPCudpcwZeji4XtEysF2MDtaX+Gpc8X4wj8XCukHc2+mFQ5paObsAhloI3X
         xu8TOwYcZobkHu4+xL7FmYbSc+gVJn4jZ6pzxsZDm8hDB+SGhwoLPlWLPdHTVZcDKgb0
         8R8m9vC4q8xUg9ua1sJQiCEriV3IbMkB0JbfzzF/CTaG8s4bBq8i8SJ8wlvJ1YZlzEyP
         6NYQIeVUBwsem+fWFJaZF+gUZWhFQyFnG9MgEWsj7nB92EhkstIy7P+xyqjkzC47ih8w
         8tfWXS+y7EqwQ3UNROmIeF9ny43S5+JREkUyq0obIhdlxgCjQOo+stMz3GMTBS8cjWR/
         z61w==
X-Gm-Message-State: AOJu0YyicMz7aIChJ6w5jq3nh08i1h0XVdZTOIGtyzBmXh3SuaxdJZBQ
	5i2rXf3EqfI4Y9DgDmUub4k9auCQHExDhK7mL6jHUmM5U9BSioGaDwjkaBHn8in4I/0tvJ02Zde
	1V0ipOi8=
X-Gm-Gg: ASbGncvxawdoi6UbptPVhzGPGvHkrdPIoZ2ii/Z73mncKooBEFQNAaf+Woue5ttNJDh
	Jg+zp9ZKLujYw9/YHpCM39kjeAuLOR5MEyD1BvFqRMM0Cf65bSRPCwVTICZLgLou02LKoAsYoIa
	HTF0+sk2c5u3ce5vpS1OoLhoNziOc0yt1WW0kBUAOq5olrbWjHT7lCsKL8wk2Dy/YkMNHk8cfS5
	jqCXPFez0QzZ7pkOj3pKhKp5YvvAh1z8Iujl10IRGYf5F343J9Cp4NZBod+wHeNm8uHaE33bXFB
	QLlG+tFXnid04J7e9A/WBwTfDH5zrvZQQ8k3TLPRpDImt5A6yMb0lKb7iyqDeTlUzJzqB4MewQ2
	o5Jkr7X3j5yI7YGBYy/k9DxZdSEP3X/iMxUTrPkI8A5/ySy8WGqR+I6CByqAi6pUz0zE3wOvl/e
	HT3nN6r2cMxg==
X-Google-Smtp-Source: AGHT+IFwHWp3z0WfR5BEyLr3nsy+4DqHZJcjqlkJZW93LcT7e+RtCP65cMKCJuN+XEYyyExdOCX9Iw==
X-Received: by 2002:a05:600c:3109:b0:477:19bc:1fe2 with SMTP id 5b1f17b1804b1-4771e1740f8mr35479835e9.6.1761752798296;
        Wed, 29 Oct 2025 08:46:38 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e3b9994sm53745535e9.16.2025.10.29.08.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:46:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v9 0/5] perf: arm_spe: Armv8.8 SPE features
Date: Wed, 29 Oct 2025 15:46:00 +0000
Message-Id: <20251029-james-perf-feat_spe_eft-v9-0-d22536b9cf94@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALg2AmkC/43S3UrDMBQH8FcZvTZy8n3ile8hMs6Sk62i60hHU
 cbe3bQgnZYOL/+B/M5Hcml6Li33zdPm0hQe2r7tjjWEh00TD3Tcs2hTzY0CZUFLJd7og3tx4pJ
 FZjpv+xNvOZ+FczFlkzBzCE29fSqc289Jfnmt+dD25658TYUGOZ7+mHrVHKQAoSgqSAZ8jPj83
 h6pdI9d2Y81JsCCuw+kZBAY2aCVt8DY1aDmTqwK65CqEIGksCNK4GgB6RlyYNchXSEvdxBDDgh
 BLyAzQ17JdchUCMgqbyRkzGkB2X9CdhzN76LVuq6IljtyM4SA65CrkEuUTUDr8fdrTZC/gaRZh
 /wIkTc6+0zKhgWEMxTgzmg4/h9WXmNWxv6BrtfrNyPHp0D/AgAA
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
X-CRM114-CacheID: sfid-20251029_084640_917692_DCEE0B2E 
X-CRM114-Status: GOOD (  14.77  )
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

Support SPE_FEAT_FDS data source filtering.

---
Changes in v9:
- Fix another typo in docs: s/data_src_filter/inv_data_src_filter/g
- Drop already applied patches for other features. Only the data source
  filtering patches remain.
- Rebase on latest perf-tools-next
- Link to v8: https://lore.kernel.org/r/20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org

Changes in v8:
- Define __spe_vers_imp before it's used
- "disable traps to PMSDSFR" -> "disable traps of PMSDSFR to EL2"
- Link to v7: https://lore.kernel.org/r/20250814-james-perf-feat_spe_eft-v7-0-6a743f7fa259@linaro.org

Changes in v7:
- Fix typo in docs: s/data_src_filter/inv_data_src_filter/g
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
James Clark (5):
      perf: Add perf_event_attr::config4
      perf: arm_spe: Add support for filtering on data source
      tools headers UAPI: Sync linux/perf_event.h with the kernel sources
      perf tools: Add support for perf_event_attr::config4
      perf docs: arm-spe: Document new SPE filtering features

 drivers/perf/arm_spe_pmu.c                |  37 +++++++++++
 include/uapi/linux/perf_event.h           |   2 +
 tools/include/uapi/linux/perf_event.h     |   2 +
 tools/perf/Documentation/perf-arm-spe.txt | 104 +++++++++++++++++++++++++++---
 tools/perf/tests/parse-events.c           |  13 +++-
 tools/perf/util/parse-events.c            |  11 ++++
 tools/perf/util/parse-events.h            |   1 +
 tools/perf/util/parse-events.l            |   1 +
 tools/perf/util/pmu.c                     |   8 +++
 tools/perf/util/pmu.h                     |   1 +
 10 files changed, 170 insertions(+), 10 deletions(-)
---
base-commit: ab29ff9f6fe06d23c16b5565fcae96bad21be900
change-id: 20250312-james-perf-feat_spe_eft-66cdf4d8fe99

Best regards,
-- 
James Clark <james.clark@linaro.org>


