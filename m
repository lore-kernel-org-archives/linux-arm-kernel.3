Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC90EFD20B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/gXAB9Mf1RxavyIM+bnnRna+ZiqZXs/50gt0j/15Ark=; b=OyLEN55qtLNxwP
	BpGatZ77otibtXIHUeWADj17EpbUMUysnBbWIJ0rh0XAOJtfTNasbRxcqP5l9NU8fUO7aIuSbRbuX
	Jf3hrTru/3yv6c2e1KlfkxvpKrh7v9gVoU9e5wYo87Ynkhl2k/yhn4qtHSty1tbpZU5GXDX+KgKOy
	WuFvOnXn2RxHc8U1uOtgi/pJGANzY0Ub6IB7M6ro+CAVAoKYA5dahaiMWHN9evXWCoI+GGgqEL0Or
	hlX8GSQKU85K8kYcfVSqEBdggoPgzaOHrJH8Rw9FA2yWPoWIihtbCXzsv2iNnNWO9p45mpCUehPoQ
	twuBYhTQ8VARcW+W5j6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAr5-00000003d5v-1uFc;
	Wed, 25 Feb 2026 09:06:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAr2-00000003d4C-3bWo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772010407; x=1803546407;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=Rd8pBFRnXnJ5AAxlXaHhnrRJoWW4lC1dGDjHsSzEHx4=;
  b=Gigsq7bbvYvUr8xntrZg0MHCqpUdcZZDav5cRDxBgybyeWy7nnLUS92+
   QF5lMgvf7N23qoj+ptMgi0eJHi4biHqryrqzB5bVoL0+Gt2ARWdIuk+Eg
   jVzNxbam5QDlINkxA/te5IevX01zeDEdMbiTNAJvB8cVQoC77LQGHIiXd
   aNTPb/59FVHk68t4Vqy4ceVGqvLoupJRZkFdq1yCrCcp++8ODZpblecLk
   QWq6iqIzW15Np5dJhpKDs1kxovGDlw53dfAasaJqYL3BxENuVO1UVP+iZ
   CBOcSD4wjqWsvmiI9DInhF1mMZShOx87b8ktf3MVagoDgYuDGoAJy1Vyy
   A==;
X-CSE-ConnectionGUID: BbhGCtIlQZOkUhkWOAVukw==
X-CSE-MsgGUID: rC2Dz5dBSou9sgbq3vMbFw==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="221112785"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Feb 2026 02:06:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 25 Feb 2026 02:06:07 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 02:06:05 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next 0/7] net: sparx5: clean up probe/remove init and
 deinit paths
Date: Wed, 25 Feb 2026 10:05:23 +0100
Message-ID: <20260225-sparx5-init-deinit-v1-0-97036580b9f0@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFS7nmkC/x2MwQqAIBAFfyX23IIaGfQr0SHsVXvZQiWE6N+TT
 sMcZh5KiIJEY/NQxC1JTq1i24bCsegOlrU6OeO8cdZzupZYehaVzCt+mG4Im/V98A5Uwytik/J
 PJ1JkVpRM8/t+7oHzwm4AAAA=
X-Change-ID: 20260216-sparx5-init-deinit-037cf165c62e
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_010648_962166_CF78D4FE 
X-CRM114-Status: GOOD (  12.40  )
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
paths and remove() follows the reverse of initialization order. What
remains in sparx5_start() is only hardware register setup and FDMA/XTR
initialization that does not require cleanup.

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
    sparx5_ptp_init()
    sparx5_vcap_init()
    sparx5_mact_init()
    sparx5_stats_init()
    sparx5_register_netdevs()
    sparx5_register_notifier_blocks()
    sparx5_start()

  remove():
    sparx5_unregister_notifier_blocks()
    sparx5_unregister_netdevs()
    sparx5_stats_deinit()
    sparx5_mact_deinit()
    sparx5_vcap_deinit()
    sparx5_ptp_deinit()
    sparx5_destroy_netdevs()

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Daniel Machon (7):
      net: sparx5: call sparx5_start() last in probe()
      net: sparx5: move netdev and notifier block registration to probe
      net: sparx5: move VCAP initialization to probe
      net: sparx5: move MAC table initialization and add deinit function
      net: sparx5: move stats initialization and add deinit function
      net: sparx5: move calendar initialization to probe
      net: sparx5: move remaining init functions from start() to probe()

 .../ethernet/microchip/sparx5/sparx5_calendar.c    |  15 ++-
 .../net/ethernet/microchip/sparx5/sparx5_ethtool.c |   9 +-
 .../ethernet/microchip/sparx5/sparx5_mactable.c    |  27 +++-
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 149 ++++++++++-----------
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  12 +-
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c |  13 ++
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c   |   2 +-
 7 files changed, 135 insertions(+), 92 deletions(-)
---
base-commit: 17d0056f71b13050317a662a505b1a36fb7009e5
change-id: 20260216-sparx5-init-deinit-037cf165c62e

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


