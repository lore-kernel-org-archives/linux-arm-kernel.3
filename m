Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8142ECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 17:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r4lh4MHQfSOkdDuZaGI7bN9ybZgSXUPJzcaRq8qSXhk=; b=TF6vRBtrp4oAYvpRoNQSRL8PjE
	UVdUri70DKKBf7rfN1CASTg6Drlr2ws4gBYeY8ov9voif21Z9uhNk0W9dzSs6rG4PTTqOzYemzWwq
	4/StDti6O3A0R/vX+zTsTrl+HPl3b9688mS+nCFXdZivhK31LOGqfzxKQZwIzJ5AlCNS5mMpKxkx0
	x57qje0DXenU2cDMLe2raq9Ncujm8qqr2BcREl2CUaBFIdIG5a8vtjxcGaWfAuvSGnZLNemY1mlou
	QTDwC8P4C7VmtnRNIN8If95uFYuWexNwQ0YFfRfZ7M/HQOtOENID7Y1TbFoCpbm0qwv3Rs+BgvJKP
	LkewG7gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urJWZ-0000000GFAG-2V1H;
	Wed, 27 Aug 2025 17:01:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urHY6-0000000FpC6-2QTO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 14:54:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756306495; x=1787842495;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7/9/ab5DwSdq1kMUFY0n9EWgffcJOonazGOO+MnnqKM=;
  b=C5H0q3w3rY1VrvSQhdlWwXu9FYZ/H8DPKgAZag1Rx8tQYOJcmrciaB0r
   uPu2OTbrPKvMtUZmDiqsNpX6l1icm2YE/6aQ9PXsei7p2YjQIa40LLU+m
   V3+fD+1ZgAVgJjUDDIT945V4qzhNwdPT5jp21HyOJnrqET9/u5twQPXga
   NQbMqOVPhwDr+//X19KAxvOVM6BqdivH7Wy/L9S5Z9PRVTYv3jQm4YTKb
   EoOStMJrez3hY6C2t/75QG4OmHU2BNO6xgSJmM6oYikylEdEbzouV+QqH
   W9+9QaeLQadodmRdEdjIi4ESHLgogt/Exz5VOZRiWTeJDdY+11sYgpfwi
   w==;
X-CSE-ConnectionGUID: K/Go/kCXSc+X6OI3ZHXIsg==
X-CSE-MsgGUID: t5A98cIBRlCdhJ/4uxEw2w==
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="45714989"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Aug 2025 07:54:52 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 27 Aug 2025 07:54:37 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Wed, 27 Aug 2025 07:54:35 -0700
From: <nicolas.ferre@microchip.com>
To: ARM Maintainers <arm@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ryan Wanner <ryan.wanner@microchip.com>,
	Varshini Rajendran <varshini.rajendran@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH 0/3] ARM: at91: enhance PM routines
Date: Wed, 27 Aug 2025 16:54:24 +0200
Message-ID: <20250827145427.46819-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_075454_801587_EC34FCA8 
X-CRM114-Status: UNSURE (   7.85  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Low priority fixes to the PM code, in relation to recent addition of sam9x75 or
sama7d65 SoCs.

Nicolas Ferre (3):
  ARM: at91: pm: fix .uhp_udp_mask specification for current SoCs
  ARM: at91: pm: fix MCKx restore routine
  ARM: at91: pm: save and restore ACR during PLL disable/enable

 arch/arm/mach-at91/pm.c         |  2 +-
 arch/arm/mach-at91/pm_suspend.S | 12 +++++++++---
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.43.0


