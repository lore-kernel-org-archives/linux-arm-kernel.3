Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98DBD49222
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 12:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RFNYO3zM3YpLm/vZhWQinaNzehBA7kuRQD1QZVYrppg=; b=0iMQuvRCEjL7EL
	AXj5PH9Zx/egIn5MgaOp/1QK1MAfhMsfH/GYbaDf84auP5rLsD1fVbMfGOs7jR7bX0+W3Lp96yd3y
	FqSU8NFaIzc/49+93MifYpPV1+u0RhX23XMpxjAClxNz7mBVfBuDI1cs10A8wMAKtNXovj0ZyiEMF
	MuMwvXd9y1bIicdKBaJXBLHrw+HuuyCG6jlF8VBCL9KNqEUs4EgQFA67Poiejiz+ATG+7/2YkuHmL
	G54LjhgHUEgb6nmWg1wv3L4iVgV/PZ2XaIVpY2KIFVuSiW7gR+pftus7Sk3EuKKE+y5JP9JzgyNhQ
	bElMP0hJLEFUgONPW14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2VP-00000000XEp-3LM2;
	Fri, 12 Dec 2025 12:44:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vU2VM-00000000XEC-3q2v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 12:44:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4249FEC;
	Fri, 12 Dec 2025 04:44:07 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30FA33F762;
	Fri, 12 Dec 2025 04:44:13 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/2] perf arm_spe: Minor event configs housekeeping
Date: Fri, 12 Dec 2025 12:44:02 +0000
Message-Id: <20251212-perf_c2c_update_event-v1-0-29a26c7a949b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABIOPGkC/x3MQQqDMBBG4avIrA2YaWvBq4gEm/ltZxNDokEQ7
 27o8lu8d1JGUmQampMSimZdQ4VtG/K/OXxhVKqJO35Ztmwi0uI8e7dHmTc4FITNvHt5QgQf4Qf
 VNiYsevy/43RdNzXcE8NnAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765543453; l=722;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=j2J6G4h5/xgYN8qh1XhHEBhu1T1EWy/waavIZ/ivCMg=;
 b=fseEbbqaILVNnNB1p6gJZ9rDWdwuwYqW+79S0PHHd1aHkBMG+k7DFq5k3n+RIU4RTWinUa6t+
 CYj0WSNtBOgBLmWUCpCH4Oae7MzhX+i1Rmz0DksSMpnlJD2kEioRuHm
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_044417_017192_8AF3496C 
X-CRM114-Status: UNSURE (   8.08  )
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

This series is to clean up event configs and update the doc for default
events used for Arm SPE.

A quick verifying on Orion6 board with commands:

  perf c2c record -e spe-load -- test
  perf c2c record -e spe-store -- test

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (2):
      perf mem: Simplify Arm SPE event config
      perf c2c: Update documentation for Arm SPE events

 tools/perf/Documentation/perf-c2c.txt   | 7 ++++++-
 tools/perf/arch/arm64/util/mem-events.c | 4 ++--
 2 files changed, 8 insertions(+), 3 deletions(-)
---
base-commit: cb015814f8b6eebcbb8e46e111d108892c5e6821
change-id: 20251212-perf_c2c_update_event-76d4eddebd23

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


