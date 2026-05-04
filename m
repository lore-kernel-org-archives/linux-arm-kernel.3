Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51BEFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 14:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RrnICKT8rEnvehTSYYarumEuj0dYFUG45az0He8+yjM=; b=0JYXf0107Z6ZT4
	XXP8ZQavA8BSfgCpZKPetb0Z1aD3Rt0aa5cKH8BOvomK3Gzjii1YsABM6tqWikRgbRFoJNqJQmATV
	bqT6FtrAsoxrI4wtcR9wRSiGSTVitigU6ozdMbi6j1q0rMLsV8dN+DCnYRqyvkY7KiHdzzLMPONdx
	OBmpEb8qxKdV4qg3WZb6zMB43n1c0s2UtgiKjYcO1sBzNRJo6vFJ9/WZ8aHaYbH/+YOUx9XcGQoUn
	LWPgHDq2GpPFP7Rz8EnAEEj5S8GCHc0161nnHvBRJE30hhXHk/Eka4W6Wu2UQEsGGH1lKtjnJ5XMz
	iUgsnpOQ2AJz+4wReb8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuWf-0000000DUMi-0sLd;
	Mon, 04 May 2026 14:44:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJuWc-0000000DUM3-28Pk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 14:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1777905839; x=1809441839;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=B+3rQXr1c2ofu+6dPdrlrqmBajJw+3mDKksw7VUmPAE=;
  b=mzVlF+YhFG43GrbpaQDxdYZnW9IqgQKWcOnzZMAu5H2qhNu+yvfDNklo
   IbrhLp7Z7OKxZYneGRgr0T+zFDeKGc+R0cpkjvtWNCx1eEYDBEdNbUbbd
   CuVPrfTJm/qilj2kA3AoUDKtQDLjeicbTvBNSsWEND3F3afUd0AK5WGBO
   b1v/r8RnzcYU2BxQivyrKkmnIJv6ewPpP2J2aztd6t6KSgfWHhEYBddfx
   weOQHb5RTyHpDQml5Ef/EtbMq0CJc9rSLXsCCWnnVPve5kd8dp/80sh8Z
   hyV+7DNp8sE7NE8su31KfayCt4VXr7dbwDEve9PvonfF8OuQGP/Qz0Au4
   A==;
X-CSE-ConnectionGUID: 8/7Yu0V2ShWirtJf/0Cq8w==
X-CSE-MsgGUID: dWSrV0FGR5u3iTC6/vjMmw==
X-IronPort-AV: E=Sophos;i="6.23,215,1770620400"; 
   d="scan'208";a="288370922"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 07:43:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 4 May 2026 07:43:57 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 4 May 2026 07:43:53 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net 0/4] net: sparx5: misc fixes for sparx5 and lan969x
Date: Mon, 4 May 2026 16:43:41 +0200
Message-ID: <20260504-misc-fixes-sparx5-lan969x-v1-0-6604306b5743@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ2w+GkC/x3LQQqEMAxA0atI1hOoRav1KoOLWqMGtEojUhDvb
 nH54P8bhCKTQFfcEOli4T1klL8C/OLCTMhjNmiljap0ixuLx4kTCcrhYqpxdcEam3Dw2prS1Y2
 aBsj/Eenr8v6HQCf0z/MCs//EO3AAAAA=
X-Change-ID: 20260428-misc-fixes-sparx5-lan969x-bc2961a570fb
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
	<bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <linux-rt-devel@lists.linux.dev>, Andrew Lunn
	<andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_074359_091841_3A76C84F 
X-CRM114-Status: UNSURE (   8.23  )
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

This series fixes various issues in the sparx5 driver, which also
serves lan969x.

Details are in the individual commit descriptions.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Daniel Machon (4):
      net: sparx5: defer VCAP debugfs creation until after netdev registration
      net: sparx5: fix sleep in atomic context in MAC table access
      net: sparx5: fix wrong chip ids for TSN SKUs
      net: sparx5: configure serdes for 1000BASE-X in sparx5_port_init()

 drivers/net/ethernet/microchip/sparx5/Makefile     |  3 ++-
 .../net/ethernet/microchip/sparx5/sparx5_debugfs.c | 26 ++++++++++++++++++++++
 .../ethernet/microchip/sparx5/sparx5_mactable.c    | 24 ++++++++++----------
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  4 ++--
 .../net/ethernet/microchip/sparx5/sparx5_main.h    | 19 +++++++++++-----
 .../net/ethernet/microchip/sparx5/sparx5_port.c    |  3 ++-
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c   |  6 -----
 7 files changed, 57 insertions(+), 28 deletions(-)
---
base-commit: 98878ed91b68a3150126fccef125ee7b1bb86ab2
change-id: 20260428-misc-fixes-sparx5-lan969x-bc2961a570fb

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


