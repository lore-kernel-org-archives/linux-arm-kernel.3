Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14138C02190
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZWNfyHZT3dec0t5+LmNDlzWhnubpwjoc8YY+t8IQYiU=; b=qjuqTtHsK2VF5bvHLYEG4qV7n2
	efC3nM/tNE5Yp0TODB2Yq9BMqKP8Id0a9vHy6tBwCwHwurOf1ICYRGfz21+HlyuYTRvzDWaQHgz1E
	KCYbkQEK6IFQY/zBb/V/lHkSWpKFx+4ITAFihefqlTqwf15PfwCPBA2DRXhkwuQ7LOlWvxXQzheSk
	zg0ggX3cMg8+YHPPunCmkWpnXgGjtbITaLKCOVaE6/X9982eM9dQ6YKYuseugDGzXUswYHf1hLVHI
	kV3LOfUfocaJOTjYSq0+vSSrlsQMKYZnRx502y77bNZvE/W5GCLhmrW4ZqkVDnP24d5r9u5l5Gy68
	DX7UN7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoZb-00000005Lhl-3ARL;
	Tue, 28 Jan 2025 16:36:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcoJ9-00000005Igr-2DXq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 16:19:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1738081164; x=1769617164;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ERBHXKcK/ZgBB0KVQYHeIPLn64zY0LS2hMLJrIodcLI=;
  b=gp5U7lMSDDXrTANU9pA5Nv9ChGzBfVDtN1w8bMeDeh7acHrDbmprahim
   tf/IpGCzwfRB8n2xuTYZkB9z1hBReO+P7OviXKyBvtBzSUo++4Kt6qH2e
   Zs3wTsctZUafaElSrHbhnaZC7/SOeFQp3aczSRfGEGWV9V8i9sSRGoOAf
   EBCOvW9zCz0nymX/qo30284jdI7KPNGDLNXDBDPDgyAUIU6ON0rIh0isF
   7gv1ARRXgkCyUCUBs79lq3bfBuOY1F+1H+41hsrTF/dEYUp8seLdkxSut
   /2sViRpEhbttO4eK11s44bkuDOI1QhzLUhnyvrEoCfdJG6eAqu7OQMnaA
   A==;
X-CSE-ConnectionGUID: gZUkyJ0GT6+5er0WEIFfZw==
X-CSE-MsgGUID: MNAfTJv/RVekaf216foQ/A==
X-IronPort-AV: E=Sophos;i="6.13,241,1732604400"; 
   d="scan'208";a="37017195"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jan 2025 09:19:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 28 Jan 2025 09:19:01 -0700
Received: from ROB-ULT-M76677.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 28 Jan 2025 09:18:58 -0700
From: Andrei Simion <andrei.simion@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <broonie@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrei Simion <andrei.simion@microchip.com>
Subject: [PATCH 0/2] Convert atmel-ssc.txt to YAML
Date: Tue, 28 Jan 2025 18:18:41 +0200
Message-ID: <20250128161842.44541-1-andrei.simion@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_081923_740017_0C527616 
X-CRM114-Status: UNSURE (   8.60  )
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

This patch set converts atmel-ssc.txt into atmel,at91-ssc.yaml and
update the documentation file supported for MICROCHIP SSC DRIVER

Andrei Simion (2):
  dt-bindings: misc: atmel,at91-ssc: Convert to YAML format
  MAINTAINERS: Update the documentation file supported for MICROCHIP SSC
    DRIVER

 .../bindings/misc/atmel,at91-ssc.yaml         | 111 ++++++++++++++++++
 .../devicetree/bindings/misc/atmel-ssc.txt    |  50 --------
 MAINTAINERS                                   |   2 +-
 3 files changed, 112 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/atmel,at91-ssc.yaml
 delete mode 100644 Documentation/devicetree/bindings/misc/atmel-ssc.txt


base-commit: 9a87ce288fe30f268b3a598422fe76af9bb2c2d2
-- 
2.34.1


