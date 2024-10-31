Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA4FE68960
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 09:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U9LkV+rq/H9we/2rNOGIF0m4NvoRYUMVY6IOkk0Hvn0=; b=SqqrBgYs9BZMBX1YHdNrE+DzgI
	T4reeVp7HeMm6q5oWDJSEhjbgqSQswTc9anBfgvB1w6df28ZJB6+VLMvwTSmPCeDvT7Hfxn3Ef7Pm
	UeHu4CF5EMGPw131tovThStw9ImyIUeVkcby1EJNKD54vP5oFrzLibrv3jcPEzuRC8HC3TeDRGV6J
	GfUjiRWn3O48BSZf9QoPtnOBHNVJYiPaKS04hcP3IVzd0fU/rQ9HL2i+kTpl+1RvEtkkQ8egsUVnK
	wwYatOBEOrZq1d/w4s8mmRmW6jc9tljop6GH4bAhG5hGcqLOjaIE6fUrGEcux4T6pSVcqC/UXturc
	uVx3WXvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RXM-000000035lB-1mZU;
	Thu, 31 Oct 2024 09:32:16 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RVh-000000035U2-3JZp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 09:30:35 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ceb8:3fda:3601:820f])
	by baptiste.telenet-ops.be with cmsmtp
	id WxWS2D0094BbGPD01xWSpB; Thu, 31 Oct 2024 10:30:26 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t6RVG-0061eS-VM;
	Thu, 31 Oct 2024 10:30:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t6RV3-006hZj-2d;
	Thu, 31 Oct 2024 10:29:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	Colin Foster <colin.foster@in-advantage.com>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: am335x-bone-common: Increase MDIO reset deassert delay to 50ms
Date: Thu, 31 Oct 2024 10:29:51 +0100
Message-Id: <9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_023033_989841_7591F8BC 
X-CRM114-Status: GOOD (  12.88  )
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

Commit b9bf5612610aa7e3 ("ARM: dts: am335x-bone-common: Increase MDIO
reset deassert time") already increased the MDIO reset deassert delay
from 6.5 to 13 ms, but this may still cause Ethernet PHY probe failures:

    SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC LAN8710/LAN8720 failed with error -5

On BeagleBone Black Rev. C3, ETH_RESETn is controlled by an open-drain
AND gate.  It is pulled high by a 10K resistor, and has a 4.7µF
capacitor to ground, giving an RC time constant of 47ms.  As it takes
0.7RC to charge the capacitor above the threshold voltage of a CMOS
input (VDD/2), the delay should be at least 33ms.  Considering the
typical tolerance of 20% on capacitors, 40ms would be safer.  Add an
additional safety margin and settle for 50ms.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
index a0fb431aec8411d8..212d7f867f8786af 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
@@ -409,7 +409,7 @@ ethphy0: ethernet-phy@0 {
 		/* Support GPIO reset on revision C3 boards */
 		reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <300>;
-		reset-deassert-us = <13000>;
+		reset-deassert-us = <50000>;
 	};
 };
 
-- 
2.34.1


