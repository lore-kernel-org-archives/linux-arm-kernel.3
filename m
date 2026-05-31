Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F3CCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 11:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJ0EqeycGMqEGZ+ilYzM2TIHWMZS86hqQeQQTWn8JFc=; b=KhQ1bommdEJTTrn64QSfHGXqdw
	6618T47HM8/rRWxsAYc1cg1COryytmoKkwoHOw5BhPznIQBi7cz28WkWamR8ez++nB8iy1oxwa4EW
	FvOBeOnt18tb9n1Pm/0aDFU5ny/I4/cAnncH5TQIi1HaiTwiHB6cRk2hVMssCeCmVL/uJcUeZudNH
	KR9zpl+HMO3jfJlRyc9Q1r35JNyn52toUR6ZDSmRqp6HhuvCEOhKGpRPSjiy9HlzJOO5XUxwq+imT
	uGDE1yp/RddnB9oLlW1Xkf2LInU/K5foYKq5v8jAuZvaFftPQJ36ZSB2iQhH2IkUIwYHJsF418quq
	Kq2dWW8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdyW-00000009WY1-2lAC;
	Sun, 31 May 2026 11:05:00 +0000
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com ([35.155.198.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTdyT-00000009WWv-1uqu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 11:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1780225497; x=1811761497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SJ0EqeycGMqEGZ+ilYzM2TIHWMZS86hqQeQQTWn8JFc=;
  b=jrsHKf+m4WzFDqDBJEqMK4hLJh9D4caJKxikqgBnesiHGKwrbwAYVlUW
   7XUGrWtL0in94QvtfQ4PBYu0tnp01kCXX6X/y1H2Kdzgp2YknpXO5EXwG
   HvYZd/Z5xp7Hg8kXFK4f7d/9D8yb6QpuqZcScylm7bnobT3NHhx/J2BQ7
   sgRmHn2QaL8/Bb80wF8NZ/sHyuMc3AutAhScPAYo046bU4khj3vxRkwus
   hXe3fmJEe5y92GeuNNiCMI9+ii/ougWtbstPyQ96IclxEVlsJ6oA3joM9
   GkgZLw/4und3krC8ufYR4B27fYOIncyaZ3kDh2Ph+wR7qKlKJakoyanwv
   A==;
X-CSE-ConnectionGUID: tdFeQ4DlRAicmta78vAuzg==
X-CSE-MsgGUID: QSLyO8POSmqrXa4r78VB5w==
X-IronPort-AV: E=Sophos;i="6.24,179,1774310400"; 
   d="scan'208";a="20678444"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 11:04:52 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:21705]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.6.91:2525] with esmtp (Farcaster)
 id dc0f3f19-864f-4891-9642-d8fdf3f3ce2e; Sun, 31 May 2026 11:04:52 +0000 (UTC)
X-Farcaster-Flow-ID: dc0f3f19-864f-4891-9642-d8fdf3f3ce2e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sun, 31 May 2026 11:04:51 +0000
Received: from dev-dsk-avivb-1b-e28f450e.eu-west-1.amazon.com (10.15.33.9) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sun, 31 May 2026 11:04:49 +0000
From: Aviv Bakal <avivb@amazon.com>
To: <robin.murphy@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<avivb@amazon.com>, <zeev@amazon.com>, <blakgeof@amazon.com>,
	<ilkka@os.amperecomputing.com>
Subject: [PATCH v4 0/2] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
Date: Sun, 31 May 2026 14:04:45 +0300
Message-ID: <20260531110447.10095-1-avivb@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260524153848.16334-1-avivb@amazon.com>
References: <20260524153848.16334-1-avivb@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.15.33.9]
X-ClientProxiedBy: EX19D036UWB003.ant.amazon.com (10.13.139.172) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_040457_573611_B95E8DEE 
X-CRM114-Status: UNSURE (   9.27  )
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

This series adds support for Graviton5's customised CMN-S3 which has
zeroed discovery registers.

Patch 1 is based on Robin's suggestion [1] to move the DTM index and
watchpoint bitmaps out of hw_perf_event into separate allocations,
removing the size constraint that prevented increasing CMN_MAX_DIMENSION.
Two fixes were applied on top: the kzalloc size now accounts for
sizeof(u64), and bitmap_zero() is used instead of a raw memset for
wp_idx.

Patch 2 adds the Graviton5 workarounds.

[1] https://lore.kernel.org/all/c1d27212-8e2b-4820-bee6-ad7e7de81238@arm.com/

Changes since v3:
 - Replace patch 1/2 with Robin's approach: dynamically allocate
   dtm_idx and wp_idx instead of moving the struct into perf_event.h

Changes since v2:
 - Revert DTC logical ID assignment back to xp->logid (per Robin's
   review)

Aviv Bakal (2):
  perf/arm-cmn: Move DTM index data out of hw_perf_event
  perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5

 drivers/perf/arm-cmn.c | 121 ++++++++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 31 deletions(-)

-- 
2.47.3


