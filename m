Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E0CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zNmrNgyXK4vgy/Dxa0dAkGVnloeFKCBwPuADdkEKV00=; b=JapsRqHbq3ojiiRD5OVOP6sgjp
	q1e0xBSA5OmUb+JrlJ88UuSX3n1HnI8yvrZmeidRAaxMp2k/V3ymUHdvR99XPRfej9hO/srg3RaWe
	KWTE2z69dEUBc4qrcqcNLUZvU6PUoC91ID3j1TTW6fIIEtUuW2j2v64YFgrdjc60F2+X54pjnPeS3
	sYeePfQ2azQfHRK8r49BNeWb0glK6BAa578xk/69fISipXL9jg9rizcGYpa+8zweWdERuvwsYLd5f
	f/d7n0ibexsttt5n8hqDH3fRrR7f4kRWxLlfxVcYt+rSxb03DermTgIE1bB0DZ13oH+XxlKE2SWMv
	SyCZa2ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weY5j-0000000H6pV-1CLE;
	Tue, 30 Jun 2026 13:01:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weY5g-0000000H6oJ-2fUQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 13:01:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E24DC2ED2;
	Tue, 30 Jun 2026 06:01:20 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0BF983F905;
	Tue, 30 Jun 2026 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782824485; bh=J++bVc2eDFtasCu94A0O+i2iCy1XUUqw/X2NxGrpFEk=;
	h=From:To:Cc:Subject:Date:From;
	b=Zq9e1ohWmKsPCpcMjN69pt8XAVKHkNLBa9OrFY7IdZeyp5ciEyZExPNtJjqjNpwWX
	 bgJ4xgHeg5uCQzuJYdTq8kInCenAkmXlJVETp4mkjJbzWXsHUb2xtaD+rfD8HOpYGw
	 X/yLTfesRZriu1G0Ee3o3ma0/gcXjuz567PeBJ4o=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	zeev@amazon.com,
	blakgeof@amazon.com,
	avivb@amazon.com,
	ilkka@os.amperecomputing.com
Subject: [PATCH v6 0/2] perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5
Date: Tue, 30 Jun 2026 14:01:16 +0100
Message-ID: <cover.1782824005.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_060128_806163_B8AC99BA 
X-CRM114-Status: UNSURE (   6.98  )
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

v5: lore.kernel.org/r/20260603150025.30980-1-avivb@amazon.com

Hi all,

I'm reposting Aviv's series partly for visibility, since the previous
versions were buried in a thread, but also to respin patch #1 - Aviv had
fixed up the bugs in my initial draft, but I also get reports against the
original commit on my branch, so I ended up taking a second look, and
deciding the improvement was worthwhile.

Thansk,
Robin.


Aviv Bakal (1):
  perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5

Robin Murphy (1):
  perf/arm-cmn: Move DTM index data out of hw_perf_event

 drivers/perf/arm-cmn.c | 123 ++++++++++++++++++++++++++++++-----------
 1 file changed, 92 insertions(+), 31 deletions(-)

-- 
2.54.0.dirty


