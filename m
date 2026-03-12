Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFD9FED2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ugOuw7T4v0idjV2XykkyxgOkdjTkO0dLS5Nelx4Rb/8=; b=sugEt0zlFSyEXUJ4NnH8kxApKH
	YEEcgcNEC7xPuAvy7jntY347vHT53M5z0Vjr5iMahWtKH9fUyb0pacmIZ199XX1fqeTrA+BpppoBR
	9JpVloYf+Mar/z6oQ6o6hODiEtaORphZtxlTBUDDpvZjjNPXPcprkIaFr439FKzfjY/nCjDmbfFYG
	vWe8V8OCnmFQ1e2u0nynjHNT9BnLCkFqzRB661LlocJoGFmXGqllGFWlGLanpVIEO37V/hPJ3AhQH
	t8RHNxxAN88zgDVkZK+X2IQnLv8nc6HNJb2xqCZ0/lUjzxiXzZh6Y4B+8O1gocfeiuTR8y8z0Q/8z
	eaeLi8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cMG-0000000Dj5v-2WDt;
	Thu, 12 Mar 2026 09:29:32 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0cMB-0000000DizO-3RIH;
	Thu, 12 Mar 2026 09:29:29 +0000
X-UUID: ee98c7281df511f1a21c59e7364eecb8-20260312
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:364da13e-4297-4e51-b36c-abb76dbed6cc,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:89c9d04,CLOUDID:3fe1568a4ae880f33e74b65e970bdd58,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ee98c7281df511f1a21c59e7364eecb8-20260312
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 885957485; Thu, 12 Mar 2026 17:29:13 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	broonie@kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 00/17] cleanup in spi by use devm_clk_get_enabled
Date: Thu, 12 Mar 2026 17:28:52 +0800
Message-Id: <cover.1773306858.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_022928_165785_3A90775E 
X-CRM114-Status: UNSURE (   5.70  )
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

I know that many old SPI drivers should not be modified for hardware
stability and to reduce maintenance effort. But I can't help cleaning them
up. To minimize the introduction of issues, I tried not to modify the
timing of those hardware clock enables.

Pei Xiao (17):
  spi: axiado: Use helper function devm_clk_get_enabled()
  spi: bcm63xx-hsspi: Use helper function devm_clk_get_enabled()
  spi: bcmbca-hsspi: Use helper function devm_clk_get_enabled()
  spi: img-spfi: Use helper function devm_clk_get_enabled()
  spi: imx: Use helper function devm_clk_get_enabled()
  spi: npcm-pspi: Use helper function devm_clk_get_enabled()
  spi: orion: Use helper function devm_clk_get_enabled()
  spi: rockchip-sfc: Use helper function devm_clk_get_enabled()
  spi: sifive: Use helper function devm_clk_get_enabled()
  spi: slave-mt27xx: Use helper function devm_clk_get_enabled()
  spi: st: Use helper function devm_clk_get_enabled()
  spi: stm32-qspi: Use helper function devm_clk_get_enabled()
  spi: stm32: Use helper function devm_clk_get_enabled()
  spi: sunplus-sp7021: Use helper function devm_clk_get_enabled()
  spi: uniphier: Use helper function devm_clk_get_enabled()
  spi: zynq-qspi: Use helper function devm_clk_get_enabled()
  spi: zynqmp-gqspi: Use helper function devm_clk_get_enabled()

 drivers/spi/spi-axiado.c         | 23 +++----------
 drivers/spi/spi-bcm63xx-hsspi.c  | 44 +++++++-----------------
 drivers/spi/spi-bcmbca-hsspi.c   | 47 +++++++++----------------
 drivers/spi/spi-img-spfi.c       | 14 ++------
 drivers/spi/spi-imx.c            | 15 ++------
 drivers/spi/spi-npcm-pspi.c      | 19 ++++------
 drivers/spi/spi-orion.c          | 10 ++----
 drivers/spi/spi-rockchip-sfc.c   | 20 ++---------
 drivers/spi/spi-sifive.c         | 20 ++++-------
 drivers/spi/spi-slave-mt27xx.c   |  8 +----
 drivers/spi/spi-st-ssc4.c        | 14 +++-----
 drivers/spi/spi-stm32-qspi.c     | 17 +++------
 drivers/spi/spi-stm32.c          | 59 ++++++++++----------------------
 drivers/spi/spi-sunplus-sp7021.c | 15 +-------
 drivers/spi/spi-uniphier.c       | 15 +++-----
 drivers/spi/spi-zynq-qspi.c      | 28 ++++-----------
 drivers/spi/spi-zynqmp-gqspi.c   | 17 ++-------
 17 files changed, 95 insertions(+), 290 deletions(-)

-- 
2.25.1


