Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B75D1BDD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oI5s8asFDWE8LgW78P2vcd6xNJ1YtBMsqU066l+ZeeQ=; b=qlLGudvcAnrfJg2I0a0HIP5aZG
	WPSNntQlT/E/dbt55sOTGd6bHa/9lmUfJPyWgX8wG2tK26Tzs6WzdvMnB3qvwUPPUa9I2NIpL+FxI
	AE+sy4AR4UsvZBwfQB4qI8ivqmlCio1xVvMkHOfWzoPxkk2eUcoF2gsq3krChGO0yYgIhJfeo/RZj
	2GtyztwrYPyDH698ICZTBAzhaIATQvIRfCJfXdC60kxCBETZEZAx3PpabA8FCwo9Yu9K/4EH3oReD
	rFKFFica/fCr+YmvihlhF5ILbGS0/VYXN7sinKKnXBB0xrrVDuexgR94KmO/96m6XBI+cFfoz+AOA
	3rLP6uPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t80sf-0000000EWzu-2cvD;
	Mon, 04 Nov 2024 17:28:45 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80Tk-0000000ERz2-0v4R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 17:03:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F00EE60005;
	Mon,  4 Nov 2024 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730739775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oI5s8asFDWE8LgW78P2vcd6xNJ1YtBMsqU066l+ZeeQ=;
	b=L1WCxFcACUgATE0tjjEcTfaN33vuYwaz+WIrUnD5/83xyUJMVJiiyB7T/3nRmy9hOVxJ9B
	hVo1p8HAmVCdN6DRXx/EDJ1s9G+aTazR3Us24cKKrUsndash/oD28BRxLPslTIBglFL78p
	pk/Pr4sBRU07vYMX8orosVcWpBCfowNfyeLVrN88s6Mk39d2ka/lDkNQDWvYnodP2JlTIu
	IN4c+TMmuAH0Lr/tUzdrCwKdJVA0zFfnTojebSCnxGYi01DT/k0+TyRBtzokMkRZW0WZjt
	u+138GZMj6GP4WFGAdN3NqkdSZPDzgkUYErLjFsa8TWfu33HC8w8T/fGbP6KIA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/9] Support external snapshots on dwmac1000
Date: Mon,  4 Nov 2024 18:02:40 +0100
Message-ID: <20241104170251.2202270-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_090300_442357_74FAB889 
X-CRM114-Status: GOOD (  10.64  )
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

This series is another take on the pervious work [1] done by
Alexis Lothoré, that fixes the support for external snapshots
timestamping in GMAC3-based devices.

Details on why this is needed are mentionned on the cover [2] from V1.

This V2 addresses multiple issues found in V1 :

 - The PTP_TCR register is configured from multiple places, as reported
   by Alexis, so we need to make sure that the extts configuration
   doesn't interfere with the hwtstamp configuration.

 - The interrupt management in V1 was incomplete, as the interrupt
   wasn't correctly acked.

 - This series also makes so that we only enable the extts interrupt
   when necessary.

[1]: https://lore.kernel.org/netdev/20230616100409.164583-1-alexis.lothore@bootlin.com/
[2]: https://lore.kernel.org/netdev/20241029115419.1160201-1-maxime.chevallier@bootlin.com/

Thanks Alexis for laying the groundwork for this,

Best regards,

Maxime

Link to V1: https://lore.kernel.org/netdev/20241029115419.1160201-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (9):
  net: stmmac: Don't modify the global ptp ops directly
  net: stmmac: Use per-hw ptp clock ops
  net: stmmac: Only update the auto-discovered PTP clock features
  net: stmmac: Introduce dwmac1000 ptp_clock_info and operations
  net: stmmac: Introduce dwmac1000 timestamping operations
  net: stmmac: Enable timestamping interrupt on dwmac1000
  net: stmmac: Don't include dwmac4 definitions in stmmac_ptp
  net: stmmac: Configure only the relevant bits for timestamping setup
  net: stmmac: dwmac_socfpga: This platform has GMAC

 drivers/net/ethernet/stmicro/stmmac/common.h  |   4 +
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac1000.h   |  12 +++
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  | 101 ++++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c    |  15 ++-
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c |  26 ++++-
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  38 +++++--
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  10 ++
 8 files changed, 196 insertions(+), 11 deletions(-)

-- 
2.47.0


