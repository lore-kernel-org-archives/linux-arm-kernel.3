Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72344E674AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lgAmYVpW9kSdM2WOtAoAz+kRpin+Q+G1Z5IP70EersU=; b=qao/JPflKfDxGU
	1NJr1gij75SILqRcoI4JYyjf6YE3cZwlbtBkTOAqJ12gDLNkxzGCoYAJTvJN+ri9ob7xIYUEnrK+T
	dQH1HSWjYk2tmPdBn+SQCVzIWX7W0MS1V3FwXoXqxFVtG0xo7DZBM2kXW8+ks/IOXIJaHYsCcjDSW
	YeuJXQvXVvxHO5elPGOXTgiegajJEj/lJ4KW5Pnppg0GBMIaWFKO9uwU7t1Q7zqpXr+Gxz+9BmEfJ
	EqkfLH1Sw1bxvr/QgijgmOu9Vsg4Lvtvg8l1a1oUDO+9rKRla9elTPrMb2MILAYKANZ/ylJ+xBp8b
	tgkMoQuZtBBqjQGsFw1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6m59-000000066mc-3aRB;
	Fri, 01 Nov 2024 07:28:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lnL-000000063ei-0g4Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 07:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730445006; x=1761981006;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=8SBtAFIZv6QdmDpsSm24E8xxTeonWxMbs9IQUu8QsfA=;
  b=X34Qk4hD826/hN4oUlOhgOap5dm17IUHhG0xQlAePrU9gP88vjHNqSUl
   UejeGKbw70RhPYqPmxFTqoAoIxfSq/fA+Nu5ejRcN9K6tOurE9nkBDuI/
   z0XtEnC5Q2dPLl3RKEnysAxe2qBr0ht36Tvm3RmQ2R1OStkkrZGxzCgax
   jTqz0r1KSTY7YCUAd3P3g9mP8WLIAzzRyRkea5npuylSVUCpkoG2XYAAG
   N1/uSFa3qvHFZTK1AR/BiNJWqNuvlKO6FvJ3nvw96EEcgkgeeTo9F7k13
   y+vv0S3cv+6Q5culEZ+YKYNZaXsgrDwrELWd+RGESX071qP922cwI5x9N
   A==;
X-CSE-ConnectionGUID: NPrwf/hMSSa00KPy6thoyw==
X-CSE-MsgGUID: ROduA6SrQSevCJ88YzhLHQ==
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="201180317"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Nov 2024 00:10:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Nov 2024 00:09:52 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 1 Nov 2024 00:09:49 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next 0/6] net: lan969x: add VCAP functionality
Date: Fri, 1 Nov 2024 08:09:06 +0100
Message-ID: <20241101-sparx5-lan969x-switch-driver-3-v1-0-3c76f22f4bfa@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJJ+JGcC/x2NywrCMBAAf6Xs2YU8ajX+inhI09Us6Fo2pQZK/
 93ocRiY2aCQMhW4dBsorVz4LQ3soYOUozwIeWoMzrjeGm+xzFHrEZ9RwhAqlg8vKeOkvJKix0D
 u1A90Ho330CKz0p3rf3AFoQWF6gK3ZsZYCEeNkvJv8IossO9f2Doum5EAAAA=
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<jacob.e.keller@intel.com>, <christophe.jaillet@wanadoo.fr>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_001007_320319_60CF6802 
X-CRM114-Status: GOOD (  13.32  )
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

This series is the third of a multi-part series, that prepares and adds
support for the new lan969x switch driver.

The upstreaming efforts is split into multiple series (might change a
bit as we go along):

        1) Prepare the Sparx5 driver for lan969x (merged)

        2) Add support for lan969x (same basic features as Sparx5
           provides excl. FDMA and VCAP, merged).

    --> 3) Add lan969x VCAP functionality.

        4) Add RGMII and FDMA functionality.

== VCAP support:

The Versatile Content-Aware Processor (VCAP) is a content-aware packet
processor that allows wirespeed packet inspection for rich
implementation of, for example, advanced VLAN and QoS classification and
manipulations, IP source guarding, longest prefix matching for Layer-3
routing, and security features for wireline and wireless applications.
This is all achieved by programming rules into the VCAP.

When a VCAP is enabled, every frame passing through the switch is
analyzed and multiple keys are created based on the contents of the
frame. The frame is examined to determine the frame type (for example,
IPv4 TCP frame), so that the frame information is extracted according to
the frame type, port-specific configuration, and classification results
from the basic classification. Keys are applied to the VCAP and when
there is a match between a key and a rule in the VCAP, the rule is then
applied to the frame from which the key was extracted.

After this series is applied, the lan969x driver will support the same
VCAP functionality as Sparx5.

== Patch breakdown:

Patch #1 exposes some VCAP symbols for lan969x.

Patch #2 replaces VCAP uses of SPX5_PORTS with n_ports from the match
data.

Patch #3 adds new VCAP constants to match data

Patch #4 removes the is_sparx5() check to now initialize the VCAP API on
lan969x.

Patch #5 adds the auto-generated VCAP data for lan969x.

Patch #6 adds the VCAP configuration data for lan969x.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Daniel Machon (6):
      net: sparx5: expose some sparx5 VCAP symbols
      net: sparx5: replace SPX5_PORTS with n_ports
      net: sparx5: add new VCAP constants to match data
      net: sparx5: execute sparx5_vcap_init() on lan969x
      net: lan969x: add autogenerated VCAP information
      net: lan969x: add VCAP configuration data

 drivers/net/ethernet/microchip/lan969x/Makefile    |    3 +-
 drivers/net/ethernet/microchip/lan969x/lan969x.c   |    3 +
 drivers/net/ethernet/microchip/lan969x/lan969x.h   |    8 +
 .../microchip/lan969x/lan969x_vcap_ag_api.c        | 3843 ++++++++++++++++++++
 .../ethernet/microchip/lan969x/lan969x_vcap_impl.c |   85 +
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |   15 +-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |    3 +
 .../ethernet/microchip/sparx5/sparx5_vcap_ag_api.h |    2 +
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c   |   48 +-
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.h   |   21 +
 10 files changed, 3995 insertions(+), 36 deletions(-)
---
base-commit: 157a4881225bd0af5444aab9510e7b6da28f2469
change-id: 20241031-sparx5-lan969x-switch-driver-3-9e2746e8b033

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


