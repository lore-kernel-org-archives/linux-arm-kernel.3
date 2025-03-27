Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C511C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 11:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C6ngseiQqvgrXHSZVsU6fvWaTlZ32xtky/O0lIsRQ+E=; b=1JFmpJivwSRL7Xn39LDj9mqXg3
	Pltjgd6XLjsBd5cg4k0HOJh4810UtAMFDWQYmRRPDAtX8duSXS9vWsrITA9ldsnzs3QXFuUMKK+tB
	iC4NDrt05ACL0xq8vqcR80j+ilNz39RaiXbpVbPjaraouCr4Hrm+Bnuq/GAxRE8lmLgjGQdWai5e8
	R+Z4XTzHdJ+xQlwrMNDf/nQHke7jMNbPVGTqtV9RI2WCAA+6MkM6Vp5Klw4TQ7RZgniABVdeV7UBZ
	WDcx+frQJA62xe6Y1POGmYQwFARrqhoJoMID+SDEeSX6xiJ7wqwzAnN5glBUAqPw5GK5KeRG1npr6
	hmBZb13w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txlbt-0000000Aqrl-0ooW;
	Thu, 27 Mar 2025 11:41:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txlZ0-0000000AqG6-1wRn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 11:38:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F3A061063;
	Thu, 27 Mar 2025 04:38:26 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D6C5F3F58B;
	Thu, 27 Mar 2025 04:38:19 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v1 0/9] coresight: Fix and improve clock usage
Date: Thu, 27 Mar 2025 11:37:54 +0000
Message-Id: <20250327113803.1452108-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_043822_589094_953C45DB 
X-CRM114-Status: GOOD (  10.25  )
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

This series fixes and improves clock usage in the Arm CoreSight drivers.

Based on the DT binding documents, the trace clock (atclk) is defined in
some CoreSight modules, but the corresponding drivers to support it are
absent.  In most cases, the issue is hidden because atclk is shared by
multiple CoreSight modules and is enabled anyway by other drivers.
The first three patches address this issue.

The programming clock (pclk) management in CoreSight drivers does not
use the devm_XXX() variant APIs, so the drivers needs to manually
disable and release clocks for errors and for normal module exit.
However, the drivers miss to disable clocks during module exit.

Another issue is pclk might be enabled twice in init phase - once by
AMBA bus driver, and again by CoreSight drivers.

Patches 04 and 05 fix pclk issues.

The atclk may also not be disabled in CoreSight drivers during module
exit.  This is fixed in patch 06.

Patches 07 to 09 refactor the clock related code.  Patch 07 makes the
clock enabling sequence consistent.  Patch 08 removes redundant
condition checks and adds error handling in runtime PM.  Patch 09
consolidats the clock initialization into a central place.

This series is verified on Arm64 Hikey960 platform.


Leo Yan (9):
  coresight: tmc: Support atclk
  coresight: catu: Support atclk
  coresight: etm4x: Support atclk
  coresight: Disable programming clock properly
  coresight: Avoid enable programming clock duplicately
  coresight: Disable trace bus clock properly
  coresight: Make clock sequence consistent
  coresight: Refactor runtime PM
  coresight: Consolidate clock enabling

 drivers/hwtracing/coresight/coresight-catu.c       | 53 ++++++++++++++++-----------------
 drivers/hwtracing/coresight/coresight-catu.h       |  1 +
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 41 +++++++++-----------------
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 24 +++++----------
 drivers/hwtracing/coresight/coresight-etb10.c      | 18 ++++--------
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 17 ++++-------
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 32 ++++++++++----------
 drivers/hwtracing/coresight/coresight-etm4x.h      |  4 ++-
 drivers/hwtracing/coresight/coresight-funnel.c     | 66 +++++++++++++++---------------------------
 drivers/hwtracing/coresight/coresight-replicator.c | 63 ++++++++++++++--------------------------
 drivers/hwtracing/coresight/coresight-stm.c        | 34 +++++++++-------------
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 48 +++++++++++++++---------------
 drivers/hwtracing/coresight/coresight-tmc.h        |  2 ++
 drivers/hwtracing/coresight/coresight-tpiu.c       | 36 ++++++++++-------------
 include/linux/coresight.h                          | 47 ++++++++++++++++++------------
 15 files changed, 206 insertions(+), 280 deletions(-)

-- 
2.34.1


