Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE081C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hrfOFVYtqSA4RPeMk5t0kgZgaYsp66JgGoi+frkDnGY=; b=aeDjBOWYZRdg6HqIwY5e9MHAwq
	zJ6G4pZEhnyoqzGasxJdDtc7hsHW5XA/Z3BcgA1BRGyy+UbF5qP/K4DzwoGF9acHPNodhBpn3nYDj
	q403dJ01EZvygTH54wYmcwW37XUNgt43GMxsKSZKfBgAtkUwOJZOXhhvMQ5NR1Dt4bhR8ouk+PQtT
	ILiBvr+rlV6qG0YAQkNQWKzuHjyvbCPSKKnopg5iXaGE308LLepwv1n4r7BsjhWrg6to7lOO99IhE
	gwI3E9eG8syCLY9qaYR1kOkARRalG/GVTy4Z6KEH9aWTenwt8QkEavjB0e803LOc6VhQwqtl5BjY/
	wFsSJYrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ws8-0000000EFD5-3b8e;
	Fri, 18 Sep 2026 11:35:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wrw-0000000EF2C-1cZa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:35:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789731305; x=1821267305;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=pLLUnpsQHk0XLLoB+wBplrU8A7WIjOzUca/wCfOw6mw=;
  b=Zgkx/100fRkZE5bLWIi8J526ylPkF/prTEVeeSEa5JUV2qyqXZXYNiR9
   7tKBZTHEXGqgzPDyBZsjRueu7em+RKYhf8IofzrgMg30UQTsiDu664pZB
   tZLuJOQr32BA3896Ljb21QdFZRb3jCgEnnUTYlaokXOAoMIrnZhZCBsR3
   A9SQ2q8acFCOVkKGbGRvvFj3trUBlq8l2q7JIrAAfuznunWOxlpxPVVX/
   Z3BOubhKtUdTjx34Ep3F9rWGysKGNcTTe3M4xDRL5HSPukuwaiElQ3icP
   tm+VVdp0TPVRrQkWwq38+nwu3bIGnaNnRd5cjjRuMAVN1TR7ldD2Z9Dse
   A==;
X-CSE-ConnectionGUID: UKadeTgMQlCsweVzlz2kNA==
X-CSE-MsgGUID: nwVHFmhVRnuLz53ZcMhigg==
X-IronPort-AV: E=Sophos;i="6.27,108,1787036400"; 
   d="scan'208";a="295223747"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 04:35:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Fri, 18 Sep 2026 04:35:03 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 18 Sep 2026 04:34:59 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 18 Sep 2026 13:34:05 +0200
Subject: [PATCH net-next v7 13/14] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260918-lan966x-pci-fdma-v7-13-0ecc179c8a2c@microchip.com>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
In-Reply-To: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Steen Hegelund
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Jesper Dangaard Brouer" <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, Herve
 Codina <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>
CC: Richard Cochran <richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_043504_449000_6C0D4553 
X-CRM114-Status: GOOD (  11.72  )
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

The ATU outbound windows used by the FDMA engine are programmed through
registers at offset 0x400000+, which falls outside the current cpu reg
mapping. Extend the cpu reg size from 0x100000 (1MB) to 0x800000 (8MB)
to cover the full PCIE DBI and iATU register space.

Tested-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/misc/lan966x_pci.dtso | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/lan966x_pci.dtso b/drivers/misc/lan966x_pci.dtso
index 7b196b0a0eb6..7bb726550caf 100644
--- a/drivers/misc/lan966x_pci.dtso
+++ b/drivers/misc/lan966x_pci.dtso
@@ -135,7 +135,7 @@ lan966x_phy1: ethernet-lan966x_phy@2 {
 
 				switch: switch@e0000000 {
 					compatible = "microchip,lan966x-switch";
-					reg = <0xe0000000 0x0100000>,
+					reg = <0xe0000000 0x0800000>,
 					      <0xe2000000 0x0800000>;
 					reg-names = "cpu", "gcb";
 

-- 
2.34.1


