Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43CFCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 15:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo07lhz1ZYzs4I7CDsALtpJV5qdnglg24lvtIPhYQ2w=; b=KYHJAlAClkAurYtwXIotf0yW8L
	msvy+Nnvy8XBwFFmdrfJyC56nuhMpvorUzg1Ez7VuM6sfGiUrn2xCABBLyOYzmVNZZNMG/GzdXJMr
	rGuIN7nCCLmrK5bsE5wQgKWgm0wpEGrV0oNyVvfRrIBSDe7oyuIjMcqW+mNaofiwOtmLAjWOIb8hv
	Gqq+IokLSZO7N0NmFjKRWxW+0+nQorhyYkI84F8rewKu8DiVE6n5/51RvdgH4DbsYbwvYXxnSutcQ
	3Hp7RKrbs02adoB4qL9/nqPOow4C+/ccK/lSEWp9M++PFutEAhxaNM1p2coKOyqhAKGSzO6t5aBA/
	90Fpxh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRAv0-0000000FC1K-2PEt;
	Sun, 24 May 2026 15:39:10 +0000
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com ([44.245.243.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRAuy-0000000FC0M-0LGX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 15:39:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1779637148; x=1811173148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Eo07lhz1ZYzs4I7CDsALtpJV5qdnglg24lvtIPhYQ2w=;
  b=ITCbIQFTS3G60mBrcPVSz5f4qAxXIsgF7DKibO58trJMxRp6fPY/qcoL
   xUqYnGbDMCCdKKtuhYs8X8STFZY76ChmHGtkk8Ntey4hxtHETRr+K9A/+
   ft1MaUBlpwKcwub0uo3cW4oBUJJhXzMxkHS2Qq470PzZaFCN47zdC1ZwA
   xnTnT9FDObMb2G32sHB81YZNxvLSgZ0aUNG90kEvqd6Umh0QFno4K/Vn2
   u5HI/kbdthRnXQ6wk0lP0t3VWBc748DHoJYXxgYCNsHgYbqz9bdSN/f1X
   FboXKpeCtrU6/Ei3I8FcyG06pvwXyuOerUz71t0R6RCMMqpwCaYG1R4AH
   A==;
X-CSE-ConnectionGUID: KP4fJ1PpRj2YoiD1PWIFUQ==
X-CSE-MsgGUID: KzOVSTDJR2CEABSJxJi+qQ==
X-IronPort-AV: E=Sophos;i="6.24,166,1774310400"; 
   d="scan'208";a="19877271"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 15:39:01 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:27340]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.10.199:2525] with esmtp (Farcaster)
 id 3bd2d114-3875-41b5-affc-bd66079b8795; Sun, 24 May 2026 15:39:01 +0000 (UTC)
X-Farcaster-Flow-ID: 3bd2d114-3875-41b5-affc-bd66079b8795
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sun, 24 May 2026 15:39:00 +0000
Received: from dev-dsk-avivb-1b-e28f450e.eu-west-1.amazon.com (10.15.33.9) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sun, 24 May 2026 15:38:58 +0000
From: Aviv Bakal <avivb@amazon.com>
To: <robin.murphy@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<avivb@amazon.com>, <zeev@amazon.com>, <blakgeof@amazon.com>
Subject: [PATCH v3 0/2] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
Date: Sun, 24 May 2026 18:38:46 +0300
Message-ID: <20260524153848.16334-1-avivb@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260504133923.23373-1-avivb@amazon.com>
References: <20260504133923.23373-1-avivb@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.15.33.9]
X-ClientProxiedBy: EX19D033UWC004.ant.amazon.com (10.13.139.225) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_083908_171862_6C4C01DE 
X-CRM114-Status: GOOD (  10.09  )
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

This series adds support for Graviton5's customised CMN-S3 which has
zeroed discovery registers.

Robin, I understand moving driver state into the core perf header isn't
ideal, but I couldn't find another way to grow the struct. The v2
submission failed the kernel test robot build on i386 (COMPILE_TEST) due
to arm_cmn_hw_event exceeding the static_assert against the 'target'
field offset when CMN_MAX_DIMENSION is increased beyond 12.

Patch 1 moves struct arm_cmn_hw_event into the hw_perf_event union to
resolve this. I'd appreciate your feedback on this approach, or any
alternative you'd suggest.

Patch 2 adds the Graviton5 workarounds themselves (unchanged from v2
except for the DTC logid fix below).

Changes since v2:
 - Revert DTC logical ID assignment back to xp->logid (per Robin's
   review)
 - Add patch 1/2 to move arm_cmn_hw_event into hw_perf_event union
   to resolve 32-bit build failure

Aviv Bakal (2):
  perf/arm-cmn: Move struct arm_cmn_hw_event into struct hw_perf_event
  perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5

 drivers/perf/arm-cmn.c     | 55 +++++++++++++++++++++-----------------
 include/linux/perf_event.h | 22 +++++++++++++++
 2 files changed, 52 insertions(+), 25 deletions(-)

-- 
2.47.3


