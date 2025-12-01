Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12A1D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X8CXO9OJfojSeFF+UUsnSSZI1P/+BX3oz+61rBzG6wc=; b=iLTgryx+IAyZGN
	82YHRnfoJVwEEV8pyOeIYAZNabvBUyFRpJ4PM9XS+6JDvmvB1p0cXlAppa7T6jfrSWVh4vCFvLsWV
	py29zld+jZ8WxC2T9GLokTlF7t0//Uexo3ll3eL6v1rHAoAVKwRDBG0BQruB/lgU3uhkUXHam+Iyh
	R4Kro6aKMTGPdtvl+Dj0KYlM5FNzbsigI8hbDlHMqm0+cuUo8HRHFcH0pBHLkLTuMAdyOKqrW/ujC
	7BpVNaxvCiLai39HddNVFTjev1NuXv6BFhvbabOutjVxqkYHbH4QVntXdbJCKL+eOgDjVgX+qjkUr
	MxfqLENr2IkHR4+JalYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6yB-00000004Hxt-0Lxe;
	Mon, 01 Dec 2025 16:41:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6y8-00000004HxC-3GKB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 16:41:46 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso46131805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 08:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764607303; x=1765212103; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X8CXO9OJfojSeFF+UUsnSSZI1P/+BX3oz+61rBzG6wc=;
        b=ITd39MM8Pfr4hYNbMiVcFaskXpB44EPf1966iyvYGaHDvLkWCdxhmJ1aJWwDWfdzVx
         q4DfBamjMHbAOwZZ0ikjACkVFy0VI9WYkav3NB5wEw7X3DS9H4jFUPZhNopp73wWU6pH
         at8/0vGgtE01gSqP5gXqSGNKmUN8AVbdE+Vg4H9tTflSCnvQ6z7jVnEaTfwniNs5Kbul
         vW4OPCX4i8UNfqlIWn3d2ZKZDVzvIodv3hIBmo5UUlyCEoF6fElFxwdThUjkgIoHkbhr
         gkOxXwS87RzAfYFIBd8e/fPUmWrrwtzyMjcwkY/opW7OTNyb+cC6NoKEcQq6SKvkDRlg
         LVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764607303; x=1765212103;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8CXO9OJfojSeFF+UUsnSSZI1P/+BX3oz+61rBzG6wc=;
        b=l3hvBI8bTz+mqbGVCBjdSU4tH1jYxXKkQXoVMAjdg9eF4jpVLubgeXztOBgAEFqskG
         GBmevTtlKuvcBnZjjahMyUU/AIp8t73F3znwBjjA5B3/N10ZK42tR2JcQCYdNYBp+lQI
         BYLE2TzI1M7vn1zzxmKgdb7utwcr7PCY/4rXQG35uZoBKcDLHvOqNsyvkpmik+54VsZ6
         48P6O5EDoCH2nk4rt9dfPNR48HkmPlqfa+7MTWdYOE7qlO4W3ExZ9zlxwqdkWDH4ijZe
         TmO/58CAYnmV49KJgH8hqSXH5vIRllst9dsJYu1GWH8cCObh66lMgcOlqOUpOXOD3AcA
         d/BQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+EktB4thlFltuRi0mauNHKY1g2jCLQzEE67mxhp7jEpHEIsyABvWa1e1Mxtu2Qh0MZyxckTFbAhiFQ7NuEE4n@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8N3sJ6nHcIUs9ldHOoOHUiAhdtzxeHBR1BsebVtsWcYGWzMYs
	/Y43vQB5HTFCJ92VGRFGs5lF4XJFjva+LvIggBgeJpkNHnHFScfl81fFhhUdu/TMYhY=
X-Gm-Gg: ASbGncurH80owYE2E3Blz3EaRT1CnoM56u0Lv+bpfr8fdmJzwtwkw6n7bkz6A+K6xVA
	Sha2Wh36bpoPKPSkCdoza3+D2Q8tO9g6PG6Po8CCdGFtKMgwvpXa6PvAdYuqHt9UmdkHrDSFECH
	NwjG/mprayf5sz001vL7oMPGJzrdtbcLTEJBZmNaw3LsBzXhSG19HWAk/GsvvgnmMKClhvsv0hQ
	73WPnVApyAa7iXs+nmZcrm1kWpmdFl20KWz0v1zMR+VPZx4JG8byjyKHyd9MZengzbZxR4l9JXR
	u+1pI0W0qB9mMPQuPixZDutKK8KOcnoUiGrzuBKzbH2b1m5MPMr/0+s3Tt8DmX3erIQACxLAHjr
	yhab3zNUOyKvjxtNpJDo0xgU/ozD7pXylBtQ7n9MeGHhdwIRXTNdmDMU1wZ8bG1u6W+aKRY2P4u
	jh3i5OEZxxvTfjdmpvS2Fk
X-Google-Smtp-Source: AGHT+IFpklz6cl1AMJUqVSGcZRb3Pn6NfQxw4c1mN9dYuQ9p6NjC0krJoPGjNKaFKqqo6n/s5CfyHA==
X-Received: by 2002:a05:600c:3595:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-477c0184b34mr418552785e9.8.1764607302915;
        Mon, 01 Dec 2025 08:41:42 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4791164d4f3sm255901275e9.13.2025.12.01.08.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:41:42 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/7] perf cs-etm/arm-spe: Remove hard coded config fields
Date: Mon, 01 Dec 2025 16:41:03 +0000
Message-Id: <20251201-james-perf-config-bits-v1-0-22ecbbf8007c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB/FLWkC/x3MQQqDQAxG4atI1gaSgVrwKqULtX80BUeZFCmId
 +/Q5bd476RAcQT1zUkFh4dvuULbhqZlyDPYX9WUJN1UNfF7WBG8oxhPWzafefRP8AjcVToTE6E
 a7wXm3//48byuH8jI9ZRoAAAA
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
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_084144_840212_35620F44 
X-CRM114-Status: GOOD (  13.03  )
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

The existing evsel__set_config_if_unset() also has a similar problem
that it hard codes attr.config, so fix that too.

There are no functional changes here because all the fields touched are
in attr.config and not config1 or config2 etc. Although this may not be
the case for new fields.

Signed-off-by: James Clark <james.clark@linaro.org>
---
James Clark (7):
      perf tools: Track all user changed config bits
      perf tools: apply evsel__set_config_if_unset() to all config fields
      perf cs-etm: Make a helper to find the Coresight evsel
      perf cs-etm: Don't use hard coded config bits when setting up ETMCR
      perf cs-etm: Don't use hard coded config bits when setting up TRCCONFIGR
      perf cs-etm: Don't hard code config attribute when configuring the event
      perf arm-spe: Don't hard code config attribute

 tools/perf/arch/arm/util/cs-etm.c    | 202 ++++++++++++++++++++---------------
 tools/perf/arch/arm64/util/arm-spe.c |  15 +--
 tools/perf/util/evsel.c              |   6 +-
 tools/perf/util/evsel.h              |   2 +
 tools/perf/util/evsel_config.h       |   6 +-
 tools/perf/util/parse-events.c       |  89 +++++++--------
 tools/perf/util/pmu.c                |  93 +++++++++++++---
 7 files changed, 251 insertions(+), 162 deletions(-)
---
base-commit: 834ebb5678d75d844f5d4f44ede78724d8c96630
change-id: 20251112-james-perf-config-bits-bee7106f0f00

Best regards,
-- 
James Clark <james.clark@linaro.org>


