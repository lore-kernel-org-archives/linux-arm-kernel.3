Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FC3C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 06:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u35dBdoTHw7Ziek9P37CcfGBRUiIBHiIOC9KAm09khk=; b=r/LJpWTSBNviN8
	OUfbExmr5+7679pD5Rr/bPILadHLTwkA7nbNAqiDZ2WV24W4gOhvyX+TjmJyO5tm1Y9yVrDYWMEZq
	OhRvSlnSIsC0qri3PlHKX1qvLQcoMZm1gNZjNUc6O7jZrDPAGDFEnHkGuLWGRXJsuV6e12L77EFd+
	5qLfN1e2aFrkN9XDmhGu9b6MJjbltTxm0JxWMxadM2ViBElItbOqswNOUy2Tx5XIDtMCDWbMUvsf+
	tHk7fdpDDc1Ux6QBqX3eqAHUEhIiPhIKqsRVXmzo5dybtTfcvOvZ8aUqmfLPAz8Ye3xVg9hrquTKq
	qYSH2XbCU+ZZOytY5DJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKA58-0000000CHMB-1Vbq;
	Wed, 28 May 2025 06:16:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKA2z-0000000CH7B-2h0U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 06:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748412834; x=1779948834;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=dGXYE/DiAwj+uOxmvi69MBxG9FwMrkP4VaIHvYdkff4=;
  b=IQgMQt1P5IeC1t7frU4QC2TZP0fl0SbkjejK4TEDMV01hx4U+fis74Bt
   x0EBvzWIv/WwSf+Uu37MUozcKUvH3ZncgRQQ44/KZVvYD6IuKKi36S8yi
   iQ+AlIew3YprzKskBa628O3McJlmzCmywJDaM3fUB+NUI5mDiNihh79gI
   nmnNM38uzTgEOXECofhF9mefDU1NYhcR3LGdOYN5bw4Gl1OGTnjcuD78v
   ICGbeM7TUhJDwcDnpueYb+/N9pD60nee++CibpDki7xnwosp5m6wF+dU7
   rdSmyOhsjlnxuqVyuGPm4Y0mHFckIa/4JpryKbr64z7uhSRAGgvcjWrkm
   w==;
X-CSE-ConnectionGUID: Na4ii3iOTbObYzT6z7QrlA==
X-CSE-MsgGUID: ztvcs+Y1SXeDgHiUPfKLeQ==
X-IronPort-AV: E=Sophos;i="6.15,320,1739862000"; 
   d="scan'208";a="42149723"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 May 2025 23:13:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 27 May 2025 23:13:16 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Tue, 27 May 2025 23:13:12 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: [PATCH 0/2] TCB: Add DMA support to read the capture register AB
Date: Wed, 28 May 2025 11:43:03 +0530
Message-ID: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG+pNmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyML3dzkjALdkuQk3ZTcRF3TRCNLQxOLtFSzVDMloJaCotS0zAqwcdG
 xtbUAjG8sgF4AAAA=
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748412791; l=1279;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=dGXYE/DiAwj+uOxmvi69MBxG9FwMrkP4VaIHvYdkff4=;
 b=zV5Oyny2gAL5OxDkogoxJfETHlTsLTFHxNGEk/be2hY9iGYHrsZLVJhkFH6yjjXD/KQsIIC3X
 zGHJ4QN+DkWCp6r0lAU0fW7PsdUlTwx1qU5X/XQ7oCkPQcINu8gSh0X
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_231353_810060_B2EEF3D0 
X-CRM114-Status: GOOD (  11.45  )
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

This patch series adds support to enable the DMA support for TCB.

When DMA is used, the Register AB (TC_RAB) address must be configured as
source address of the transfer. TC_RAB provides the next unread value from
TC_RA and TC_RB. It may be read by the DMA after a request has been
triggered upon loading TC_RA or TC_RB.

-----------------------------------
This is tested on sam9x60 curiosity

root@sam9x60-curiosity-sd:~# cat /sys/bus/counter/devices/counter0/count0/capture0
258428554
root@sam9x60-curiosity-sd:~# devmem2 0xf800800c 
/dev/mem opened.
Memory mapped at address 0xb6f78000.
Read at address  0xF800800C (0xb6f7800c): 0x0F674E8A

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Dharma Balasubiramani (2):
      counter: microchip-tcb-capture: Retrieve and map parent base address
      counter: microchip-tcb-capture: Add DMA support for TC_RAB register reads

 drivers/counter/microchip-tcb-capture.c | 128 +++++++++++++++++++++++++++++++-
 include/soc/at91/atmel_tcb.h            |   1 +
 2 files changed, 126 insertions(+), 3 deletions(-)
---
base-commit: fefff2755f2aa4125dce2a1edfe7e545c7c621f2
change-id: 20250528-mchp-tcb-dma-5a29148fe6e6

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


