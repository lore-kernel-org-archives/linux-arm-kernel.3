Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A2EC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OtMbr2ZwivTa+QKpyid7/2KnJENNUFDtGx1aofwoiXY=; b=DJ+etWjAlmcaYg/DcSEvyKXbr9
	nGUo2akJl+H8pjxYVhexsSD1RTcDt+f90S3E3DHt5vJ+b10Srhfkggq+MoWVBefoMZVZ/ukGVaUNR
	Mik++qJYfUL3mgzVSwzdABOfsRmNjL4lKgtNtnbbs9xyj4PkSt2c3yoy3EJyk9VqIgR5/NgEof/+4
	LZSXljitQ3902NitjQF8S8TcYAI3I945zColFY8oQpnD2GDmRu6oqtA+VfMXfA3klgOUGF0MzQfC1
	6GvD4jIkVZanV6dnNfe6Sw49EKaBE8+QIFKDGF5Z+bTgY/OHT40a6vWyOIZXwXJZNYA9Ooi1edRGL
	XpKQQRTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR4j-00000004WZu-1dUZ;
	Tue, 04 Mar 2025 12:08:41 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpPlV-00000004FHi-44aU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 10:44:47 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 4 Mar
 2025 18:44:38 +0800
Received: from aspeed-fw03.aspeedtech.com (192.168.10.13) by
 TWMBX01.aspeed.com (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12
 via Frontend Transport; Tue, 4 Mar 2025 18:44:38 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<derek.kiernan@amd.com>, <dragan.cvetic@amd.com>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
CC: Kevin Chen <kevin_chen@aspeedtech.com>
Subject: Add AST2600 LPC PCC support
Date: Tue, 4 Mar 2025 18:44:31 +0800
Message-ID: <20250304104434.481429-1-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_024446_010751_2831A64E 
X-CRM114-Status: UNSURE (   6.49  )
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

 The AST2600 has PCC controller in LPC, placed in LPC node. As a result,
 add LPC PCC controller driver to support POST code capture.

--
v2:
  -- Change driver path to drivers/misc

Kevin Chen (3):
  dt-binding: aspeed: Add LPC PCC controller
  ARM: dts: aspeed-g6: Add AST2600 LPC PCC support
  soc: aspeed: lpc-pcc: Add PCC controller support

 .../devicetree/bindings/mfd/aspeed-lpc.yaml   |  36 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   7 +
 drivers/misc/Kconfig                          |  10 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/aspeed-lpc-pcc.c                 | 441 ++++++++++++++++++
 5 files changed, 495 insertions(+)
 create mode 100644 drivers/misc/aspeed-lpc-pcc.c

-- 
2.34.1


