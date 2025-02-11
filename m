Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E98C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=grh7652BZFj/OFJeywD5HQHLa272qGnXVQq7NJxaSmw=; b=neR/dYuAy7CYpu7F2OmYDjFYBD
	kKcolDZ20C6rforJBEzn6Ac+K+dSVrxWEE3wXmqcG61mF7N1r+S0NL14OjDe0ioUtPUbD8h3DUJaa
	nYSpjyrCmSDf31mHBCSX9QwsOv7x7MxrsEOOpO2BhwducYmjULybS6ITSKopHXVHw+ARRac3DvL+8
	8kH5GQC8DnS6dkFYy6hTu3pOZ9muyBCBmEdNQAu2J0h0/Pslr8nRi/RvaMT3phLEsxkvzJmLWXe8B
	YfiR017ZPA7sOcYKU1LV0cdVlZjwsddYYhPDggcSjlA90ha/YMrVSrpCJPgp/PykEbCAnP4wAEnNZ
	2JC2S+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thrO4-000000049Bl-3HQP;
	Tue, 11 Feb 2025 14:37:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thrKo-000000048Fq-1eGQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 14:34:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739284438; x=1770820438;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ju8fNtGm/9M0KfuQYUcyEL4d/QiET4gCUmWGNpIcfPE=;
  b=2lm/I1XR57Yw8gc+Fwz376esd4/0DBPV5xwb9r99sUfzt5g9JfrfwDSN
   oU6+RMbtD7iZxqNvRCsUXoGGH5U1Zuuw13EwseHn/pC9fkYk8uZik31dn
   8uBzIxjHLknCZ0Q+NHBlxhxiS4fklosZk+0e8gIb1k9NBpm3pXMak6ksO
   g9dvhXLV4TKttHHrUV8zPl1CosBwZIzK8e5/uquvZxHrHG9L/j6WmYKyf
   ZgJ2H0mzF28R6r4K5HbwLxJtxoQj7LWWi6TPJK8vbwigOrCN+Fo3IXn3Q
   1X1987v8GpYGTWH8AACQ8gH7UKMlv8V93m9uBRjJCiX4wXfvh/fGAZx1G
   Q==;
X-CSE-ConnectionGUID: 35UA5pLrQAmrHtJwTcQ8OA==
X-CSE-MsgGUID: t5KqAL4RToiGYpnbPSX4+g==
X-IronPort-AV: E=Sophos;i="6.13,277,1732604400"; 
   d="scan'208";a="37535217"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Feb 2025 07:33:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 11 Feb 2025 07:33:25 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 11 Feb 2025 07:33:23 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH 0/2] Add power monitor support on sama7d65-curiosity board
Date: Tue, 11 Feb 2025 16:33:00 +0200
Message-ID: <20250211143302.4102-1-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_063358_551322_6BF410CB 
X-CRM114-Status: UNSURE (   6.23  )
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

This patch series adds power monitor support on Microchip SAMA7D65 Curiosity board.

[root@SAMA7D65 ~]$ lsiio
Device 001: pac1934
Device 000: e1000000.adc

[root@SAMA7D65 ~]$ awk -f pac1934.awk
VDD3V3   current: 146.173 mA, voltage: 3302.73 mV
VDDIODDR current: 62.1356 mA, voltage: 1353.96 mV
VDDCORE  current: 242.248 mA, voltage: 1204.36 mV
VDDCPU   current: 213.565 mA, voltage: 1303.05 mV

Mihai Sain (2):
  ARM: dts: microchip: sama7d65: Add flexcom 10 node
  ARM: dts: microchip: sama7d65_curiosity: Add power monitor support

 .../dts/microchip/at91-sama7d65_curiosity.dts | 52 +++++++++++++++++++
 arch/arm/boot/dts/microchip/sama7d65.dtsi     | 21 ++++++++
 2 files changed, 73 insertions(+)


base-commit: febbc555cf0fff895546ddb8ba2c9a523692fb55
-- 
2.48.1

