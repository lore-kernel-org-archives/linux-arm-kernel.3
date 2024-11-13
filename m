Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEBCD637C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 21:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3lmaaODNIXsTr52RCRU7yzw6chQFj9dQ/DDjKAa6qB8=; b=GaHa655c+k7wdm
	mkJbmN4aXzQAS50sjALF5K3LtcEKPOoGJdQKnI1g/c/GRf+S0iyZ0AvKhBXqsbRRbGjtD9Mer3mew
	0fvDdTF+Y429KO1CVi8w0T2bqRzFCyWZbEL4uNN+TwvCSCKFBWwv3XCyGa0T6B+bzoeVEdLRtv9nM
	Pe0FsZr47P3kaCot468NmG++6xPt4If3czK9g5xo/Nda41NEvIhLBhUdaEJ8lUXJng3sx8lSs6rZI
	N4rT532Mlai+JoiUKMGtBhQmwc6xUr+XsRcfiYLfdSYl8gDOIGebUrkiB0Q+9V/8HyCN5RGsSAc+2
	T93AIzoq5+XpY9yS0ldA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKhz-00000008310-1H3F;
	Wed, 13 Nov 2024 21:15:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKeo-000000082Iq-3uXQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 21:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731532331; x=1763068331;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=MiOA+h2WEfYvSK6LWO85YbpCELWFRGGFH0WIAFxXeZc=;
  b=tU0TA3CrwbKFFGHhqLMX2E1CZmWJuWUJb7nife/awnyq77ZLCykm4+6e
   mU66VfdTRiviyemU1XHWKEGKI07RE0rOwiB4BDg2xf/D5YGVdLVwFbnFj
   OmN3rWy+dhmqEmrjQqoLNSl9/SjbMeXdTj10YD20VdwhdhTnW8Oi+DovW
   VzsBbJjd77kaoLdzwvQE+onMgLACgxQdK5qCXjNNKEmQ1f9QkIa7w+1eu
   +aQwEQZ221PvjPPz3COtaKe0tUDQTJH4PuyfLOwDOEfD+yWoYQ6FNa+ui
   K5iSnJn7tTOpgIhNCTRI7JYUyKa0zvi2HaBcfwAXO7Q/+HCN5R42HJquq
   Q==;
X-CSE-ConnectionGUID: KA3skogJTWSLY1V4ky2YAQ==
X-CSE-MsgGUID: iVpW/84nSha1vD/zEH2PYA==
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="265427892"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Nov 2024 14:12:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 13 Nov 2024 14:11:34 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 13 Nov 2024 14:11:31 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next v2 0/8] net: lan969x: add RGMII support
Date: Wed, 13 Nov 2024 22:11:08 +0100
Message-ID: <20241113-sparx5-lan969x-switch-driver-4-v2-0-0db98ac096d1@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOwVNWcC/4WOzQqDMBCEX0X23C1G419PfY/iIca1WahRNmIt4
 rtXpfceh+Gbb1YIJEwBbtEKQjMHHvwekksE1hn/JOR2z5DEiVYq1hhGI0uGL+OrvFowvHmyDlv
 hmQQ1tlnVFGUS6zIzsI+MQh0vp+ABnib0tExQ701jAmEjxlt3CHrD/gAch2mQz3loVif2c+f/3
 LPCGLuiK1KV6zRv2nvPVgbreLzaoYd627YvYI63bfEAAAA=
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_131211_145448_F9B9DD56 
X-CRM114-Status: GOOD (  15.29  )
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

Patch #7 adds RGMII implementation.

Patch #8 document RGMII delays.

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

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
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
Daniel Machon (8):
      net: sparx5: do some preparation work
      net: sparx5: add function for RGMII port check
      net: sparx5: use is_port_rgmii() throughout
      net: sparx5: use phy_interface_mode_is_rgmii()
      net: sparx5: verify RGMII speeds
      net: lan969x: add RGMII registers
      net: lan969x: add RGMII implementation
      dt-bindings: net: sparx5: document RGMII MAC delays

 .../bindings/net/microchip,sparx5-switch.yaml      |  20 ++
 drivers/net/ethernet/microchip/lan969x/Makefile    |   2 +-
 drivers/net/ethernet/microchip/lan969x/lan969x.c   |   5 +
 drivers/net/ethernet/microchip/lan969x/lan969x.h   |  10 +
 .../net/ethernet/microchip/lan969x/lan969x_rgmii.c | 237 +++++++++++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  29 ++-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |   3 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 145 +++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_phylink.c |   3 +
 .../net/ethernet/microchip/sparx5/sparx5_port.c    |  57 +++--
 .../net/ethernet/microchip/sparx5/sparx5_port.h    |   5 +
 11 files changed, 488 insertions(+), 28 deletions(-)
---
base-commit: 12079a59ce52e72a342c49cfacf0281213fd6f32
change-id: 20241104-sparx5-lan969x-switch-driver-4-d59b7820485a

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


