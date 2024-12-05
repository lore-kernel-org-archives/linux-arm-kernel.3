Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FB6E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6pW6jWmBA09T3MAUx5xJBEQMGxOsT8ShEzVhtOujQ9w=; b=URybcl6ADaGIC9IwTz9LmskfHN
	lKiN+4n4aC8AoQPgfTieLfz1jTTsrZ/AENhI3v562LLCCzMnJ37228VPU+YItLqm2wkYhHHssN9+j
	NxRSWfiTtixwmyjBhHuZefzFbUnsXcNhBwzVcpk5t0uGPqqVFS7RIj1LE9FdJQzLTbSvxlAlnI1ol
	aAFgZrl0sDDLCU5eSBtm+9M04Z1F/kzbCy8CWoyU2cJAK0SYx1qhXcA4DxlR+7LzyD6WfuGSd3HSa
	jyBr9V+Noyz/cUEpjFbBN+Yi/aA78cyvGqYrAd48lPa/4uEetRcCCf5f5brMJWj30ter0c8SVLPSv
	KUmA1cKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCzM-0000000GO3U-2VLD;
	Thu, 05 Dec 2024 14:37:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCyK-0000000GNri-3eVN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 14:36:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 038971063;
	Thu,  5 Dec 2024 06:37:18 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 980063F5A1;
	Thu,  5 Dec 2024 06:36:48 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>
Subject: [PATCH] coco: virt: arm64: Do not enable cca guest driver by default
Date: Thu,  5 Dec 2024 14:36:34 +0000
Message-Id: <20241205143634.306114-1-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_063652_950813_750C417E 
X-CRM114-Status: UNSURE (   8.26  )
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

As per the guidelines, new drivers may not be set to default on.
An expert user can always select it.

Reported-by: Dan Williams <dan.j.williams@intel.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Steven Price <steven.price@arm.com>
Cc: Sami Mujawar <sami.mujawar@arm.com>
Link: https://lkml.kernel.org/r/6750c695194cd_2508129427@dwillia2-xfh.jf.intel.com.notmuch
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/virt/coco/arm-cca-guest/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
index 9dd27c3ee215..3f0f013f03f1 100644
--- a/drivers/virt/coco/arm-cca-guest/Kconfig
+++ b/drivers/virt/coco/arm-cca-guest/Kconfig
@@ -1,7 +1,6 @@
 config ARM_CCA_GUEST
 	tristate "Arm CCA Guest driver"
 	depends on ARM64
-	default m
 	select TSM_REPORTS
 	help
 	  The driver provides userspace interface to request and
-- 
2.34.1


