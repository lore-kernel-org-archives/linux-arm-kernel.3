Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82F6E9A744
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XijWvmr2G4/VSAMzAQPTLjRdqgm3qgu6QZB5IohDwQI=; b=NOreylcT7ScP2bhwSBEhxbL377
	RFgS01dPqw+YzdQW3a0gKORE7p1zi1U68Txjg3DKAw5CvbYmPVKMUa/37MSphO4I8CYWZRl+4F91o
	BOr5r0HRfURciQUwXlErXLYzKMgiJzMyr5C9o9dnQb692sJ2Z6E+LRRgWQt6imIgGRm4g6qL/Lh79
	kWvqd8t/MYbV2agh6DpDssRVK1an6AF4/ovgDCB8Sk8XB3KEgBcbkHPwXXGDAQMtw1OLn4AJxRoZa
	UxohljoL0+zh8kyweep804HnC4Efv/nBy50DW6A8JHiZfVQFzEhv8Wpy43bN0EB/N65zjVwU7vYAZ
	MDmjT4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xx6-0000000154S-2kBF;
	Tue, 24 Mar 2026 09:21:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xx3-0000000152i-2pmG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:21:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D64BE4E427C5;
	Tue, 24 Mar 2026 09:21:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9439C6011D;
	Tue, 24 Mar 2026 09:21:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BED0610450A18;
	Tue, 24 Mar 2026 10:21:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774344079; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=XijWvmr2G4/VSAMzAQPTLjRdqgm3qgu6QZB5IohDwQI=;
	b=VzyXjdRBB14XeFJ4BD1hGxlYC8ZBdMbt1OFR4Bu4zRp8XrdeeoLebzetzQJZQLdvaOVhWZ
	g0ZsM4r+0lrk8kIRI3iMaeupBBI/e3dRgx2xtmJDuyAcEZWab7WL9ElWCD+qaUGhsn5Wlx
	m30E8TpAYU2cThJhur+u9TUedmFddFoQ7P0Oz5IlqKCQGXvbOh6sq6n2hLJzutVswiZ/QU
	OUoo14Rab1A7/f+3n05Ik0uDOWcfHRQ2dKz79OOl9jRgUYqRSh/ZjOvsW0bTEXWAJObG/S
	WNGWRQ/ml+L+ZMHQktcmrcPkGTopJrERcrRQ5biLv5jP6zlEUSwbvPWNwHej1A==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Mun Yew Tham <mun.yew.tham@altera.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 0/5] net: stmmac: dwmac-socfpga: Cleanup .fix_mac_speed
Date: Tue, 24 Mar 2026 10:20:55 +0100
Message-ID: <20260324092102.687082-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_022129_972263_F7145A55 
X-CRM114-Status: UNSURE (   7.52  )
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

Hi everyone,

This small series does a bit of cleanup in the dwmad-socfpga glue
driver, especially around the .fix_mac_speed() operation.

It's mostly about re-using existing helpers from the glue driver, as
well as reorganizing the code to make the local private structures a
little bit smaller.

No functionnal changes are intended, this was tested on cyclone V.

Maxime Chevallier (5):
  net: stmmac: dwmac-socfpga: Move internal helpers
  net: stmmac: dwmac-socfpga: Use the socfpga_sgmii_config() helper
  net: stmmac: dwmac-socfpga: Use the correct type for interface modes
  net: stmmac: dwmac-socfpga: get the phy_mode with the dedicated helper
  net: stmmac: dwmac-sofcpga: Drop the struct device reference

 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 58 +++++++++----------
 1 file changed, 28 insertions(+), 30 deletions(-)

-- 
2.49.0


