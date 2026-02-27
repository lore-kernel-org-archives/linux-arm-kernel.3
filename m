Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0D8FD5306
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 07:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q6uv4JGxCzzJ5wFogz9MsQ867Z1+75zbzfN2R4Qjg0c=; b=VhSSFOBL4+GI6yeDcZeJosxaj4
	2kV8OpDTG34WJBj0MGQQ5nOywjhF2ZtVlKpBRVZaNHqCZzOicEYVoU27E6g9Mp+tKnzBo5uj2UDWk
	mkZdmKGpWJwTfmkD/deNd+M2V10yffYB9l74BjvJP61QDzEbcCJq5xhotRS4Ami57S7nzBBha7M9o
	Nw0KGt6i1tD4Q7aXyzmoTY5mPJoCjs/BtHWmDzafHM5zVXmV6Q4WMULq3IjgAgLoOR871TtqAEqtU
	T90bDSA1RjQLhDL5xjZe67sDGWRl5lOh96Bo5pL24q+u4ajgAn3MDNT7fOKtl1SVRKL5+Fr+mPmtJ
	8IBnpbSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsK5-00000007tJ9-2E3n;
	Fri, 27 Feb 2026 07:31:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsK3-00000007tIp-1g49
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 07:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772177499; x=1803713499;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dDaFwFVDAxlGWqUqbdgTb/VkU5CFjGwdHAfU4ODBCtg=;
  b=AhxYzmV+Au+p4FWwB3OGFroZnueTUv955jtnNfn3+7bsoI+vuA4K7Ef+
   th6fiLiv9J73vAjIdr865OnTKtrbTsX32VDVgTMyNOfbirN7GVTp/iZax
   uPojMZYtgOw0o0I3MyYkeXThsHIQ6c5wBNqa3uwpxARNMIfvJcR+ORE/2
   a74wRF72IbNoQSxgow1hqWj3XA8gwfvZXrErVGfGsNyf7TiKLj+tqhtwX
   0GSsvPcd72J7VxflC2lLNpypa/VVN6mGJg8k2tDA1pq1vewy59FPH3dTV
   G6E7Bo9VB+443FMvzBPknBCSp2VieLRKaNBTWN89Ttj5awz0qaUZTqNzU
   g==;
X-CSE-ConnectionGUID: vpDQk4TsSECHsMOlyQZBaw==
X-CSE-MsgGUID: fgIAV63zSnubCMpkLe64ng==
X-IronPort-AV: E=Sophos;i="6.21,313,1763449200"; 
   d="scan'208";a="221239577"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2026 00:31:36 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 27 Feb 2026 00:31:21 -0700
Received: from che-ll-i71840.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 00:31:17 -0700
From: Balakrishnan Sambath <balakrishnan.s@microchip.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balakrishnan Sambath <balakrishnan.s@microchip.com>
Subject: [PATCH 0/3] watchdog: at91/sama5d4: header cleanup and driver refactor
Date: Fri, 27 Feb 2026 13:01:13 +0530
Message-ID: <20260227073116.30447-1-balakrishnan.s@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_233139_525899_5B837C1C 
X-CRM114-Status: UNSURE (   7.04  )
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

This series cleans up the AT91 watchdog header and refactors the
sama5d4 watchdog driver.

The header reorganization introduces consistent register naming and
makes the WDDIS bit handling explicit for modern (SAM9X60, SAMA7G5,
SAM9X7) and legacy (SAMA5, AT91SAM9261) SoCs. The driver refactor
improves readability and fixes the reset regression introduced by
commit 266da53c35fc ("watchdog: sama5d4: readout initial state").

Andrei Simion (2):
  watchdog: at91sam9_wdt.h: Cleanup the header file
  watchdog: sama5d4_wdt: Refactor the driver

Balakrishnan Sambath (1):
  watchdog: at91sam9_wdt: Rename AT91_WDT_WDDIS to AT91_WDT_WDDIS_LEGACY

 drivers/watchdog/at91sam9_wdt.c |   8 +-
 drivers/watchdog/at91sam9_wdt.h |  65 +++++++------
 drivers/watchdog/sama5d4_wdt.c  | 156 ++++++++++++++++----------------
 3 files changed, 113 insertions(+), 116 deletions(-)

-- 
2.34.1


