Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE5AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+k4g7avi2DD44LmDtyqP5U/JLznbKmKzyJkY/aH+oPk=; b=djQFWaiJ3jJm0SInjcPXrMPSzj
	sjD8UZ/kPPie7C6Ev4OVfsA4KpB69Evpe9l8F7gCR3q9LXLzThrLGwcD6nBSC5LcKs6Cq/E+6188U
	e74EBED6Uj3zS3hSeRdHHdExzByW4ZiOkRqAaWFWDbpwO6oXWi2onWk7dJeG1L04Kz8q9qNbWLD8W
	q2aaFo/fnvu1EcSKmMPcMxxKQmk32Q58k/NEqRWqkTc1SS9PtE9RwowNFA8r5J1+pBLd9cjY+q7Lm
	RYTMHRv2eJTT/C2rFLaohvgOtSMR2bnNSs80rRqbzN1kpZ54QxkbALqFCIeaP3YmcnMYgTJfR6BOM
	zuV4AWEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8GO-0000000Endl-4AUw;
	Fri, 14 Mar 2025 16:52:00 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt88n-0000000EmU6-0RdE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:44:10 +0000
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tt88l-0001NV-TW; Fri, 14 Mar 2025 17:44:07 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v6.15
Date: Fri, 14 Mar 2025 17:44:06 +0100
Message-Id: <20250314164406.744117-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_094409_144184_85923810 
X-CRM114-Status: UNSURE (   8.43  )
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

Dear arm-soc maintainers,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v6.15

for you to fetch changes up to c361baf67200a79c878d72cc879b1217c52cec96:

  reset: imx: fix incorrect module device table (2025-03-14 16:46:15 +0100)

----------------------------------------------------------------
Reset controller updates for v6.15

* Add missing microchip,sam9x7-rstc compatible to device tree binding
  documentation.
* Add SCU reset driver for i.MX8QXP and i.MX8QM.

----------------------------------------------------------------
Arnd Bergmann (1):
      reset: imx: fix incorrect module device table

Frank Li (2):
      dt-bindings: firmware: imx: add property reset-controller
      reset: imx: Add SCU reset driver for i.MX8QXP and i.MX8QM

Varshini Rajendran (1):
      dt-bindings: reset: atmel,at91sam9260-reset: add sam9x7

 .../devicetree/bindings/firmware/fsl,scu.yaml      |  12 +++
 .../bindings/reset/atmel,at91sam9260-reset.yaml    |   4 +
 drivers/reset/Kconfig                              |   7 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-imx-scu.c                      | 101 +++++++++++++++++++++
 5 files changed, 125 insertions(+)
 create mode 100644 drivers/reset/reset-imx-scu.c

