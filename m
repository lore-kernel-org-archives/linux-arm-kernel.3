Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B696CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lH41RhbrOBVmzAN2aH8NZzQVqD5v4xoPzx/V0+1gYWk=; b=RArieJb0tAmcfl
	GqGFME9q4egiHIlSc+ZupEMLQA2PnDkUW9YPm5zQD+wXK1wcI5OjkEdYkuPj0n2yDyzY7QBZ7DO2S
	5Y0rnoeuKYJJSLCawmny3NIUzt71oModbqtyHy5r0BvnMm1zhBZ7/+Up6p8zOVc/zYVQSWxrj/Zqi
	t7qvytSKKY1t8Fygtb5QNui8JVqG+awjGv4uvxCZ6E1ZYmZjm6qKR0zL3ilSh5/ab4Un/PhbnvHdX
	mbHHss2xNGu2EZ9wIrELtwNAfvHTpNFeJCQc5sh6QIIMK6KGbBwbcnTIaLl2AhRDDVGyT5bspPc2F
	3iAuv/Qy9/hz69xmn/gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXjK-00000000Apk-3umv;
	Wed, 06 May 2026 08:35:42 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXjJ-00000000Ap5-3VnV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:35:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C60694E42C12;
	Wed,  6 May 2026 08:35:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99DC66053C;
	Wed,  6 May 2026 08:35:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AD13E102F15A2;
	Wed,  6 May 2026 10:35:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778056537; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=lH41RhbrOBVmzAN2aH8NZzQVqD5v4xoPzx/V0+1gYWk=;
	b=y9r6s6b3+UKDswZjRBEqAmQpJmBbrY4xhxe6kcxqVl0njbd/MgX5C+KXX/MUsix0IwhG6k
	4jly7ugPfKa3e/uIgSZA168Q6RnAV7DOYl4JHZ1ZMJAxnAfAmnyZk0DsurV1su0AkStfAz
	2kDeWaaocW2xmvTlGA9mvkDgMxL/muthVv0LjcXl7VhfUyR7m01pIzSeWPbYV9j1p8UOB8
	nuIAf6uGIW1vw7D/4rcum+QlhqPB2Q+03hzFAXL0ZpsJM4h89XcTUAHL1O7l1KON35yg6E
	IW9KWQ/W/FHkyIoa5lvdZ5zzu2K50p23WQrEi5MnrVyrO9xURp2stzb5WNZbSQ==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Subject: [PATCH v7 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Date: Wed, 06 May 2026 10:35:24 +0200
Message-Id: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-0-037098a35215@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEz9+mkC/43Qy07DMBAF0F+pvMZoPHb86Ir/QCwcP6gRxNQOE
 ajKv+MUVQFlEZZ3ZJ07ngupoaRQyfFwISVMqaY8tKDuDsSd7PAcaPItEwTsGDCgY6LVJfpiXRr
 GTCsWWkIdc2kvy5kK1AFAR8/AkYa8lxDT57Xg8eknl3D+aD3jOjylBfi6LjGxZXrrU3t9E6NAu
 fCCc+NRKPvQ5zy+puHe5Tey4BOuIMN9EBtohVbR8hgR2RbkK4jQ7YK8gR6kkdwoYb3YguIGSkA
 Qu6BooFQawUZugnVbsFtBAftf7hpoVI86ojc8mi0of4H/uKFsoEInhdSuR9v/Bed5/gaaihq/e
 AIAAA==
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
 Dhruva Gole <d-gole@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_013542_147008_03B03A5F 
X-CRM114-Status: GOOD (  11.25  )
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

This is the 7th iteration of this series. I did some changes as suggested
by Nishanth. In ti_sci driver I added a lock around set_irq() and
free_irq() to keep hash list consistent in case of concurrent accesses, and
now ti_sci driver tries to restore all IRQs even in case of error.
On the clock side, get_parent() errors are now handled. If we fail to get
parent_id for a clock, set_parent() is not called anymore in
restore_context().
Other minor changes are listed in the changelog.

Best Regards,
Thomas

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
Changes in v7:
- ti_sci: add a lock around set_irq() and free_irq() to keep hash list
  consistent.
- ti_sci: in free_irq() add warning in case we are in a path that shall not
  be run.
- ti_sci: free an IRQ if we failed to add it in the hash list.
- ti_sci: during resume in case of error, try to restore remaining IRQs and
  logs all errors, then return the latest one.
- sci-clk: add Stephen's AB tag and Brian's RB tag.
- sci-clk: handle get_parent() error, in restore_context() do not call
  set_parent() with parent_id=0 if get_parent() failed.
- Link to v6: https://lore.kernel.org/r/20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com

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

 drivers/clk/keystone/sci-clk.c |  45 +++++++--
 drivers/firmware/ti_sci.c      | 212 ++++++++++++++++++++++++++++++++++++++---
 drivers/firmware/ti_sci.h      |   6 ++
 3 files changed, 242 insertions(+), 21 deletions(-)
---
base-commit: a8afe52b5e5050c0c5825d7931a21b687a628d9a
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c

Best regards,
-- 
Thomas Richard (TI) <thomas.richard@bootlin.com>


