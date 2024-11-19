Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AC2D4417C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 16:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f1gI6D33NZ2IATeIN580FJ3Lxiz3/eVT530U8udG6bw=; b=D/jcCR+oWwnYAtAHsHsHH54Rj3
	bKExqVricxmGt1+cKcxmLJ61Gt31+lC8rwXcHUSSLlmgSLjcCPzaIp/VZrUiZqYbV6t9DzN5iwib3
	cWk/RMlIFRyv3ihuKqvcIWAVSyfyInu6snTRnhRev1kUBWqrPNRuEI5FwjvHxC7nMUfCgg9pZ+BGN
	khrJy82xoO5kZ9bmNEZvEfOETa07an22ff4FmT18eTZTPMK6zURat1/Br/2drPMOiHQysw3lskG3d
	+N3O471SEJvCw0EDjqewHirY1yPkkjYp7AIEG6CFj0r7ASmdGMxxm3WgIPCVLKWeeF2lEKeODt7kH
	So3I6qqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQh9-0000000Cxsk-3W3t;
	Tue, 19 Nov 2024 16:03:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDQek-0000000CxSz-0G0s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 16:00:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732032046; x=1763568046;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gsWw2pf7NLkSqETGrHgG7uVkA3SCZQaKx+obLvvQtEI=;
  b=GSbghgLxts9KDQflrLgB/mMbepxkTCO2VsBsHo/jPM7Rr8EpaX2a1dmJ
   Az6KHwCo6yXJWlqXheyZDg8iJhXQDxGik7l1258e+pqQ6nEuaqwssfOEj
   yrXnZyPIzgmeyRH37y++umG1e43q7w8irt3PpqfelXsTlqek04NIdQgQB
   qd623fMHENcMC5VkJ99nFGYCtC/lTq4QphYMMdprckmJG0jlRoqZwBpN+
   pstMsH/P98BPvKNzbXzQOV7NU7Pt7vb/DsuAYuGp/lQ5O5ic3SUBhlUCG
   Unk5ebJFeqV01jA9L2TL8cwcmGMQeduUqLndyytUAMzB4ws99nyRrTkPs
   g==;
X-CSE-ConnectionGUID: 4O9knxboR1CTZIJk2gLi+Q==
X-CSE-MsgGUID: usIpRQTCTEe6UmfpC0mRew==
X-IronPort-AV: E=Sophos;i="6.12,166,1728975600"; 
   d="scan'208";a="265672313"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Nov 2024 09:00:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Nov 2024 09:00:05 -0700
Received: from ROB-ULT-M91496.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 19 Nov 2024 09:00:03 -0700
From: <cristian.birsan@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Cristian Birsan
	<cristian.birsan@microchip.com>
Subject: [PATCH 0/2] ARM: dts: microchip: Add no-1-8-v property to sdmmc0 node
Date: Tue, 19 Nov 2024 18:01:05 +0200
Message-ID: <20241119160107.598411-1-cristian.birsan@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_080046_100218_DF6F97B8 
X-CRM114-Status: UNSURE (   8.25  )
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

From: Cristian Birsan <cristian.birsan@microchip.com>

Add no-1-8-v property to sdmmc0 node to keep VDDSDMMC power rail at 3.3V.
This property will stop the LDO regulator from switching to 1.8V when the
MMC core detects an UHS SD Card. VDDSDMMC power rail is used by all the
SDMMC interface pins in GPIO mode (PA0 - PA13).

PA6 and PA10 GPIOs are used to enable the power switch controlling USB
Vbus for the USB Host.

Cristian Birsan (2):
  ARM: dts: microchip: sama5d29_curiosity: Add no-1-8-v property to
    sdmmc0 node
  ARM: dts: microchip: sama5d27_wlsom1_ek: Add no-1-8-v property to
    sdmmc0 node

 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1_ek.dts | 1 +
 arch/arm/boot/dts/microchip/at91-sama5d29_curiosity.dts | 1 +
 2 files changed, 2 insertions(+)


base-commit: 158f238aa69d91ad74e535c73f552bd4b025109c
-- 
2.34.1


