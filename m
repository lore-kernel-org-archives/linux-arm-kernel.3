Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB60E674B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 15:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9LJhS2nq8ZHS6T/QvSCJ9XFnbSCF5NsF3Smsb7IoFAo=; b=z+RsXxTle4Oo93
	N275ZFmRSfDmQTWc+ORHHZETjuVvHLvJ6JJBk4Q21+YDYQAHBZCw2PvPtyBBP4KXdyGcc8ZhJ74zw
	0SjjIFWHX3w5tO4LuCawZcZdNQX2PFzf9Hf/QedJbSSV86JKLx9fc1KKPYYY2GBC+1h9Z/hOFKIvN
	My7gaAG790nbddAS1Lx+FQsjfVflOrIkHMubQQUbdrGkfxjzVJwci8Jx5k0miEH3+B7t1dE+KvPUl
	bwEiLPUBqD1Vbig/b0Q25qmhPZgrwSeMbsUPNbHO0MwfnTyg6DOKT6WA0OfoeUMWFsBCiD6eLoc57
	U69Zusl3QjkYeuHCFS9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcZ-0000000DtgI-1AdB;
	Mon, 22 Dec 2025 15:14:51 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXhcW-0000000Dtfc-34pf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 15:14:50 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42fbc3056afso2143305f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 07:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766416487; x=1767021287; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9LJhS2nq8ZHS6T/QvSCJ9XFnbSCF5NsF3Smsb7IoFAo=;
        b=gu/SNvZDUbZilhxKpr9FgihNzXUeox1IWgLxOJKzKnm1vNaOrcmGcdvm1SGKkGCMdj
         Rc3OaCwZblfxl+oJUTvqvpduoFFS57iSA5frrASWd9iJVYs5m+8OPSYzVJe3yQx8pxF5
         HmsGjmzYNkAfShn2QsTowWxiBo7RhN0X+AuodIr5/LWFtQ4elJt3jOcZkmXeHrf/IDCI
         QB1VCQJj4+cDzxXY4LLvPXC0z50vK1psoRQgzXFDs57v6wHvB7I6CCFYHqy4zgx6bwZB
         0OiJcxzU33Ixb9nExK22x8aBCG6gMpFriszQWU3quzJI+EVuoHYZn/6lXNKj/6HVm5OB
         mTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766416487; x=1767021287;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LJhS2nq8ZHS6T/QvSCJ9XFnbSCF5NsF3Smsb7IoFAo=;
        b=QW5SoSuj+CoeiURQXPfW7RP0AzxravdIZeFNVH35WdILJRI5GnkSbxAZ+3mh5X6te+
         moAgyGmsM+xzBLiSVSa8yupG/zxN3/i+BHhmZRJumoIMDO9yr9DMWfa86dmkYpzmU7mb
         iEXuTPYDG9x5RktHZs7rHZa3Hr1GPhfbXnlPJDj35FXKkVl24YN5dXTH+wug+a2eB1md
         9HZqE/6Q32lGt33/4WQdn9zQA54CRoWalEtDqJSJrUhzkbmiaXOC5UtlETvS6oPXUPbm
         LadxycpowmpQ/HYWaX26h438qOoC9ZgWx+52vsrCKiXnuzoSYoKKEi4mSJoauWnlV3cB
         RU8A==
X-Forwarded-Encrypted: i=1; AJvYcCXapFJ0TsPQmIejvl/dI8kzxu87sN1GvTR74V/FPBP07/OAx7OsaSh+AaFOuu7hGyt86a1i6gOl6SznWykOfbFS@lists.infradead.org
X-Gm-Message-State: AOJu0Yx42mc+Cctqu4wue17/eJeZ332Yo38Xd/nCAMv8es/VziQHjRqZ
	a9p2g/DfzcaCbfs84mBzxVxgPIHRA5ZOg+WSBTjqReNNWpjbhDz16Vvu28jbZzXe60g=
X-Gm-Gg: AY/fxX6Y3BM38Gk7E9Eyr1rI/xNTHZgilANgH349DzKw98GfWQgVFabDWQBgk8/bOOw
	SLVrUjIsezGDRmBRjDrZr9J2tMCQbQk2rvA3/HmIJJip86B4x3cFeSBdbrlf4xyYFS4xcbaTzhx
	zObrtpeo4J6aQaRa3xJGEbqy/uR5b2IYvxIkNqe0KkgTblyrs8yvfqbWZ7Wf0XMaycdVi1r0A9d
	CSCEfcY2siQpdlqh7jBMLA7G0WQBgnbE0Cvmkygjhv7Cn7WQxqjSphgrm2wh142P9QpSSqReCDo
	GR5oqanTKziz+AKBVIyttre0LjZouRp/2qWDuD+q1pc5eZnVYClFfRyo5N5wVR1H8/cheoKm4cE
	OwqKgLCbBwQ8gECyLGEpa14bs+OKFBOVEPVjrOPx1MUaJWBt49WLFSO5bMd0Wq9KK3FOFtk/aB0
	lG50I+MkbhuAr/MshCN0LJmlgGcWAlUdQ=
X-Google-Smtp-Source: AGHT+IFn92lYsDgvK7tpXNAPQ0WsUj1chzC1o/mtl8WTQxCYBCBN4igonzXBapuvSBdZM9yNW4+VSA==
X-Received: by 2002:a05:6000:144d:b0:431:74:cd5 with SMTP id ffacd0b85a97d-4324e50b758mr14849127f8f.45.1766416486681;
        Mon, 22 Dec 2025 07:14:46 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm22750093f8f.20.2025.12.22.07.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 07:14:46 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v4 00/14] perf cs-etm/arm-spe: Remove hard coded config
 fields
Date: Mon, 22 Dec 2025 15:14:25 +0000
Message-Id: <20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFJgSWkC/3XPzQrCMAzA8VeRnq2k2dyHJ99DPLQ13SK6jnYUR
 fbuVr0osuM/kF/IQ0QKTFHsVg8RKHFkP+Qo1ythez10JPmUWyDgVimF8qyvFOVIwUnrB8edNDx
 FaYhqBZUDByDy8hjI8e0NH465e46TD/f3naRe0w+JoJbIpCRIRLLGuAagtvsLDzr4jQ+deJkJv
 51m0cHslNoCNqptCwN/TvHlLL+YiuxoXVS6bMqqrqsfZ57nJ3S9Q8RNAQAA
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_071448_840090_25792246 
X-CRM114-Status: GOOD (  17.74  )
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

The specific config field that an event format attribute is in is
consistently hard coded, even though the API is supposed to be that the
driver publishes the config field name. To stop this pattern from being
copy pasted and causing problems in the future, replace them all with
calls to a new helper that returns the value that a user set.

This reveals some issues in evsel__set_config_if_unset(). It doesn't
work with sparse bitfields, which are an unused but documented feature.
And it also only writes to the attr.config field. To fix it we need to
start tracking user changes for all config fields and then use existing
helper functions that support sparse bitfields. Some other refactoring
was also required and a test was added.

---
Changes in v4:
- Constify some function args (Ian)
- Move some evsel__* functions to evsel.c and make some pmu.c functions
  public to support this (Ian)
- Drop pmu arg where it can be fetched from evsel->pmu (Ian)
- Link to v3: https://lore.kernel.org/r/20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org

Changes in v3:
- Fix uninitialized variable warning on GCC
- Fix leak of evlist in test
- Confirm no type punning issues with ubsan (Ian)
- Link to v2: https://lore.kernel.org/r/20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org

Changes in v2:
- Remove macros in get_config_chgs() and some other refactoring.
- Support sparse bitfields in evsel__set_config_if_unset().
- Always track user changes instead of only when
  'pmu->perf_event_attr_init_default' is set.
- Add a test.
- Don't bail out in cs-etm.c if any format fields are missing (Leo).
- Rename 'guess' to 'synth' (Mike).
- Link to v1: https://lore.kernel.org/r/20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org

---
James Clark (14):
      perf parse-events: Refactor get_config_terms() to remove macros
      perf evsel: Refactor evsel__set_config_if_unset() arguments
      perf evsel: Move evsel__* functions to evsel.c
      perf evsel: Support sparse fields in evsel__set_config_if_unset()
      perf parse-events: Track all user changed config bits
      perf evsel: apply evsel__set_config_if_unset() to all config fields
      perf evsel: Add a helper to get the value of a config field
      perf parse-events: Always track user config changes
      perf tests: Test evsel__set_config_if_unset() and config change tracking
      perf cs-etm: Make a helper to find the Coresight evsel
      perf cs-etm: Don't use hard coded config bits when setting up ETMCR
      perf cs-etm: Don't use hard coded config bits when setting up TRCCONFIGR
      perf cs-etm: Don't hard code config attribute when configuring the event
      perf arm-spe: Don't hard code config attribute

 tools/perf/arch/arm/util/cs-etm.c    | 201 +++++++++++++++-------------
 tools/perf/arch/arm64/util/arm-spe.c |  17 +--
 tools/perf/arch/x86/util/intel-pt.c  |   3 +-
 tools/perf/tests/pmu.c               |  91 +++++++++++++
 tools/perf/util/evsel.c              | 112 +++++++++++++++-
 tools/perf/util/evsel.h              |   6 +-
 tools/perf/util/evsel_config.h       |   7 +-
 tools/perf/util/parse-events.c       | 248 ++++++++++++++++++++---------------
 tools/perf/util/pmu.c                |  95 ++++----------
 tools/perf/util/pmu.h                |  34 ++++-
 10 files changed, 529 insertions(+), 285 deletions(-)
---
base-commit: cbd41c6d4c26c161a2b0e70ad411d3885ff13507
change-id: 20251112-james-perf-config-bits-bee7106f0f00

Best regards,
-- 
James Clark <james.clark@linaro.org>


