Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EA4C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O7ABpbwcg1Coyn6LKRlK8loM5sYlwClzgo7hN0mkrUU=; b=PJ5ZyQYUAYuAft
	BcLJWeu0skC92donVPYIXSGVn2P/w+gtkJk/bpdxReYLxglZI83tU+JHr/1y8/IIrSJBiqrtAok/s
	e7rY6+sQtILSm9V8xExcU8lU8AbYaKHUQW5G2t1dAZv5NzDxhELxaSUkoz7JXcFaf8itQkG9cb5jR
	FLFuD6zRQDXEQqOQXLxC3hiF4mHuuHkMV5r07HrqAt4EzBlde/fQCIBTsRzIfybwOs/rL465cW6o1
	2Rdf4PJNVQHwd5AbFVSDdGgnDzY0rzGxUWlIZwj9pQtrZIaqaMWdJ/zv4ov7AVaSzFyrED3K3M4gj
	qTQi9cDvJc2IuJ9to68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtO6R-0000000Bb6C-2lbp;
	Mon, 10 Aug 2026 11:23:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtO6N-0000000Bb4v-24iy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 11:23:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786361011; x=1817897011;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=AjAr5gjAkQ1Yp4bxsaEgjcFfiPlkVc5weZHWpMGWB5s=;
  b=LwZksfjnd0XSR2Lm8CneygKm1UcyN2iEj40yo4z6GXdKhFGZD/w2BXMj
   ph+jhYoD4M6FVl/qEy1cgCsvbBAYKzz0gpdpPAsF71EZ8geMRXkCPdMrv
   cOe8m1L9dayqVAGyj/JJ3CTyjlLN1xQnl24+RZn7/YmtUkh28Zjh/8XZ2
   Up6iBcLnfmXUU3BXct2XgIlh9FIlRFrbUQesElmpOiPj29i7/IT9aH3ZP
   awHftv3CXYcAI87RHA8lBn2kMb1S9lLpzSt0xo8wwXjYGJwo1JkUdhP/w
   0TluCnh02ElstWxt2PXrRn/8H1GJ3tMMh4f5StzdLmPfK9xh3vfdUVXoM
   w==;
X-CSE-ConnectionGUID: ZtIVA3FtSgartEHIy3eibg==
X-CSE-MsgGUID: tKBHExnvT4qjsvu4DAk5aw==
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="293272590"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 04:23:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Mon, 10 Aug 2026 04:23:26 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 10 Aug 2026 04:23:23 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Subject: [PATCH net-next v2 0/9] net: sparx5: add L3 unicast routing
 offload
Date: Mon, 10 Aug 2026 13:20:45 +0200
Message-ID: <20260810-sparx5_l3_routing-v2-0-59e68cc8c8ca@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAA20eWoC/22NQQqDMBBFryKzbkoSNdSuvEcRkTjqQE1kkopFv
 HtD1l0+Hv/9EwIyYYBncQLjToG8S6BvBdhlcDMKGhODltpIraQI28BH3b/Lnv0nkptFY3RVP7A
 ay3GAtNsYJzpy8wUOo3B4ROiSWShEz998tqvsc9co/ae7KyHFZEurpDJyqpp2JcveLrTdrV+hu
 67rByxTUh3AAAAA
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Machon
	<daniel.machon@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_042332_543108_D148C22B 
X-CRM114-Status: GOOD (  15.78  )
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

Patch 8 (FIB + nexthop + neighbour CRUD): This is a large patch.
Splitting it further is difficult because the neighbour and nexthop CRUD
is shared between the leg-teardown path and the neighbour-event path: leg
teardown flushes the legs neighbours and refreshes their dependent
nexthops, and the NETEVENT_NEIGH_UPDATE handler in patch 9 drives the
same helpers.

Patch 9 (neighbour events): Registers the netevent notifier for
NETEVENT_NEIGH_UPDATE used in ARP/NDP resolution, wiring up the final
piece.

The Super VCAP shared-register race reported on v1 is fixed separately by
commit d7a8d500d7e4 ("net: microchip: vcap: fix races on the shared Super
VCAP block"), which is now in net-next.

Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
Changes in v2:
- Reworked neighbour lifetime: anchor neighbours to the router leg
  instead of the most-specific covering FIB entry (matching
  mlxsw/prestera). Fixes a neighbour-entry leak (memory + VMID + host
  VCAP rule + netdev reference) and lets the software LPM be removed
  entirely.
- Fixed a heap overflow in the fib6 nexthop prune path.
- Fixed a leak on the router_init() error path.
- Hardening: netns filtering and offload-ownership checks on the global
  notifiers, and a NETDEV_UNREGISTER leg-teardown backstop.
- Fixed do_div() misuse on a 32-bit value. Added the missing RCU
  annotation on in_dev->ifa_list.
- Zero-initialise the actionfield data in vcap_rule_mod_action_bit().
- Updated the sparx5_router.c header comment to describe the
  leg-anchored model.
- Link to v1: https://lore.kernel.org/r/20260612-sparx5_l3_routing-v1-0-fc3c10160f49@microchip.com

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
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |   44 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   |  691 ++++-
 .../net/ethernet/microchip/sparx5/sparx5_regs.c    |   20 +-
 .../net/ethernet/microchip/sparx5/sparx5_regs.h    |   20 +-
 .../net/ethernet/microchip/sparx5/sparx5_router.c  | 3021 ++++++++++++++++++++
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
 22 files changed, 5047 insertions(+), 137 deletions(-)
---
base-commit: 001b5d347d8ba39b2dccaefcc57967b18caec8fe
change-id: 20260210-sparx5_l3_routing-962458e4d3da

Best regards,
-- 
Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>


