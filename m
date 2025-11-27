Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B48D9CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 08:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=42l9E9oC5tnK66Gc9RSFnvRh9vnctWVSZSgLzxSJWRc=; b=RmGQlaGN60QleA
	9w+luvteO3kO07OPgFFo0M0Y/nmAxCetwlBNocbFXoAYdkDVPh11IZjYQLjSePbC+SQfohlkmc1U/
	1WVxC0Ejd05HYbyq09MNfNUZECnBtucpwJrB8nE64nh6j9qJLrpP4gmzzu0HsSW/YJBuZBH3Ds92R
	H5mlWwBiyLbg4FWLwrMksivUyLPrFDGWG0hhvmL7ym0irtEVkavhQ0Aos2E4J3RYfoIfeNVDMJXDP
	DFzPcV5tvQamjd/G2Nb5k993JaZX/6mpdSTeOC4mJq3EyMRLHihpo2mpNSF27qNU0vPVrKBVErUqs
	3GWDAV4r9cmYtRUZk9/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXX7-0000000GDbP-3EjJ;
	Thu, 27 Nov 2025 08:39:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOXX3-0000000GDZP-32fw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 08:39:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AE065C16A16;
	Thu, 27 Nov 2025 08:38:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7FB9B6068C;
	Thu, 27 Nov 2025 08:39:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57EA3102F1A6A;
	Thu, 27 Nov 2025 09:39:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764232753; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=42l9E9oC5tnK66Gc9RSFnvRh9vnctWVSZSgLzxSJWRc=;
	b=l0JMVX46ohIVc7Fo4faJweXEoS7cz6UWkI4g72eX6svcwnWLMbtV/6YqZEivMjRF4miKOF
	lsqfHjuZmNBCw8N+QOYZFyJHM52+YYVuZrVIw4mvQeSubE6yBHBOpyY478B3OGvRQzlMpC
	6a0tAlU7417Do5pJE+hhemESJT8jt0oYLtSIgMLg/sBXgAGxDHxhM8IZ8vaOJuwTCp6PJK
	2ICfBU1NtJblQHAbEqJzE0Us/npCZdmTLFTEP0AK7APuN/5PnH+03tYssfcEprET9pZSoz
	9b4p2fDZOiS5MDCOlZvQwWmSh9MgEeWAPYeWv6ajH4WSB6rxyKNJkO4WDyxTWg==
From: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Subject: [PATCH RFC v2 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED
 mode for Jacinto family
Date: Thu, 27 Nov 2025 09:38:54 +0100
Message-Id: <20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB4OKGkC/4XQzW7DIAwH8FeJOM8VkA+yniZN6gP0OvVAiLu6S
 kKKabSpyruPJt1hO2w3DOj/s30TjIGQxTa7iYATMfkhFfopE+5kh3cEalMttNSlkkpCJGBHcLa
 OhuiBdYCAHH1IP8MFCl2jlPWxVdKJFDIGPNLHAryJ/e5VHNbLgJdrwuLjpUdmu2DJXqnimyIPx
 L6zMbUGkwIFlXHGYdmqpspfGu9jR8PG+f4O/pU09uBHBtehHa7jmmVkU8rG5NbV5e+sxjJCOvc
 Ut9lUbVQNwallhBPdZ/5c9japZYaHZv5bUWIl5EVb5Plzqwtjf7CHeZ6/AA57YGOWAQAA
X-Change-ID: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Prasanth Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_003917_942860_CA7274BB 
X-CRM114-Status: GOOD (  10.32  )
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

This iteration introduces a key improvement: the ti_sci driver now restores
SCI clock parents during resume as the firmware is not able to do it.
On the interrupt management side, the driver has been updated to use hlist
for storing requested IRQs.
Regarding documentation, Nishanth requested references for
BOARDCFG_MANAGED mode. While the relevant documentation is not yet publicly
available, I will update the commit message with the appropriate links as
soon as it becomes accessible.

Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>
---
Changes in v2:
- ti_sci: use hlist to store IRQs.
- sci-clk: add context_restore operation
- ti_sci: restore clock parents during resume 
- Link to v1: https://lore.kernel.org/r/20251017-ti-sci-jacinto-s2r-restore-irq-v1-0-34d4339d247a@bootlin.com

---
Thomas Richard (TI.com) (4):
      firmware: ti_sci: add BOARDCFG_MANAGED mode support
      firmware: ti_sci: handle IRQ restore in BOARDCFG_MANAGED mode during resume
      clk: keystone: sci-clk: add restore_context() operation
      firmware: ti_sci: restore clock context during resume in BOARDCFG_MANAGED mode

 drivers/clk/keystone/sci-clk.c |  25 +++++--
 drivers/firmware/ti_sci.c      | 160 +++++++++++++++++++++++++++++++++++++----
 drivers/firmware/ti_sci.h      |   2 +
 3 files changed, 170 insertions(+), 17 deletions(-)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
prerequisite-message-id: 20251014-ti-sci-io-isolation-v1-1-67c7ce5d1b63@bootlin.com
prerequisite-patch-id: 7bbf6ca9fb85214b5360548506ccca7fae2e5a16
prerequisite-message-id: 20251014-ti-sci-pm-ops-cleanup-v1-1-70b50b73ac85@bootlin.com
prerequisite-patch-id: 257a5848d5631504c9549ad94e4b41a93f980978

Best regards,
-- 
Thomas Richard (TI.com) <thomas.richard@bootlin.com>


