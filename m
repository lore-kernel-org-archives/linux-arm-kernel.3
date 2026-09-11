Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2CEC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w/L0Gci4dWz7IrqDMJL9O/2LA8MRX78qWC0lGe4XUyk=; b=f1u9O3Lby9XqsaUhSGSoQbWbBn
	+GOumX5qoh+Z+EFEZuagwMH+Zm3W7V6j8FVCW9GFNGW2eVs4+RV4ooFUyAnpJPOUpbgzNmQSPx/4L
	8Dhd9Hy1LyXHhYoP1dehRq0a13ydWF7mUPlQmkTWaSblWMmp6NeUyA5IVc3y0m85q2AmQEd78ue1z
	dv0LM0ukEyYPRQaJhh7WrCzWP7kDEucmigJorJYQFMt1R7H4rmJ/R9XbTcn7aBjatfMJaRPOwikKI
	S/P1HUgKfBKYGd1ekrv6pZsBK6zLeJsf2+g/2vwoxt6cgKSJuzXn/OxZmCIQeqcuNsyCh/1JjOvDE
	cUGijJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x2f-0000000GBjE-1JQW;
	Fri, 11 Sep 2026 08:55:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4x2d-0000000GBiW-13z8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 08:55:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4D07416A3;
	Fri, 11 Sep 2026 01:55:20 -0700 (PDT)
Received: from e142892.manchester.arm.com (e142892.arm.com [10.33.8.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B21853F7B4;
	Fri, 11 Sep 2026 01:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789116924; bh=5A1EK0N/gipYt9PjNBNWj0Ne+fz6KdYh5A1j+8IH04M=;
	h=From:To:Cc:Subject:Date:From;
	b=Ak3oFlJT7BAKSRtFvnsrvhIFCdk8FnLPWMbEf0Djn38wpRvsi3eMYQvrSTvD1XL2z
	 Gb6mECytE6CblXXQmhkYYlvsB3OsWEh9ceYjynvI7SYaI7q4WFZXTARI82KGDtja9z
	 yslo6dKZQTeBOiBFIWPws4cATdUH7g5rN8mPfyY8=
From: Mike Leach <mike.leach@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	Mike Leach <mike.leach@arm.com>
Subject: [PATCH v4 0/1]  coresight: fix issue with insufficient claim tags
Date: Fri, 11 Sep 2026 09:55:19 +0100
Message-ID: <20260911085520.2201261-1-mike.leach@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_015527_338623_B525EC43 
X-CRM114-Status: GOOD (  13.53  )
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

All CoreSight compliant components have an implementation defined number
of 0 to 8 claim tag bits in the claim tag registers.

These are used to claim the CoreSight resources by system agents.

ARM recommends implementions have 4 claim tag bits, though a valid
implementation can have 0 claim tags bits.

The CoreSight drivers implement a 2 claim tag bit protocol to allow
self hosted and external debug agents to manage access to the hardware.

However, if there are less than 2 claim tags available the protocol
incorrectly returns an error on device claim, as no checks are made.

If insufficient claim tags are present in a component then the protocol
must return success on claim / disclaim to allow components to be used
normally.

Add initialisation to read the CLAIMSET bits to establish the number of
available claim tag bits, and adjust the claim returns accordingly.

Cache the claimtag protocol availablity in the coresight_device to reduce
reads for the main claim/disclaim api.

changes since v3:
1) removed unneeded bool casts (Leo)
2) rebased to kernel 7.2 on coresight/next

changes since v2:
1) consolidated API to remove the API calls using just cs_access, which were
used purely to clear down stale self claim tags, replace with a normal
coresight_device API for initialisation, to match the claim/disclaim API.
This does both the check on availability and the stale tag clearance.
Updated all drivers to use the new init functionality

2) Added option for drivers to skip claim tag checking completely for devices
with no-compliant hardware, that do not implement registers at the claim tag
location, or do not operate correctly to indicate the correct number of
claim tags for the device.

changes since v1:
1) Added claim tag availability cache into coresight_device when using the
main coresight_claim_device() / coresight_disclaim_device() API.

Applies to coresight/next

Mike Leach (1):
  coresight: fix issue where coresight component has no claimtags

 drivers/hwtracing/coresight/coresight-catu.c  |   6 +-
 drivers/hwtracing/coresight/coresight-core.c  | 139 ++++++++++++++++--
 .../hwtracing/coresight/coresight-cti-core.c  |   7 +-
 drivers/hwtracing/coresight/coresight-etb10.c |   9 +-
 .../coresight/coresight-etm3x-core.c          |   8 +-
 .../coresight/coresight-etm4x-core.c          |   8 +-
 .../hwtracing/coresight/coresight-funnel.c    |   7 +-
 drivers/hwtracing/coresight/coresight-priv.h  |   7 +
 .../coresight/coresight-replicator.c          |   9 +-
 .../hwtracing/coresight/coresight-tmc-core.c  |   7 +-
 include/linux/coresight.h                     |  23 ++-
 11 files changed, 205 insertions(+), 25 deletions(-)

-- 
2.43.0


