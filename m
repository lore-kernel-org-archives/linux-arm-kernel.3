Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80282E65D32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 08:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5u8Yd7srLzNICkwS5m0ozwf+Lruuo6AdtKu7LNheZWg=; b=nRvhiajprloAQwMPbeLaJIS+d/
	FRC+cJqLdH5kJQwj+P5nQ+jMPIjVrpbRmFCBVYPnn5l2Y3XHiEr43N2WYZbtxjIaPUEtVP8ZsBVJp
	x0EpjmsUdfAtP7jOK8qnk016kA2DQkM4aMxU/4mKvBCrJHfdPFPr9e7q3nphMQYbPL1efw+5I1hJ9
	OX7ORirwuCZ8srPTxXF2bmgpPd11tfK4aN+c5mM5P5OPdYPng+FJ2OBg3iGeqbP+0gBn/0D7HEV51
	PazPcfrdCrgvkDfkO8aZBb4ARraVaP3kXUlneJEmdevodiPe7kBLGWOKPrwLfhYepNwqmYjdqLXNS
	8w8+LaNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEOgk-00000001spm-13AP;
	Fri, 22 Nov 2024 08:06:50 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEOfn-00000001sf2-3nuK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 08:05:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732262752; x=1763798752;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hux5Q8X2nef5Bcrui5OWpPRB1gIDoQFhpk4nkDN3EWQ=;
  b=ePQpQUfa65rVB6tJ5D55GvGfuGAz2gTDC0rivil7v7/ZNaZZZ8qkx7uQ
   8b2mc8I04FxhGOfLMV7BcPAi4pNCVSP6eUYvIbujP7wJIyfNYMRpQdoHM
   KCrSWhcgzXHZ9uIvBQtbz/jfLINk6XkVHjZwfh1ixddeHwMPM6FSi0JxF
   uOuWj8vOiq0u9LG9uGwHs+VcIWw6e26Pkq1JCwor4ebo0KYabnmHAly1Y
   KpiVRoKy+U1V8QzxU8f2g3n/dvQqO08SewY66eYExbJJYrQjeEDgZ3Vb+
   Yx+y8mzrRjkAAbzMhpkiQLHFbPbDpjOa0fdOKHytXBLSK8O0PKmTK5lGX
   A==;
X-CSE-ConnectionGUID: seBZEJAOQsKqub7xMw7SQA==
X-CSE-MsgGUID: oX8kSjsmThqCFdMRVuwI9Q==
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="34661804"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 22 Nov 2024 01:05:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Nov 2024 01:05:42 -0700
Received: from archlinux.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 22 Nov 2024 01:05:40 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/2] Add power monitor support on sam9x75-curiosity board
Date: Fri, 22 Nov 2024 10:05:21 +0200
Message-ID: <20241122080523.3941-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_000552_055167_84FC33F8 
X-CRM114-Status: UNSURE (   6.81  )
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

This patch series adds power monitor support and moves i2c address/size to dtsi.

[root@SAM9X75 ~]$ lsiio
Device 001: pac1934
Device 000: f804c000.adc
Trigger 000: f804c000.adc-dev0-external_rising

[root@SAM9X75 ~]$ awk -f pac1934.awk
VDD3V3 current:   15.7075 mA, voltage: 3298.34 mV
VDDOUT4 current:    8.436 mA, voltage: 1205.08 mV
VDDCORE current:  121.237 mA, voltage: 1250 mV
VDDIODDR current: 34.3125 mA, voltage: 1354.49 mV

Mihai Sain (2):
  ARM: dts: microchip: sam9x7: Move i2c address/size to dtsi
  ARM: dts: microchip: sam9x75_curiosity: Add power monitor support

 .../dts/microchip/at91-sam9x75_curiosity.dts  | 54 ++++++++++++++++++-
 arch/arm/boot/dts/microchip/sam9x7.dtsi       | 26 +++++++++
 2 files changed, 78 insertions(+), 2 deletions(-)


base-commit: 28eb75e178d389d325f1666e422bc13bbbb9804c
-- 
2.47.0


