Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8466D29FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 09:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=weAShtrkUjDQdfMxGlmfAtR3B6mS0OXtPZsSWC+b/z4=; b=GuQqRSWa9fUGRnox48XoQrdpXf
	nXjAS/JGO5xN0/PolWC0yRpJGX2LMHR5QNmn7RedwTG7m7MyXqUOPq6vSxhTzaKQ+RwjhyHIhrab7
	oWnshLnYSH7ywo5N5A6Z0q6/dcRN/11/6Xitk/nqQqTdAdvUiMFftwWj9gH0SbyOGkLurvHda7Ntz
	9fP3YSoKpeeBPo8RV0dGglFoiXVh0zXafkXnBSa99MimNYQz5O5pK1VvjidMgkJXIt6w5KvXVkl7N
	+XNFx1Vud/s3c7XO0Dulh4UVnytg3RGtKiEZer9vGHrwB7RsJqWmrj1xY5dnzjXsNCASj8kIDl4d4
	AqO4ZKBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8c5j-00000002Rlz-3SCm;
	Wed, 06 Nov 2024 09:12:43 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8bww-00000002ORt-1n6p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 09:03:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79A17C000A;
	Wed,  6 Nov 2024 09:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730883815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=weAShtrkUjDQdfMxGlmfAtR3B6mS0OXtPZsSWC+b/z4=;
	b=ldkTn1WoOO9SvTFEUWcjuPQCtXxvyw7jTELOwmzgwIdIz66jwYiqHFVPL2tex2nHynBJUk
	nufYR2gX8SJ5mL0WfDURhYbIRWUCCW0u28jEUZ7pwoJ0G3Rb7E63oS8k0uxz3H3vqiNEgE
	uxzE9lkzJ1LvoiZNlqqTmBtD99o6T/5TtXKBeS+Y2fe9hc+CAbkJccXVkKxQl+QO6ecdn5
	lW6wEUVnxZyvC98yDVn9/WuwHn/puJxD23ikNPCN99dlfmGWuDxK/mLcpmAa3Y07Szl09v
	idOND9U472puCw6guVr0XxQcvbu6zloJqyxqTTujTlvv3ECNw8eXY6QEzt4lQg==
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
Subject: [PATCH net-next v3 0/9] Support external snapshots on dwmac1000
Date: Wed,  6 Nov 2024 10:03:21 +0100
Message-ID: <20241106090331.56519-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_010338_787001_58B75618 
X-CRM114-Status: GOOD (  11.47  )
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

This V3 is just a rebase a V2 on top of net-next to address some minor
conflicts. No changes were made.

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
Link to V2: https://lore.kernel.org/netdev/20241104170251.2202270-1-maxime.chevallier@bootlin.com/

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


