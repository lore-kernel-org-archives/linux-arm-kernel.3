Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02A88D3B7F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 14:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hoaFM8gsTHBxZpSQ2rcSy6Ke4PCkz4T2Sf6PrdtW3hc=; b=KiOTrAKRXi05nm
	+R6kT23L2UzKhSsrvAVyx5xYZuRvNrZFLd/1ZPgWmfTKjl/vLYOkFEdLU5JL5PEOKHL0DnycMyf5/
	/xbzKNS41jPi+m/CmbqI1nkvSsfvr0o/LG+X1dOO3eJn8YIJXcAP0aEFVEsf3RDcdK9BsyfacZeVG
	LOrE5oy9jGv2lSTRQoOLNbfo9ecA9LQiPC9ju0NP4ptQ2ZSimF+WYmISxK+kwX+YotSDoqM83hv89
	hEWmhwJKhuB13m1erCLdzmnpBgl7BqwZ+ZxrEp+13r4J4/cZKtncxYS/XVbniGMVA2JoYbEyiSRx7
	DNILTZdj/Wt29DxGg7sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc97-0000000DB4t-44fM;
	Mon, 08 Dec 2025 14:23:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc92-0000000DB2R-0JhI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 14:23:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so35690495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Dec 2025 06:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765203797; x=1765808597; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hoaFM8gsTHBxZpSQ2rcSy6Ke4PCkz4T2Sf6PrdtW3hc=;
        b=d5S0MdaK3k7FvM1VpX6eduMCBSqFrumTpCwD7deBrfPCqTWIJIu6NP6AjN10E3tOy3
         Gb3iYXJm0OB7SpNAcnEIJBPn6NYho7B3irMLOvIu1hMweGNdFyr6+zB7QuiHyRF6kfkL
         WwStHzV1VO4gJJ5Qn0GcZRUENZtzuRebFTTam55qTk5luGxZ5mYr6HFwf/+UAjxKOfdK
         Iw91YG+NaJT9XQBxyg5V7zkGKJm2V087eO5gva4w7QNcFd4J0A8bhR2sOEwbAP5aIkFG
         myKLUGKaG9goQcB7xeEwkA0KSdKD76ALOUXPH/fVGiK3pek+xjG+eQjJJGvMwLK9RhA2
         wwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765203797; x=1765808597;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hoaFM8gsTHBxZpSQ2rcSy6Ke4PCkz4T2Sf6PrdtW3hc=;
        b=RjORkwRuA+6lTzzWHqj0MBPlYqtvuPSet8b3grM5st8VD7Bc5Z7mgumzWdyYYH+Opw
         Sg82MhnKwQxt0q9I8HtOHoCvAKQ7S10JSd++2h+4ScqGVd1fe5mjH5gdQGRtV3NK6knt
         3/iK2lFmMBIwU6fUSf+p7c3/kr5RHLju0Zz65eCo0JAIJ7ZqZdYhI29UdUY4oQBwV5S/
         y8RwlxsyB68ximplF8QI7podx3YJskuSh9KQ76pDXYgTXZe0+HQZJFys77ImvXhFLTu+
         SyYcp1uKTVChBjNCo46fAfqvtOT0xHGNlboDJkahmfLWbeRiZtRvAMbn8BU3YDyjcW4U
         o8Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXbggtLC/DRKJj7tATt3QDmZ5rO7Fz/t3t0tdoCThKnSj/6omZ0zfW29ftauFwKvK4Qxap/E+XrSPReHR+0F+m/@lists.infradead.org
X-Gm-Message-State: AOJu0YyUM+9DTzXjb8NjH7DfV40amaXHkDEWRzY+YHxweDukAxr/TF0i
	s7J+tpFlTfe1M1qCYY//XKFybJP06ER0nHVHt3kQjWVz8pKAQ0lHSG6lvg+NkmMwpQH0E0bK/Pf
	cC4yU
X-Gm-Gg: ASbGncshXaZoVNO0QB3wyz5Oi5Zq/PW1gDkFg7KPpXKNU0nw/207kEvwkrgeP5hHKI5
	7mKFbScEjT+b1v1TovyqIRxtu8bQWkd/FpXOzuBnp6NF6o2hH0A4isPNnevPSNsj8oJncDAO9EM
	YU+nkaEKjp+XtFmg9rwESSxUwLS7cBuWo91/kRmNYiapscYozyqeNyhEOqerSA7q+hwFgP3Q9XY
	xh4G20FWqOskllhQcRU0VX7VX98nzMDGO1VsON9d204a7kyTlcYjOOXGJTN6ibJ4RGHX+5Rj9wR
	Lkyrgo0FRoRFkr2Ck/eJoYdYnLYJ7M+bwW9kZS96SWBtoQo5KFacVPvSnce+Rej4wvXWxvLvdOk
	xrRCH5GmS8Nu6ASPQNGHXPyXnqeqRI/RnRtPbXz2NPUTTLFIM5IPRRwUfmkJdz48hg/fZYwGvyO
	xdNQ4iN+5F54lz8uY0kpIR
X-Google-Smtp-Source: AGHT+IE/cC+g7PtcpgB5/C4izQvgvOAmYHfqEb5ZHOwtqieQOr+FW/7g/kT51096WpKbc0yjg3TInw==
X-Received: by 2002:a05:600c:4e14:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-47939e2b900mr76844035e9.25.1765203797445;
        Mon, 08 Dec 2025 06:23:17 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930920e0dsm248561065e9.2.2025.12.08.06.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 06:23:17 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 00/12] perf cs-etm/arm-spe: Remove hard coded config
 fields
Date: Mon, 08 Dec 2025 14:22:03 +0000
Message-Id: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAvfNmkC/3WNQQrCMBBFr1KydmQmoBVX3kO6aOKkHdGkTEpQS
 u9urGuX78F/fzGZVTibc7MY5SJZUqxgd43xYx8HBrlVNhbtgYgs3PsnZ5hYA/gUgwzgZM7gmFv
 CY8CAaOp4Ug7y2sLXrvIoeU763n4Kfe0vaZH+JQsBgrXsnQsnxNZfHhJ7Tfukg+nWdf0A2rJ3/
 L0AAAA=
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, leo.yan@arm.com
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_062321_086590_8DC3FAC9 
X-CRM114-Status: GOOD (  15.86  )
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
 tools/perf/tests/pmu.c               |  90 +++++++++++++
 tools/perf/util/evsel.c              |   6 +-
 tools/perf/util/evsel.h              |   2 +
 tools/perf/util/evsel_config.h       |   7 +-
 tools/perf/util/parse-events.c       | 248 ++++++++++++++++++++---------------
 tools/perf/util/pmu.c                | 112 ++++++++++++++--
 8 files changed, 459 insertions(+), 214 deletions(-)
---
base-commit: 2eeb09fe1c5173b659929f92fee4461796ca8c14
change-id: 20251112-james-perf-config-bits-bee7106f0f00

Best regards,
-- 
James Clark <james.clark@linaro.org>


