Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8008FCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 09:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q7Pe+MIjaP0GckUzKiVimtbYf2O8ZGKXwMtUS0jmzkY=; b=IUFuRPPLa1BlPT
	5S/EyXfPEQ/USbq7ey6dxq2f/mlS5N46rf8orl3LdG+hOi++NKsPGhi41BR8FrXDbkZ8vZsTdC8TK
	/9xR0Mv+eTnQ5x6yCvE+kXBa8EULZ/dzTYZZ0LvUdLeXMtVzbuo4/PFgHfP1NWJGl9XtgH9nrg5ff
	Rbr/04PqgwQznECuXF3k7b2/EDOCV+6gqDm1ElBdECc4JD0gwrMHZlzVfEIAjh3SHGtgZlH3cpSyE
	IO/vwn1kWuDVlrMkE4weTNlAygitWCyBEdCh/H5k4vsWW08vSIiX6AHunW6Rn/BAEPoCVQqdD68My
	OCGMkFcDxmuSXbcuAaIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyiw-0000000AT7F-2iQ6;
	Mon, 01 Jun 2026 09:14:18 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyit-0000000AT68-3IOL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 09:14:17 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Jun
 2026 17:14:10 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Jun 2026 17:14:10 +0800
From: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: [PATCH 0/2] rtc: aspeed: Add AST2700 RTC support
Date: Mon, 1 Jun 2026 17:14:05 +0800
Message-ID: <20260601-ast2700-rtc-v1-0-15d4ca46500a@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF1NHWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwND3cTiEiNzAwPdopJk3RSTxJQkU8MUI0MTCyWgjoKi1LTMCrBp0bG
 1tQD52m9pXQAAAA==
X-Change-ID: 20260601-ast2700-rtc-d4adb51d2148
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, Tommy Huang <tommy_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780305250; l=637;
 i=tommy_huang@aspeedtech.com; s=20260601; h=from:subject:message-id;
 bh=BIVqZiBYz0UJFJj0e/Ht6rWfSBtx/Fyk2CN8Z7NBoqw=;
 b=k+dRNdw4ySTci6bzre+yAKaseUFPXui2dpoGU5J7TDjLJOtLdZMBf13b3+uyAeFodlxfG31+p
 UVXjbQSHHl7Dpg8yNLgXtNHBc6e02DHP6LdIkxtAgbTYnHpWIlvAp67
X-Developer-Key: i=tommy_huang@aspeedtech.com; a=ed25519;
 pk=/SRU8iPtlyPCtlX7hXjYJhOTpCUdfEZ9pIVVyCQOjLE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_021415_826686_B89B6FA7 
X-CRM114-Status: UNSURE (   7.71  )
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

This patch series adds support for the ASPEED AST2700 RTC define,
includeing dt-binding in the Document and rtc-aspeed.c

Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
---
Tommy Huang (2):
      dt-bindings: rtc: add ASPEED AST2700 compatible
      rtc: aspeed: add AST2700 compatible

 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 drivers/rtc/rtc-aspeed.c                               | 1 +
 2 files changed, 3 insertions(+)
---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260601-ast2700-rtc-d4adb51d2148

Best regards,
-- 
Tommy Huang <tommy_huang@aspeedtech.com>


