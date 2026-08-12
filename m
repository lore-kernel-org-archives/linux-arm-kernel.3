Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA46BC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 05:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IHxOT7Wnk5xlww8xoI2HTvhglRQOBXxqoCb/87tWt9U=; b=i1hU2TQEG7+PEz
	ebMqTEc8rHbEFyWwKV+ZGxmtUIE4VVQOkh7lnpPbspCce5yhmQ4rAqTI7Ho9C4AdWCaXqi/kPIBj5
	4WaGdjv4qxBYwSmqJpe9sfP99LJJAkzE0wD88gimYNVC9p7B27lvRYtYNte6i0opvBEWqysfq2o2/
	7tCZ+ETJy/OtisQAZtsCLVcXRCoVM62B27R3XtxITM/gHDpM4eCSG3YmXj+iiXqKeFtfed9PmjelN
	kECkymUWRoprwGSbmQSAZnWeyjA5Tpx4IUWbMoXJXkc86YQ4Y6wkj0mJO+dvGHCSVs3Fgl1IVjc8M
	sI+82+lYIDiPFOCtPUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1pM-0000000FSXl-1PCI;
	Wed, 12 Aug 2026 05:48:36 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1pJ-0000000FSWa-1FgW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 05:48:34 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 12 Aug
 2026 13:48:26 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 12 Aug 2026 13:48:26 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: [PATCH 0/7] Add Aspeed AST2700 SDRAM EDAC support
Date: Wed, 12 Aug 2026 13:48:24 +0800
Message-ID: <20260812-edac-v1-0-03992edea297@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACgJfGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNT3dSUxGRdi1RLM4NUA6NU8zRzJaDSgqLUtMwKsDHRsbW1AEd5t41
 WAAAA
X-Change-ID: 20260625-edac-8e960e02e7f7
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>,
	<linux-rt-devel@lists.linux.dev>, Ryan Chen <ryan_chen@aspeedtech.com>,
	<stable@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786513706; l=2810;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=iJPKTwaUlWXTtq4FbV7av/iGgAlKvVcOixKOblgP5dA=;
 b=8f8TR6x2H15qSiqX++8gKE+a9Je/bBd1L6n9u/sgQSTtbIArgdPaAHdk6laBU+hjZSQmTcY57
 azS13RCOuQuCI7Oy88hLQymdCWjELJqj4v/KXCeoCPAP+yPyAFL8hJ9
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_224833_343533_330E21ED 
X-CRM114-Status: GOOD (  13.28  )
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

Add ECC error reporting for the Aspeed AST2700 SoC to the existing
aspeed_edac driver.

The AST2700 memory controller keeps the same overall EDAC programming
model as the earlier Aspeed BMC SoCs, but uses a different register
layout, a split interrupt status/clear/mask scheme and DDR4/DDR5 memory.
Rather than fork the driver, the existing code is first tidied and
generalised, then the AST2700 is added as one more per-SoC variant.

The series is organised as:

 - dt-bindings: document the new "aspeed,ast2700-sdram-edac" compatible;
 - set dimm->grain to the controllers' ECC granularity, fixing a
   pre-existing WARN_ON in the EDAC core on the first reported error
   (carries a Fixes: tag and Cc: stable);
 - clean up whitespace and include ordering so the following changes
   start from a consistent style;
 - free the mem_ctl_info unconditionally on remove, dropping a NULL
   check on a value that cannot be NULL there;
 - drop the regmap, which serves only as an MMIO wrapper here,
   in favour of direct readl()/writel() under an explicit raw spinlock,
   annotating the register base with __guarded_by() so that the locking
   is checked at build time under CONFIG_WARN_CONTEXT_ANALYSIS;
 - abstract the SoC-specific details (register layout, ECC/DRAM-type
   bits, memory types, write-protection key) behind per-SoC chip data;
 - add the AST2700 support, teaching the shared error-reporting helpers
   to report an error without an address for its single shared
   failure-address register.

Tested with the memory controller's ECC error injection on both an
existing SoC and the new one:

 - AST2600: an injected correctable error is reported through the EDAC
   interface as a CE with the recorded failure address, confirming the
   regmap removal and the chip-data refactor do not regress the existing
   controllers.

 - AST2700: an injected correctable error is likewise reported as a CE
   with the expected failure address.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
Ryan Chen (7):
      dt-bindings: edac: aspeed: Add AST2700 SDRAM EDAC
      EDAC/aspeed: Set the DIMM grain
      EDAC/aspeed: Clean up whitespace and include ordering
      EDAC/aspeed: Free the mem_ctl_info unconditionally on remove
      EDAC/aspeed: Replace regmap with direct register access
      EDAC/aspeed: Abstract SoC differences behind chip data
      EDAC/aspeed: Add AST2700 support

 .../bindings/edac/aspeed,ast2400-sdram-edac.yaml   |   6 +-
 drivers/edac/aspeed_edac.c                         | 414 +++++++++++++--------
 2 files changed, 268 insertions(+), 152 deletions(-)
---
base-commit: 5464985e42c04e335fb30e38fbc409c997db9bec
change-id: 20260625-edac-8e960e02e7f7

Best regards,
-- 
Ryan Chen <ryan_chen@aspeedtech.com>


