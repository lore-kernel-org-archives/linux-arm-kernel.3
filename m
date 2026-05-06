Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C63CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 07:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WTTC4eWS6xsX1WabsoEMcJQB6BgPKpGPc6CsKIqvis8=; b=2QjQfcorF3T4fv
	C7sbubTUsB1lUSphqDWbgvHshK9H/3GJvlFyBxVMoLLDO0GH4V2CSndKlfl4+XS9PmvaLzU0GF9xg
	1vgNVXDtJCXcKnk2vUJtSyBfPeoJGxu7VhKidReL+VtlewtjFVcjrHvlNGalNQP4ycG66R8GvpluF
	uKF6NJwyxpAro9tIOQpQObT3tFtVrZGZoBgRIAMQQ+0TwafLBc9BIsGUR5G5IMb58ZT9MAiAYhQap
	pYeOOBBmdNhquLjmHq8QtWPhTe33pxGHfX7tgeesy8KN0hluIffk0RxJAYdjbhjGVNQyo6mGOI95W
	MVk4TjdNz4wvpZoSUxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWe5-000000001DL-1PsB;
	Wed, 06 May 2026 07:26:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWe2-000000001Ci-2Xfl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 07:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778052370; x=1809588370;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=FUgqcwlqHZvuXQFkTp2cH0PZJLSFbwKOjopx/wLUl0s=;
  b=NtNMlU2sinpy01vl6J/BDjN+bI3XtgLdy8e9KE8FVTF7kfEUHkQUrnAz
   6GF4pkSXrK3lZOT6FCHyEEWeNzRyDSK6tfKNFHewzhJF03J5tRtiBNSJd
   aK4FBzmdisCqjesacRm+WQCSp9QtokKv6PGSZAKdqRfseuSmZYjeRACOw
   xxE208E8o6D4oruIzkf9TdbEJWguLaSX/Q8zQUYN2FIDMVn+esPFRp+Hn
   S5OcNG293O5ylpndOs2t7xh/FhJusL0Z2oxS/lax0EkkOm1+PbpxQbmno
   aX4+rZgjeu7GN2BkyxQr6r11khfi8jA4QvFnRO0YdCjpYDiVDUhcqNsOK
   g==;
X-CSE-ConnectionGUID: mdJjxWYtRtGSZSmgn51qzA==
X-CSE-MsgGUID: wDek4DCXQ9qsBUc39xrVEQ==
X-IronPort-AV: E=Sophos;i="6.23,219,1770620400"; 
   d="scan'208";a="57515437"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 00:26:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Wed, 6 May 2026 00:26:08 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 6 May 2026 00:26:04 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net v2 0/4] net: sparx5: misc fixes for sparx5 and lan969x
Date: Wed, 6 May 2026 09:25:35 +0200
Message-ID: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO/s+mkC/31OSw6DIBC9ipl1p0EUrF31Ho0LpFgnqUAYY2yMd
 y/hAF2+/zuAXSLHcK8OSG4jpuAzkJcK7Gz82yG9MgYppBatvOFCbHGi3TFyNGlX+DG+1/2Oo5W
 9ro3qxDRCzsfkii/Hn+DdCkMmZ+I1pG/Z2+oilWol2j/VW40CdT7QCD2qrm0eC9kU7EzxasMCw
 3meP+2h4lPLAAAA
X-Change-ID: 20260428-misc-fixes-sparx5-lan969x-bc2961a570fb
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
	<bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, <kees@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <linux-rt-devel@lists.linux.dev>, Andrew Lunn
	<andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_002611_818364_0A27F4F8 
X-CRM114-Status: UNSURE (   9.06  )
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
Changes in v2:
- Rework patch #2 to use ndo_set_rx_mode_async (Jakub)
- Link to v1: https://lore.kernel.org/r/20260504-misc-fixes-sparx5-lan969x-v1-0-6604306b5743@microchip.com

---
Daniel Machon (4):
      net: sparx5: defer VCAP debugfs creation until after netdev registration
      net: sparx5: fix sleep in atomic context in MAC table access
      net: sparx5: fix wrong chip ids for TSN SKUs
      net: sparx5: configure serdes for 1000BASE-X in sparx5_port_init()

 drivers/net/ethernet/microchip/sparx5/Makefile     |  3 ++-
 .../net/ethernet/microchip/sparx5/sparx5_debugfs.c | 26 ++++++++++++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  4 ++--
 .../net/ethernet/microchip/sparx5/sparx5_main.h    | 17 +++++++++-----
 .../net/ethernet/microchip/sparx5/sparx5_netdev.c  |  8 ++++---
 .../net/ethernet/microchip/sparx5/sparx5_port.c    |  3 ++-
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c   |  6 -----
 7 files changed, 49 insertions(+), 18 deletions(-)
---
base-commit: 98878ed91b68a3150126fccef125ee7b1bb86ab2
change-id: 20260428-misc-fixes-sparx5-lan969x-bc2961a570fb

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


