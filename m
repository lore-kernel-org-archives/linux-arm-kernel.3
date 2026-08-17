Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F00C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ow2+sQJzHkZBqh8LFkpDPKw1EKsacCByj11xjdlfSRE=; b=LXTVOC4KG3WedY
	huN8K/gCVNLymwpdHm4KdiNZlUm0QOFgydwfyB/YlQWmSH1H5mbum0sZNf40x5PFXilMIwREbcxyD
	5Rb664ljhGi/54Mv1H4gYQPpyow82VN5zRVhSjFUHWgWFxtFNj+zgLkqeDuFePWyiXV43mV/OAX2S
	+u9S6FuI3l91po8kNxkFqbm1u/vb0klsFGzZ4OTjfVt+Pa/k3IHZ/RSYs5y6H0sWPDry9OfL9cmnr
	Oo/88EIqFcMedJ7Qc5Uvbn1bl8FdoJ9zhcXHfstMITLL5wHw0fYhbO7oannRpFn/Nfe2nm71Zsywa
	40yB7ogDhRuWP7nJW7gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzTX-00000006R9Q-0Bgl;
	Mon, 17 Aug 2026 15:42:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzTU-00000006R8t-1WOu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 15:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786981332; x=1818517332;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=Jtg5vk7ejVdQ82vIV6q0t9vsQQoXsAf++NSCdTq+K94=;
  b=2EPVHaCJoAx5fT6MnTWCOPHwW6N6S1BtduPAfS6QiGnUbxoztWJkFUaT
   RawkRsahBG2J6AoLCzC3XMX//Zc26/+PruPm1Lr8+jgIZKqmkqF2VkaA3
   3865M5rTLAdqjVtOQ/sd8Yv0Ujuh41J7aB7k59caD3bv/RUb8kTX97KSg
   S7d6rEEIvv63Y+uJdrkjf4jdJFgeDVLzauOj3uXR77CsOgaKdNU4JM2+E
   JdhlgTASqXnl+z5JlWshLxxtEGt19oSytGNT9UhSPXGFdCIym4qYZeVFs
   GMu3fQ9op+S5XJc8tyd+RuzbP55XHuDzVZ15I+X696Knto1uqWYGpZiPe
   g==;
X-CSE-ConnectionGUID: UMlPrz88T3myxF5gMCCkYg==
X-CSE-MsgGUID: EyJrNUZUSUWXyT0Xk0oBKA==
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="62559689"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Aug 2026 08:42:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 17 Aug 2026 08:42:06 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 17 Aug 2026 08:42:03 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net v3 0/2] net: sparx5: misc fixes for sparx5 and lan969x
Date: Mon, 17 Aug 2026 17:41:57 +0200
Message-ID: <20260817-misc-fixes-sparx5-lan969x-v3-0-c7c7fef723a8@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMUrg2oC/33OSw6DIBAG4Ks0rDsNgqB21Xs0XQDFOkkVA4bYG
 O/eCaumC5fz+L+ZjSUf0Sd2PW0s+owJw0SFPJ+YG8z08oBPqpngQvNatDBictDj6hOk2cRVwdt
 Mne5WsE50ujKq4b1llJ+jL3sUv7PJL+xBzQHTEuKn3MtVGRVa8fqAzhVw0PSA5Nqqppa3EV0Mb
 sD54sJY5Cx+NX2kCdJ6K6Q2hhq8/df2ff8CC16qQBkBAAA=
X-Change-ID: 20260428-misc-fixes-sparx5-lan969x-bc2961a570fb
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
	<bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, <kees@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <linux-rt-devel@lists.linux.dev>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_084208_703520_82A85C42 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

This series fixes various issues in the sparx5 driver, which also
serves lan969x.

Details are in the individual commit descriptions.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v3:
- Patch #1: retitled to net: microchip: vcap:, since the fix lives in
  the shared VCAP debugfs helper; name the VCAP debugfs entry after
  the stable port index instead of the netdev name, which can change
  at runtime (Jakub). Added as a new vcap_port_debugfs_portno()
  helper, so lan966x's existing per-port debugfs files are untouched.
- Patch #2: update sparx5_set_rx_mode() to return int, matching
  .ndo_set_rx_mode_async's return type, and propagate
  __hw_addr_sync_dev()'s return value instead of always returning 0
- Drop patches #3 and #4, already merged upstream
- Link to v2: https://lore.kernel.org/r/20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com

Changes in v2:
- Rework patch #2 to use ndo_set_rx_mode_async (Jakub)
- Link to v1: https://lore.kernel.org/r/20260504-misc-fixes-sparx5-lan969x-v1-0-6604306b5743@microchip.com

---
Daniel Machon (2):
      net: microchip: vcap: use port number instead of netdev name for debugfs
      net: sparx5: fix sleep in atomic context in MAC table access

 .../net/ethernet/microchip/sparx5/sparx5_netdev.c   | 11 ++++++++---
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c    |  5 +++--
 .../net/ethernet/microchip/vcap/vcap_api_debugfs.c  | 21 +++++++++++++++++++++
 .../net/ethernet/microchip/vcap/vcap_api_debugfs.h  | 14 ++++++++++++++
 4 files changed, 46 insertions(+), 5 deletions(-)
---
base-commit: e6a5d573d24cd375e09d24f136523cb3cc85c9d3
change-id: 20260428-misc-fixes-sparx5-lan969x-bc2961a570fb

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


