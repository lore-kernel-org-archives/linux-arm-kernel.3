Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13831C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 15:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QUeiVAvzGE5NNBflW/e1gUT7xFtr9MkSp0X+15RmkmE=; b=JdcmlfpSqBWq8+ph0S3ZvXLFh6
	Gsv8OeukxGWWY4rBxnTAD5QoP7++ylp1N5Yd5E8P+pImXx1/u/ZL1OXOI2v1HUQw1A9ShzQ0b6HEt
	fG5OnoL5dBBHcp6csvqTnHZ+b6mH1nmRRCzfmi9gkKngwFGxl3RVDqaa5/EluwdTqktrjQKSHjbIT
	NuHhGKW6xm+y0fgfafAHu8q0DN5BUUDk1cSAdd/udgaH+CRc9RfYb8yYT3UzuuKFFkxA6WCpbZ1pH
	UIUBMOWOiDioBdZQtGzFI8bfI3FkdfnLv3TbM3nh1zF2oQeMeU9l8oNgZ++u1YhA/q9xD0udkqRki
	Yhlslfaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVYa-00000009xh1-4Bx8;
	Mon, 12 May 2025 15:59:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEVHL-00000009uaL-065Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 15:41:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 770A0150C;
	Mon, 12 May 2025 08:41:07 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0CD8D3F63F;
	Mon, 12 May 2025 08:41:16 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 0/5] coresight: Fix device registration and unregistration
Date: Mon, 12 May 2025 16:41:03 +0100
Message-Id: <20250512154108.23920-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_084119_105002_C2512F74 
X-CRM114-Status: UNSURE (   7.40  )
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

This series is to fix device registration and unregistration.

The first patch addresses the resource is not released properly for a
failure case during a device registration.

The second patch is to use mutex to protect unregistration flow.

The last three patches are for refactoring.  Patch 03 explicitly uses
the parent device handler.  Patch 04 separates the success and failure
flows for code readable and easier maintenance.  Patch 05 improves the
error handling by invoking specific functions for resource cleanup.


Leo Yan (5):
  coresight: Correct sink ID map allocation failure handling
  coresight: Protect unregistration with mutex
  coresight: Explicitly use the parent device handler
  coresight: Separate failure and success flows
  coresight: Refine error handling for device registration

 drivers/hwtracing/coresight/coresight-core.c | 67 +++++++++++---------
 1 file changed, 37 insertions(+), 30 deletions(-)

-- 
2.34.1


