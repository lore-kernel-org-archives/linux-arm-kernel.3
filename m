Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47D560A2613
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vbN6isde;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=S4SStrx/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=26Ew83+7Mi3ZWEYZMN+jfH4zJjxT0j2F/U0mB+W/3K4=; b=vbN6isdeIH1SslXPq7ZiOwrndy
	6cjliRYP2ndOrEj+7mm/fln1XiDS7lEooqk10Yc6adI2MuefzS7gWFbDl2BqxHq6EURSvDp98LcLs
	XL0AWBYag5Pvs0l63OGy9Nx39yJkCMDFabdI0rynRmlprrEP0tBqDApvRTLuLuFCeVL0fACAAFiF9
	ALzm2x0th1Jv7mc/h0ObqwhAYG5+VPTkkSmSzHnLLKM7NUcJqywgkA/hW8UqRSMrYcvyzCEuAqTC8
	NEtbZKUz1nCd0X7iwYBBmddceAvnUzn6hh9b7+U2UcPo7DmeRy1KHv+OxpYZDKh4Dh9RMJNs11D9S
	U0LLct6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2i-0000000GSUD-0cDC;
	Mon, 02 Nov 2026 12:21:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2a-0000000GSPi-3at3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793622092; x=1825158092;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=WC3JV8Hpsc3JuumgJF2EtoGz1qp8MrT/ss4vVUWAba8=;
  b=S4SStrx/AOR1iIxMk0fMu0MrjhELEOsipuQjo1KLoUk/M3yHP2dgknnP
   RBkc+d+8YpDX+VORQq8fRwK5qtjbmhrSYPN2IPZpsQw9IPxJwF5Pn6eeu
   LgPatl81NGhBEIqryFYxAKHg7K+Lsr+e5n3IAcxkuY+GnXMSlphfxA5t1
   A7DlgTmiPWHMw8HdZVl+gufix6wDAegxQedy63+R52vp8qvkliUVj2w+Q
   jyhJvl6v20aukJjrhLSZTwL+26HDrsNsdIxRdCT/a9VXO5aPY2cZuxbZM
   N1v5zfeTrpxnEAY1+q5NG6s9NMsqIoIk+ptTlkkLQNqtffGLapdjwdBxh
   A==;
X-CSE-ConnectionGUID: kCVTsL9wSd+CRTjxzCZkwg==
X-CSE-MsgGUID: V3Q7uwtKTvSiBD14TgXmaA==
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="232950948"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2026 05:21:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 2 Nov 2026 05:21:31 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Nov 2026 05:21:29 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next v2 0/5] net: sparx5: add tc matchall port policer
 offload
Date: Mon, 2 Nov 2026 13:21:23 +0100
Message-ID: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-0-3bd47ec1b227@microchip.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEOA6GoC/5WOQQqDMBREryJ/3V+SVGPTVe9RXKTxWz9oIomIR
 bx7U3uCbgZmBubNBokiU4JbsUGkhRMHn406FeB661+E3GYPSigtzEXgs8TBeqP1ipNj7NrRYpp
 sXKtfbnIe4pxlYEcxYVmXWoq60qQ05NkpUsfrgXyApxk9rTM0uek5zSG+jy+LPPovVgph/scuE
 gWWRupaXG1NVt1HdjG4nqezCyM0+75/AMItLvf+AAAA
X-Change-ID: 20260930-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-474610756e26
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <robert.marko@sartura.hr>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_042133_172594_C9ED584F 
X-CRM114-Status: GOOD (  13.75  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds offload of tc matchall filters with a police action to
the ingress port policers of Sparx5 and lan969x, which are both served
by the sparx5 driver.

In hardware, each ingress port has four single-rate leaky bucket
policers. A policer drops the frames that exceed its rate and burst.
The four policers of a port share the pass and drop statistics counters
of the port.

The driver uses one policer per port, because with more than one, the
statistics reported to tc could not be attributed to the right policer.
This matches lan966x and ocelot. The policer meters each frame without
preamble and inter-frame gap, so the configured rate is a data rate, as
tc police expects and as on lan966x and ocelot.

Since the policer meters all ingress frames on the port, only filters on
chain 0 with protocol all are offloaded, and filters on shared blocks
are rejected. A police action that is already offloaded as a port
policer on another port is rejected too, since in software it is a
single bucket for all of its users. Only drop is supported as the exceed
action, and the police overhead parameter is not supported.

Patch #1 drops a redundant prefix from the existing POL_UPD_INT_CFG
register macros.

Patch #2 adds the registers used by the port policer.

Patch #3 tracks whether the ingress block of a port is shared, and adds
the per-port policer state.

Patch #4 adds the hardware programming of the port policer.

Patch #5 adds the tc matchall offload.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v2:
- Patch #4: meter the data rate, not the line rate, by setting the gap
  to 0 instead of 20 bytes. Fix the commit message, which wrongly said
  that lan966x and ocelot meter the line rate.
- Patch #4: take queue_stats_lock around the existing ethtool read of
  port stat counter 0, since reading the LSB latches the MSB.
- Patch #4: correct the comment on the traffic type mask.
- Patch #4: reject a packets-per-second police as unsupported before
  checking for a missing byte rate, so the right message is reported.
- Patch #5: reject a police action that is already offloaded as a port
  policer on another port.
- Link to v1: https://lore.kernel.org/r/20261009-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v1-0-4916708a7ea2@microchip.com

---
Daniel Machon (5):
      net: sparx5: Drop redundant POL_ prefix from POL_UPD_INT_CFG
      net: sparx5: Add registers used by the port policer
      net: sparx5: Track shared tc blocks and per-port policer state
      net: sparx5: Add hardware programming for the port policer
      net: sparx5: Offload tc port policers via matchall

 .../microchip/sparx5/lan969x/lan969x_regs.c        |   7 +
 .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |   6 +
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |   6 +-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  39 +-
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 117 +++++-
 .../net/ethernet/microchip/sparx5/sparx5_police.c  | 431 ++++++++++++++++++++-
 drivers/net/ethernet/microchip/sparx5/sparx5_qos.c |   4 +
 .../net/ethernet/microchip/sparx5/sparx5_regs.c    |   7 +
 .../net/ethernet/microchip/sparx5/sparx5_regs.h    |   7 +
 drivers/net/ethernet/microchip/sparx5/sparx5_tc.c  |  14 +-
 .../ethernet/microchip/sparx5/sparx5_tc_matchall.c |  39 ++
 11 files changed, 663 insertions(+), 14 deletions(-)
---
base-commit: 4dd16e31135ea8437a720222df34e8745f385d6d
change-id: 20260930-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-474610756e26

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


