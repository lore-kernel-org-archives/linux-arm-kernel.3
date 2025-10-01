Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64F2CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a8s6HxRRd9vC8JP9kc13Y8TE1AoRzpQQbSPEkVOZ6ug=; b=Q1qATvVoj02/qc
	G/Wi+ddbZYUk/iZxK2gEQAexRST/1aIhztm2720+JbiFsr90OPbB1e++ZLRFy8JXaLaV6z4JQwzKP
	sNyUh6xNnanikJOAal0V4wNxbOddgrJBSxaTyFhZuUgsjusnMRJ4p/iK3I/ZSPPrDyCWQFpPM+PRe
	JttqGOqaUoV7HChu/niR2uacTB4nX3zXjf8d2mPdZnMU7IVNQtzovMvmg7GCG3flP2eBPt+jEV8Pz
	OlkS2PKgjZCWFwOiTrGH/7ZngXzbJgV++UH2QSC+ReBD9tpuK1zvTrKQj8bdhHEarCX5hbZnfFi6D
	nYVHXgSkN8oawJi2H+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uyR-00000007NbP-24DI;
	Wed, 01 Oct 2025 11:26:19 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3uyO-00000007Nai-405Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:26:18 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 1 Oct
 2025 19:26:05 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 1 Oct 2025 19:26:05 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <clg@kaod.org>,
	<broonie@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
	<linux-spi@vger.kernel.org>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 0/6] spi: aspeed: Improve clock, timing and address decoding logic
Date: Wed, 1 Oct 2025 19:25:59 +0800
Message-ID: <20251001112605.1130723-1-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_042616_990668_BB332B01 
X-CRM114-Status: UNSURE (   7.15  )
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

This patch series introduces several improvements to the
ASPEED SPI driver, targeting better stability, compatibility
and, flexibility across multiple ASPEED platforms.

Key changes include:

* Clock selection strategy update
  Improves fallback logic when timing calibration is skipped or
  fails, ensuring reliable boot behavior.

* Timing calibration enhancement for AST2600
  Replaces the previous "first-pass" strategy with a more robust
  algorithm that selects the optimal timing point.

* Default address decoding assignment
  Ensures each chip select (CS) has a valid decoding range during
  probe, avoiding detection failures due to missing or incorrect
  bootloader setup.

* Centralized address decoding management
  Refactors the decoding logic to centrally assign address windows,
  preventing improper trimming and improving layout flexibility.

* Per-platform decoding adjustment
  Introduces platform-specific `adjust_window` callbacks to handle
  platform specific hardware constraints for address decoding range.

* Selective memory mapping
  Optimizes memory usage by mapping only the required address window
  per CS to avoid exhaustion.

Chin-Ting Kuo (6):
  spi: aspeed: Update clock selection strategy
  spi: aspeed: Improve timing calibration algorithm for AST2600 platform
  spi: aspeed: Force default address decoding range assignment for each
    CS
  spi: aspeed: Centralize address decoding region management
  spi: aspeed: Add per-platform adjust_window callback for decoding
    range
  spi: aspeed: Only map necessary address window region

 drivers/spi/spi-aspeed-smc.c | 644 ++++++++++++++++++++++++++---------
 1 file changed, 489 insertions(+), 155 deletions(-)

-- 
2.34.1


