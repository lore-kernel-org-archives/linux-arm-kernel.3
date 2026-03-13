Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F997106FD7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 05:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IXtnoRotPROYOYKxJSTjckOFDlJ3Utg3vHGH+uXFmpM=; b=k+esFKMJzlQrmv
	/NXUhH0IW5CmRXEncj7maTfw3Ll2y8uUXLsh4zs9id6CQk+UYBSqIbvlaAmnLG18c7kGeD8e/qRpJ
	fNsik8QJiOnSTQJW9GYJM3o1mrE0P0N5q8aIRKJpspMJhG4clEnhy9iuXc7tguwa9dnE136Y6jMUI
	AqdJuIPebnqWJNW7+lDdq++eCRDB3u2Dc9LEsbMeLOvNo3IWgdGLXzJ3XjjFQDsyeFO3HR+Jy3ySI
	A9iau/sJUw5XQMzFmlBP7bAGmJXO5Wh1adsW8kio8WwcqwqUlU4/XkofM1n7F2t84lp5qCWKkfke0
	Jz7Et5CtGQOj1WlJqwnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0v4F-0000000GeGJ-0NRS;
	Fri, 13 Mar 2026 05:28:11 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0v4C-0000000GeEs-08rg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 05:28:09 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Mar
 2026 13:27:57 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Mar 2026 13:27:57 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 0/2] Add AST2700 support for aspeed sdhci
Date: Fri, 13 Mar 2026 13:27:55 +0800
Message-ID: <20260313-sdhci-v1-0-91cea19c8a67@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFugs2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nj3eKUjORMXSMzyxRjQ8u0lKSUVCWg2oKi1LTMCrA50bG1tQDY/8O
 hVwAAAA==
X-Change-ID: 20260313-sdhci-269d319fdbde
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Ryan Chen <ryanchen.aspeed@gmail.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Andrew Jeffery <andrew@aj.id.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773379677; l=705;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=SB7CAsVDuvC/UzUyKBRMDViK4RWtIuE3C0YGThbJYq0=;
 b=Sz8w6I60BX3Vi3i6P7kBBwzTQn0pfRzJThSD8zp37uZ+jJVimsrLjFNIOak0m2xEst+vT2F/N
 95Y8AtIXkKEDQuF/Bwnobj6YtdVzMRtuzaTwuVCBBZe58KT3vWTrK/H
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222808_080227_93155A6E 
X-CRM114-Status: UNSURE (   6.02  )
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

This series add aspeed sdhci support for AST2700. The AST2700 sdhci
requires an reset. This series updates the binding and driver to
support reset requirements.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Ryan Chen (2):
      dt-bindings: mmc: sdhci-of-aspeed : Add ast2700 support
      mmc: sdhci-of-aspeed: Add ast2700 support

 Documentation/devicetree/bindings/mmc/aspeed,sdhci.yaml | 16 ++++++++++++++++
 drivers/mmc/host/sdhci-of-aspeed.c                      | 11 +++++++++++
 2 files changed, 27 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260313-sdhci-269d319fdbde

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


