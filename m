Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3015CCAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EvtiP8cp8BhABUlmDna8Y0Y1St2GWHNIfZ0PtAqOnds=; b=v0R8S9hFH82O54LyPuxWpcdy7g
	S6ARCsS+Nj8vA720ieIXfiK0Zo/JbyjXIgRDfnSKYRZJse6cThkVcbcXVH3y60Z7j97UDTZP2ZvAM
	tlXhHgQ/F4gyaBua7tNFhQl+Orr/vOfCDTgEkTqpRSZIshV2Uhj8AxVgRqwvonM2HAZ8dURvPtFgE
	IFyqYBUkInz1eF1XvTyZ2w8Z+ABzW/h9vzyZge7RVhaTuLScInGNVU8h61UaZVFWgrOJ7cxjCPBF6
	BNzid2iT/ReKxTrsV7PhYx6sqtvbWcbA5/3++Y9joZlaw+WIgpd9tWATIq68zuEjWztQKxA0FRA09
	rdtASOVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nXd-0000000AQ5c-1uA6;
	Thu, 25 Sep 2025 15:05:53 +0000
Received: from out-178.mta1.migadu.com ([2001:41d0:203:375::b2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nXb-0000000AOY8-3Kwj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:05:53 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758812638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EvtiP8cp8BhABUlmDna8Y0Y1St2GWHNIfZ0PtAqOnds=;
	b=qc+APSbfWfm1HkxNcTUxP7A7opt9wXkSXngWpYL2pyaw4uSvSeu6Qe+/07OQwHr20jSsbp
	0wDu6H/3V2x79Fjv607xpQZtCHzXNCdQe+UEqVidFbzQeWUzeLIXXX1S1FbL4faWTgE2j5
	zuHkCL88AGRahruz20aL/3tXpF7fbn0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Linu Cherian <lcherian@marvell.com>,
	Mike Leach <mike.leach@linaro.org>,
	linux-kernel@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	James Clark <james.clark@linaro.org>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v5 0/3] coresight: Fix possible deadlock in coresight_panic_cb
Date: Thu, 25 Sep 2025 11:03:39 -0400
Message-Id: <20250925150342.1845615-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_080551_974152_CC094864 
X-CRM114-Status: UNSURE (   6.90  )
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

This time with the notifier in csdev.

Changes in v5:
- Split reordering of coresight_device_release into a separate patch
- Check csdev mode before calling sync()

Changes in v4:
- Fix fwnode leak in coresight_register error path
- Move the panic notifier into csdev and restore the panic sync API

Changes in v3:
- Rewrite patch to remove the panic sync API entirely

Changes in v2:
- Add a comment describing csdev_lock/list
- Consolidate list removal in coresight_device_release

Sean Anderson (3):
  coresight: Fix fwnode leak in coresight_register error path
  coresight: Reorder coresight_device_release to match
    coresight_register
  coresight: Fix possible deadlock in coresight_panic_cb

 drivers/hwtracing/coresight/coresight-core.c | 71 ++++++++------------
 include/linux/coresight.h                    |  2 +
 2 files changed, 30 insertions(+), 43 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


