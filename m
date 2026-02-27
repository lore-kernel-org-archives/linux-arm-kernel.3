Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D14BFEFB54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pWctyQ8HitypP4wV6H4UjvVRFiEatC9GvSj3NdgiLXc=; b=Hxb8UMoHzcNvdo
	nFRUXpsOmB04ubpekRxjmST9ntpyxnRwsUARkLPuSw1aDMQ92MC7DUrbJI7PFD0KODfnDf50Y6kpi
	pWtsLsGpmDD8bJxHn7l1rPRBO7hQ12Vu3xsduv1irxrrkHyTWWrLp4K8GX/aCx+7VObphOGL8THxG
	JU4Igc5t7bCPuprr0etNqn5wraTyC3j/5kipMC7cPrIYY9Cr8O5XtmwHqKvWKciI5s7ypATEIPVIP
	fo4xo424n3eQ3vwiM3GLxDbDQ2ZPGHJCbXtxl7WbuK2Yxs8juNfriOzC6+99tNsk26HsChhNY/DxH
	t5Bb2lTSTztQvjkWu70g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHc-00000008X9q-06hy;
	Fri, 27 Feb 2026 14:57:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHX-00000008X8W-06F9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772204249; x=1803740249;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=Ow4BaL7t8+ptDhmm93kvq3SCgaiHZrjMuwhCUtx9vBY=;
  b=eqIi0pCoIdpkPF1KsDfiR1pkmNSNpK0MH4czvUjfXd7nUCPskKukJpBI
   OBIk7zht4BLMwe1CCCLVxhXmqtx+wa1srtDBtBy3+GydFGF+lwFEB7ArA
   2ZJ6V4FCaiAqled8J1f4HcEYioss/2QWbFwtcfLpo7yjTOp8efPmEGXu5
   0vnXnhcMG8CTX6QelF1266obfVXqB1h4N+IpygDmbMBlS6mxCqIcItx9o
   gb4SrXOtOxojujWjbsZa7dV7l7UzSODRokM5UX2V+NBXI9ZtBWVrfapt6
   5asw7nlfA8cCii5h4N5dKhX9xfrwoyRt5zOkCOqdnDuCuyNKJKUEjrot5
   w==;
X-CSE-ConnectionGUID: kLDX0HSLSkif0YfeYYLp1A==
X-CSE-MsgGUID: sKY45YYqSf+b1MKrmg4FDg==
X-IronPort-AV: E=Sophos;i="6.21,314,1763449200"; 
   d="scan'208";a="61420721"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 07:57:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 27 Feb 2026 07:56:58 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 07:56:56 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next v2 0/9] net: sparx5: clean up probe/remove init
 and deinit paths
Date: Fri, 27 Feb 2026 15:56:38 +0100
Message-ID: <20260227-sparx5-init-deinit-v2-0-10ba54ccf005@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKawoWkC/22NwQ6DIBBEf8XsudsABqw99T8aDxbXugfBACE2x
 n8vodeeJi+TeXNApMAU4d4cEChzZO8KqEsDdhndm5CnwqCEMkJJg3Ebw66RHSecqIZoOztLo61
 RBGW4BZp5r9InOEroaE8wlGbhmHz41Lcsa/8TK/1PnCUK7DvRGn0Tr34Wj5Vt8Hbh7Wr9CsN5n
 l+bo0/NwgAAAA==
X-Change-ID: 20260216-sparx5-init-deinit-037cf165c62e
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, <maxime.chevallier@bootlin.com>,
	<rmk+kernel@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_065731_285266_44A5CDDD 
X-CRM114-Status: GOOD (  13.50  )
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

This series refactors the sparx5 init and deinit code out of
sparx5_start() and into probe(), adding proper per-subsystem cleanup
labels and deinit functions.

Currently, the sparx5 driver initializes most subsystems inside
sparx5_start(), which is called from probe(). This includes registering
netdevs, starting worker threads for stats and MAC table polling,
requesting PTP IRQs, and initializing VCAP. The function has grown to
handle many unrelated subsystems, and has no granular error handling —
it either succeeds entirely or returns an error, leaving cleanup to a
single catch-all label in probe().

The remove() path has a similar problem: teardown is not structured as
the reverse of initialization, and several subsystems lack proper deinit
functions. For example, the stats workqueue has no corresponding
cleanup, and the mact workqueue is destroyed without first cancelling
its delayed work.

Refactor this by moving each init function out of sparx5_start() and
into probe(), with a corresponding goto-based cleanup label. Add deinit
functions for subsystems that allocate resources, to properly cancel
work and destroy workqueues. Ensure that cleanup order in both error
paths and remove() follows the reverse of initialization order.
sparx5_start() is eliminated entirely — its hardware register setup
is renamed to sparx5_forwarding_init() and its FDMA/XTR setup is
extracted to sparx5_frame_io_init().

Before this series, most init functions live inside sparx5_start() with
no individual cleanup:

  probe():
    sparx5_start():              <- no granular error handling
      sparx5_mact_init()
      sparx_stats_init()           <- starts worker, no cleanup
      mact_queue setup             <- no cancel on teardown
      sparx5_register_netdevs()
      sparx5_register_notifier_blocks()
      sparx5_vcap_init()
    sparx5_ptp_init()

    probe() error path:
      cleanup_ports:
        sparx5_cleanup_ports()
        destroy_workqueue(mact_queue)

After this series, probe() initializes subsystems in order with
matching cleanup labels, and remove() tears down in reverse:

  probe():
    sparx5_pgid_init()
    sparx5_vlan_init()
    sparx5_board_init()
    sparx5_forwarding_init()
    sparx5_calendar_init()         -> cleanup_ports
    sparx5_qos_init()              -> cleanup_ports
    sparx5_vcap_init()             -> cleanup_ports
    sparx5_mact_init()             -> cleanup_vcap
    sparx5_stats_init()            -> cleanup_mact
    sparx5_frame_io_init()         -> cleanup_stats
    sparx5_ptp_init()              -> cleanup_frame_io
    sparx5_register_netdevs()      -> cleanup_ptp
    sparx5_register_notifier_blocks() -> cleanup_netdevs

  remove():
    sparx5_unregister_notifier_blocks()
    sparx5_unregister_netdevs()
    sparx5_ptp_deinit()
    sparx5_frame_io_deinit()
    sparx5_stats_deinit()
    sparx5_mact_deinit()
    sparx5_vcap_deinit()
    sparx5_destroy_netdevs()

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v2:

v2 mainly addresses the comment from Russell on v1, saying that a
minimal initialization should be done after netdev publication. This is
now done by moving initialization in sparx5_start out to proper init
functions. This also means that no initialization is done after netdev
publication in v2.

- Drop v1 patch 1 ("call sparx5_start() last in probe()"); PTP IRQ
  handling is now a separate commit and sparx5_start() is eliminated
  in the final patch.
- Add patch to move PTP IRQ handling out of sparx5_start() into its
  own init/deinit with cleanup label.
- Add patch to extract FDMA/XTR initialization from sparx5_start()
  into sparx5_frame_io_init() with cleanup label.
- Add patch to rename sparx5_start() to sparx5_forwarding_init() and
  change return type to void, eliminating sparx5_start() entirely.

Link to v1: https://lore.kernel.org/r/20260225-sparx5-init-deinit-v1-0-97036580b9f0@microchip.com

---
Daniel Machon (9):
      net: sparx5: move netdev and notifier block registration to probe
      net: sparx5: move VCAP initialization to probe
      net: sparx5: move MAC table initialization and add deinit function
      net: sparx5: move stats initialization and add deinit function
      net: sparx5: move calendar initialization to probe
      net: sparx5: move remaining init functions from start() to probe()
      net: sparx5: move PTP IRQ handling out of sparx5_start()
      net: sparx5: move FDMA/XTR initialization out of sparx5_start()
      net: sparx5: replace sparx5_start() with sparx5_forwarding_init()

 .../ethernet/microchip/sparx5/sparx5_calendar.c    |  15 +-
 .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |   9 +-
 .../ethernet/microchip/sparx5/sparx5_mactable.c    |  34 ++-
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 253 ++++++++++-----------
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  12 +-
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c |  18 ++
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c   |   2 +-
 7 files changed, 196 insertions(+), 147 deletions(-)
---
base-commit: 17d0056f71b13050317a662a505b1a36fb7009e5
change-id: 20260216-sparx5-init-deinit-037cf165c62e

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


