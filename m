Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AC1D49219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qjdjTJq/2FOekUKvaMFvXfapqDOMGzAef3Bha4jXHl8=; b=dmpJnTXuDVX7hu
	H9MFmiN4GFM08/IPjfdYy9AUrA1oeLAIpOOVmN97HxEywrPANycgiNQWKFC+eVwiXFm4IBHFjnFEo
	RcD0xec3CG1C66ty8dSzfvCCFGcRS40yAiDsCaQpTdDQTl2F9gep/FNjN/nMQpIqchxDvS5CgoCW2
	tRBASEzj6li5xg+3w51vM6El4R6tGRivvUfFzDmtjXlKuvpXq41naliEU9tK2dnCqvv0mDR7qt8Ld
	cUbOZRek9Thmxxm0Ws6/rP0PdUqadnUGqOAl7SXbm2Orz0zaZZFFDjFAu6c+KANH+KiGYm+H+Ql6c
	aTYN2vDnBATJYwmekHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1PS-00000009TzT-2AdA;
	Mon, 18 Nov 2024 13:03:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1NV-00000009TIN-2j8Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 13:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1731934877; x=1763470877;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=ZHjrUlq66zs8efI7yyCOtRV2kHJYGGuesQuTNPW2bvI=;
  b=k0AEVgCdIxL4QtgwFQO2U+c85oiamplHc5VlJKegVow6GDPAECUh4LTg
   OT7iIBXiG6bhX4qlF68cBrug5r2p5BY9kzgCBeZGBnzmKa5ed08A5gLeg
   ah2VKYA3sJa5JWsD7PC9DHKk+YJR852ITppHqq4RrMw49SeyzeERf4vIi
   2olYhVC/vxjToGRQGh6zUWNsoGIAwlc3t4GW5x9FwW/nUvqVGKgUt3mrJ
   OxOx4KwAOVH/4WpfBkI33ee1ovmwWT77WNY9uk0tkMZ1ryRoeLpiztJBf
   BwtKMdZHCOaYMU7MsbtWWl7qgTnZnOiCrT7scKsRCWCpqwOaY6yC2Jk89
   g==;
X-CSE-ConnectionGUID: DbRaG4tGSXe42+jZNuS/Pw==
X-CSE-MsgGUID: 8tKiatfDTPeGBJ/uTe1xlA==
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="37994315"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2024 06:01:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Nov 2024 06:00:56 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 18 Nov 2024 06:00:53 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next v3 0/8] net: lan969x: add RGMII support
Date: Mon, 18 Nov 2024 14:00:46 +0100
Message-ID: <20241118-sparx5-lan969x-switch-driver-4-v3-0-3cefee5e7e3a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH46O2cC/4WOS27EIBBErzJinY4AY2yyyj2iWfBzaCnGVmMRj
 0a+exgriyibWZZK9V7dWYmEsbC3y51RrFhwyS10Lxfmk82fETC0zCSXSgiuoKyW9h6+bDba7FC
 +cfMJAmGNBApCb9wwSq7G3rIGWSlOuJ+CD5bjBjnuG7u2xtkSwZHNPj0Es8X8GCQs20K381AV5
 +zXrZ+5qwAO0zANndCq0y68z+hp8QnXV7/Mp7XKP0jRPUXKhuTBmdF6bnQQ/5HHcfwAfTg1BkQ
 BAAA=
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
X-CRM114-CacheID: sfid-20241118_050117_764867_C1A1042B 
X-CRM114-Status: GOOD (  16.12  )
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
Daniel Machon (8):
      net: sparx5: do some preparation work
      net: sparx5: add function for RGMII port check
      net: sparx5: use is_port_rgmii() throughout
      net: sparx5: use phy_interface_mode_is_rgmii()
      net: sparx5: verify RGMII speeds
      net: lan969x: add RGMII registers
      net: lan969x: add RGMII implementation
      dt-bindings: net: sparx5: document RGMII delays

 .../bindings/net/microchip,sparx5-switch.yaml      |  18 ++
 drivers/net/ethernet/microchip/lan969x/Makefile    |   2 +-
 drivers/net/ethernet/microchip/lan969x/lan969x.c   |   5 +
 drivers/net/ethernet/microchip/lan969x/lan969x.h   |  10 +
 .../net/ethernet/microchip/lan969x/lan969x_rgmii.c | 224 +++++++++++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  29 ++-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |   3 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 145 +++++++++++++
 .../net/ethernet/microchip/sparx5/sparx5_phylink.c |   3 +
 .../net/ethernet/microchip/sparx5/sparx5_port.c    |  57 ++++--
 .../net/ethernet/microchip/sparx5/sparx5_port.h    |   5 +
 11 files changed, 473 insertions(+), 28 deletions(-)
---
base-commit: d7ef9eeef0723cc47601923c508ecbebd864f0c0
change-id: 20241104-sparx5-lan969x-switch-driver-4-d59b7820485a

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


