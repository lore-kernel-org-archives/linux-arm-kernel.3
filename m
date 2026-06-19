Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF79CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 16:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=baT9Toz2Yw1UPT0o991oZTNMi42pG9kFH4mDgdD1L1Y=; b=DIIIIViW8JSL3oCDgYLqXMgFhc
	8x/JiE8o0JMhChXiN0vYYuZZcVqNyn5MoCd7pYyqQwTRACvnePGIRCfif5zp4zXshYRXrcXv0e41u
	dBNv+IRWSCEa+7NHmKK/qKjHj2ylCGWIwvD/4ASmajvy/tKlAFa+SDt4GKrZ99Nl0CaXXvkT2yE6f
	01rWnNilFoqIvC0hkMppGgsxxAwSoOQRQcy0KgHKS2oabWS8kuiv/AddOpRWKM7WwCCZU5mhjcN1J
	HjQfZnQ6qKrIL1CscR8A4jo9uabKsG7Zk07wUd6e92Y0tNjkTgrL4dOWRCZSdNuaY8geF+5/2uJQB
	bx+tuaKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabfP-00000002kII-24ph;
	Fri, 19 Jun 2026 16:02:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabfK-00000002kFq-11ch
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 16:02:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3984E27DC;
	Fri, 19 Jun 2026 09:01:48 -0700 (PDT)
Received: from e142892.manchester.arm.com (e142892.arm.com [10.33.8.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3009E3F763;
	Fri, 19 Jun 2026 09:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781884912; bh=pzRcJ1JSUtuxzKGTQRcC0BWS7t2xfb3vLNddKCSQslo=;
	h=From:To:Cc:Subject:Date:From;
	b=qtcQyUdg1tNB+IT/XBYNPuOWfWnNTyCqeCUBA7+jAtf3Q4920r+BZId3KK2CGZGjd
	 aw0CrYDbaNq1yy09G+dbuWmfN+mOuVPVXi/ZaILEQzq8jzQjxBadFqgy175OeXdFgH
	 Ylx+kPkpc1tpQGflzrmplwhPCBEB00CCPDLRadYQ=
From: Mike Leach <mike.leach@arm.com>
To: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com,
	leo.yan@arm.com,
	james.clark@linaro.org,
	Mike Leach <mike.leach@arm.com>
Subject: [PATCH v3 0/1]  coresight: fix issue with insufficient claim tags
Date: Fri, 19 Jun 2026 17:01:47 +0100
Message-ID: <20260619160148.499223-1-mike.leach@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_090158_405466_EA3C4B10 
X-CRM114-Status: GOOD (  13.26  )
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


