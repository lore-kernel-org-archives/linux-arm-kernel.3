Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36299CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 14:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vntM1/TxhdiVPOOzQR2app5xuX2eIoHoYXzwuHqvn+8=; b=si+qFfMWG0PbXCBzsJfbcMhIPW
	tQ7VsFQ3pd2VGqVChzthAIFwWkTkXahwlJZEDzuFxNHrlk6AejsBjrFXIX56wuxphyn8kwVZisrYt
	sKTpWvgxVmsqkaWMcRZYYSwrKLDZZ0DhzTIiyv1ltbTVXLgm8y9k25bPhM4REOQYVNxImTW8uAdxK
	zAKbQDfjDYb8zuZD/l5cV1gfprEVMiEtl2dGzAdeHHt2IPApVY+/Ny/NONcBtBn2qdhjSLoCXlpYS
	1IGv3EtqBd1corOJgwptnaqaKCslzpK3XU3n2tdc/mw/h6BC9ODAAcn7yr+HQ17XeyvyP2V9JOzst
	i7KMy68A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquqT-0000000CIZX-0hpO;
	Tue, 26 Aug 2025 14:40:21 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uquRE-0000000CDn8-1XEh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 14:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756217656; x=1787753656;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vntM1/TxhdiVPOOzQR2app5xuX2eIoHoYXzwuHqvn+8=;
  b=gCgKrpbvsU5HdukO6VnFfemkVevaAm9/stRiVS7edzNl9DhmD0N7dRP2
   gv9j/BSKQX4da9O/Kr8XZB+XX+bwkP8+AcH2tieF1zxxczuJv36oaAjJe
   M7qeZYBRxUYmlXdjdzFUhQC39c9ZukdBh1NfSCRf0BB4nilXSBbhBVgrd
   PTSr5mADQuV/btIkzy5v78bnj9b7wF7ouGqKp81fpTi4+ONQM6eVHZz6R
   S9WrI7831N7f4ibMkO7/kxGgupUFtsLGliVMZ2GBLlikusUb11teGYXNh
   8owA3YPC7I8w7gn4QDmi+CLicX5rAKs6ogfqbyf2KBnJWEn3whMb2asDm
   A==;
X-CSE-ConnectionGUID: 2XFV1cqMTSuPx9nJFDp/ww==
X-CSE-MsgGUID: u5oOWMpiShyES94+GNmoeg==
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="45917408"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Aug 2025 16:14:12 +0200
X-CheckPoint: {68ADC134-6-410E8DD8-CEA8F0F8}
X-MAIL-CPID: 6A3AB291245F51CE0A0472E892044B20_3
X-Control-Analysis: str=0001.0A002119.68ADC16E.0002,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 21662167192;
	Tue, 26 Aug 2025 16:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756217648; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=vntM1/TxhdiVPOOzQR2app5xuX2eIoHoYXzwuHqvn+8=;
	b=eZ4SIp9S8PfNOWl+75CLW7e9jEbyp8gTA1yXWjCF2+dAjO3B/mkcD5ay4hFaMbQzRigbak
	8AW0QF5xaRiY+tQHHpyZHtdlCdrZVqkoXFS4JjfeQiho2oXfR1zVNtDT2jpysBDjCNnOwX
	4DvW1whyP0+8Z3Juz29812YXTQ2tLDO3P8gFNzcZhEVGcQPTGg7l3GCVAnI0TBrCHLiOGU
	uGaw3Q/ScwimACcqs+uCvqwdSv8xd7CgJlchw0wi0xl4YbtLdkXZrFA4LH1eNIsbVxIyVJ
	juhM+tAagg0UF4mdlQ/iA0aRpH567uJJmQnaifaNyZpMM78Hf7oLz6FMI2ftuQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/1] arm64: defconfig: Enable Marvell WiFi-Ex USB driver
Date: Tue, 26 Aug 2025 16:13:56 +0200
Message-ID: <20250826141356.2572830-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_071416_704583_DD91664B 
X-CRM114-Status: UNSURE (   7.41  )
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

MBa91xxCA (imx93-tqma9352-mba91xxca.dts) features a soldered,
non-pluggable USB attached WiFi module. lsusb says:
 ID 1286:204e Marvell Semiconductor, Inc. Bluetooth and Wireless LAN Composite Device
Enable the corresponding driver.

To: Shawn Guo <shawnguo@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Explicitly mention the onn-pluggable USB WiFi module
* Added Krzysztof's R-b

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6be80d07c2f6d..9d86c706bc211 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -441,6 +441,7 @@ CONFIG_IWLMVM=m
 CONFIG_MWIFIEX=m
 CONFIG_MWIFIEX_SDIO=m
 CONFIG_MWIFIEX_PCIE=m
+CONFIG_MWIFIEX_USB=m
 CONFIG_MT7921E=m
 CONFIG_RSI_91X=m
 CONFIG_WL18XX=m
-- 
2.43.0


