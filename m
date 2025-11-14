Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29874CE7AA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 10:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gahU7OKPUSXUdIJKf0Jz5vsdbMRo85Fx6sGduurApik=; b=OXzbgFIZ1ezfUG
	0YdF/NPkTkiTXXKrrGedHLfhXvRHZru2roLk0KfaOBrVgic/sQ+hqCDV4357Dman6Ny11xCXe9cYU
	mc9cfw+g5I4q8U6MnsksX+TOAsjsZzS64kDMpMB+i0+Ddac9DMo/IH4zk+2D/FV5WXDbK3PmJOyWW
	jzlFe9dvsph1QA8wjFhHuvBTTsIh6pzqG4T5GxSFIVVB5lH+w/lzCUUJwqhYeQ1lKRHMQqU3eRFtC
	jDw5IriN8Xzu3wNxxCgHhA/AmNNotUWYwGU1nBAwIK0+cL0CIQK8+YYb1IjSVBMkRRAmP8iXFElWu
	r9edIHy7owJsA7fNM2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqlZ-0000000BypA-48vl;
	Fri, 14 Nov 2025 10:10:53 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJqlX-0000000ByoE-2IQA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 10:10:53 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 14 Nov
 2025 18:10:42 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 14 Nov 2025 18:10:42 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<clg@redhat.com>, <broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 0/4] spi: aspeed: Add AST2700 SoC support and Quad SPI handling update
Date: Fri, 14 Nov 2025 18:10:38 +0800
Message-ID: <20251114101042.1520997-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_021051_583888_C7352DDB 
X-CRM114-Status: UNSURE (   7.77  )
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

Changes in v2:
  - Some differences between AST2600 and AST2700 are described in
    commit message of the dt-bindings patch.

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


