Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADD0D59D79
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 17:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rJf+ShqzTFgg+7HGc7wpZufZ9jwQEq72++VQl5OYS9s=; b=AK2LihpQg25lA2
	n0YbBNuH1Yoww+KoB6vv+PrTirSnjB1iBMu6IQbU7ExpF64BcDbHqe7Txf/ifh7m9+dfmMpBM0jXP
	J3NZvUH9fV8qWGMiicD8334Wwa5MAZilb+QGfwt1q9CnfEnUgS9h2lapTDlAjYt/lV4DIUd0/ps2+
	KbMSjK/0o9S0a+cDPeRPppqv2t1W2jbYbhuMsv+rN10WUZHuIMaO9Acrq6C6Ivh9v7Elom9lQ5API
	ixcHjczGrv8oI6poldDcD98OBBtih4MyJl+JTkyrqxCNYksRMeBCnQNXbCZAzHXHRcLUREupgMPbr
	3cSUsyRuTeJf9TF4VnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU6tE-00000000tBX-1Nff;
	Fri, 12 Dec 2025 17:25:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU6tC-00000000tAX-0N8D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 17:25:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D23EE1063;
	Fri, 12 Dec 2025 09:24:59 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D0A73F762;
	Fri, 12 Dec 2025 09:25:05 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 0/2] perf arm_spe: Minor event configs housekeeping
Date: Fri, 12 Dec 2025 17:24:58 +0000
Message-Id: <20251212-perf_c2c_update_event-v2-0-27df9a6cb1d4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOpPPGkC/4WNQQ7CIBBFr9LMWkwZaxtceQ/TEApTy6KUABJNw
 93FXsDle8l/f4dIwVKEW7NDoGyj3VwFPDWgF+WexKypDNjilSNH5inMUqOWL29UIkmZXGJDbzo
 yhiaDF6hbH2i276P7GCsvNqYtfI6bzH/2XzFz1jIUCns9KNGJ6a7CetbbCmMp5QtJIEw+uAAAA
 A==
X-Change-ID: 20251212-perf_c2c_update_event-76d4eddebd23
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Al Grant <al.grant@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765560304; l=972;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=VHPA5CePVpOmtBBO1bxsa3hYXFTk8jI4b2guvtB4iN0=;
 b=PJz78MF8JB/eeUwBubR0HKFxK0GMyDwsAK+RBMGlszataYma1u3Wl6cVBS999utJyv5utrMJY
 X4ODgVEGpShBvlDGbvmbOQ97oXZqRfZhBnJSDrOpNH4aWG9NHMK9iy+
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_092510_177069_01B1CCF7 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

This series is to clean up event configs and update the doc for the
memory events and related options on different archs.

A quick verifying on Orion6 board with commands:

  perf c2c record -e spe-load -- test
  perf c2c record -e spe-store -- test

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Changes in v2:
- Updated document with using table for memory events (James).
- Link to v1: https://lore.kernel.org/r/20251212-perf_c2c_update_event-v1-0-29a26c7a949b@arm.com

---
Leo Yan (2):
      perf mem: Simplify Arm SPE event config
      perf c2c: Update documentation for adding memory event table

 tools/perf/Documentation/perf-c2c.txt   | 51 ++++++++++++++++++++++++---------
 tools/perf/arch/arm64/util/mem-events.c |  4 +--
 2 files changed, 39 insertions(+), 16 deletions(-)
---
base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
change-id: 20251212-perf_c2c_update_event-76d4eddebd23

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


