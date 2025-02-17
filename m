Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8617C021AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 12:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4Bav6E8flN9mO/0zokohJ0f6CGE4NuZlgv05XM78nk=; b=WTapsanNhvIs0KUlqQ4WpwTZ0L
	DHDSW8O/THHyl88JPiyE+qSeEwDWnHnSStDt9yXpkTXnLwXewkJBkTW0dIIj4gNyG3/Jz2lV9uvbF
	7GxYNq8lOxgbIa7bN/TLPitUZn+vAIFHP7FKoZNZdK+BPeLn+31y5mr16qCKlmuYQiODaE+y3Kn6v
	QsCWiUK+NfqnUDAgJ1RutYhliorapepaW4rPQWMGFNy3qFYYmzoSHphLnr0cCqEVbUDgfqvTjYG/E
	XlQkuRVDKXOm9X4QKQcYkP8zeiL/Qopp9ZL6XcdG4Nu2go7r28kuxI/Cvh3qzkxcpn5HkJbcJ6Uy2
	XLv/OW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0G9-00000004SYl-4Ad6;
	Mon, 17 Feb 2025 12:30:01 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzcE-00000004Mob-0CTV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:48:48 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Mon, 17 Feb
 2025 19:48:33 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Mon, 17 Feb 2025 19:48:33 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: <lee@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<chiawei_wang@aspeedtech.com>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Kevin Chen <kevin_chen@aspeedtech.com>
Subject: [PATCH v1 0/3] Add AST2600 LPC PCC support
Date: Mon, 17 Feb 2025 19:48:28 +0800
Message-ID: <20250217114831.3225970-1-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_034846_093728_2B31FBBA 
X-CRM114-Status: UNSURE (   6.60  )
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
v1:
  - Change pachset from 1.
  - Remove properties in pcc driver.

Kevin Chen (3):
  dt-binding: aspeed: Add LPC PCC controller
  ARM: dts: aspeed-g6: Add AST2600 LPC PCC support
  soc: aspeed: lpc-pcc: Add PCC controller support

 .../devicetree/bindings/mfd/aspeed-lpc.yaml   |  36 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   7 +
 drivers/soc/aspeed/Kconfig                    |  10 +
 drivers/soc/aspeed/Makefile                   |   1 +
 drivers/soc/aspeed/aspeed-lpc-pcc.c           | 439 ++++++++++++++++++
 5 files changed, 493 insertions(+)
 create mode 100644 drivers/soc/aspeed/aspeed-lpc-pcc.c

-- 
2.34.1


