Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF4BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=STbTJMkUh3rxDh+BaRkosXXio8WtWMWp0Go6p1Yu2ag=; b=0Ltv9L0FiW6906gEWX/EcgMYWM
	GRcb8WDM/h9x//YmjEKDDVGrGli6IKWY1Br8lCht6SR/+NNMkgE6FzYWz2n+dwln/tLVzePshzn8l
	9wez6QDgghXKUEW+T/PeyAMos1cO+7esexxzQaFm75ydcLqMlXWXIe07JFGo04Nr2b0GUrgOjWY4P
	VsKJYm98dXl99wx97brJog12EFtTsHkkvy9Y3kiYFp6rVoS4d+PGVpXerb4wiuPQViKH1ssjlbAWp
	tsTFQjDaUl1pWrrhN+XLcucWRkFLMeY+/2c1rg/5BC/gxVq5vCjLTXY7eZqrNjuIsySKNVqNRKSy2
	iZntfqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIMX-0000000FUc1-1DfF;
	Fri, 11 Jul 2025 18:20:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaIHS-0000000FU9V-2jLL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 18:15:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B759516F8;
	Fri, 11 Jul 2025 11:15:18 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4CCE13F6A8;
	Fri, 11 Jul 2025 11:15:28 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com
Subject: [PATCH v2 0/2] perf/arm-ni: IRQ improvements
Date: Fri, 11 Jul 2025 19:15:15 +0100
Message-Id: <cover.1752256072.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_111530_738340_55A47B6E 
X-CRM114-Status: UNSURE (   5.21  )
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

v1: https://lore.kernel.org/all/cover.1747149165.git.robin.murphy@arm.com

Hi all,

Here's a quick tweak to address Will's concern last time (minus
the affinity fix that's already queued).

Thanks,
Robin.


Robin Murphy (1):
  perf/arm-ni: Consolidate CPU affinity handling

Shouping Wang (1):
  perf/arm-ni: Support sharing IRQs within an NI instance

 drivers/perf/arm-ni.c | 154 ++++++++++++++++++++++++------------------
 1 file changed, 88 insertions(+), 66 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


