Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CA5E9D3F9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 15:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V+jIX2+PXJPcmc9ucwjmh1dIDrajSC6GG82tgislS3M=; b=3ly0ygNsLADBsi
	EqqXD1oh0Dmxw4wFJKpNt8//2WI3ec0VzsHOL19qLe44xeD3EIfEA05XT9uIYJ68xt9wMMZ2fZ8qN
	pBRk0++zye+KhPP/c0QT9QIWeNe3RhSyQWBgQpd20f6HalrmJ0HgHOcjTCWksCd1zmQODzK8Gr1JI
	2O/WBajHbbWPzJBAX7aipF700IIr91LUn9h+QwBmEamOYROBPBX52a4Pn21PQHIisqY0AZZAi08Om
	SElRuKujMTlQQtqru003yE53yDLjkGJQ4xR07hbxeEe4HS+zY1hqxkmYGtm4b7QzvmWM+xXeYAmFT
	T8HRj2Bn5CxAN04rsMDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vneQN-00000008cvu-1yhs;
	Wed, 04 Feb 2026 15:04:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vneQG-00000008cre-0QQ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 15:04:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1BE061A2BE9;
	Wed,  4 Feb 2026 15:03:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD7AC60705;
	Wed,  4 Feb 2026 15:03:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CCF6119A88F7;
	Wed,  4 Feb 2026 16:03:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770217437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=V+jIX2+PXJPcmc9ucwjmh1dIDrajSC6GG82tgislS3M=;
	b=01PkKoQC1tWnJDivPZCN6FUoxPPYQ5fkmldZ1ChoPh6qJ4Eak5r19qTPIXuaEsS3rctQTS
	UDqv+7SI/uDAUEpgFS4OX1ictqFq75Q5AiN3iqT+TO/Wkg0Se3vG8jZ6N7wpdHXCVahTco
	l3uPFR08DjXa8IjLKj9m1PLdZU1ksK1G+vG+rLSKF6ZrIJIYEJ9T3gkEqa0tvwI8MFtXmy
	mc3Qv1B7sRXckugiaCh/98fsUCx2hrYQ8aBDpFuSLSY5LDEvmA9+Yt2yIwarQIupHRptIB
	lGBsBCYvenL5w2l6kr/3gfoMyRMzDFD/kS8qoDpNNBpBWpWVDEghKvxllldh8A==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Subject: [PATCH v4 0/4] firmware: ti_sci: Introduce BOARDCFG_MANAGED mode
 for Jacinto family
Date: Wed, 04 Feb 2026 16:03:37 +0100
Message-Id: <20260204-ti-sci-jacinto-s2r-restore-irq-v4-0-67820af39eac@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMpfg2kC/4XOTW7CMBAF4KsgrzvVeGxI0hX3QCxc/5Sp2rixT
 QRCuXsdKhShLrJ8T6PvzU1kn9hn8ba5ieRHzhz7GvTLRtiT6T88sKtZENJWokQoDNkyfBrLfYm
 QKUHyucRUL9MAmlqP2AYn0YqK/CQf+HIfOBz/cvLDue6UpTzxDFzvT4xybh97zdreKAFBaaeV6
 hzpxuzfYyxf3L/a+C1mfKQFlLQOUgWNbptgVAhE8j+oFpBwuwqqCjrcdTvVNdo4/QxO0/QLGdw
 c4IUBAAA=
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
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_070404_635211_AD6396E6 
X-CRM114-Status: GOOD (  11.51  )
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

The fourth iteration of this series adds support for two new firmware
capabilities:
- MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST: Indicates that DM-Firmware is not
  able to restore IRQ context during resume after suspend-to-ram.
- MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST: Indicates that DM-Firmware is not
  able to restore clock context (rate and parent configuration) during
  resume after suspend-to-ram.

Now, ti_sci driver determines whether to restore IRQs based on the
MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST capability rather than the
BOARDCFG_MANAGED mode. The same logic applies to the clock context.

Both J784s4 and J7200 platforms support these new capabilities. A
corresponding pull request has been submitted on DM-Firmware side to
define and enable these capabilities.

The value for the BOARDCFG_MANAGED mode has also been fixed.

Public documentation for BOARDCFG_MANAGED mode and these new capabilities
is currently unavailable. I will update the series with relevant
documentation references as soon as they become available.

I rebased the series on linux-next next-20260202.

Best Regards,
Thomas

Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
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

 drivers/clk/keystone/sci-clk.c |  42 +++++++++--
 drivers/firmware/ti_sci.c      | 164 ++++++++++++++++++++++++++++++++++++++---
 drivers/firmware/ti_sci.h      |   6 ++
 3 files changed, 192 insertions(+), 20 deletions(-)
---
base-commit: c6fb8985458d675f32a22788f30afcba754b6d78
change-id: 20251010-ti-sci-jacinto-s2r-restore-irq-428e008fd10c

Best regards,
-- 
Thomas Richard (TI) <thomas.richard@bootlin.com>


