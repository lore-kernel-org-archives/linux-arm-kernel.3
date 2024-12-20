Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09309E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wdn6rbk7rzZtvv1/l/o0E6P2u4ToMIAY8bEOIqLk540=; b=UmaDa4NPsAoImW
	Xj5iTDAC+I1v8DPXq/V08v2dAHRBA4pW+/zjCeP3Uzq8czEmqwkG4O4D4ri21ZCYUTTFL05TusU7A
	1KPxkXiEXYGyCPYzR7DnxvuoN2igEGYIqXz3v3R0ubh2Cp1/FUVP2MGcfE1totBEDMpTUR+jVLVYs
	WxY2F2puEtcNHAH0j3iv2wPo788sIYNPs7+I1LD/KoOnzZISOcHXBrTP1m9csydL0beTTMWRR9vPD
	rF6OOBKKkKatbAWDxoMIrFrA+tMpWuZhHJmVMkCVrYW2If/nS2BMdKb0Hq1ZFk45LpQoldmN7Rg4G
	8YnfMXTG3kMn6L0RxNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdPY-000000053NC-3gjw;
	Fri, 20 Dec 2024 13:51:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdNQ-000000052x3-3PDz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:49:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734702552; x=1766238552;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=DJqB9T4Cn7pUwzkT4atNAK0XjNt3zrURlaVQr6egu7k=;
  b=h5hppxucwbcMLwhYR86X3+XGCohv8qxRCQJo5i4+FTlWaZONc1z7CLDz
   ri8kMfggCzObjVHhKypxSKzUoYFl7JLTAt26oB9WNefJXhQ5gRLfIoEwj
   0Fg6y0Rth/JwqhsiyjWoFPPlB8/zWuUfCepZ1F/rJKAWq5ZS6pIK2rp4F
   jQrq1GHW56oLuYzOhrjeKxFLN+zyIQeN42tvoQNlzsUdjSjfXxmwMWFNp
   d4/fireTVybIkjQAetnuMim4kdvmq849PFWGkPBDhWX8dUfiayiXX9uXi
   cEpqzyGb8XiHkdYQonqIqIdyewdB8+RqsdKTTZT6YtpOXeyismF9jFSco
   w==;
X-CSE-ConnectionGUID: RUDE3qXGTIK0i20iY0tGeQ==
X-CSE-MsgGUID: Sm0QUGH2T/u486dHcQ0zCA==
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="39551349"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 06:49:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 06:48:51 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 06:48:47 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next v5 0/9] net: lan969x: add RGMII support
Date: Fri, 20 Dec 2024 14:48:39 +0100
Message-ID: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALd1ZWcC/43OzWrDMAzA8VcpPk/DX4njnvYeowfHVhbB4gQ7p
 Bkl7z43DFZGITsKod9fN5YxEWZ2Pt1YwoUyjbEM1cuJ+d7FDwQKZWaSSy0E15Anl9YKPl20tV0
 hX2n2PYRECybQECrbmkZy3VSOFWRK2NG6B95ZxBkirjO7lE3rMkKbXPT9PTA4iveDnvI8pq/9o
 UXsZz/t+qi9CODQmc4oUWtVt+FtIJ9G39P06sdhry7ygRTqkJSF5KG1jfPc1kE8I9Uj2RySqpD
 KY4dYoUHlnpH6l5T/+FIXMghnpLdeG6H/ktu2fQNuTbE+6gEAAA==
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<robert.marko@sartura.hr>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_054912_867278_54F8E371 
X-CRM114-Status: GOOD (  20.42  )
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

The lan969x switch device includes two RGMII port interfaces (port 28
and 29) supporting data speeds of 1 Gbps, 100 Mbps and 10 Mbps.

== Patch breakdown:

Patch #1 does some preparation work.

Patch #2 adds new function: is_port_rgmii() to the match data ops.

Patch #3 uses the is_port_rgmii() in a number of places.

Patch #4 makes sure that we do not configure an RGMII device as a
         low-speed device, when doing a port config.

Patch #5 makes sure we only return the PCS if the port mode requires
         it.

Patch #6 adds checks for RGMII PHY modes in sparx5_verify_speeds().

Patch #7 adds registers required to configure RGMII.

Patch #8 adds RGMII implementation.

Patch #9 documents RGMII delays in the dt-bindings.

Details are in the commit description of the individual patches

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
To: robh@kernel.org
To: krzk+dt@kernel.org
To: conor+dt@kernel.org
Cc: devicetree@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: robert.marko@sartura.hr

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v5:

- Updated tags received on the list. No other changes to commits. Patch
  6/9 from v4 is kept, since it is required in order for RGMII port
  config to not fail. The cleanup of the sparx5_port_verify_speed()
  function will be deferred to another series (see comments on patch 6/9
  from previous version).

- Link to v4:
  https://lore.kernel.org/r/20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com

Changes in v4:

- Split patch #4 in v3 into two patches, where the new patch #5 handles
  PCS selection, by returning the PCS only for ports that require it.

- Got rid of the '|' symbol for {rx,tx}-internal-delay-ps property
  description in the dt-bindings (patch #9).

- Link to v3: https://lore.kernel.org/r/20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com

Changes in v3:

v2 was kindly tested by Robert Marko. Not carrying the tag to v3 since
we have changes to the handling of the delays.

- Modified lan969x_rgmii_delay_config() to not apply any MAC delay when
  the {rx,tx}-internal-delay-ps properties are missing or set to 0
  (patch #7).

- Removed 'required' constraint from {rx-tx}-internal-delay-ps
  properties. Also added description and default value (Patch #8).

- Link to v2: https://lore.kernel.org/r/20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com

Changes in v2:

  Most changes are in patch #7. RGMII implementation has been moved to
  it's own file lan969x_rgmii.c.

  Details:

    - Use ETH_P_8021Q and ETH_P_8021AD instead of the Sparx5 provided
      equivalents (patch #7).
    - Configure MAC delays through "{rx,tx}-internal-delay-ps"
      properties (patch #7).
    - Add selectors for all the phase shifts that the hardware supports
      (instead of only 2.0 ns, patch #7).
    - Add selectors for all the port speeds (instead of only 1000 mbps.)
    - Document RGMII delays in dt-bindings.

  - Link to v1: https://lore.kernel.org/r/20241106-sparx5-lan969x-switch-driver-4-v1-0-f7f7316436bd@microchip.com

---
Daniel Machon (9):
      net: sparx5: do some preparation work
      net: sparx5: add function for RGMII port check
      net: sparx5: use is_port_rgmii() throughout
      net: sparx5: skip low-speed configuration when port is RGMII
      net: sparx5: only return PCS for modes that require it
      net: sparx5: verify RGMII speeds
      net: lan969x: add RGMII registers
      net: lan969x: add RGMII implementation
      dt-bindings: net: sparx5: document RGMII delays

 .../bindings/net/microchip,sparx5-switch.yaml      |  18 ++
 drivers/net/ethernet/microchip/sparx5/Makefile     |   3 +-
 .../ethernet/microchip/sparx5/lan969x/lan969x.c    |   5 +
 .../ethernet/microchip/sparx5/lan969x/lan969x.h    |  10 +
 .../microchip/sparx5/lan969x/lan969x_rgmii.c       | 224 +++++++++++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  29 ++-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |   3 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 145 +++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_phylink.c |  14 +-
 .../net/ethernet/microchip/sparx5/sparx5_port.c    |  57 ++++--
 .../net/ethernet/microchip/sparx5/sparx5_port.h    |   5 +
 11 files changed, 484 insertions(+), 29 deletions(-)
---
base-commit: b73e56f16250c6124f8975636f1844472f6fd450
change-id: 20241104-sparx5-lan969x-switch-driver-4-d59b7820485a

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


