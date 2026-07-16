Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD63C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GUDDA7WLhd11J3afxqa1mQAY/cCunwFAzouNh8rkQQI=; b=f2KgQqciWVXKwwDlxjfTNiF6ro
	/8n0KT1GkOQRE+eIpGeiuCEqfn9agDzYNm8/QT9bfPd+/1ww02gKw7DClI8kRlpWHnApWDNBQbI6Y
	AkGUi4gvC6I+Ux1wxzz1fvg5z/jrdBvQB7vMH2/u76QXYxc4i016jKcf+7SIMz2p42mljyYRg2L9k
	DrtxkYl887BBzVR+c0SBGPhChb7RThBSNNTNmSR/KA00FRFyQdS7cdtJH/XDQZqcXLU3BQiKaZeVj
	KvcqRXAGjYRIlzKXCEKyNhYQaJff+EYw3uwlT1MDMPvF1bgqa9XnVLkLeLtjUTH2pT0ryh9UWMRWF
	0vBlo/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNW4-0000000HYU6-04Iq;
	Thu, 16 Jul 2026 14:56:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkNW0-0000000HYTi-47l2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 14:56:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B0FD1476;
	Thu, 16 Jul 2026 07:56:39 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30BC73F7B4;
	Thu, 16 Jul 2026 07:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784213803; bh=OeE48gTGuCZ9msSMA3TQXhBCtnD2xyz0+Yow4siGDBc=;
	h=From:To:Cc:Subject:Date:From;
	b=bCHKgAz2whfs/OnWepF/6oZB1IBTl5EJ9ez7x3w18MiQoABQ2qHF07EJBD6n3Xt2O
	 gmw2B956fbMpystKqEEXtAtQ1Fzsomby82X+xtO/I+UxKBaEXVjgWpddhGsacH3TY0
	 s5nS2P/Pa3fzr9IdwjV8LJsxrorbuNtf9UEbNDLg=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com
Cc: ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v2 0/4] perf/arm_cspmu: Miscellaneous improvements
Date: Thu, 16 Jul 2026 15:56:33 +0100
Message-ID: <cover.1784213435.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_075645_058679_FD87C633 
X-CRM114-Status: UNSURE (   7.23  )
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

These are a few quality-of-life improvements for CoreSight PMU that
I've accumulated based on things which have come up in practical usage.
There's no real dependency between any of the individual patches, it
just felt right to send them as a series.

v1: https://lore.kernel.org/linux-perf-users/cover.1783605641.git.robin.murphy@arm.com/
v2: Fix valid nits from Sashiko review, add Ilkka's R-b.

Thanks,
Robin.


Robin Murphy (4):
  ACPI/APMT: Use stable device ID
  perf/arm_cspmu: Improve APMT-based PMU naming
  perf/arm_cspmu: Improve sub-module error reporting
  perf/arm_cspmu: Make IRQ more optional

 drivers/acpi/arm64/apmt.c          |  6 ++--
 drivers/perf/arm_cspmu/arm_cspmu.c | 48 ++++++++++++++++++------------
 2 files changed, 33 insertions(+), 21 deletions(-)

-- 
2.54.0.dirty


