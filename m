Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC862C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 07:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GPZXAdRVkxxso3trhMOuUYX6smFpWej31xIFr76d/wU=; b=F3eQ26XnxHuyy5bIMqbs8an0E4
	nmZsogssT2kiXMR6U3uiiiykvLxs8FW5LgvHaevh8mR1nxaH1xah/j7DpdcBkmuqnifWOCw3mAB5h
	GsCcn4fzBC5GT7Gob2cZRdEdJxWpYVQcyuV7DsMP+AyrQsQ+IEQMKsnJFcbotB2bv/BpYYLt4KAK+
	pB+0g7pVTjJnyP73O3AQSDF4zRpwyfKAQXheIz9Nyf3lZlM6hNDEBmwl1pOoUxqiFkbnP6It7A6EF
	+Rpgag4ujLqR5b9HFgt6cPdiH6pvAu/t+nf5Rd2C3YQIDd5DAZkJqT2nWz/2mVYFs6FhCeA6OTRzI
	rUpY64+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9mL-0000000CJEB-3AeC;
	Thu, 19 Jun 2025 07:33:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9MG-0000000CFnt-20B1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:06:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750316808; x=1781852808;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o//kVFDTunc99C0AXM+9AtF6fAsGoPk6QCMYBVVFa0Q=;
  b=Vdrjg+bfVQuxBzZcBT3r+IJAosYBjFHEemiWT50HHqNDY4KY9l9NE5LY
   +vMcr7f0wX197lQwK3/jND+EUWYcQ4JUPUfKkLE4JdlDrZLrXJm8pA4aU
   /VzM+NPStckB40Xw5ctQzCKSK00wcy5jXxDPXgVxkAffMCFuxO3hZeOdu
   SnrrklRvVnSD0jMxewm6uON0vnseWXUPmrceQ+UAIL4CJ/pEUhZvUom6Q
   woXk1Am8QKzZhughyN6vrtplPK4J8me4FKI7Xd8Bo0g0KO3YFsU6kKlpU
   VNv41EECXxloFNcEseJ9myRdimsK5mMJcqf7qCw77L11XleIG8KU8CluP
   g==;
X-CSE-ConnectionGUID: oDr9x4EZQ9ubUqoabc0KFg==
X-CSE-MsgGUID: lIjcawPLQnK5EqrSyawKcQ==
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="43565501"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 00:06:44 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Jun 2025 00:06:44 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Thu, 19 Jun 2025 00:06:41 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 0/2] Add cache configuration for Microchip SAMA7D and SAMA7G MPUs
Date: Thu, 19 Jun 2025 10:06:34 +0300
Message-ID: <20250619070636.8844-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_000648_707136_FEFC3788 
X-CRM114-Status: UNSURE (   8.07  )
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

This patch series adds cache configuration for Microchip SAMA7D and SAMA7G MPUs.
The cache configuration is described in datasheet chapter 15.2.

Changelog:

v2 -> v3:
- Remove the l1-cache node
- Move the L1 cache properties in the cpu node
- Align with device node requirements for cpu: 
  https://devicetree-specification.readthedocs.io/en/latest/chapter3-devicenodes.html#internal-l1-cache-properties

v1 -> v2:
- Remove the cache-unified property from l1-cache node

Mihai Sain (2):
  ARM: dts: microchip: sama7d65: Add cache configuration for cpu node
  ARM: dts: microchip: sama7g5: Add cache configuration for cpu node

 arch/arm/boot/dts/microchip/sama7d65.dtsi | 10 ++++++++++
 arch/arm/boot/dts/microchip/sama7g5.dtsi  | 10 ++++++++++
 2 files changed, 20 insertions(+)


base-commit: fb4d33ab452ea254e2c319bac5703d1b56d895bf
-- 
2.50.0


