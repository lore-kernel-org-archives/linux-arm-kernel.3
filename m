Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBF5C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 06:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=W7UUoSU/JKBYw8AcTXyc+/yk9Zl2lFIybimWyZEP1ZU=; b=JCHMq4L28fef74V4CTK3roiBU+
	6pKpD5JaKk4ZhJY9kP2WbFA/Pp3IgvbzduSakM45ubhFFdIjQi8M+oMzLkBblvv/kVTyK4xzao0Zf
	aaPy/tKnQrmIyl0p7oUec2AMKGCXadQDKdqGo+sfznVwFaHn+Z2YkoJxY9ceHF80FtYKG+5QiDQOK
	UOTIoxMEaNQXwbAS5OA0XfFeGZcKayXYhcKdItARTGq67bL7pEZCVOqZHqgH0nIlDSrZJkBh9Qafi
	PhQeV0mmYu2fv4rnA2mL7+jLeexWdu4XduKx/jEDlp5HX26VQkE2fYxtLjscVSTKcB3NcEWsfYhV1
	EKxZNnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud1Bk-0000000DxLA-2ryH;
	Sat, 19 Jul 2025 06:36:52 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud19J-0000000DxD6-1GMr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Jul 2025 06:34:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8F43103AF666;
	Sat, 19 Jul 2025 08:34:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1752906855; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=W7UUoSU/JKBYw8AcTXyc+/yk9Zl2lFIybimWyZEP1ZU=;
	b=h8Rj8wJroOAmiypYvhf19SAuBvsOZATkKuF9QiNEl8FQq2Cv7pqZUybmESTBxhl4EPrWwS
	L6gVuXU1WwWz7qtUWikP5VkfJdtfJxHRJUcXCK/aGu9UJvGzaJNaZT7YiNXhDAJuZ951l0
	DnzjkOiXYVge+4077QucLV1BsrvTo8FQW3/74xH0R5LTb9EbP0AIhc4ap8PnZLr1gOckh9
	9MI1LMzM5rIE9NNOyNIDHZw1tnN5h3wKPcWIxB/HF9OM13aji3pc+mXaSdDPzVK+5NPt7d
	GapLCq/2buSnFDFdHv5XZFspY5GQsXRjkn4OyJ47ZVGpLjcI2/XnNqS8Iy2DFg==
From: Heiko Schocher <hs@denx.de>
To: linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Heiko Schocher <hs@denx.de>,
	Andrei Lalaev <andrey.lalaev@gmail.com>,
	Chanh Nguyen <chanh@os.amperecomputing.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/3] spidev: introduce trivial abb sensor device
Date: Sat, 19 Jul 2025 08:33:51 +0200
Message-Id: <20250719063355.73111-1-hs@denx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_233421_497465_E84ABCAA 
X-CRM114-Status: UNSURE (   7.85  )
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


This series introduces the changes needed for trivial spi
based sensors from ABB, currently operated from userspace.

The last patch adds the spidevices to the DTS files, already
in mainline.

make dtbs_check showed no errors/warnings for the dts files

  DTC [C] arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-adpismarc.dtb
  DTC [C] arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios.dtb
  DTC     arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtbo
  DTC [C] arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-proton2s.dtb



Heiko Schocher (3):
  dt-bindings: trivial-devices: Document ABB sensors
  spi: spidev: Add an entry for the ABB spi sensors
  arm64: dts: imx8mp: add ABB spi sensors

 .../devicetree/bindings/trivial-devices.yaml  |  2 ++
 .../freescale/imx8mp-aristainetos3-helios.dts | 28 +++++++++++++++++++
 .../imx8mp-aristainetos3-proton2s.dts         | 22 +++++++++++++++
 drivers/spi/spidev.c                          |  2 ++
 4 files changed, 54 insertions(+)

-- 
2.20.1

base-commit: 3668990919df7a8df60ab1f39ec95f59434b68ec

