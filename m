Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1475D37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Rgx8dJXKRMSd4BK7n8pd5ssWXaRYRNm1JG7m+/we6F8=; b=SKsIPkaz1xNI2P
	0JjjXZEn79arm54EVI0lXMjCjknXFI81CXWVubaVwtheILDIzvMUbFhdQ9PJLZ/3tfEiebYp0GjUz
	Y2CnuvspMicIVDdcs0zIi93qouXh/g4cbOthm6/vnoXI0k+wMRbYgwoH3uFUG6UB9Sf5lY5xuBL/0
	kWwwuvc9ajgWemBek4gfFch4uoi4zzzz70FiNqHTiCkwzDpC62xw5wW6VC3ou0J8oGGPsWCheuKVx
	ST0OD+WPP1K6A7Wruxy7QkM2JM7gUu3ElSTaJlRRLRRK2BYLwAzmnkl/BjinX7rFVdtuMT8ExQM11
	v83vCJEzdrk5dxPG6Stw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Ff-00000009o3F-3mib;
	Wed, 14 Jan 2026 15:57:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3Fb-00000009o0Q-1q82
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:57:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so3899755e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 07:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768406257; x=1769011057; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rgx8dJXKRMSd4BK7n8pd5ssWXaRYRNm1JG7m+/we6F8=;
        b=A5PLykRBPSR/TCoT6B1EWHw0Hw2jw6XEOA2hXai4qfJxjhgbCcAnkMf3AFyET/8aon
         2TASa5aGfeYVUTeTg4T7F8ctmq2lE7Ij9DzXY0FZwo8g7Ovj7F5daqtJ7Y2gfoqjrK23
         iRccAqrwA10oKGXgPsbOGkTT0xJgpMZs6WqE76YyrSABkh0IROd3wExt/h3jniMRWt3a
         +Ly3KQ19f9O5Txb2Yeo3JnaLuc5/0kd+h84clXV+X75EZC9ndlMMXgmczjsUqdtJ6Ytm
         FNk6j9/HuNPhK3WqN4ZNTOYQQgf5jhGoumhi7bADr6DNaFzZnJdNnObM365NzVwXiJMp
         BnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406257; x=1769011057;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rgx8dJXKRMSd4BK7n8pd5ssWXaRYRNm1JG7m+/we6F8=;
        b=Yh4IoSQQEapnRXb0qFHjm2IzmglOEgFawX98iFNQcoBaFNnPcKlnt7LcQ2XqLWMqxi
         deggiNgqlT7owzfDVHAbTTyJUonEuYlsIdSHfzjb9p0+AWD0repk5ygYVVBzJEXCMjkp
         1XWqGPFur1XGTz0j5J1JsvXawnt+AFLmI1qTdZ3RExYk8S26n82+sNm46b9IihS2HgyL
         TW271k2CRLHRcN3y338VcFnArQ28gCuzJwifjXHV88ODrAwz/0ERoktXGCWBzdFctWI7
         DJH3XN0KSV4sRJm34B8ZbEyYk3R9WM1W0TrbsFlKtr328b9nqCM1ZshSJWwf4vgqPnNh
         Yntg==
X-Forwarded-Encrypted: i=1; AJvYcCVsZFHTk/P4jQ1Mh5zqJNXNRq3RYo6KQ64pr1FYZfj/HIpgmDwMzznZSOLtWFu8hYKHHbt7Wu05EFTQQbjDCF9T@lists.infradead.org
X-Gm-Message-State: AOJu0YxA0CE49MIZpPVlp306ck8tAIXNLrmniqjgeX3IkztUB4qtLUmP
	VwwVgV8APZAVDmshDSmo4kP1fBUNq7T64gikiwclwvjSN+P7Fq6Chu/FhKxoQP+/7tQ=
X-Gm-Gg: AY/fxX6DOpmbkJskzvfVycZywunid0yZWS90oXe1tVwvdFzq0qcOUm4u9f5brSkLjNR
	WAHrxkbZv6zcRnYk4L4/S8v3gezFZp63Lixit2ZiC5RpXrbZV0HobzAOJHnfJzlYbDcFdPE76IK
	+ZLqGyGzQ8QVO1X74nMlRzYLw7GURR8uqiWgmc76S8ssuJKMlvL+twmMvsgqjkfdi/MDSPn8Uuk
	vaQZOzqBk57dYXpovt8JYlyqE8KOuFcvujRp+jdztUV24lUXJIA74NA/4zgb2ZLCgWcn2H50qup
	kdAEQ3EB75Qope0oljNeZu8AY6cwp/bxqlwaZLPHSkbsIFy/Fn5P32mTyFH0SPijtkfHg8WfvsV
	VOJmbH93/5735qEINPipUgfvtnsP9biJAxyxElG3xwRo2LOZMCtF24vMvuiCz6GVCKV4ksedWsT
	BgN1ysxno/U7Nq8XBsG21s
X-Received: by 2002:a05:600c:3581:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-47ee3371d96mr37276685e9.28.1768406256774;
        Wed, 14 Jan 2026 07:57:36 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee85e8807sm7426475e9.16.2026.01.14.07.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:57:36 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v5 00/14] perf cs-etm/arm-spe: Remove hard coded config
 fields
Date: Wed, 14 Jan 2026 15:57:12 +0000
Message-Id: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANi8Z2kC/3XPwW4CIRAG4FcxnIuZGZBFT76H6QHosNK0iwFD2
 ph996K9rDF7/CeZ789/E5VL4ioOm5so3FJNeeph97YR4eymkWX66FkQ0A4RSX66b67ywiXKkKe
 YRunTtUrPPCCYCBFA9OdL4Zh+HvDpvedzqtdcfh89De/Xf5IA18iGEiQRB++jBRjC8StNruRtL
 qO4m42Wjl11qDvaBSCL+73y8OKohbM+sanuOKeM01abYTAvjl44tO7o7oABq5VFa+Lzrnme/wB
 SeFZilQEAAA==
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
X-CRM114-CacheID: sfid-20260114_075739_635218_D4E3189F 
X-CRM114-Status: GOOD (  18.58  )
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
Changes in v5:
- Use bitfields wherever possible instead of converting to a u64. This
  is more consistent with the existing format helper functions and
  fixes a build error on i386 where unsigned long is 32 bits.
- Link to v4: https://lore.kernel.org/r/20251222-james-perf-config-bits-v4-0-0608438186fc@linaro.org

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
 tools/perf/util/evsel.c              | 120 ++++++++++++++++-
 tools/perf/util/evsel.h              |   6 +-
 tools/perf/util/evsel_config.h       |   7 +-
 tools/perf/util/parse-events.c       | 248 ++++++++++++++++++++---------------
 tools/perf/util/pmu.c                |  95 ++++----------
 tools/perf/util/pmu.h                |  34 ++++-
 10 files changed, 537 insertions(+), 285 deletions(-)
---
base-commit: 54a23bff770961e024e2c61cd1f46888190c3e79
change-id: 20251112-james-perf-config-bits-bee7106f0f00

Best regards,
-- 
James Clark <james.clark@linaro.org>


