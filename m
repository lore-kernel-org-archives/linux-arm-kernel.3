Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A48C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vCHt8yNJeYPYr9o5YPYfCDUfnXDMejYEUEOz6tKiUkA=; b=Mw3qwHOSoHeNLL7OnTLs+Au/Hf
	QRjty7Vf+AfSFSx1eTxph63zM7jLAiv+xXI0JYgrME3zpHAkMC8NKOwhi+DmjDICSTirJ2IYXJ3mV
	sikHzHI3qCtivpuRqlknW2ViRSg/Dfflqra77/Wq0mm1fIeQBj6MrIRCFrO8J9Gu7VM+aRckWf8PV
	NU/Ql/Mayg4zZClNNZ8vxH3WGanCBaIpi0IhWrp6eLWmC6FoJ7hicIwCnvhBsC9ibo8R6QEDPboAK
	Z6hEzUkVmSBIMdsCAj8eTwuaEHL540ZiACDf9fO42tW5pxoi+GS1QFpUbd0mHieBFWTD5/2/d40Gc
	z4J2iHLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokDP-00000005kkZ-3iOk;
	Tue, 28 Jul 2026 15:59:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wokDM-00000005kjZ-3jW9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:59:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A6CA169E;
	Tue, 28 Jul 2026 08:59:27 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 54EF33F66F;
	Tue, 28 Jul 2026 08:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785254371; bh=nVkco82+yfXz0BQn2xyAzX3TupsGHo0xXHaVTkcrZB0=;
	h=From:To:Cc:Subject:Date:From;
	b=pI7+CWFB1Kkxunc6WyKU72zAowhxdmNVEAeKVIImVgZiHYfKVlop2CgU3btkDeEN7
	 CKoRwoRh7itJndrY0KI3HKAwYz0Cuh5bfG5HMngmOiTc0DocKlln9PJE+co/VO5/95
	 CCjVDuTHk6TI/54KnZjwLMQTecB+AoLKgBaftEXQ=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	ilkka@os.amperecomputing.com,
	leo.yan@arm.com
Subject: [PATCH v2 0/5] perf/arm-cmn: Support CMN S3 r2
Date: Tue, 28 Jul 2026 16:59:20 +0100
Message-ID: <cover.1785252273.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_085932_969966_DA54513A 
X-CRM114-Status: UNSURE (   5.72  )
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

v1: https://lore.kernel.org/all/cover.1782830759.git.robin.murphy@arm.com/

Hi all,

Since nothing else has come up, this is a very minor respin to fix
the bisection nit that Leo spotted, and hopefully it's good to land?

Thanks,
Robin.


Robin Murphy (5):
  perf/arm-cmn: Rename filter variables for clarity
  perf/arm-cmn: Refactor event filter programming
  perf/arm-cmn: Refactor event filter data
  perf/arm-cmn: Plumb in new filters
  perf/arm-cmn: Support CMN S3 r2

 drivers/perf/arm-cmn.c | 490 +++++++++++++++++++++++++++++------------
 1 file changed, 347 insertions(+), 143 deletions(-)

-- 
2.54.0.dirty


