Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B564FCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 05:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LWLN71yt+YA8OvfTtpMEtJlNMfJ+e3+F4iSar+rq42A=; b=xrwencs5eBuJI8
	DN8beNFZuqRlHUvv4ISIqviAF5aj5BM+rMAwVOAYGeDyTZYGCIMj/2rxmnTtS6q8R3f2Xs9+d603c
	tVU0WxF8abHbMDh7mc9j8CmM2j2yD6jyfNQF2lPHwz3yAGSceYUQ94Ws8qf086CJeOZ79f53o8l2A
	Tkad//4oC0NKVGKtWQjzGNZGXyGaZIG0boVyJQCFv82o4FekVV9QQW5S0opLSdWsNIODtwVuhB11y
	6sBx5BujgC/aoG8WYzAJcKiV5IPkeRRw3IuuQUXe5VxD/MIOtuDLl2py/0PlhhkO9tAfxITIQczqN
	SPj0s/y74oEUugSLe5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGQE-00000007AcR-0sg1;
	Wed, 24 Jun 2026 05:45:14 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcGQ9-00000007Abj-3urz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 05:45:12 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 24 Jun
 2026 13:45:01 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 24 Jun 2026 13:45:00 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 0/2] Add AST2700 PECI clock support
Date: Wed, 24 Jun 2026 13:44:58 +0800
Message-ID: <20260624-peci_clk-v1-0-ee28b92e22e9@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANpuO2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNj3YLU5Mz45Jxs3aREC/NUAxPj1FTTNCWg8oKi1LTMCrBR0bG1tQA
 Z34/3WgAAAA==
X-Change-ID: 20260623-peci_clk-ba87e043ee5f
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782279900; l=643;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=odlPR9ypkZoCmLp8rrpiizM7sQMlSS91UDSOPAX5z6s=;
 b=jY5mCWNYf6ZGdseK9bInNXNGm6THNQm8Tn8QAiGuCks3CWEWMwrwx1cJdXSY1RcdDG/yej/qA
 Mal65bRBbEbDSY5lT2tFoJrxdkdEfZlEpnIpebJLHZzYbt4Jcadf7a+
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_224509_978555_1AB09E74 
X-CRM114-Status: UNSURE (   5.71  )
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

Add the PECI clock for the AST2700 SoC1. The PECI clock is a mux
controlled by SCU1_CLK_SEL2 bit 16, selecting between the 25MHz CLKIN
and HPLL/4.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Ryan Chen (2):
      dt-bindings: clock: ast2700: add PECI clock
      clk: aspeed: add AST2700 PECI clock

 drivers/clk/aspeed/clk-ast2700.c               | 10 ++++++++++
 include/dt-bindings/clock/aspeed,ast2700-scu.h |  2 ++
 2 files changed, 12 insertions(+)
---
base-commit: 948efecf22e49aa4bf55bb73ec79a0ddcfd38571
change-id: 20260623-peci_clk-ba87e043ee5f

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


