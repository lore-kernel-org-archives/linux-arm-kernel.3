Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E82C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HpB5lB6azzxlrJkYukifNhmmPqI9KsgkZ1X5toy37xk=; b=D3Aafzt5ai4Q9wLUcTJtMcJMIH
	nw+4AvA/16f+SH1FJ6efoGiUfIRVgr61eDjvqnVqjGdK7L2k1wN2eQ9tLUhsYxpGPKWaB2Vn/JE1k
	AYe85u+CDg3jUxBOlrHpXa3AiV9zZfBCeRG4opXjdW+3rtWcKh4to5LfZgv8Sjdq1ZiM1zLsb6llt
	iF4TFjxRpyOs9fxohe+gXQJZoMs/bzrjYKn8TpdJtGfEqbUU4YNZ9tSgN59pmBOp2yw7Y9qLB5X9c
	PsQzEnl/F14NEO3edDSPb/ZVCrqAYCfvRcG2ql/JXaxUCM8IBxkSJbMMtz1mSUTvrvGB/ZFzDyquR
	P0koCNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYnG-0000000GGEB-3vss;
	Thu, 16 Jan 2025 22:56:54 +0000
Received: from out-175.mta0.migadu.com ([91.218.175.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYlz-0000000GFz4-0yyU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 22:55:36 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737068127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HpB5lB6azzxlrJkYukifNhmmPqI9KsgkZ1X5toy37xk=;
	b=XIkYNUOnuOMNraYswo1GWPm8iADUy2F3zZ3ceaUdiQFQiTUudbzNs78J2Qnx3AbJneWydC
	wQcHTwdtvO36b+cXEwGNCXu3UMTtvD6SSrqkCEAnYQjzvGrmh2Hbfs8SpFeExTraRmlaXX
	I99lNcLrzt3vJjIDZbK6EdCv9Ze8kSg=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 0/5] spi: zynqmp-gqspi: Improve error recovery by resetting
Date: Thu, 16 Jan 2025 17:55:16 -0500
Message-Id: <20250116225521.2688224-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_145535_633636_4DE242F1 
X-CRM114-Status: UNSURE (   6.70  )
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

This series adds support for resetting the QSPI controller if we have a
timeout. I find this greatly improves the stability of the device, which
would tend to break after any timeout.


Sean Anderson (5):
  dt-bindings: spi: zynqmp-qspi: Add reset
  spi: zynqmp-gqspi: Reset device in probe
  spi: zynqmp-gqspi: Abort operations on timeout
  spi: zynqmp-gqspi: Allow interrupting operations
  ARM64: xilinx: zynqmp: Add QSPI reset

 .../bindings/spi/spi-zynqmp-qspi.yaml         |  6 ++
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  1 +
 drivers/spi/spi-zynqmp-gqspi.c                | 64 +++++++++++++++----
 3 files changed, 59 insertions(+), 12 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


