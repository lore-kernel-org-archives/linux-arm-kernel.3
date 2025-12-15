Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C468BD5B864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JflWnfhXZSY/C25yADfL4K5U8oOMF7zPuM1TuaRfjNU=; b=soGHUBryCPf3Sw
	TtcDPz+DNcUbrLUpKcs4ToiE59oyukHmo87sg97ncDhSbeW1Z2kWI8l6Sq6wOHZds1icuGddxaxy7
	V7/LCskHFZt6xIkK6ba0cpX/+tzjvhlOzUUAGy0PL0nBTx1Cy1gKwbeoPEpGyR9JgXMwMuqvFDwmU
	nsTa1sAdr42zxpN6eOd5DtlJT4OLt6V4272Py4KWKaWapOgjt/kfiCMG9odkNuD6pgDJDgIngIOTl
	SW8SE4b88A/snTLspLCKUEydfhXUvmvgU/RQU9EjBJEhFjvHqRRrZGk6VRhAu2hZms9c2fZAJoVX2
	DwETQ/lOcq4ns1DotFyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVE5s-00000004ALi-2w05;
	Mon, 15 Dec 2025 19:18:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVE5p-00000004AKC-1kqe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 19:18:50 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vVE5a-0007x7-5s; Mon, 15 Dec 2025 20:18:34 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Subject: [PATCH v3 0/3] i.MX91/93 BLK-CTRL improvements
Date: Mon, 15 Dec 2025 20:18:24 +0100
Message-Id: <20251215-v6-18-topic-imx93-blkctrl-v3-0-51dbd1333938@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAABfQGkC/43NQQ6CMBCF4auQrh3TTimgK+9hXAAdYCICKdhgC
 He3sDIxMS7/l8w3ixjJMY3iHC3CkeeR+y6EPkSibPKuJmAbWqBEo1Aq8AmoDKZ+4BL4MZ80FO2
 9nFwLOlaIskplFlsR7gdHFc+7fb2FbnicevfaX3m1rf+oXoGEwqR5ipRIJc1loK5+Tq7veD5aE
 hvt8ZPDXxwGjlJtAqXj3JZf3Lqubx1pwJ8WAQAA
X-Change-ID: 20251201-v6-18-topic-imx93-blkctrl-341220f7084d
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Frank Li <Frank.Li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_111849_460848_C4B92C82 
X-CRM114-Status: UNSURE (   8.36  )
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

Hi,

there were several approaches to bring the sub-devices population
mainline [1,2] but non of them made it upstream. Both approaches were
part of either the i.MX93 LVDS or MIPI-CSI enablement.

This small patchset decouples the blk-ctrl changes which allows the
MIPI-CSI and LVDS patchstack to be rebased ontop of this patchset.

Before adding the sub-device supprt, I converted the driver to devm_*
only API.

Regards,
  Marco

[1] https://lore.kernel.org/all/20250701-95_cam-v1-3-c5172bab387b@nxp.com/
[2] https://lore.kernel.org/all/20250304154929.1785200-4-alexander.stein@ew.tq-group.com/

---
Changes in v3:
- Link to v2: https://lore.kernel.org/r/20251202-v6-18-topic-imx93-blkctrl-v2-0-e73501034adc@pengutronix.de
- Add r-b (Frank)
- Rebase to v6.19-rc1

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de
- Adapt patch2 commit message (Frank)
- Check devm_pm_runtime_enable() return (Frank)
- Add r-b tags (Frank, Alexander)

---
Marco Felsch (3):
      pmdomain: imx93-blk-ctrl: cleanup error path
      pmdomain: imx93-blk-ctrl: convert to devm_* only
      pmdomain: imx93-blk-ctrl: add support for optional subnodes

 drivers/pmdomain/imx/imx93-blk-ctrl.c | 77 ++++++++++++++++-------------------
 1 file changed, 36 insertions(+), 41 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251201-v6-18-topic-imx93-blkctrl-341220f7084d

Best regards,
-- 
Marco Felsch <m.felsch@pengutronix.de>


