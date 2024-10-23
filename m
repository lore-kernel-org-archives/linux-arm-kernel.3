Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C856D0BB40
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EVVNxUNwAi9xXzDu4ZB7oDhiA7Wi24aebX9JhL7shLc=; b=CRckT7aVnR1j1Q
	/7KCORfvm+qcjxKzqzDKPBqH1hsVjz33+Hgfw2og/KJlLPD7F0ZodgkGL8igp08xy9vsVHX3ltCdF
	Ql1Aqi3SkUM5dZwUbIES7KDt/abzW4dVQ0ycNEh1nzVT2Pn1lQsKhkuRcHit3/6TrY0QYm9PEzQQS
	AA5NZgzzYyFySQ2PtamZQWQe5U+mWXjiDm2T8+h/84gEIWze5lz9pIAuNG9L/zHM3twjBRTB7+0q6
	Q8WaEK8X2kQgMJ26Bfzye64ehJNSbqpSDe5zu2LS1AWgltKaCG3gwT2oeKk9c7C+jxo05N1clqr5K
	rlNGaxsm1r/Yvl6l/2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jRp-0000000G2Sd-3cA1;
	Wed, 23 Oct 2024 22:03:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jQE-0000000G226-0kmb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720901; x=1761256901;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=CzorL+H5n3YshYnC2o3Ou9NHz4HVN1fYVUhFp18YrC0=;
  b=1zrD+lXBRH/ZrQ8lTL3O91W+Fthi8jrcavf0lVH+7jQfnr0lkyw3zB2Q
   I36JPKlf3R3GyVJo97HZp/rVeFRygl4gqlDM2poRgnalnGBrJasvF4GVw
   +NO0IlShaIiQLFeK0k5r79R76p2wsZDibzc6inQKMzeDPzB7Qnh+Ju5Tf
   3jd0nhlTriFb+VxOgp5UIBhS+GvvruAOr0ezBaJ2fJOgnUdABHsCwAwcn
   ZIC3UIZrPY7H9oE7sRBlUMBhJKqk1U4+UPx9qqi36I5iCEuEkUcHW5lHq
   UWL13Owce2+R2Nvstat/I8Ompy1+L44LoQRCCY1R8xcP2O4lzedjl+xv7
   w==;
X-CSE-ConnectionGUID: kg1uMGojTM+MSEMPUN3/vQ==
X-CSE-MsgGUID: 1OeoyRfBRWKMQOYQ7W2qrg==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="36817392"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:01:40 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:01:38 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:01:34 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next v2 00/15] net: sparx5: add support for lan969x
 switch device
Date: Thu, 24 Oct 2024 00:01:19 +0200
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9yGWcC/4WOQQ6CQBAEv0Lm7Bh2EQFP/sNwWMbBnUQWMksQQ
 /i7iA/w2OlUVy8QWYUjXJIFlCeJ0oct2EMC5F14MMp9y2BTezKpOWMcnM45Pl2oztWM8SUjeby
 rTKxosSBu87wosyorYRsZlFuZd8ENAo8YeB6h3prGRcZGXSD/FXROwhfwEsde3/uhyezYz23NP
 /dkMEUq6VRxaw2n7bUT0p68DEfqO6jXdf0AhripjPEAAAA=
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_150142_384692_FE85FFE2 
X-CRM114-Status: GOOD (  19.49  )
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

This series is the second of a multi-part series, that prepares and adds
support for the new lan969x switch driver.

The upstreaming efforts is split into multiple series (might change a
bit as we go along):

        1) Prepare the Sparx5 driver for lan969x (merged)

    --> 2) add support lan969x (same basic features as Sparx5
           provides excl. FDMA and VCAP).

        3) Add support for lan969x VCAP, FDMA and RGMII

== Lan969x in short:

The lan969x Ethernet switch family [1] provides a rich set of
switching features and port configurations (up to 30 ports) from 10Mbps
to 10Gbps, with support for RGMII, SGMII, QSGMII, USGMII, and USXGMII,
ideal for industrial & process automation infrastructure applications,
transport, grid automation, power substation automation, and ring &
intra-ring topologies. The LAN969x family is hardware and software
compatible and scalable supporting 46Gbps to 102Gbps switch bandwidths.

== Preparing Sparx5 for lan969x:

The main preparation work for lan969x has already been merged [1].

After this series is applied, lan969x will have the same functionality
as Sparx5, except for VCAP and FDMA support. QoS features that requires
the VCAP (e.g. PSFP, port mirroring) will obviously not work until VCAP
support is added later.

== Patch breakdown:

Patch #1-#4  do some preparation work for lan969x

Patch #5     adds new registers required by lan969x

Patch #6     adds initial match data for all lan969x targets

Patch #7     defines the lan969x register differences

Patch #8     adds lan969x constants to match data

Patch #9     adds some lan969x ops in bulk

Patch #10    adds PTP function to ops

Patch #11    adds lan969x_calendar.c for calculating the calendar

Patch #12    makes additional use of the is_sparx5() macro to branch out
             in certain places.

Patch #13    documents lan969x in the dt-bindings

Patch #14    adds lan969x compatible string to sparx5 driver

Patch #15    introduces new concept of per-target features

[1] https://lore.kernel.org/netdev/20241004-b4-sparx5-lan969x-switch-driver-v2-0-d3290f581663@microchip.com/

To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: Lars Povlsen <lars.povlsen@microchip.com>
To: Steen Hegelund <Steen.Hegelund@microchip.com>
To: horatiu.vultur@microchip.com
To: jensemil.schulzostergaard@microchip.com
To: Parthiban.Veerasooran@microchip.com
To: Raju.Lakkaraju@microchip.com
To: UNGLinuxDriver@microchip.com
To: Richard Cochran <richardcochran@gmail.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: jacob.e.keller@intel.com
To: ast@fiberby.net
To: maxime.chevallier@bootlin.com
To: horms@kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Steen Hegelund <steen.hegelund@microchip.com>
Cc: devicetree@vger.kernel.org

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v2:

- Removed SPARX5_MAX_PTP_ID from sparx5_ptp.c (patch #10, Maxime).

- Renamed lan969x_dsm_cal_idx_find_next_free to lan969x_dsm_cal_idx_get
  and added check for return value (patch #11, Maxime).

- Shortened lan969x PTP register names (patch #5, Maxime).

- Fixed smatch warning about use of uninitialized variable pol_upd_int in patch #1.
  pol_upd_int is initialized in patch #1 instead of patch #12. (Simon)

- Switched to relative includes for lan969x and sparx5. (Simon)

- Ditched target verification using the DT compatible string (Krzysztof).

- Fixed direct dependency warning by using 'depends on' instead of
  'select' for lan969x kconfig symbol (kernel-test-robot).

- Fixed issue when building as a module. Changed #ifdef
  CONFIG_LAN969X_SWITCH to #if IS_ENABLED(CONFIG_LAN969X_SWITCH) in
  mchp_sparx5_match and added EXPORT_SYMBOL_GPL to lan969x match data.

- Link to v1:
  https://lore.kernel.org/r/20241021-sparx5-lan969x-switch-driver-2-v1-0-c8c49ef21e0f@microchip.com

---
Daniel Machon (15):
      net: sparx5: add support for lan969x targets and core clock
      net: sparx5: change spx5_wr to spx5_rmw in cal update()
      net: sparx5: change frequency calculation for SDLB's
      net: sparx5: add sparx5 context pointer to a few functions
      net: sparx5: add registers required by lan969x
      net: lan969x: add match data for lan969x
      net: lan969x: add register diffs to match data
      net: lan969x: add constants to match data
      net: lan969x: add lan969x ops to match data
      net: lan969x: add PTP handler function
      net: lan969x: add function for calculating the DSM calendar
      net: sparx5: use is_sparx5() macro throughout
      dt-bindings: net: add compatible strings for lan969x targets
      net: sparx5: add compatible string for lan969x
      net: sparx5: add feature support

 .../bindings/net/microchip,sparx5-switch.yaml      |  20 +-
 MAINTAINERS                                        |   7 +
 drivers/net/ethernet/microchip/Kconfig             |   1 +
 drivers/net/ethernet/microchip/Makefile            |   1 +
 drivers/net/ethernet/microchip/lan969x/Kconfig     |   5 +
 drivers/net/ethernet/microchip/lan969x/Makefile    |  12 +
 drivers/net/ethernet/microchip/lan969x/lan969x.c   | 350 +++++++++++++++++++++
 drivers/net/ethernet/microchip/lan969x/lan969x.h   |  57 ++++
 .../ethernet/microchip/lan969x/lan969x_calendar.c  | 191 +++++++++++
 .../net/ethernet/microchip/lan969x/lan969x_regs.c  | 222 +++++++++++++
 .../ethernet/microchip/sparx5/sparx5_calendar.c    |  72 +++--
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    |   2 +-
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |  82 ++++-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  75 ++++-
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 132 ++++++++
 .../net/ethernet/microchip/sparx5/sparx5_mirror.c  |  10 +-
 .../net/ethernet/microchip/sparx5/sparx5_netdev.c  |  26 +-
 .../net/ethernet/microchip/sparx5/sparx5_packet.c  |  16 +-
 .../net/ethernet/microchip/sparx5/sparx5_port.c    |  46 +++
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c |  15 +-
 drivers/net/ethernet/microchip/sparx5/sparx5_qos.c |   3 +-
 .../net/ethernet/microchip/sparx5/sparx5_regs.c    |   5 +-
 .../net/ethernet/microchip/sparx5/sparx5_regs.h    |   5 +-
 .../net/ethernet/microchip/sparx5/sparx5_sdlb.c    |  10 +-
 .../ethernet/microchip/sparx5/sparx5_tc_flower.c   |   5 +
 25 files changed, 1286 insertions(+), 84 deletions(-)
---
base-commit: b0b3683419b45e2971b6d413c506cb818b268d35
change-id: 20241016-sparx5-lan969x-switch-driver-2-7cef55783938

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


