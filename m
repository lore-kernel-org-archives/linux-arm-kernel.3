Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5994C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/X2Slab+SBM7AEaepiXuJKrC2TDQhdX7Mdx2snQfQOU=; b=DB+8rbdiIfg7uqmt/i/nbmmD5i
	GnveUx8iKxS9XY0WTq98SSLw7F+ylcE1/1axBW9EU12kz2pg/t1+4b3MjH4LP+u0Mdov/+cOu4sBj
	kZ4/nk/0+A/mmKnyg/KLbbbB2ZiOMWFYzsgEXdWp+XKk44023uUSBeBQSmQ1yHt7yjpv0xE0Uw2RH
	RvFKwRgE0fMssdoQrCmb/synKWpkds2RUIES5Q0kKRaqzyJNjj7SnKBBlSpY8BRspk1fIFhMz+VOd
	k3oEiWzOKykaKLRoFMz8lt904byEOpO+li6VrR8LMkhQowHDbkHFLza0nPs89JnU+eqU5F732AGi0
	gnAAcP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprLg-00000008cVt-1NIV;
	Wed, 05 Mar 2025 16:11:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprK4-00000008cIC-3GUr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 16:10:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99D25FEC;
	Wed,  5 Mar 2025 08:10:26 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 76E4C3F5A1;
	Wed,  5 Mar 2025 08:10:12 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	bwicaksono@nvidia.com,
	ilkka@os.amperecomputing.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 0/3] perf/arm_cspmu: Add PMEVFILT2R support
Date: Wed,  5 Mar 2025 16:10:05 +0000
Message-Id: <cover.1741190362.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_081016_855380_F76D1286 
X-CRM114-Status: UNSURE (   7.28  )
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

This is part of something I'm working towards, but I figure it stands
up on its own enough to be worth getting out early. Compile-tested
only, but it's straightforward enough that I'm confident.

Cheers,
Robin.


Robin Murphy (3):
  perf/arm_cspmu: Move register definitons to header
  perf/arm_cspmu: Generalise event filtering
  perf/arm_cspmu: Add PMEVFILT2R support

 drivers/perf/arm_cspmu/ampere_cspmu.c | 32 ++++-------
 drivers/perf/arm_cspmu/arm_cspmu.c    | 81 ++++++---------------------
 drivers/perf/arm_cspmu/arm_cspmu.h    | 57 +++++++++++++++++--
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 21 ++++++-
 4 files changed, 100 insertions(+), 91 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


