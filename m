Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0396CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NEzDE3+nPEjLgWVYxfj2MMOoPaHvcDJLaG/WLx1jidM=; b=2kJJVr2UiWOkqt
	pv+9+k8hHQjAaWNOyKoy52vOsbW9fgL0tbP5ZHWPBqcqbi7hUltFKde+6z1rNe9qUjPNx0kp3rhy/
	cVDe2IGGBKNcxzYbah+AIXEOO42hMJVH+UhINq1odTgMmMDdkWjblMFzV2JiH5PjiOG1uXyaVUiI3
	RcI87HBWAokrGnX7ieMTQuVU/NSolUtyhW5iKWcuSsSK3JgJDL/mj2scf6NXxeEwNo5eJqMQwRG+m
	qKwDb8w5Dno/QRXHlY5fP6tnHaKBeu/bGTHU2bBaonARtn6dA2tydEkpaUymT5N1rbT9VVF7FCqTl
	fegMzW2fFUs78Ywgj1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY19j-0000000AsPy-3nIr;
	Fri, 12 Jun 2026 12:38:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY19g-0000000AsOn-2bn6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781267917; x=1812803917;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=TNtDZ2rFubnaHt4bk3HI0rXm5kB9WhayB/Rz6IIN0KM=;
  b=rXW0ozQtnp8oWciOAoSJJ/oqP89pHGOggPMVwHKSv8VE6/uN0VpBIQr4
   qKqVj6PSbygp+zppfYCv/0RdkEjD6dQAZyc+6xyfkR11VeMEvDKOcTsxa
   XKjSlpRpXnelr17qa6CtAE660r5req64xZsB75fpwb3gWy7A8ViIYFp7r
   qS0sPS5YgpSWbOIpvX6bte0hUau7MgVojz8CUan6H+M8kZ7yKE0XLSCI9
   x1rh5lZhFRbIwLRI4RkkktnvkJzbiosszYsmcPQlLuufoKED7izF8YhkO
   W0kW48pOWjvj+SAC0YhuZQ0kMZRihumGd4SSe8z34s/Fs6kogliMkxVJN
   w==;
X-CSE-ConnectionGUID: 8hGKh+9qS9m6l19lDwo2ow==
X-CSE-MsgGUID: IStHFf1JR2y7diaV1tomJg==
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="59023654"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 05:38:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 12 Jun 2026 05:38:34 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Jun 2026 05:38:31 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Subject: [PATCH net-next 0/9] net: sparx5: add L3 unicast routing offload
Date: Fri, 12 Jun 2026 14:37:09 +0200
Message-ID: <20260612-sparx5_l3_routing-v1-0-fc3c10160f49@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHX9K2oC/x3MSwqAMAwA0atI1hZq/aBeRUSKjRqQKGmVgnh3i
 8u3mHnAoxB66LMHBG/ydHBCkWcwb5ZXVOSSwWjTaFNo5U8rsZ72cpLjCsSr6hpT1S1WrnQWUnc
 KLhT/5wCMQTHGAOP7frsORNJtAAAA
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Machon
	<daniel.machon@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_053837_033372_931F1A2B 
X-CRM114-Status: GOOD (  12.73  )
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

Add L3 unicast route offloading for IPv4 and IPv6 on Sparx5 and
LAN969x. This enables hardware-accelerated l3 routing between VLAN
upper interfaces on a bridge, with ECMP support.

This series covers the core unicast data path: FIB offload, nexthop
groups, ARP/NDP neighbour resolution, and router leg management.

Routes are programmed into the hardware LPM (Longest Prefix Match)
VCAP, with nexthops resolved through the hardware ARP table for ECMP
or inline VCAP actions for single nexthops.

The LPM VCAP also requires type_id-aware rule decoding, since it has
actionsets of identical length that differ only in their type_id
field.

Patch 1 fixes a latent bug in the VCAP rule-move algorithm that
becomes reachable once the LPM VCAP is added, since LPM is the first
VCAP to use rules of coprime size (2 and 3).

Patches 2-4 are the remaining preparatory commits for the shared VCAP
API. They add the LPM VCAP keysets and actionsets to the autogenerated
model for lan969x and sparx5, update the action-side rule decoder to
differentiate actionsets by type_id, and expose two helpers
(vcap_val_add_rule() and vcap_rule_mod_action_bit()) used by the LPM
driver.

Patch 5 adds autogenerated register macros for the L3 routing blocks
on sparx5 and lan969x.

Patch 6 adds the LPM VCAP implementation for sparx5 and lan969x.

Patches 7-9 add L3 unicast routing to sparx5 and lan969x. The router
code is split into three patches:

Patch 7 (infrastructure + legs): Router leg lifecycle tied to VLAN
uppers on a bridge, address event handling, base MAC tracking,
blackhole leg for blackhole routes, and the hardware enable sequence.

Patch 8 (FIB + nexthop + neighbour CRUD): This is a large patch, and
splitting it further is difficult due to the dependencies in FIB and
neighbour event paths. The destroy path for a FIB entry must update
neighbour state and notify nexthops, so neighbour CRUD functions are
called from both the FIB event path and the neighbour event path.

Patch 9 (neighbour events): Registers the netevent notifier for
NETEVENT_NEIGH_UPDATE used in ARP/NDP resolution, wiring up the final
piece.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
Jens Emil Schulz Østergaard (9):
      net: microchip: vcap: fix rule move for rules of coprime size
      net: microchip: vcap: add lpm vcap to autogen vcap api
      net: microchip: vcap: make vcap actionset decoding type_id aware
      net: microchip: vcap: expose helpers in vcap api and update debugfs
      net: sparx5: add l3 routing registers
      net: sparx5: vcap: add lpm vcap implementation
      net: sparx5: add L3 router infrastructure and leg management
      net: sparx5: add L3 FIB, nexthop and neighbour entry management
      net: sparx5: add neighbour event handling for L3 routing

 drivers/net/ethernet/microchip/sparx5/Makefile     |    2 +-
 .../ethernet/microchip/sparx5/lan969x/lan969x.c    |    2 +
 .../microchip/sparx5/lan969x/lan969x_regs.c        |   20 +-
 .../microchip/sparx5/lan969x/lan969x_vcap_ag_api.c |  373 ++-
 .../microchip/sparx5/lan969x/lan969x_vcap_impl.c   |   12 +
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |   13 +-
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |   46 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   |  691 ++++-
 .../net/ethernet/microchip/sparx5/sparx5_regs.c    |   20 +-
 .../net/ethernet/microchip/sparx5/sparx5_regs.h    |   20 +-
 .../net/ethernet/microchip/sparx5/sparx5_router.c  | 3095 ++++++++++++++++++++
 .../ethernet/microchip/sparx5/sparx5_vcap_ag_api.c |  373 ++-
 .../ethernet/microchip/sparx5/sparx5_vcap_ag_api.h |    6 +-
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c   |  159 +-
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.h   |    5 +
 drivers/net/ethernet/microchip/vcap/vcap_ag_api.h  |   94 +-
 drivers/net/ethernet/microchip/vcap/vcap_api.c     |  219 +-
 drivers/net/ethernet/microchip/vcap/vcap_api.h     |    4 +-
 .../net/ethernet/microchip/vcap/vcap_api_client.h  |    6 +
 .../net/ethernet/microchip/vcap/vcap_api_debugfs.c |   13 +-
 .../net/ethernet/microchip/vcap/vcap_api_kunit.c   |   81 +-
 .../net/ethernet/microchip/vcap/vcap_model_kunit.c |    6 +-
 22 files changed, 5123 insertions(+), 137 deletions(-)
---
base-commit: f6033078a9e671e3c8b83d387b91591a6f6a54e7
change-id: 20260210-sparx5_l3_routing-962458e4d3da

Best regards,
-- 
Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>


