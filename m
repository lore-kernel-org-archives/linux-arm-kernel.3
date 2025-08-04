Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4F7C87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 05:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TzTDiKxeOvLrIfMTfJ8zNaahR1uk/vEnIUNhjbiF1DA=; b=CLBhamY49UicrF
	hqwx9EibP3r351sphQSklSEKDYXc850vuHkCY3PsqPzFh3CSxhq+/+uJ8AhkZUyqTTAgswnlAjWUH
	Cgjbtsv2RQEcg2dhcNmi+mIKiUr+6U9Hkwb2CZwVDRZLFWxI1t8KjxPTTv/6hpOnT1skPdIWung0j
	H1UhFTmPw6ytHia3UIgo8+WqOIkxjp9Qt+ylKcErvXp63Empn3hXGcdms6Mr+rblS46Hwgs1bAigl
	Q7A1FhyXjQ5ZxRZVqkrGxctLtmsyYcyV2MrHa1iOHm+ptjHZo0uJOuAD5qKHRU2hT/48XVTL7zf5A
	V+/5fLSx+2cdn2q/krmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uintr-00000009g4i-1scJ;
	Mon, 04 Aug 2025 05:38:19 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uinqW-00000009fox-1OXN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 05:34:53 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 4 Aug
 2025 13:34:45 +0800
Received: from twmbx02.aspeed.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 4 Aug 2025 13:34:45 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
To: ryan_chen <ryan_chen@aspeedtech.com>, Eddie James <eajames@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/2] irqchip: Add support for Aspeed AST2700 SCU interrupt controller
Date: Mon, 4 Aug 2025 13:34:43 +0800
Message-ID: <20250804053445.1482749-1-ryan_chen@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_223452_373693_59434D30 
X-CRM114-Status: UNSURE (   8.44  )
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

This patch series adds support for the SCU (System Control Unit) interrupt
controllers found in the Aspeed AST2700 SoC.

The AST2700 integrates multiple SCU interrupt groups, architecturally
similar to those in the AST2600, but using split registers for interrupt
enable (IER) and interrupt status (ISR), whereas AST2600 uses combined
registers.

Ryan Chen (2):
  dt-bindings: interrupt-controller: aspeed: add AST2700 SCU IC
    compatibles
  irqchip/aspeed-scu-ic: Add support for AST2700 SCU interrupt
    controllers

 .../aspeed,ast2500-scu-ic.yaml                |   6 +-
 drivers/irqchip/irq-aspeed-scu-ic.c           | 240 ++++++++++++++----
 2 files changed, 200 insertions(+), 46 deletions(-)

-- 
2.34.1


