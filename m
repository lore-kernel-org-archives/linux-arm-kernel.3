Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48C6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 01:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dCyFAUvoRleK2K0riYHFLR/do0dEHDRd7+3vCkIL4+U=; b=m1IpRK/IZd1rDy
	q7RGXI6nXNAXIcXot6bPH8jljFn/WvWf7vlDeM5snwRoFnXpsjTyLKDxeEOPKCt6GSU790ln+B5GR
	rw0fd6T3TA/zOL2810q9x8Fo9kvjd/hcMu7d6SJrp3BVy/DQ138/9BW0hHgNnA+oTffyU0g6Ma70T
	eU7gOwfJCGU3io7tfoMuyV5SbZuEnTs8CHQGiFBgat3OI/RKWTKjLVE53UI22zrAhrAP6Cm7/HEB7
	WTqGMsLVNAj7iqtaKEwu+8yVquoALVIVc/KfZTzGczN+FZBdLzqSOwh2kUaWgUpb/8bAxUJdZ5oqZ
	EWntW9nFIpW/JEbJ+XDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue1tO-000000011KN-0JXL;
	Tue, 22 Jul 2025 01:34:06 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue1qs-00000001138-4BQI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 01:31:34 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 22 Jul
 2025 09:31:18 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 22 Jul 2025 09:31:18 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v7 0/2] ASPEED: Add mailbox driver for AST2700 series
Date: Tue, 22 Jul 2025 09:31:15 +0800
Message-ID: <20250722013117.2561025-1-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_183131_038268_14622ABF 
X-CRM114-Status: UNSURE (   9.38  )
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

Add mailbox controller driver for AST27XX SoCs, which provides
independent tx/rx mailbox between different processors. There are 4
channels for each tx/rx mailbox and each channel has an 32-byte FIFO.

 v7 changes:
  - Update driver
     1. clean for loop

 v6 changes:
  - Update document
     1. Update description to preserve paragraphs.
     2. Update for property, reg.
     3. Add reg-names.
     4. Add 'Reviewed-by' from Krok.
  - Update driver
     1. Use devm_platform_ioremap_resource_byname since we add reg-names now.
     2. Update error code for ch not enabled. 
 
 v5 changes:
  - Update document
     1. Separate reg from 1 to 2. 1st is tx controller; 2nd is rx.
     2. Remove 'Reviewed-by' since the patch has changed.
  - Update driver, no functional changes.
     1. Update since there is 2 reg base now.
     2. Refine reg definitions
     3. Add spinlock to protect registers
     4. Use bool as return value for ast2700_mbox_tx_done
     5. Rename variable from drv_data to dev_data.

 v4 changes:
  - Update driver, no functional changes.
     1. Remove unused variable, rx_buff, in struct ast2700_mbox.
     2. Remove unneeded cast on device_get_match_data.
     3. Remove the usage of writel/readl_relaxed.
     4. Improve readability.
 v3 changes:
  - Correct document
     1. Use 32-bit addressing in dts example property, reg.
 v2 changes:
  - Update document
     1. Correct error in dts example.
     2. Drop description for mbox-cell per suggestion previously.

Jammy Huang (2):
  dt-bindings: mailbox: Add ASPEED AST2700 series SoC
  mailbox: aspeed: add mailbox driver for AST27XX series SoC

 .../mailbox/aspeed,ast2700-mailbox.yaml       |  68 +++++
 drivers/mailbox/Kconfig                       |   8 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/ast2700-mailbox.c             | 235 ++++++++++++++++++
 4 files changed, 313 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/aspeed,ast2700-mailbox.yaml
 create mode 100644 drivers/mailbox/ast2700-mailbox.c


base-commit: 8c2e52ebbe885c7eeaabd3b7ddcdc1246fc400d2
-- 
2.25.1


