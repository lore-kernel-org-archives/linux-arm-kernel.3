Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0530D2B926
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nZZY1j6lruDhvG/h3+xAtH8wcYPIPJCMop18ebQESXA=; b=hlChcrwCafxfaRNA5iwrVNFrri
	U4w2a5hFvoR/mRuI6fwQYtWyMBFQbVw7cCkpEW3rjVYL3ELqjrz14c64hmyltMUzFRRRH+4KD77Eb
	hw2+MCPOikWVqAPBI3Vw/Wuuc7m3rZlYTeISs8duZxF4F4pDYSs4FG5QWMp5PllUBE42NFg1hrFGb
	nLJSRH6S3/pVj4utIkk03HMe1rmVbfqPh3ZKskLDPJd48N4uN+azNpK+EBQ59GndfVsjxVwAm1QJx
	odlzUaSrifXSlxBTyRPNGxTlgOuM5t+Rj6KTdypHcuAKMeDN09K+FwXpfTTkgFcI4YrWtIf3yIZUn
	HqOS7u3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JVW-0000000H6vv-0FdP;
	Tue, 05 Nov 2024 13:22:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8JTo-0000000H6lc-0NUA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730812820; x=1762348820;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t4B7PF0GVND0Gy78sX+dlhk6AmSUO1xVVVrNeGvJcPk=;
  b=Y1EOqqaV4Saf314HagFyZ4WUdi1mqU+TLf1b8/T4gmaC+eO4EvApe85D
   tJTZne2rPwiOTwQJWvSMulwF9LQBBD4esPaSYKlZm3nWWUvyzxH6bGxKA
   2eqTxKWqoUbjNW0klLdcatVJhmy6k+GOWFlmj/BIPtXGE3GOpBGnSnEU0
   yFavRBdUy7798uoHKgx7EkXl5Q238vMKYQ9UrXeJwfBb/zB/P9JAI7wON
   QI9YtG9/ypB4MgHyzmNBsBWk8UDQdi4fAFbAllqpnVKzmAiPs1JU4Ji/K
   ZaZuGH82m7h+m+84auDmMlFFVfaDVl0qFKzNLu7t8u9lWQoIDQ1V1Srm2
   g==;
X-CSE-ConnectionGUID: 7UwmSSx7Sxu5wyqCow4vig==
X-CSE-MsgGUID: uSOrPrBvQjyXZyAaZGLjqg==
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="34411485"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Nov 2024 06:20:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Nov 2024 06:19:57 -0700
Received: from archlinux.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 5 Nov 2024 06:19:55 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <richard.genoud@bootlin.com>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <hari.prasathge@microchip.com>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH] tty: atmel_serial: Use devm_platform_ioremap_resource()
Date: Tue, 5 Nov 2024 15:19:46 +0200
Message-ID: <20241105131946.22449-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_052020_337279_1DA0444F 
X-CRM114-Status: GOOD (  11.35  )
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

Simplify the request port function by using a single call
to devm_platform_ioremap_resource().

This will also enhance the printing from /proc/iomem:

cat /proc/iomem | grep flexcom ; cat /proc/iomem | grep serial

f0004000-f00041ff : f0004000.flexcom flexcom@f0004000
f8020000-f80201ff : f8020000.flexcom flexcom@f8020000
f0004200-f00043ff : f0004200.serial serial@200
f8020200-f80203ff : f8020200.serial serial@200
fffff200-fffff3ff : fffff200.serial serial@fffff200

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/tty/serial/atmel_serial.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 09b246c9e389..e1107f14ec98 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -2419,17 +2419,11 @@ static void atmel_release_port(struct uart_port *port)
 static int atmel_request_port(struct uart_port *port)
 {
 	struct platform_device *mpdev = to_platform_device(port->dev->parent);
-	int size = resource_size(mpdev->resource);
-
-	if (!request_mem_region(port->mapbase, size, "atmel_serial"))
-		return -EBUSY;
 
 	if (port->flags & UPF_IOREMAP) {
-		port->membase = ioremap(port->mapbase, size);
-		if (port->membase == NULL) {
-			release_mem_region(port->mapbase, size);
-			return -ENOMEM;
-		}
+		port->membase = devm_platform_ioremap_resource(mpdev, 0);
+		if (IS_ERR(port->membase))
+			return PTR_ERR(port->membase);
 	}
 
 	return 0;

base-commit: 2e1b3cc9d7f790145a80cb705b168f05dab65df2
-- 
2.47.0


