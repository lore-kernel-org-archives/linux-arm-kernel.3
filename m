Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D306DD0C61B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=snOnszj1jZu+U+QrHCBefqG1/YPPZKT9cApsWBQ9Ues=; b=DZO0h6Uk9/3eEtz3idpx5haT7A
	E4QEgrW6Ck5eUdRwAgZnagiM4hbGb7RsEUD+2WW+r/6Ks1uDiG6qBat8P9MfCIEpmIy0OBw4fXmui
	DN2zWpypcLz59nYZDrx2chgJKx9cWxUA/cmuRUt+E+xMoZtpC+o/qnXml4pVJJMEKKKJrl0YZXov6
	rzos+qa8MedMLUvfvUAfpuJU4+ZS9D10e38Fh5sRSAPauj7yLlG+ZkqEHaTmbW1/yRkbdy8UTulY1
	df+TUeRlVsn85OHkqTVCgbxNyNHjJ1ajw9oXrTXac4QHOjDVQp33glcv7a+tIFvsbR0rsGhRkmkiw
	5LA26CXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Lik-000000046T9-1xVD;
	Fri, 25 Oct 2024 14:55:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LL2-000000041LQ-0pFY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:30:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C30D1339;
	Fri, 25 Oct 2024 07:31:20 -0700 (PDT)
Received: from VDW30FN91H.arm.com (unknown [10.57.79.117])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C32CF3F73B;
	Fri, 25 Oct 2024 07:30:48 -0700 (PDT)
From: Graham Woodward <graham.woodward@arm.com>
To: acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	irogers@google.com,
	james.clark@linaro.org,
	mike.leach@linaro.org,
	leo.yan@linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	Graham Woodward <graham.woodward@arm.com>
Subject: [PATCH v1 0/4] perf arm-spe: Allow synthesizing of branch
Date: Fri, 25 Oct 2024 15:30:05 +0100
Message-Id: <20241025143009.25419-1-graham.woodward@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_073052_286504_E819E0E2 
X-CRM114-Status: UNSURE (   6.67  )
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

Currently the --itrace=b will only show branch-misses but this change
allows perf to synthesize branches as well.

The change also incorporates the ability to display the target
addresses when specifying the addr field if the instruction is a branch.

Graham Woodward (4):
  perf arm-spe: Set sample.addr to target address for instruction sample
  perf arm-spe: Use ARM_SPE_OP_BRANCH_ERET when synthesizing branches
  perf arm-spe: Correctly set sample flags
  perf arm-spe: Update --itrace help text

 tools/perf/Documentation/itrace.txt       |  2 +-
 tools/perf/Documentation/perf-arm-spe.txt |  2 +-
 tools/perf/builtin-script.c               |  1 +
 tools/perf/util/arm-spe.c                 | 31 ++++++++++++++++++-----
 tools/perf/util/auxtrace.h                |  3 +--
 tools/perf/util/event.h                   |  1 +
 6 files changed, 29 insertions(+), 11 deletions(-)

-- 
2.40.1


