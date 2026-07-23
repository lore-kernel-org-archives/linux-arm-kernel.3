Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497F4C44524
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 05:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MgfCy5PsBiOdygLaYq42apRPTPVTf5SNwZwfose2mGg=; b=g8D1LvKEPgZ5N8
	aVEmDpeQHjHUE9WfGphL6v+MkR0rkZXH/uEQMaqHb0f1YLYBi7RtpPoiUeS+eeY7ufhsv8TwLVvzi
	+L0iyQtBB2AlAud1mcw35lszSWZIPJL4HZzHEHpHnR/JM5IFx3LjHCYvbRnbIRQTx7YIup5Ee94cM
	B7IqbVcTHjDpfqboOzxSwV5qNN+drSlIZERR4i3vUk+u9wUPtelrbXmZ+CbTA1/KuamAiaE+UI5n+
	BB574jKlrUSbXjdpD4utmAFrcSmSSuzrOixiajMMNjMON8XtWcikGF/u6IYdfW8FDZ1lANdMlpogR
	PfOkXWe2b0FEbhPOvTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmm2E-0000000DTl9-1ZLP;
	Thu, 23 Jul 2026 05:31:54 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmm29-0000000DTkR-44th
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 05:31:51 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 23 Jul
 2026 13:31:42 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Thu, 23 Jul 2026 13:31:42 +0800
From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Subject: [PATCH RFC 0/2] ipmi: kcs_bmc_aspeed: Support multiple LPC
 controller instances
Date: Thu, 23 Jul 2026 13:31:36 +0800
Message-ID: <20260723-upstream_kcs_multiple_lpc-v1-0-d918b5270b86@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADinYWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMj3dKC4pKi1MTc+Ozk4vjc0pySzIKc1PicgmRdc2NTSxMjI0NDUwM
 LJaD+gqLUtMwKsNnRSkFuzkqxtbUAVu5+THAAAAA=
X-Change-ID: 20260722-upstream_kcs_multiple_lpc-735942211508
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Joel
 Stanley" <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Corey Minyard
	<corey@minyard.net>
CC: Andrew Jeffery <andrew@aj.id.au>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <openipmi-developer@lists.sourceforge.net>,
	Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784784702; l=4559;
 i=yc_hsieh@aspeedtech.com; s=20260721; h=from:subject:message-id;
 bh=UXpjUGeg9xtUM9YIG1CgV+Gg36EwxjK4VIMJFo4NuL4=;
 b=SDadOOpg9g4KslrKbEeBxunbIdflRSsbHgYDF8iURMyI7eD9V+k/46tLBLDQsCOL0QBhqvvHp
 HzduwSzL5usBwSKSS+v0XdupxPcrxxV6IESnHnZo1kvfjpnMCDr4QWX
X-Developer-Key: i=yc_hsieh@aspeedtech.com; a=ed25519;
 pk=7KnU2ozXGF2IATT+Hvu7RbRwPxBA3/b+zhfM+UsPJMs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_223150_170255_555660D5 
X-CRM114-Status: GOOD (  10.71  )
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

Hi,

Aspeed AST2700 SoC exposes more than one physical LPC controller
(e.g. lpc0@14c31000, lpc1@14c32000, plus pcie_lpc0@12c19000 and 
pcie_lpc1@12c19800 for the PCIe-facing path), each instantiating 
its own KCS1-KCS4 with identical IDR/ODR/STR register offsets:

	lpc0: lpc@14c31000 {
		compatible = "aspeed,ast2700-lpc", "simple-mfd", "syscon";
		lpc0_kcs1: lpc-kcs@24 {
			compatible = "aspeed,ast2600-kcs-bmc";
			...
		};
		...
	};

	lpc1: lpc@14c32000 {
		compatible = "aspeed,ast2700-lpc", "simple-mfd", "syscon";
		lpc1_kcs1: kcs@24 {
			compatible = "aspeed,ast2600-kcs-bmc";
			...
		};
		...
	};

kcs_bmc_device::channel currently serves two purposes at once:

  1. Selecting which HICR0/HICR2/HICRB bit-group to touch within a single
     LPC controller's register file (aspeed_kcs_of_get_channel() derives
     this purely from the KCS node's register offset, 1..4).

  2. Naming the misc chardev (/dev/ipmi-kcsN) exposed to userspace, which
     must be unique system-wide (kcs_bmc_cdev_ipmi.c uses "ipmi-kcs%u").

Both happen to be the same value only because this driver has only ever
had to support SoCs with a single LPC controller. On AST2700, KCS1 on
every LPC controller computes to the same channel number, and whichever
instance probes second fails outright.

This series keeps a driver-private `channel` (1..4) in
struct aspeed_kcs_bmc for register access, and computes a
globally-unique kcs_bmc_device::channel as `bank * KCS_CHANNEL_MAX +
channel`, where `bank` identifies which LPC controller instance a KCS
device belongs to.

Before settling on how `bank` is derived, I considered a few options
with different tradeoffs and no clearly "correct" answer from existing
driver conventions:

  (a) Dynamic discovery: keep a driver-global list (protected by a
      mutex), keyed by the LPC controller's device_node pointer, and
      assign bank indices in first-seen-during-probe order. No DT
      changes required, but bank numbering depends on probe order,
      which is not deterministic across boots/reprobes.

  (b) Tree walk by compatible: for_each_compatible_node() over the
      whole DT matching the LPC node's own compatible string, counting
      position. Deterministic and requires no DT changes, but AST2700's
      four LPC-compatible instances (lpc0/lpc1/pcie_lpc0/pcie_lpc1)
      don't share a common parent node and don't share a consistent
      child-node naming scheme, which also rules out parent-based or
      node-name-based tree walks I looked at.

  (c) of_alias_get_id(): require board DTs to declare
      /aliases { lpc0 = &lpc0; lpc1 = &lpc1; ... }, and read the index
      back from there. This is the pattern already used by mmc/i2c/spi/
      serial for "which instance is this" numbering, including the same
      "absent alias -> fall back to previous behaviour" compatibility
      guarantee for existing DTBs.

This series implements (c), since it puts the numbering under DT-author
control rather than driver inference, generalizes across however many
LPC-compatible instances a future SoC exposes (regardless of tree
placement), and existing single-LPC-controller boards need no DT
changes at all - of_alias_get_id() returns an error when no alias is
present and the driver falls back to bank 0, which is exactly today's
behaviour.

Patches:

  Patch 1: dt-bindings: mfd: aspeed-lpc: Document lpcN alias for
           multi-instance SoCs
  Patch 2: ipmi: kcs_bmc_aspeed: Support multiple LPC controller
           instances

Before dropping the RFC tag and posting the AST2700 follow-up patches, 
I'd particularly appreciate review feedback on the bank-numbering approach. 
In particular, does option (c) seem like an acceptable use of DT aliases 
for identifying LPC controller instances, or would the community prefer a 
different approach? 

Any guidance would be very helpful.

Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
---
Yu-Che Hsieh (2):
      dt-bindings: mfd: aspeed-lpc: Document lpcN alias for multi-instance SoCs
      ipmi: kcs_bmc_aspeed: Support multiple LPC controller instances

 .../devicetree/bindings/mfd/aspeed-lpc.yaml        |  7 ++++
 drivers/char/ipmi/kcs_bmc_aspeed.c                 | 37 ++++++++++++++++------
 2 files changed, 34 insertions(+), 10 deletions(-)
---
base-commit: f0e6f20cb52b14c2c441f04e21cef0c95d498cac
change-id: 20260722-upstream_kcs_multiple_lpc-735942211508

Best regards,
-- 
Yu-Che Hsieh <yc_hsieh@aspeedtech.com>


