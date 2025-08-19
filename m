Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0A1CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 19:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LWAZGGRXFKNEXaYis0VNlm/q5c7F0BwKu2qEiDdgATg=; b=YiKfdmvU89EH66tTDA4HcxwnJl
	1TOHW4TO//PvVAVwt9WJOEK0lqnQsw+jr0fFYBqoRTmS01O2noIX31R8yJgehuOJCSNz0InwIxgPs
	Mg/r6zitveKvBsbRmzU6Amu1avK3NhUnL9ztBLFLCMUunVv83YQG++7ccX6UVt5+UQyK34Z6hr8ea
	niGJEWDuRgcUqAA8NYnLN83/0vppn/lIHlC134gncmADMvslj5EYuGPpVM0QRS529gZYSKlZutTrb
	EZpmQwOHXR+yh3yMvpucOr7X2RkntCFynF9NLiCRzGSCiPb50EnEifNe8k8erYJGYo4TxmEwYZZmq
	Ae8h1yuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRvH-0000000BP1u-101t;
	Tue, 19 Aug 2025 19:23:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoPm1-0000000B4R6-1Uad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 17:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1755623126; x=1787159126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MbRsZVZvuB6Ng5AOSMJdgGzWCRYi3h/Z+BwdF3senV8=;
  b=LAM42HxiH7WX3JDDYx0hgOdyt4Yi3tmWFWl8mGbEi+Cov2Np/gijHUlu
   ts9SCJbY8/RmNpvDtDzuFJJdED2HZE3pLjAW6qbGVjANMGX1S7WYBgo9A
   Mh7EHkZyPqGvi7wGWa4vc53TvmirHA9fLs72NokQ56AaLtn1ZM2IOMZAK
   HcEnXig0zrOBE09nZ2ZCPn+il/nPlMCI3Srdnq3oQdVyNNwWBPyqV7nj1
   cl0NzZ7wJuGP27iXYiYb8ywiF1l0DOx+jB678Jo+x1EJB6Z+Dli2WVAd1
   n7WpzgcKa0XEN3itXlYvdBUfQkncLPrrEyOqB1sx0OJYWobfaDFm34UM8
   Q==;
X-CSE-ConnectionGUID: LwN0KEJUSkiT7DO7RE6tdg==
X-CSE-MsgGUID: XMhFjc69RPqdj9hnILCL6Q==
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; 
   d="scan'208";a="45384092"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Aug 2025 10:05:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 19 Aug 2025 10:04:41 -0700
Received: from ryan-Precision-3630-Tower.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Tue, 19 Aug 2025 10:04:41 -0700
From: <Ryan.Wanner@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH] ARM: dts: microchip: sama7d65: Force SDMMC Legacy mode
Date: Tue, 19 Aug 2025 10:05:24 -0700
Message-ID: <20250819170528.126010-1-Ryan.Wanner@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_100525_543103_3A876FEE 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

The SDMMC in this IP currently only supports legacy mode
due to a hardware quirk, setting the flags to reflect the limitation.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
---
 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
index 7eaf6ca233ec..d086437f5e6f 100644
--- a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
@@ -387,6 +387,8 @@ &rtt {
 
 &sdmmc1 {
 	bus-width = <4>;
+	no-1-8-v;
+	sdhci-caps-mask = <0x0 0x00200000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_sdmmc1_default>;
 	status = "okay";
-- 
2.43.0


