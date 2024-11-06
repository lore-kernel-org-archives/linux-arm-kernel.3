Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64424D59F6B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xXjVVc+jswJ+TJ2Ul4aVJA2kKfUu0Os/nvZqGYySduY=; b=tkS5wjmVEHk6AG
	EVnZrqV/v7QGbbPJxaIWXnTdOI+rmTQqgxslHjyyVUKvurZpKSWGElNKWHrLBHR32wXgYW/IC6Z3q
	l/a6Jm9sT25zL2WIV4Mi+jfaMX4OYIIdOK7ZZIZrSvKM5Fv15Gz9IoT9eyC3Wm6ofpH9GerC8JhRH
	JOqVlGiJehf2s8Wkb68GngQg8TRmPiCxft8byErgRwl/VRnnTfPtN8WtchbfO1fcKudj0J6DbLAoJ
	vS+od68/okqcBCeWmLi4ljr7PQDWTNT5WmDHvAoYqFgLreyvByyymB38EEkkddHaGseSPxodNshn+
	zEteadIR05zGMp6l7y9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lYc-00000004Tf8-385N;
	Wed, 06 Nov 2024 19:19:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lWr-00000004TDP-2iuv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:17:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730920641; x=1762456641;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=SiQEeSRkNADgB7z1FpkMKnsPf6At/dTxDrBLVodmNgk=;
  b=X4vPSAQ59/8GCAwwbH49OxzEjLWcW4n1efNBwk74R/oQYHGSYzez+7XG
   i7lypQj2AKmjP1+jD89/UPgKQIbQmTp2V0EstXg9q01fuNE0w8RV7MKa3
   49wJaYRPbK1mGrYTEJsT/JQZoaaQ3B1yI4pcyX9EkMDi7mih77JcDXJ9H
   pMfa7ondS2vw171lVT4Eb8Iy83JZE1Y1WvHkwST/LpgeBOtlDkQqMIM0o
   FCU5uD1isYd7Ot2EQItwAyCBhfPXxETKOmDudV0zZaQt3RS+0Vrkj4b6S
   CWkbHuiECl/1YPdy8HcZyW/N7H00yOqEum6KemCPfJxeJD0Y/RZbhGnkb
   A==;
X-CSE-ConnectionGUID: Pj5H9ORUSlaljgmVr541Mw==
X-CSE-MsgGUID: FNMV5KrAQpmxk4FeLuDC3w==
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="34481046"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Nov 2024 12:17:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Nov 2024 12:17:03 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Nov 2024 12:17:00 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next 0/7] net: lan969x: add RGMII support
Date: Wed, 6 Nov 2024 20:16:38 +0100
Message-ID: <20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJbAK2cC/x2N0QrCMAwAf2Xk2UBXOt38FdlDtkYb0DjSMQtj/
 2718Ti42yGzCWe4NjsYb5LlrRXaUwNzIn0wSqwM3vnQti5gXshKh0/S4TwUzB9Z54TRZGPDgLE
 bpkvvXeg7ghpZjO9S/oMbKK+oXFYYq5koM05GOqff4EWicBxf+ExRcJEAAAA=
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_111721_808066_584CA7E9 
X-CRM114-Status: GOOD (  13.05  )
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

== Description:

This series is the fourth of a multi-part series, that prepares and adds
support for the new lan969x switch driver.

The upstreaming efforts is split into multiple series (might change a
bit as we go along):

        1) Prepare the Sparx5 driver for lan969x (merged)

        2) Add support for lan969x (same basic features as Sparx5
           provides excl. FDMA and VCAP, merged).

        3) Add lan969x VCAP functionality (merged).

    --> 4) Add RGMII support.

        5) Add FDMA support.

== RGMII support:

The lan969x switch device includes two RGMII interfaces (port 28 and 29)
supporting data speeds of 1 Gbps, 100 Mbps and 10 Mbps.

Details are in the commit description of the patches.

== Patch breakdown:

Patch #1 does some preparation work.

Patch #2 adds new function: is_port_rgmii() to the match data ops.

Patch #3 uses the is_port_rgmii() in a number of places.

Patch #4 uses the phy_interface_mode_is_rgmii() in a number of places.

Patch #5 adds checks for RGMII PHY modes in sparx5_verify_speeds().

Patch #6 adds registers required to configure RGMII.

Patch #7 adds RGMII configuration function and uses it.

To: UNGLinuxDriver@microchip.com
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Lars Povlsen <lars.povlsen@microchip.com>
To: Steen Hegelund <Steen.Hegelund@microchip.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Russell King <linux@armlinux.org.uk>
To: jacob.e.keller@intel.com
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Daniel Machon (7):
      net: sparx5: do some preparation work
      net: sparx5: add function for RGMII port check
      net: sparx5: use is_port_rgmii() throughout
      net: sparx5: use phy_interface_mode_is_rgmii()
      net: sparx5: verify RGMII speeds
      net: lan969x: add RGMII registers
      net: lan969x: add function for configuring RGMII port devices

 drivers/net/ethernet/microchip/lan969x/lan969x.c   | 109 ++++++++++++++++
 drivers/net/ethernet/microchip/lan969x/lan969x.h   |   5 +
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  29 +++--
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |   6 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 145 +++++++++++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_phylink.c |   3 +
 .../net/ethernet/microchip/sparx5/sparx5_port.c    |  57 ++++----
 .../net/ethernet/microchip/sparx5/sparx5_port.h    |   5 +
 8 files changed, 329 insertions(+), 30 deletions(-)
---
base-commit: 157a4881225bd0af5444aab9510e7b6da28f2469
change-id: 20241104-sparx5-lan969x-switch-driver-4-d59b7820485a

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


