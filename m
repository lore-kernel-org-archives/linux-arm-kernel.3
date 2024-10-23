Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEECCD0BB44
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/i3CPWC7f91GujstCmOeUx2/r8dxaHLtoGQzcDqIGQ=; b=cDt/VBA6nFq4ETEUM3Kknor/WS
	/bVJKEh3NB/Tb9aOP3TIZqV70mlBfWWZzNQfe9hSpGNGj9H04B5Itib8JJYEYq2t+bWTIVJWUmeqo
	HplgwIgi+ZNh4nUXfTqAL88Z7op0BCrmKMARChGy2lTa98kZitEtJQBKBVkgWCvk9NuycRnxZp+5i
	gncedC1wX2sPcpIjLYmmUB4u1kwyJQvho4Ki3Xe3Jk8s9rB2NwSeek6Xh8kog+/LmLTF76O/7AHDF
	Hvh0qvMC7eh2DOMDHRRjwKyqyoyuqFKaVfYC9Vkiwb8AyicFbFnvScti8ZZowbEjepTgK1uxN+iQE
	cB0Lf+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jmx-0000000G5be-3cZm;
	Wed, 23 Oct 2024 22:25:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jRS-0000000G2Mu-3Siw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720978; x=1761256978;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=0bLSVHi3wmgkjuXooygdVcmkriLaq4Scp7XshwDEe9M=;
  b=klwaEB8ClUlQGcdE/qvR/n8VP0lh9XaBKglPbnYBqYSl4B3+VFFE8kkB
   pG8gqtGuYUygKA9Lr78Bi3Fw79JFm4sIW0KAGN6L09JmZ/WmtjxY0t7Ga
   qaZkKLvG+Z7zU7ZEP+WhnZvBbb4ahNaEfHomavFA6CgCA5d/JLX1uclbl
   gWLRf7Ueu2a0UrXhlFGEqSV7aXXSihH1RagmrCxwpwpF/si+KWfEvet0B
   lrj3Hsk+Sa0ZthdYfNGoQl7IGJf3dVqRryp4iVPV5jmF10NDMV7i0js2f
   abg4SEd8x9n8f9rKzFEkp5j2+qhvWAB5DVjyckbhq3e1ddt6Xd6N3CZOC
   A==;
X-CSE-ConnectionGUID: oMPErp9qRFmiMc0P9W4Bgw==
X-CSE-MsgGUID: YgZYLg6ZTMm8JQNyIr1uWA==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="264507061"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:02:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:02:38 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:02:34 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Oct 2024 00:01:33 +0200
Subject: [PATCH net-next v2 14/15] net: sparx5: add compatible string for
 lan969x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-14-a0b5fae88a0f@microchip.com>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
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
X-CRM114-CacheID: sfid-20241023_150258_988855_7C5F5A6E 
X-CRM114-Status: GOOD (  10.16  )
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

Add lan9691-switch compatible string to mchp_sparx5_match. Guard it with
IS_ENABLED(CONFIG_LAN969X_SWITCH) to make sure Sparx5 can be compiled on
its own.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 741404ccd8f5..fde9e06b3458 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -24,6 +24,8 @@
 #include <linux/types.h>
 #include <linux/reset.h>
 
+#include "../lan969x/lan969x.h" /* for lan969x match data */
+
 #include "sparx5_main_regs.h"
 #include "sparx5_main.h"
 #include "sparx5_port.h"
@@ -1050,6 +1052,9 @@ static const struct sparx5_match_data sparx5_desc = {
 
 static const struct of_device_id mchp_sparx5_match[] = {
 	{ .compatible = "microchip,sparx5-switch", .data = &sparx5_desc },
+#if IS_ENABLED(CONFIG_LAN969X_SWITCH)
+	{ .compatible = "microchip,lan9691-switch", .data = &lan969x_desc },
+#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mchp_sparx5_match);

-- 
2.34.1


