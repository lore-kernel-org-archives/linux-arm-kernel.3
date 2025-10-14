Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73717CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 05:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H/kOwDFzfm3IalvPOezvdeJs36K8vMFT5gBD1NEeb8I=; b=Q/JjD4UyQrLFBoDHx7irRJUi/3
	3JXnmGuV6v2EqIMYdFWlPvSr8KRznYDC+HFWUoFFQBHntyegGH9IKmjnHZZ2Plo5MBHD4LsQsfm5H
	H1op1YzU3Xt6yIgMXPCbeqQGPuP6YaN2ZUF6hiinyJFt19pxEbWYOi4D1yTFm/ZavddWNgHPiW0hx
	y4VDhnneAGu7zKEwa4muC3PYbwwp3AOlVUqSwkTPRoj3ruCJ/zqBcLen5C1tKvS3U5199WiHOInpv
	rrun2SxN1sb76iFFwIT4mX2yC7J77JH64NC0X2MAbC6A9OIOfdH3d2ITExkNsasByVFKL3ciNSbc+
	2a/tTOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8XwD-0000000FErm-0ver;
	Tue, 14 Oct 2025 05:51:09 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Xw6-0000000FErQ-3znR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 05:51:08 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=H/kOwDFzfm3IalvPOezvdeJs36K8vMFT5gBD1NEeb8I=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1760421047;
 b=PEMCfuyJvCoSIU+22t05n4ZU46Yuf5tvphbLDcK54b5V2EybKvSHHQ4lcVw0YeC+d8xgQkor
 ccojF70Cp389Q8KczIWhlwk1rf7JXH/nKE4VtLbx1gYtq8XIesfc1MtXMPW7L5URpwF2OjCDtHw
 +e4OPxb9C1isg+6gt4BN6eFpIp/5azw4Q9JGEsUGq/nCdiCZqAok2qhyzpz3dkHThB+ZJgis/sj
 6BNpuD6i5OEbuVU9fp04tpevZq1D25YYBrnrE/iu4nGwny9nooTGIjCr5UU/bsYpWTLdmyGuZ25
 VyWnvaX+O9FeVbvxIqHxWy//FSykXFCpcdEb6OT9mCa1Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1760421048;
 b=nmz3RKIr+CS8uDKyJz83yrlCUJowf/cISWNmz74EAzHTSVa/5V4BhiGyW47Q2qx1NUXFHaWL
 ZcwfCfehFxNa+kmMLLC6a9i5/T2xU9kQZywB085ZZy+37/TyZHBdLN8tDt/sddQzF7ORTq7aZLl
 aUH+rcbuAKVn2SXAiGl7uZD9vxM8or68Puhvohuk7bIhsejA6yDx1R4y2WXSxTkPbyw9d40W+vU
 b5vN0DkgArGNrpHZscUpeELUNNr/1L6Gkj61jzPjcO7SPGn4zZB7LoaO7FKdNGQkWMJUo2YwXJW
 cO7F56NBQUW4fDUvKzH6fayGE/fX1c5FTUVA+rpWrDJdw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Tue, 14 Oct 2025 07:50:47 +0200
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 0231ECC0DE1;
	Tue, 14 Oct 2025 07:50:35 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lizhi Hou <lizhi.hou@amd.com>,
	Brian Xu <brian.xu@amd.com>,
	Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>,
	Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] dmaengine: xilinx: xdma: Add regmap register ranges
Date: Tue, 14 Oct 2025 07:50:33 +0200
Message-ID: <20251014055034.274596-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4cm3Gh401Pz4MZvT
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 68dca67b7eb0fd836cb29e646ce2f625
X-cloud-security: scantime:2.704
DKIM-Signature: a=rsa-sha256;
 bh=H/kOwDFzfm3IalvPOezvdeJs36K8vMFT5gBD1NEeb8I=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1760421047; v=1;
 b=BjEmECd9p2nVYqt5R/vKFKTRvElgla+fx54VNriK9zPjSfET7NXxQTlLbPE/c73aqSbbrMdN
 dCgS8OAGKAFcmm5+FAS8Ltf8SWX1vknK+4MAoHgG4Fudbc9r0meL1BbNOrv+cjfkGNywTD6QwlX
 reqPf2ivTsAS67HuN+3oVDcAzULzuMCn+6kqGw5vttyfNPs2AdB1wgmZi2xYr3n9Hb/QIiPkIIF
 +hGYQqCtYg0pHcChNtgNr95zW5O6YTGPYk0xerr4iLvrVUFzpMZylOE1EjsvCcNYNL6PUaJ6+kK
 he5gtqGTaEjIdAAwpuU4HoE0j/U1CP3eqIAHgRAaG/xJg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_225103_554267_9D38F85D 
X-CRM114-Status: GOOD (  12.09  )
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

The XDMA bar is 64KiB, way too much for debugfs dump. Add register range
definitions for all defined registers in PG195. As this is PCIe memory
range all readable registers are marked as volatile.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Although the change itself is independent, this patch context depends on
[1].

[1] https://lore.kernel.org/all/20251013-xdma-max-reg-v5-1-83efeedce19d@amarulasolutions.com/

 drivers/dma/xilinx/xdma.c | 89 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 5ecf8223c112e..3d9e92bbc9bb0 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -33,12 +33,101 @@
 #include "../virt-dma.h"
 #include "xdma-regs.h"
 
+static const struct regmap_range xdma_wr_ranges[] = {
+	/* H2C channel registers */
+	regmap_reg_range(0x0004, 0x000c),
+	regmap_reg_range(0x0040, 0x0040),
+	regmap_reg_range(0x0088, 0x0098),
+	regmap_reg_range(0x00c0, 0x00c0),
+	/* C2H channel registers */
+	regmap_reg_range(0x1004, 0x100c),
+	regmap_reg_range(0x1040, 0x1040),
+	regmap_reg_range(0x1088, 0x1098),
+	regmap_reg_range(0x10c0, 0x10c0),
+	/* IRQ Block registers */
+	regmap_reg_range(0x2004, 0x2018),
+	regmap_reg_range(0x2080, 0x208c),
+	regmap_reg_range(0x20a0, 0x20a4),
+	/* Config Block registers */
+	regmap_reg_range(0x301c, 0x301c),
+	regmap_reg_range(0x3040, 0x3044),
+	regmap_reg_range(0x3060, 0x3060),
+	/* H2C SGDMA registers */
+	regmap_reg_range(0x4080, 0x408c),
+	/* C2H SGDMA registers */
+	regmap_reg_range(0x5080, 0x508c),
+	/* SGDMA Common registers */
+	regmap_reg_range(0x6010, 0x6018),
+	regmap_reg_range(0x6020, 0x6028),
+	/* MSI-X Vector Table and PBA */
+	regmap_reg_range(0x8000, 0x81fc),
+	regmap_reg_range(0x8fe0, 0x8fe0),
+};
+static const struct regmap_range xdma_rd_ranges[] = {
+	/* H2C channel registers */
+	regmap_reg_range(0x0000, 0x0004),
+	regmap_reg_range(0x0040, 0x004c),
+	regmap_reg_range(0x0088, 0x0090),
+	regmap_reg_range(0x00c0, 0x00d0),
+	/* C2H channel registers */
+	regmap_reg_range(0x1000, 0x1004),
+	regmap_reg_range(0x1040, 0x104c),
+	regmap_reg_range(0x1088, 0x1090),
+	regmap_reg_range(0x10c0, 0x10d0),
+	/* IRQ Block registers */
+	regmap_reg_range(0x2000, 0x2004),
+	regmap_reg_range(0x2010, 0x2010),
+	regmap_reg_range(0x2040, 0x204c),
+	regmap_reg_range(0x2080, 0x208c),
+	regmap_reg_range(0x20a0, 0x20a4),
+	/* Config Block registers */
+	regmap_reg_range(0x3000, 0x301c),
+	regmap_reg_range(0x3040, 0x3044),
+	regmap_reg_range(0x3060, 0x3060),
+	/* H2C SGDMA registers */
+	regmap_reg_range(0x4000, 0x4000),
+	regmap_reg_range(0x4080, 0x408c),
+	/* C2H SGDMA registers */
+	regmap_reg_range(0x5000, 0x5000),
+	regmap_reg_range(0x5080, 0x508c),
+	/* SGDMA Common registers */
+	regmap_reg_range(0x6000, 0x6000),
+	regmap_reg_range(0x6010, 0x6010),
+	regmap_reg_range(0x6020, 0x6020),
+	/* MSI-X Vector Table and PBA */
+	regmap_reg_range(0x8000, 0x81fc),
+	regmap_reg_range(0x8fe0, 0x8fe0),
+};
+static const struct regmap_range xdma_precious_ranges[] = {
+	/* H2C channel registers */
+	regmap_reg_range(0x0044, 0x0044),
+	/* C2H channel registers */
+	regmap_reg_range(0x1044, 0x1044),
+};
+static const struct regmap_access_table xdma_wr_table = {
+	.yes_ranges = xdma_wr_ranges,
+	.n_yes_ranges = ARRAY_SIZE(xdma_wr_ranges),
+};
+static const struct regmap_access_table xdma_rd_table = {
+	.yes_ranges = xdma_rd_ranges,
+	.n_yes_ranges = ARRAY_SIZE(xdma_rd_ranges),
+};
+static const struct regmap_access_table xdma_precious_table = {
+	.yes_ranges = xdma_precious_ranges,
+	.n_yes_ranges = ARRAY_SIZE(xdma_precious_ranges),
+};
+
 /* mmio regmap config for all XDMA registers */
 static const struct regmap_config xdma_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
 	.max_register = XDMA_MAX_REG_OFFSET,
+	.wr_table = &xdma_wr_table,
+	.rd_table = &xdma_rd_table,
+	.volatile_table = &xdma_rd_table,
+	.precious_table = &xdma_precious_table,
+	.cache_type = REGCACHE_NONE,
 };
 
 /**
-- 
2.43.0


