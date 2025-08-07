Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01044C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i2cv+ljq9/iSwRq9kuiT1B+CMizj0zq2pLMXcAzAs90=; b=4fo/4JyKQImPkMQz1Y6I9HtvRU
	HJA8l6wDqAeNKUrKy87Vgi44oLDGI6kU7rccHGN84QetthII0tkUAc+OGybbFrPQAr0pLikh945lH
	uiVanel1Qjcaa7P8gY+0TJlvIVefGKJbBqe7A80z8D0nfCgCuVTI7ZW0TPyxvIm0zESG61DzWEPiI
	l5poNb+D2i3jNL04HM0qOmFU0P/Xo3mmkdSbvAhEjjxwioG8FDGXbC0AzEbL4uCof+P7th8FNP60r
	8R8Dr9EaCi19pQel6zvL91dHJWpoCSu3Pwcv5rr5zo74FVgmFKYetMMnDN8mxquHUH5OMKe3EAewd
	rHIA/a2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0l8-00000000iIe-2SPP;
	Thu, 07 Aug 2025 13:34:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk0gF-00000000he8-0cxT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 13:29:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72CAF601BB;
	Thu,  7 Aug 2025 13:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16415C4CEEB;
	Thu,  7 Aug 2025 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754573354;
	bh=cdCOhY1Kx0+VMbY2fmJzeqOhQxEfpe/s5pe8/mpr8oI=;
	h=From:To:Cc:Subject:Date:From;
	b=fdH50sZkCPkZ5YhsmHuypP27Q6dcAah/XTEns6CZoxVZHHD0K4k0xcdsffjLVNGHi
	 ezM8uqmxoaY1nqQzHVfiSBSObNvbEyyYjlP2kbt2YY3mZlnzOBNwdUXQAGHaElPQXj
	 tsjLxwU3lubnul9g97n/1bcN1KTz7r7tN3klFZwdRsZ+7CICuuvyinRVVwCogoRQFs
	 MAKMXSe5/RnJSdoXfjOgtPOR1Cg4GxF2p5uijesxX+089O7nFbuqFvger7Ms+iHhz5
	 NppMFQRzcex0f10xFVJTA4VfMNYbLwxjWJC/kkqFnFCA9yk3kufB7+UHbpek8M3OaN
	 YQdvvx7ayVhgw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: aspeed-lpc: Add missing "clocks" property on lpc-snoop node
Date: Thu,  7 Aug 2025 08:29:08 -0500
Message-ID: <20250807132909.3291770-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The ASpeed lpc-snoop nodes have a "clocks" property which isn't
documented. It looks like all the LPC child devices have the same clock
source. Perhaps it is the parent device that should have the clock, but
it's too late for that. The driver for lpc-snoop requires a clock to be
present.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
index d88854e60b7f..f329223cec07 100644
--- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
+++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.yaml
@@ -137,6 +137,9 @@ patternProperties:
       reg:
         maxItems: 1
 
+      clocks:
+        maxItems: 1
+
       interrupts:
         maxItems: 1
 
-- 
2.47.2


