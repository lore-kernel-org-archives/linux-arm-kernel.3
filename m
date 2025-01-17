Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E75C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 09:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ic9OtFqRlWUcBS/MPE0Sm7R5wsen/MvTyrY5f/59wMI=; b=2joQb2/tPJrUgw0WTXR9rZ/9x9
	LxHDmK8gQry5cdDdimzfb7kNBPj0X89pT94JsQPNCvsR5hQqP0QhCA+hV9/PtlIqeAEbjSeLKqlCw
	lDp42614/T9H7nyxmTstTjUlzBe3I7ophK4wnVDOvCxiyHXdeEB5Xk6dzsXd07ILm/nkosSnhdxQH
	85Y4gD4T0yHlKGfg/oo5kKIU8prm07bp82y3bUpK4bGYMG/m1FBQoFbSQyZ+T85eZCfjsoKHPevH9
	uj/1B89bsoxCZvnVVelU/ChdbeYNr2JE7fHpI5jTday/ygfK3oi+LLYHitqh2ohGlRuxpxtP2s6Gh
	bJxPS1Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYj2z-0000000HUyi-39oB;
	Fri, 17 Jan 2025 09:53:49 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYj1i-0000000HUkf-1ydc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 09:52:31 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Fri, 17 Jan
 2025 17:52:19 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Fri, 17 Jan 2025 17:52:19 +0800
From: Kevin Chen <kevin_chen@aspeedtech.com>
To: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <elbadrym@google.com>
CC: Kevin Chen <kevin_chen@aspeedtech.com>
Subject: [PATCH v0 0/3] Add AST2600 LPC PCC support
Date: Fri, 17 Jan 2025 17:52:14 +0800
Message-ID: <20250117095217.661070-1-kevin_chen@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_015230_505896_A5D10302 
X-CRM114-Status: UNSURE (   6.94  )
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

Kevin Chen (3):
  dt-binding: aspeed: Add LPC PCC controller
  ARM: dts: aspeed-g6: Add AST2600 LPC PCC support
  soc: aspeed: lpc-pcc: Add PCC controller support

 .../bindings/soc/aspeed/lpc-pcc.yaml          |  51 ++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   7 +
 drivers/soc/aspeed/Kconfig                    |  10 +
 drivers/soc/aspeed/Makefile                   |   1 +
 drivers/soc/aspeed/aspeed-lpc-pcc.c           | 505 ++++++++++++++++++
 5 files changed, 574 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/lpc-pcc.yaml
 create mode 100644 drivers/soc/aspeed/aspeed-lpc-pcc.c

-- 
2.34.1


