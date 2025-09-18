Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BDBCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=guufnJxMHX+tN8RHfY1HmpQASUrRjO2qHddI4BqquD4=; b=hi1pvXGHAhe9Eo
	jfRs83yLqhbW6+Wh+Jg9kEmfZ84ty/hBu5rQTiPqKO3rO2XP0MWoDhLDYULMA4xpxmPUytRj06hVZ
	T5cJxKhLN1Fvz6FJuYm4C2hK8RpBVNnb0c6dJlbehB8cQ6x9QL+L8faRlcbLkX16rgCuKURgv+8qb
	AA4p9LSWsUVDLDXqb7RmMh/0PPf44JYq8eQNGpKS6XI7ZhCVHDi/mC5P+5YyaB3ET06JBQXtUXq92
	+Hp6LJlWJIdwcMiZ0mkyfoA8OAItUX9pKJYgjZybCwqZFfBcaSV9JnWqkRat6fDZXhdwUFzTXWSdp
	Soul3qb8fY8MrZFT7eVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAWS-0000000GnCk-3aiQ;
	Thu, 18 Sep 2025 09:01:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzAWR-0000000GnCW-3DVQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:01:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 248F76013E;
	Thu, 18 Sep 2025 09:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CA4C4CEE7;
	Thu, 18 Sep 2025 09:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758186106;
	bh=5rMvlimJ4W4wdpXOBkk6k7g6cY89cXqZ2dvZK554a0U=;
	h=From:Subject:Date:To:Cc:From;
	b=fvtLc8mWA99MkR1KcXW1Izmu9ujGbv8e7xYbBtE60LDXg7JFhQ9ZmuwsHQpAc5rfO
	 kG1xtFLR9dx/2DJUVSBGk/BNs6/+c+UQEMCXaTKph/Xbfr6w9MHu2AkGX0ZAlz7NFl
	 B+2Uj88Ro5eR6Dsk4lvljcTdAGy36gCQ913SDe7/GBWyxfPrtDddJE6195A4bU62M3
	 G6rNraF+R5zbSzR/p4/wuBtv8zAYWrjRNBlG8f/6Ib24cMDkBZfJqpqCSxDB2X2kBs
	 613xR/1lzWhzq+uJ3bVEhuP9xdCnDVa14Cqi+Yo05XPHibzGZmU7oO/XgWWAHrMf81
	 /8bcduPo4XRHg==
From: Vincent Mailhol <mailhol@kernel.org>
Subject: [PATCH 0/4] can: populate ndo_change_mtu() to prevent buffer
 overflow
Date: Thu, 18 Sep 2025 18:00:23 +0900
Message-Id: <20250918-can-fix-mtu-v1-0-0d1cada9393b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjKy2gC/x2MQQqAIBAAvyJ7bsEVguwr0cF0qz1koRVB+Pek4
 zDMvJA5CWfo1QuJb8myxwrUKPCriwujhMpgtGm1pQ69izjLg9t54dQaYuJAzlioxZG4qv82jKV
 86NIHbl0AAAA=
X-Change-ID: 20250918-can-fix-mtu-b521e1ed1a29
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Oliver Hartkopp <socketcan@hartkopp.net>
Cc: Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>, 
 Akshay Bhat <akshay.bhat@timesys.com>, 
 Wolfgang Grandegger <wg@grandegger.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Gerhard Bertelsmann <info@gerhard-bertelsmann.de>, 
 Yasushi SHOJI <yashi@spacecubics.com>, 
 =?utf-8?q?Remigiusz_Ko=C5=82=C5=82=C4=85taj?= <remigiusz.kollataj@mobica.com>, 
 linux-can@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 Vincent Mailhol <mailhol@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=mailhol@kernel.org;
 h=from:subject:message-id; bh=5rMvlimJ4W4wdpXOBkk6k7g6cY89cXqZ2dvZK554a0U=;
 b=owGbwMvMwCV2McXO4Xp97WbG02pJDBmnT2VySv215XKrFNlufMix5qL+53Wf9p0LSQzambRxC
 d/uPU7bO0pZGMS4GGTFFFmWlXNyK3QUeocd+msJM4eVCWQIAxenAEyk4wIjwzwdy03yEWF7r/91
 do/2FZNYwRHqnL9D2ogrevWtZzsVohn+Rzv28Yr+/3Gh9GNmZxWLiBLjufQ0br36fat9Mzf93c/
 NCAA=
X-Developer-Key: i=mailhol@kernel.org; a=openpgp;
 fpr=ED8F700574E67F20E574E8E2AB5FEB886DBB99C2
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

Four drivers, namely etas_es58x, hi311x, sun4i_can and mcba_usb forgot
to populate their net_device_ops->ndo_change_mtu(). Because of that,
the user is free to configure any MTU on these interfaces.

This can be abused by an attacker who could craft some skbs and send
them through PF_PACKET to perform a buffer overflow of up to 247 bytes
in each of these drivers.

This series contains four patches, one for each of the drivers, to add
the missing ndo_change_mtu() callback. The descriptions contain
detailed explanations of how the buffer overflow could be triggered.

Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
---
Vincent Mailhol (4):
      can: etas_es58x: populate ndo_change_mtu() to prevent buffer overflow
      can: hi311x: populate ndo_change_mtu() to prevent buffer overflow
      can: sun4i_can: populate ndo_change_mtu() to prevent buffer overflow
      can: mcba_usb: populate ndo_change_mtu() to prevent buffer overflow

 drivers/net/can/spi/hi311x.c                | 1 +
 drivers/net/can/sun4i_can.c                 | 1 +
 drivers/net/can/usb/etas_es58x/es58x_core.c | 3 ++-
 drivers/net/can/usb/mcba_usb.c              | 1 +
 4 files changed, 5 insertions(+), 1 deletion(-)
---
base-commit: f83ec76bf285bea5727f478a68b894f5543ca76e
change-id: 20250918-can-fix-mtu-b521e1ed1a29

Best regards,
-- 
Vincent Mailhol <mailhol@kernel.org>


