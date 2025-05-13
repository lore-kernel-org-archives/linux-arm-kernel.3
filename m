Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFA1C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 15:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mIBUwEMHNuLnbP/8RUpmB3fO/6ukgYjnbTS0GKg6Sbk=; b=DFhsNftHv7f1F28srgEn9fWuAo
	pVcNum5bBPMvQceY+ygTQXU5kDYrhn6pxf4+7gPPauar0BBxWefbLp50d38x2vIpopWW/nMUKqKhP
	GlBjyw0VrsLf6TBjrlQcAVbwFYwcQwqSv9VCcT0aG3yFuxib1zROurbjU/cmDbVTjPvj32TtH1bY8
	1HSJATBstEadOf+qZ3PWZvwOrh7bmDxm5Yi9yH+ZQ+j7QynAt+hcWtiZcd2k0QEpujzP8pv7ZRfJm
	TWdqYAKcRGShj1+HDa5YnhHar1W0QYgPY/RInYWG+ZvGRSnau1tTA47tvS1K+k2YFoO5ZwSX6l1Lr
	6keSOSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEroG-0000000CpLy-3JY3;
	Tue, 13 May 2025 15:44:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEril-0000000Cods-2pK4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 15:39:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9A07150C;
	Tue, 13 May 2025 08:38:54 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B0E723F63F;
	Tue, 13 May 2025 08:39:04 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com
Subject: [PATCH 0/3] perf/arm-ni: IRQ improvements
Date: Tue, 13 May 2025 16:38:57 +0100
Message-Id: <cover.1747149165.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_083907_763654_7957ACC2 
X-CRM114-Status: UNSURE (   8.83  )
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

Hi all,

While the previous attempt[1] was missing some important aspects, it's
a valid problem to solve, so I figured I'd take a look myself. This
ended up turning into a slightly wider cleanup, but I think the end
result is nice enough.

As usual I don't have anything to test this on, so if there are any
silly mistakes left that the compiler couldn't catch please do let me
know.

Thanks,
Robin.

[1] https://lore.kernel.org/all/20250410114214.1599777-3-allen.wang@hj-micro.com/


Robin Murphy (2):
  perf/arm-ni: Set initial IRQ affinity
  perf/arm-ni: Consolidate CPU affinity handling

Shouping Wang (1):
  perf/arm-ni: Support sharing IRQs within an NI instance

 drivers/perf/arm-ni.c | 148 ++++++++++++++++++++++++------------------
 1 file changed, 84 insertions(+), 64 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


