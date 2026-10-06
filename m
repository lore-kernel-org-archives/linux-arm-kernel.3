Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC41CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4H+TvhFzZJAUYfNmA9dZ0GzXWSX3nxxmo95n8TuNVnQ=; b=NUJ+xwJp44ovC9
	5YyB7qOE0VwaKENCVyOCxCwhp0YU3X0dt/jDRaIsLm7i4zWKD6rOt7E6D1EbKC55K/XME8a4Bd1Wh
	jr5uWu9Ss9qysuUp/RpuD1wJFc0EUXaUiSDGkAQVlI8sO0oYpS6a5clNAvOGVjakHHJXBrSab8uSq
	4eZ4AfU4DLaDv93JZUrNKSFh5aRj/xu/ElU8OpqaC7Yx3dOgB0rAWDeUV3MKDI+Z/VAuQmqfiHdVz
	7A5rnV+PjxT/jGlK28USG++faeYv96YW9TzHaVnZI2yM/O12WYOaUmXJqus1MFTLCAKkUOcGqBIU9
	SwjcrsgTkGVN+2qHiL4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5Zo-00000000u1U-1Lqx;
	Tue, 06 Oct 2026 13:51:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5Zm-00000000u0s-0vIZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791294686; x=1822830686;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=v9lEBvjdaqO6XwdYDIqvh1dxR9AHhNinpBUAg9b7Qhw=;
  b=ru6U7n+TNIOS9f8q0Ne4aRQha6w2gyGXdWIiyMI3xlpajB+PXYo82s3A
   Yb3qPjf619uK+EBg4p2Upxnh8VkxPQ8sFvSWM1x0JO3XtD1yIu8pKTaFz
   ZBGnOdGrAW3iYf6rGj5iAXfcf615ukg1CG7Xxz9X6O29L4N/BxVlH0kRY
   yuJMFJZ8gmVK0WQ+q6Sor6S51DLHztcp3xi6CbxOLkBAwtNBMXXOuUaht
   ltv4gSYoceb1KdyFVlJ+qnpyF9B7mThlpYLfRhpAIoIQdcp//2F7TjjKZ
   uW+e07s6oLGzHlB0JCIru9PanWEMW116NDSoW6zV4IlN7aCBEHUutOpES
   w==;
X-CSE-ConnectionGUID: +wFIaA0USQyKvtmAKQmJ9w==
X-CSE-MsgGUID: IYhRJQgaSj+cmdGukXM8WA==
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="231742330"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Oct 2026 06:51:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 6 Oct 2026 06:51:24 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 6 Oct 2026 06:51:22 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Subject: [PATCH net-next 0/3] net: sparx5: add TAS offload
Date: Tue, 6 Oct 2026 15:51:05 +0200
Message-ID: <20261006-sparx5-tas-v1-0-5eef1126dfd5@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMn8xGoC/x3MMQqAMAxA0atIZgNpwApeRRyKjZqlSlOkIN7d4
 viG/x8wySoGU/dAlltNz9Tg+g7WI6RdUGMzMLF3RB7tCrkOWIIhUxRmR+NIEVpwZdm0/rMZkhR
 MUgss7/sBfcsIHGYAAAA=
X-Change-ID: 20261006-sparx5-tas-20de2210770d
To: Daniel Machon <daniel.machon@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Richard Cochran <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_065126_593195_E8826A0E 
X-CRM114-Status: GOOD (  13.83  )
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

This series adds offload of the Time Aware Shaper (IEEE 802.1Qbv),
configured through tc-taprio, on Sparx5 and lan969x, which are both
served by the sparx5 driver.

In hardware, a TAS schedule is run by a TAS list, which steps through
gate control list (GCL) entries taken from a pool shared by all ports.
Sparx5 has 128 lists and 10000 GCL entries, lan969x has 60 lists and
3000 entries. An idle list is in the ADMIN state. Once started, it is
PENDING until its base time, then OPERATING. A stopped list is
TERMINATING until the end of its cycle, and then goes back to ADMIN.

The driver uses two lists per port, so a new schedule can be set up in
one list while the current one keeps running in the other. When the
new list reaches its base time, the hardware stops the old one.

The two chips differ in how a list addresses its entries: on Sparx5 a
list is a contiguous range addressed relative to its base, on lan969x
it is a linked list addressed by absolute pool index. The driver
handles both.

Frame preemption is not supported yet, and every queue uses the
default guard band of 1536 bytes. Making the guard band follow the MTU,
and taprio queueMaxSDU, are left for a follow-up.

Patch #1 adds the registers used by TAS.

Patch #2 moves the existing TAS link speed configuration to a new
sparx5_tas.c.

Patch #3 adds the taprio offload.

---
Daniel Machon (3):
      net: sparx5: Add registers used by TAS
      net: sparx5: Move TAS link speed configuration to sparx5_tas.c
      net: sparx5: Add TAS offload support

 drivers/net/ethernet/microchip/sparx5/Makefile     |   2 +-
 .../ethernet/microchip/sparx5/lan969x/lan969x.c    |   2 +
 .../microchip/sparx5/lan969x/lan969x_regs.c        |  10 +
 .../net/ethernet/microchip/sparx5/sparx5_main.c    |   2 +
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  28 +
 .../ethernet/microchip/sparx5/sparx5_main_regs.h   | 204 ++++++
 drivers/net/ethernet/microchip/sparx5/sparx5_qos.c |  53 +-
 drivers/net/ethernet/microchip/sparx5/sparx5_qos.h |   1 -
 .../net/ethernet/microchip/sparx5/sparx5_regs.c    |  10 +
 .../net/ethernet/microchip/sparx5/sparx5_regs.h    |  10 +
 drivers/net/ethernet/microchip/sparx5/sparx5_tas.c | 806 +++++++++++++++++++++
 drivers/net/ethernet/microchip/sparx5/sparx5_tc.c  |  17 +
 12 files changed, 1094 insertions(+), 51 deletions(-)
---
base-commit: a5e7d8e446af9803e37a3b6a4d416fb41178348f
change-id: 20261006-sparx5-tas-20de2210770d

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>


