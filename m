Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF9FFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 12:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qjy308hK9rOO1ChSh0zTpRRW8vgUyHGi0LBb/z6ARhg=; b=ngZ6cfgHBOtjcB
	0IuptTXfyu7G9kz52V4Wm01VdoKkMtzRO28VibOOjBG6gAguzKiZyX83gLZBVTIRK1Rd7S+np40j8
	AIxoicW9XGDOlj6CGRROAkIIBHN7FmSK11KE/NBey7Y7+XZRnJWjFtcDHqL8aLaiit27ZPg5aOrz0
	Mf0tWu5DxCh8FWKLcaZvtsCDWVq5EWzqFPW4j/Q1TLgam146qI3bjVbV/I4sJ0zA+aL7UVZ2BpYDB
	pgtqqQHFsZ4XrcXXFYvSy8FjH7hV3bvBNw5YWMHmfMG4LfH/q0MJ0748Kb/1Nq6Iy5KqGg7i2iH8e
	9MAI18AwHiDdAkFhEViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKyc-0000000Gscf-3zxI;
	Mon, 27 Apr 2026 12:22:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHKyZ-0000000Gsav-3tRV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 12:22:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1209B4E42B34;
	Mon, 27 Apr 2026 12:22:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2B5A600D1;
	Mon, 27 Apr 2026 12:22:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E526C1072807D;
	Mon, 27 Apr 2026 14:22:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777292526; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qjy308hK9rOO1ChSh0zTpRRW8vgUyHGi0LBb/z6ARhg=;
	b=rDOkO/MZAUJOlKdGgmkOyPpeLucFU/A4d8JtDw1hr14+berrOgVx7z0HTFV5PLQ25v5NlL
	TF6EXn5O3SkhOs+8L4kRZV0dy98pKmlAk5gAzQ9S+8CTlfEkeVzJxpUiedtqLSNJiUSqJ9
	2yInqSDi7Dbk+luzJXQ3pfHzhcr9oA8kqvwO77ut9cYEMCPSaQj8mIRFFiHayJxj6sGMbd
	zDkgXpHFcjgVYoB6fo22SJQDpiWEbXmI/4hvy94NRctujZ8NZCR5jjcGYYyRmfo8v3uRW8
	puIGtSfG+32VlZZycOZ0b3ZtunssAaGWwRiuFoKIxokPJVOAXYQ0rLDWGTHUVQ==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Subject: [PATCH v6 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Date: Mon, 27 Apr 2026 14:21:33 +0200
Message-Id: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM1U72kC/4XPTU7DMBAF4KtUXmM0Hk/suCvugVi4/qFGEFM7R
 KAqd8cpqiKURZZvNPrezJXVUFKo7Hi4shKmVFMeWlAPB+bOdngNPPmWGQJ2AgTwMfHqEn+zLg1
 j5hULL6GOubTNcuGEfQDooxfgWEM+S4jp+1bw/PKXS7h8tZ5xHZ7TAvzcjpjEMr336b2+SXDgk
 jxJaTyStk+nnMf3NDy6/MEWfMIVFLgPYgMt9TpaGSOi2IJyBRG6XVA20IMyShpN1tMWpDuoAIF
 2QWqg0j2CjdIE67Zgt4IE+y93DTT6hH1Eb2Q0/8F5nn8BXZ+u5icCAAA=
X-Change-ID: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>, 
 Dhruva Gole <d-gole@ti.com>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_052212_151952_87EBE09F 
X-CRM114-Status: UNSURE (   6.99  )
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

This is the 6th iteration of this series. The only changes are in sci-clk
driver. As suggested by Brian, during restore_context(), the set_parent()
operation is done only for clocks which have more than one parent. Also the
rate returned by recalc_rate() is saved. And I added Kendall's RB tag.

Best Regards,
Thomas

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
Changes in v6:
- rebase on v7.1-rc1.
- add Kendall's RB tag.
- sci-clk: call set_parent() during restore_context() only for clocks which
  have more than one parent.
- sci-clk: save also rate returned by recalc_rate().
- Link to v5: https://lore.kernel.org/r/20260407-ti-sci-jacinto-s2r-restore-irq-v5-0-97b28f2d93f9@bootlin.com

Changes in v5:
- rebase on v7.0-rc7.
- add Dhruva's RB tag.
- use kzalloc_obj() in ti_sci driver.
- Link to v4: https://lore.kernel.org/r/20260204-ti-sci-jacinto-s2r-restore-irq-v4-0-67820af39eac@bootlin.com

Changes in v4:
- rebase on linux-next next-20260202.
- fix BOARDCFG_MANAGED value.
- add MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST firmware capability.
- add MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST firmware capability.
- Link to v3: https://lore.kernel.org/r/20251205-ti-sci-jacinto-s2r-restore-irq-v3-0-d06963974ad4@bootlin.com

Changes in v3:
- rebased on linux-next
- sci-clk: context_restore() operation restores also rate.
- Link to v2: https://lore.kernel.org/r/20251127-ti-sci-jacinto-s2r-restore-irq-v2-0-a487fa3ff221@bootlin.com

Changes in v2:
- ti_sci: use hlist to store IRQs.
- sci-clk: add context_restore operation
- ti_sci: restore clock parents during resume
- Link to v1: https://lore.kernel.org/r/20251017-ti-sci-jacinto-s2r-restore-irq-v1-0-34d4339d247a@bootlin.com

---
Thomas Richard (TI) (4):
      firmware: ti_sci: add BOARDCFG_MANAGED mode support
      firmware: ti_sci: add support for restoring IRQs during resume
      clk: keystone: sci-clk: add restore_context() operation
      firmware: ti_sci: add support for restoring clock context during resume

 drivers/clk/keystone/sci-clk.c |  44 +++++++++--
 drivers/firmware/ti_sci.c      | 164 ++++++++++++++++++++++++++++++++++++++---
 drivers/firmware/ti_sci.h      |   6 ++
 3 files changed, 194 insertions(+), 20 deletions(-)
---
base-commit: 0b8124777bdaeed16d8165f1e6f621d3df6e85a3
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c

Best regards,
-- 
Thomas Richard (TI) <thomas.richard@bootlin.com>


