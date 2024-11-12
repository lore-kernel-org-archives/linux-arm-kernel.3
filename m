Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0FED42BB5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MNtCugG59nS9OABDLmKZagjpJ188CbPhZJNQ0/shOKY=; b=OI3cm+Uiy8Trzuash1CA5a1C20
	WhySXdd48/Vw3j9XrHlw626iYmvgoLO2txYnj7cbEEAvm0VnobOA6lNePj+eX+6c0EHkS8g62BwFK
	ByxLN5kshmB8yNqoHZWjrYQpJVTdkNypc0dEiDNFHkXlf8UQe3DTez8vZtbhbwYCbXo0STYNc/LL4
	uuxULIRj9qbJpM3lRt+nHiAsy8b648PSWrwcSO4lJyKOuhoYv4m+nMzaaMpMTiUvYBPqJ0PG0K9vM
	NnzZ/8SDOtwJxRC8FnpM2QcgIjxHpxeQkkQT9hMh6PaxEVupeV3GvieaIE8mPjGMbDSY1V3gR1cVw
	8EZvH2Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuZs-00000004LN3-1FNW;
	Tue, 12 Nov 2024 17:21:20 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuM5-00000004I7J-0yUe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:07:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54B79E0002;
	Tue, 12 Nov 2024 17:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731431222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MNtCugG59nS9OABDLmKZagjpJ188CbPhZJNQ0/shOKY=;
	b=KF6aRyBn5/7nNXSS5Mad6+l+b+BbubgLGJZfM7VgpqTBqmHpPWlNRVneQ/d90gcj71UWiN
	vQcSemki6Sg14AxdjC6nY7uZpZWp4VcbfJSdHPfxJHViK4AcI22w/xTuXP3hzBPUIeD0ao
	ROh47wIUy58MA/IYBsb0gpI1GW5WjRBMwuKHrSKQsvikmu2vDMAEMsj8+vkHOK2IMk+1WS
	V/coLl2a4ohAaV3xmvzLYT0KbnbwQOUJ9d3Fx1nw2oai5BsAdrKmzc/OsDrLy2uU56QAVl
	gyPT5qDS9aEjQfoG92F6DTJ2A4mNIJn4eOxk3euoa5MdvohILAkFdhPrDWk+Pg==
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
	Daniel Machon <daniel.machon@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/9] Support external snapshots on dwmac1000
Date: Tue, 12 Nov 2024 18:06:48 +0100
Message-ID: <20241112170658.2388529-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_090705_582582_6A5B3A38 
X-CRM114-Status: GOOD (  11.23  )
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

This is v4 on the series to support external snapshots on dwmac1000.

The main change since v3 is the move of the fifo flush wait in the
ptp_clock_info enable() function within the mutex that protects the ptp
registers. Thanks Jakub and Paolo for spotting this.

This series also aggregates Daniel's reviews, except for the patch 4
which was modified since then.

This series is another take on the previous work [1] done by
Alexis Lothoré, that fixes the support for external snapshots
timestamping in GMAC3-based devices.

Details on why this is needed are mentionned on the cover [2] from V1.

[1]: https://lore.kernel.org/netdev/20230616100409.164583-1-alexis.lothore@bootlin.com/
[2]: https://lore.kernel.org/netdev/20241029115419.1160201-1-maxime.chevallier@bootlin.com/

Thanks Alexis for laying the groundwork for this,

Best regards,

Maxime

Link to V1: https://lore.kernel.org/netdev/20241029115419.1160201-1-maxime.chevallier@bootlin.com/
Link to V2: https://lore.kernel.org/netdev/20241104170251.2202270-1-maxime.chevallier@bootlin.com/
Link to V3: https://lore.kernel.org/netdev/20241106090331.56519-1-maxime.chevallier@bootlin.com/

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


