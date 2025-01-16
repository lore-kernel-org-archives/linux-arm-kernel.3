Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B912FC02188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 23:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E5bbPGTI9HeBHp6uft5WuWFGh/pAe7B4U1Dpt+uYsDY=; b=06ZC1skX5o2t87Xu0SOl2VfY2c
	BjFBExTNpwsD42mBdAkRwofin5JnhK80T1eigChdz5Zvc9/zx9C0pNJjS9X64BzIe3zukuFwnWopT
	oy66il1FFW/kxi4wngkLj7APsh9N43c41+LdaDB6GLTcruMXzZJqHpMs14mFUJJHEh8dDq9UdAx3q
	6lg1TBiBUPJ1K1c2RwBBk9bThkQ3YqHGI/paKx4L6eINZEgxoOJ//gsQeSnYnK7ihphdCCAeaNbk1
	JMGRKZBz5XLHZXJxWTOfsEsatFxxHxpbD/CbxB2A5IOwbCkSNHMYyq2xQFYULZ+tP4eD/BbSluxbt
	dgXyMgOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZCL-0000000GPUY-2x0y;
	Thu, 16 Jan 2025 23:22:49 +0000
Received: from out-176.mta1.migadu.com ([95.215.58.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYZB4-0000000GOwd-2MSi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 23:21:32 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737069688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E5bbPGTI9HeBHp6uft5WuWFGh/pAe7B4U1Dpt+uYsDY=;
	b=oIwp6x3Kkv+fvJ4XRExuOdRI1k31QkJG0LvrOj4QQzEDaPYNTQEsjwSzrQ5Gbo3Ud9EKIK
	08zkwPOEZ/ud+N0uvkuhfSBqder/kTM0MItdCk9ssSSlLWMwv4Th3R/P/5VYcaK8jr3ykW
	FSD5n8WoavVBEIbWkkXN7R6KAllkDpc=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 0/7] spi: zynqmp-gqspi: Split the bus and add GPIO support
Date: Thu, 16 Jan 2025 18:21:10 -0500
Message-Id: <20250116232118.2694169-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_152130_879677_39E6CFF6 
X-CRM114-Status: UNSURE (   6.01  )
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

As discussed in patches 1 and FIXME, this device really has two SPI
busses. Split the existing "merged" bus in twain, and add support for
GPIO chipselects.

This series depends on [1, 2].

[1] https://lore.kernel.org/linux-spi/20250116224130.2684544-1-sean.anderson@linux.dev/T/#t
[2] https://lore.kernel.org/linux-spi/20250116225521.2688224-1-sean.anderson@linux.dev/T/#t


Sean Anderson (7):
  dt-bindings: spi: zynqmp-qspi: Split the bus
  spi: zynqmp-gqspi: Pass speed/mode directly to config_op
  spi: zynqmp-gqspi: Configure SPI mode dynamically
  spi: zynqmp-gqspi: Refactor out controller initialization
  spi: zynqmp-gqspi: Split the bus
  spi: zynqmp-gqspi: Support GPIO chip selects
  ARM64: xilinx: zynqmp: Convert to split QSPI bus

 .../bindings/spi/spi-zynqmp-qspi.yaml         |  43 ++-
 .../boot/dts/xilinx/zynqmp-sm-k26-revA.dts    |   5 +-
 .../boot/dts/xilinx/zynqmp-zc1232-revA.dts    |   5 +-
 .../boot/dts/xilinx/zynqmp-zc1254-revA.dts    |   5 +-
 .../dts/xilinx/zynqmp-zc1751-xm015-dc1.dts    |   5 +-
 .../dts/xilinx/zynqmp-zc1751-xm018-dc4.dts    |   5 +-
 .../boot/dts/xilinx/zynqmp-zcu102-revA.dts    |   5 +-
 .../boot/dts/xilinx/zynqmp-zcu104-revA.dts    |   5 +-
 .../boot/dts/xilinx/zynqmp-zcu104-revC.dts    |   5 +-
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    |   5 +-
 .../boot/dts/xilinx/zynqmp-zcu111-revA.dts    |   5 +-
 .../boot/dts/xilinx/zynqmp-zcu1275-revA.dts   |   5 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  15 +-
 drivers/spi/spi-zynqmp-gqspi.c                | 328 ++++++++++++++----
 14 files changed, 359 insertions(+), 82 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


