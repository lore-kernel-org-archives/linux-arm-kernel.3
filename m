Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AED8C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4s03yPEhF45+lWh5hyBpMppSw2oqj+GdWmyYq1pWC3U=; b=x9MIMKB6kCLJKliptAX4i+ng0h
	7jS7BA4SsX4OGFuqKKRcWnZcAN4wS6J6evy38UQI2iafI+OHALjJetNtoBbhh0jhKfckyFa8tmMTb
	0CVlcfYrCFqA/h27aTskJoSum/WmsJPMEeVTo9M3FCgvrFvB4DnFrSKytgTt1tZz7sO+v40ZEblzN
	fYa/UfSQ/5oKeCNnP4+v40Q5BO7c83r3iZMGpTDNkdozekdIBoyAtm61BFQYni6iZ2eLyIrafbSLX
	37GkNilKtN8/dKloKnuOXVCJvero4q0qDu9TRteDzGmzGw430SOzWItoweB9nOEWIdg33KqBP3TA5
	jOPvB1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHwD-00000005eel-0nXu;
	Mon, 16 Jun 2025 22:04:21 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHtC-00000005e6I-47Lc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:01:16 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4s03yPEhF45+lWh5hyBpMppSw2oqj+GdWmyYq1pWC3U=;
	b=iL+3CM+DtVo4+gmEcNyja3IwWUGWPIvvvUP9mUdkZpBaCIC8Z8NAxdgHcEBFZgeO8YSfJa
	oNioV1esuk2dUqqUWhTtNaQH8m1XvDXAl6NtTGNZf1TOwE849tKso4U0wbTTOG6SBRnFox
	+qb/om8Jl/33MlLXRAD+sz9iVuLAUT0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/9] spi: zynqmp-gqspi: Support multiple buses and add GPIO support
Date: Mon, 16 Jun 2025 18:00:45 -0400
Message-Id: <20250616220054.3968946-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_150115_442186_B7A14A23 
X-CRM114-Status: UNSURE (   8.88  )
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

This device really has two SPI buses but they are currently determined
by the slave's CS. Decouple bus selection from CS, and add support for
GPIO chipselects. This allows adding arbitrary devices on either bus.

This version does the bus selction using a spi-buses property in
slaves's node, as opposed to having separate nodes for the upper and
lower buses. This should be backwards compatible with existing bindings,
and could allow supporting "parallel" memories in the future (identical
flashes on both buses controlled in lockstep).

Changes in v2:
- Add spi-buses property
- Update spi-zynqmp-qspi.yaml with new binding style
- Support multi-bus controllers
- Add flag to determine default bus
- Support multiple buses with spi-buses instead of explicit
  upper/lower/merged buses

David Lechner (2):
  dt-bindings: spi: Add spi-buses property
  spi: Support multi-bus controllers

Sean Anderson (7):
  dt-bindings: spi: zynqmp-qspi: Add example dual upper/lower bus
  spi: Add flag to determine default bus
  spi: zynqmp-gqspi: Support multiple buses
  spi: zynqmp-gqspi: Pass speed directly to config_op
  spi: zynqmp-gqspi: Configure SPI mode dynamically
  spi: zynqmp-gqspi: Support GPIO chip selects
  ARM64: xilinx: zynqmp: Add spi-buses property

 .../bindings/spi/spi-peripheral-props.yaml    |  10 ++
 .../bindings/spi/spi-zynqmp-qspi.yaml         |  22 ++-
 .../boot/dts/xilinx/zynqmp-sm-k26-revA.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zc1254-revA.dts    |   1 +
 .../dts/xilinx/zynqmp-zc1751-xm015-dc1.dts    |   1 +
 .../dts/xilinx/zynqmp-zc1751-xm018-dc4.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu102-revA.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu104-revA.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu104-revC.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu111-revA.dts    |   1 +
 .../boot/dts/xilinx/zynqmp-zcu1275-revA.dts   |   1 +
 drivers/spi/spi-zynqmp-gqspi.c                | 155 ++++++++++++++----
 drivers/spi/spi.c                             |  31 +++-
 include/linux/spi/spi.h                       |  15 ++
 15 files changed, 208 insertions(+), 35 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


