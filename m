Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A30D49238
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 15:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6wTVU0HQcML/U5Ma12iYvsQExc4mXY0n/RGu05cTBVU=; b=V2xnjsOAYqErg5
	ymC1yhGmDINS9W1qhrXtsgYnr6erNS5Cw2lB3FlpC5bKD6rfkUFwHtl27K842oSmSzSmX1qV24hiB
	woQKQMcCZwDP6+RKmt8F+oUFkHh300AgwUYrfwf9zyvKwM9a3jreYKAV3aubJbOOrx6qLMJJhf96W
	546yT34fUy0vNCYUo+aSMZYWLbkxWTtINvXf4kd2z6EzIkjunvHCnNI78j7Z12fjynj2NLwZU5Abb
	/jI+uzaJvJXKGRpsdbsoaeP1G1U3UbQbNYsxDV+x/iui94DFYCBLf1fb/R+kld33FcpjpNprsPKAK
	BBazflZ+FSkaWJ77CPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58N-00000000j1K-0wf8;
	Fri, 12 Dec 2025 15:32:43 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU58L-00000000j0J-0jy1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 15:32:42 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-b728a43e410so213597666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 07:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765553559; x=1766158359; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6wTVU0HQcML/U5Ma12iYvsQExc4mXY0n/RGu05cTBVU=;
        b=Zg1JFQCt4+959aiPylaW1+LYYGr86GGnw8Vv4VABmrAractLAFT8HuyZYIahJHDD7V
         onUoxIeT/mZRXBQtxE2IDM/rHhzn2zPpuw/+/HKV3pm/3kJyRjpwTk3A/n4GdLotpFbh
         2PTy19uPkBoDtf5I4dZ2BTkNiExlJGVQvswB6w2XSY2/c0AcG3rot2lB+TShmhY5P+//
         KXBsnknZ44booYkO2d/+nQKKJ4jDfQdiPHdIswukakwPitkQP3a9txbw52LKrnpKo9UW
         bEkpKT6VmPyCqsbBzR+y0VydSUQNovujXC1F4pWlltZ/oTCciyTXtV/UhoyJPZkjjX/o
         kimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765553559; x=1766158359;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wTVU0HQcML/U5Ma12iYvsQExc4mXY0n/RGu05cTBVU=;
        b=RO7tEXHZlxGLBF5WCOWPHEfMwknYNc+gOPqo80uoF9TFmDhZ+rhmHUy4oMjVxj8pW1
         gpzpfeN14fOKCEu4ZZgzUDv4+/Gz+tScuWFhyzp2NdwTFO1dcZ/4HnjSHk3tz+KtIjOb
         9ZIuNvzo1hd6xFqvIHj/jFuEHPklZg5BoomWNTjEIUyE1WYAQFeZcg3mnl4fYt9aeogz
         lp7eeKbKEmZdF2bHOhT+opnDfZKXQU8E5bv49f5EFxUFuI0bb9KkFh4GY5Rgrmy4T4Js
         tU4qnAKFeNCyWEJliS6fCScWZUaSdHIDQqwhU3d2H5bVKT7GV9usg56Eqxxz0uRQmgF7
         ujIA==
X-Forwarded-Encrypted: i=1; AJvYcCVR8/m+xkKCP0JSRxbJUd54REt6wYVqMaWXRHroHxtZ0kx/lvubCciH2R12GS85/o1JwaM6MyzqJyvTHhvgVdWm@lists.infradead.org
X-Gm-Message-State: AOJu0YzslvguEC1w7raGSS+4Mp3tVVj+yYCteg1YHbq6VgV9JWfhGlNm
	xadnDtNEevFvaTeghZ4NVVDhWeZAIhrfuqeef1wClHxWxQqvnsqMQhOXSjZdeE+PsQU=
X-Gm-Gg: AY/fxX77lAuP0UFGrI5TrxlOH5iyblqMxZd0eT8qOLRT4m1EYgX2LCe5F4B7j2EGEe8
	ZFtzq+ytGsU1OWNwOb/8o2Anu4c4aWAzh40muSG1koccxZejc7sKh5F+U4N78ybE6g3f+n6ylOf
	fdVAyvTVAPX/Gso52boMojnFZYNOPcZzr5CW2C+PsQcNzgiCL5CKEc5bL3ATK/nwTwJNuRhgLUH
	1J7IDr1bgE+2v4xil6IldtfN38lGPfv0fkpzgSJPXTZoAUsa2hXPnXMCjzfpyJPWYvFpPWNHrjy
	D/vHZ67yuOE4yQ2Q3sjZpasKfKWUW0EchYUxb1Jsq4gAAWpuohpF/fedhroOZLgx0EINh17Z7FS
	P2vTqm2wQnP2ObWcTWlWWe3cebEKxfRO+Hrjd0jdaJeum+0tmX1vYDf73rMO9ZZKaR481zui0+f
	ZlA02Yhaxd3gLZcraVlQ5w
X-Google-Smtp-Source: AGHT+IHM3bNfdM96Kzos3FUn4XqLiaZCJ92JSG8XKa4CBCiU4GR8q36GeeQKRgso6l4CDG9nSZC8CQ==
X-Received: by 2002:a17:906:7312:b0:b76:23df:c997 with SMTP id a640c23a62f3a-b7d23cda902mr264214666b.54.1765553559136;
        Fri, 12 Dec 2025 07:32:39 -0800 (PST)
Received: from e133063.arm.com ([130.185.218.160])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6498210ed32sm5433234a12.29.2025.12.12.07.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 07:32:37 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v3 00/12] perf cs-etm/arm-spe: Remove hard coded config
 fields
Date: Fri, 12 Dec 2025 17:32:17 +0200
Message-Id: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIE1PGkC/3XNQQ6CMBCF4auYrq2ZDirgynsYF7ROYYy2pCWNh
 nB3C250wfJ/yXwzikiBKYrTZhSBEkf2Lkex3QjTNa4lybfcAgEPSimU9+ZJUfYUrDTeWW6l5iF
 KTVQqOFqwACIf94Esvxb4cs3dcRx8eC9/kprXL4mg1sikJEhEMlrbCqA05we7JvidD62YzYS/T
 rXqYHb2jQGsVF0XGv6caZo+BYY0pAUBAAA=
X-Change-ID: 20251112-james-perf-config-bits-bee7106f0f00
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
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_073241_418084_63028E20 
X-CRM114-Status: GOOD (  16.27  )
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

Signed-off-by: James Clark <james.clark@linaro.org>
---
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
James Clark (12):
      perf parse-events: Refactor get_config_terms() to remove macros
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

 tools/perf/arch/arm/util/cs-etm.c    | 193 +++++++++++++++------------
 tools/perf/arch/arm64/util/arm-spe.c |  15 ++-
 tools/perf/tests/pmu.c               |  91 +++++++++++++
 tools/perf/util/evsel.c              |   6 +-
 tools/perf/util/evsel.h              |   2 +
 tools/perf/util/evsel_config.h       |   7 +-
 tools/perf/util/parse-events.c       | 248 ++++++++++++++++++++---------------
 tools/perf/util/pmu.c                | 112 ++++++++++++++--
 8 files changed, 460 insertions(+), 214 deletions(-)
---
base-commit: 2eeb09fe1c5173b659929f92fee4461796ca8c14
change-id: 20251112-james-perf-config-bits-bee7106f0f00

Best regards,
-- 
James Clark <james.clark@linaro.org>


