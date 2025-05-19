Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6718FC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 18:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hsVkrbTbiKnfjUvW12pTRi72Er5WLX4o8Ef4LwVOoAQ=; b=nsbpcn41Xpsr2cjFVo25IS7vUJ
	oRJvGeSw/XCwiQGsKM4lgFrqnWyVn/aj+jErB48kfBGjlgXNXPMdFZoWx0KJSUcY5ssCOVynC9noZ
	pnUioDO47hk9x78lDe8qE22FjxbcxnbRacpSBEIgC6aeC2rS7sm1zS/mYl+EtHTZyaiAcr+pK0nub
	xR3cBarDI8YAiVdcRBSzdcGB5Wiwyei69lCSiB5ctXAGyq0/Mi0+ahw2WCjld3tmdwlVTHZUnwnWf
	0Q8+tEgo9q+BIauhsf8E3d5QW7y8ULTyAshSbrxHbbSI3Swt+BA+JAUeNZApyUdo/sp0z0GjEakjF
	dGZmPGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5Ac-0000000A8dv-0CaM;
	Mon, 19 May 2025 18:25:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4ck-0000000A1Kw-1Kdb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:50:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B032A15A1;
	Mon, 19 May 2025 10:49:48 -0700 (PDT)
Received: from e132581.cambridge.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD0923F673;
	Mon, 19 May 2025 10:50:00 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Cc: Leo Yan <leo.yan@arm.com>
Subject: [PATCH v2 0/2] coresight: etm4x: Fix timestamp regression
Date: Mon, 19 May 2025 18:49:43 +0100
Message-Id: <20250519174945.2245271-1-leo.yan@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_105002_400141_D999452D 
X-CRM114-Status: UNSURE (   7.60  )
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

The timestamp appears all zeros with latest kernel, which is caused by
wrong bit field setting. The first patch fixes the regression.

The second patch refactors the ts_source_show() function.  It simplifies
the code for directly returning the TS value.

Changes from v1:
- Retained the older condition check (Suzuki).


Leo Yan (2):
  coresight: etm4x: Fix timestamp bit field handling
  coresight: etm4x: Refactor returning TS field

 drivers/hwtracing/coresight/coresight-etm4x-core.c  |  2 +-
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 16 ++--------------
 2 files changed, 3 insertions(+), 15 deletions(-)

-- 
2.34.1


