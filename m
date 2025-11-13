Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB842CD4F5F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4/QhMm6cQEsf97law7i0DvmF8IobIzkeG2umGfTg0+A=; b=u56N2kElCTebH1
	g8V4SXFnHfNanvETDWgjfAXfG+F9I2PVXEuHfrmh+RKSx8V44rXfh+17Rl14FVVJ4xqCdGBPxBUcQ
	olVy+iNbw7M+7vKOFySGrnCrs/uhGrA0gZ5GGdc9zh/BY48KT/lRiFXp78oamR5lzTH0LQ02AkY5d
	d57pwNtMsEa/PEQgCt/GZEp/RMsKaTLt4/M1bbEmy4FDGOaRYaJ8LVHZdQaEbfm9xdhp+hBvZhMOz
	FeG9BbpoJ7HQXlnbT93QCShVZzandhOoBkA0opSd+3ivT8cxTJTubFI1+JkvKLVI/RrxGfInJEoR4
	bwOnVs3gb9nOHr/Nj/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJT5N-0000000A8Wo-1yD3;
	Thu, 13 Nov 2025 08:53:45 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJT5K-0000000A8W4-3ZRj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:53:44 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 13 Nov
 2025 16:53:33 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 13 Nov 2025 16:53:32 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 0/4] spi: aspeed: Add AST2700 SoC support and Quad SPI handling update
Date: Thu, 13 Nov 2025 16:53:28 +0800
Message-ID: <20251113085332.89688-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_005342_890501_01DB1595 
X-CRM114-Status: UNSURE (   7.04  )
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

This series adds AST2700 support to the ASPEED FMC/SPI driver and
bindings, introduces 64-bit address compatibility, and improves
Quad SPI page programming behavior. It also implements AST2700-specific
segment logic, where range adjustment is not required because the
AST2700 SPI hardware controller already fixes decoding issues on
the existing platforms and adopts an updated scheme.

Chin-Ting Kuo (4):
  dt-bindings: spi: aspeed,ast2600-fmc: Add AST2700 SoC support
  spi: aspeed: Enable Quad SPI mode for page program
  spi: aspeed: Use phys_addr_t for bus addresses to support 64-bit
    platforms
  spi: aspeed: Add support for the AST2700 SPI controller

 .../bindings/spi/aspeed,ast2600-fmc.yaml      |   4 +-
 drivers/spi/spi-aspeed-smc.c                  | 107 +++++++++++++++---
 2 files changed, 95 insertions(+), 16 deletions(-)

-- 
2.34.1


