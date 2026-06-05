Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668E7CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 10:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=44gbnIf0MqOZ0PFpuSwgVD3b5QRoy0LbpuEZio+K3Lg=; b=TxbhbivpGhhFYXKDRu3m3VzYAz
	rianXvRlX5WLQTaQGTdlQJB8Ntkg0e+oj+3YN63LwnIxZ4Ba5pgdQPOfiJ6Tt35oDaBu/BzToGvqj
	1NJZvjr44iHAs04B+mghyoVBraK6O9ido5dSj0H2JwXZxRmwSDt3bvU2rcDYxOx4miE9KNi4IgFkD
	U8uALv+o9+X8DymNOMYRETMh425+0fYwdLHywRZx4qFAPjLwp7oDJuKDsdfUbgvWo3xnTeMiVKzsk
	x6Jv8T4a3t2YaKvrSdx2kao9e2RJk3sChNwcDA4RlxD49YWTv72JiO9uVCIVGR46Bl4fLVnpSA8CJ
	O0pOgTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVS75-00000000Uvg-14io;
	Fri, 05 Jun 2026 10:49:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVS72-00000000Uuo-0E2I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 10:49:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B648A4AC6;
	Fri,  5 Jun 2026 03:49:08 -0700 (PDT)
Received: from login2.euhpc.arm.com (login2.euhpc.arm.com [10.6.38.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 63D5C3F7D8;
	Fri,  5 Jun 2026 03:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780656553; bh=qmKIASkFCpDHNtgkjF9OB+DjNRBxJ/BsjOJ14o64gpQ=;
	h=From:To:Cc:Subject:Date:From;
	b=cuK+i5XrRh7V/ASrc99wvLLY/mjYU1tzO4fERPf8d9ZhG0DSyVmbYn04DE1NKECp0
	 1IVOWFpt0hKDTgIGPm/rrxCnj0X6geHBRPRCXBtx1csxWwRYAnNSYnFBnwKLiEJCRW
	 T+s8jUSVmCrqp99zlxaNNJSOQbq22IyFBMY6k58A=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: vladimir.murzin@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	joey.gouly@arm.com,
	Sascha.Bischoff@arm.com
Subject: [BOOTWRAPPER PATCH v4 0/2] Support GICv5
Date: Fri,  5 Jun 2026 11:48:51 +0100
Message-Id: <20260605104853.2406-1-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_034916_134045_B1E3DF96 
X-CRM114-Status: UNSURE (   8.73  )
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

Small series adding GICv5 to the list of supported GIC
versions. Minimal implementation, just enough for Fast Models.

Thanks!

Changelog:
  v3 -> v4
     - Fixed stray new line at the EOF (per Sascha)
     - Added more tags from Sascha Bischoff
  v2 -> v3
     - Fixed code formatting and incorrect comments (per Sascha)
     - Fixed spelling and grammar mistakes (per Sascha)
     - Added tags from Sascha Bischoff
  v1 -> v2
     - Assign SW_PPI to NS domain (per Sascha)


Vladimir Murzin (2):
  Introduce --with-gic option
  Add support for GICv5

 Makefile.am                    |  15 +++-
 arch/aarch64/include/asm/cpu.h |  11 +++
 common/{gic.c => gic-v2.c}     |   0
 common/gic-v5.c                | 131 +++++++++++++++++++++++++++++++++
 configure.ac                   |  24 ++++--
 scripts/FDT.pm                 |  16 ++++
 scripts/findbase-by-regname.pl |  44 +++++++++++
 7 files changed, 231 insertions(+), 10 deletions(-)
 rename common/{gic.c => gic-v2.c} (100%)
 create mode 100644 common/gic-v5.c
 create mode 100755 scripts/findbase-by-regname.pl

-- 
2.34.1


