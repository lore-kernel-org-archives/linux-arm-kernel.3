Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C3EC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 18:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b2+StECbPUsw8O5lvPVzsmlJ3+N7vFRXE7zgZ7GuRSk=; b=MI61ieL5tIWgO+hIj1bhLeUqZP
	HWe+8DheqAzblR1gEzNF/abt07IBfL3O5AxKMRsCyZvt9UpkrbA9xY3Jm3pcVMsNEpFbeRU5Hhl1L
	fI44jPNJ69Dn0AEbukwiWn6DPB298yHC0HsW3/OVu00lnIV7AZfymCdSU7uwFmOs2WKchZ5DIAnd5
	7XbRPesWpbFYQSDVCJx9iQHj1ddhoi02AFz7r0kjv/P2fs7slHqsKGJeWVRcwIzmTjB9hF7Yz4E0d
	EFvq74y02IBgTM4YStOFSBc9VaG9lfs2zAokwQZFeUtUplGi0w6j7+yvwbkSGv850IIvumK3PCyQH
	m1j2JcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKDX-0000000E0Vx-1OiU;
	Thu, 19 Jun 2025 18:42:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSJ7a-0000000DnHi-0z4c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 17:32:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9570617F2;
	Thu, 19 Jun 2025 17:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A1AC4CEEA;
	Thu, 19 Jun 2025 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354337;
	bh=dnW/KeOlCCPZwEfbvo8J45kgENPUMKU2wmQYqK2LIGw=;
	h=From:To:Cc:Subject:Date:From;
	b=VN0QGBbt4tRi4gq3NSM17Znien/P1ilBoWwY9IbHVkQ7Bw8Ok2MxdGEEpyKFX1p5R
	 qNn4Si4thBFEmD/nf2xLyEgupYDj38sOA08a/TGxFzbppC5c1HcGB5qd5/lElsN6Fb
	 2UZgY0kQ+rtxt2Lgw/KJvFuXaHlOPgahGuGo7H3jEO7h8nU24KDtZzsCKnf0FnsFwM
	 dUEKqfYWhc67JA+hIKRTa8M4BV5j/hz8+LVtmkGkaiiG6xCSOLe1dsFZZlWuqb91M0
	 R997NMJqIkXa7KLBcptaXLrVds5lYNuSIrcRdWJYJxnzxH6JxmNudKcrd54mxcDsHv
	 thMCbil/KaipQ==
Received: by wens.tw (Postfix, from userid 1000)
	id CD6D65FEF5; Fri, 20 Jun 2025 01:32:14 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] mfd: axp20x: Set explicit ID for AXP313 regulator
Date: Fri, 20 Jun 2025 01:32:07 +0800
Message-Id: <20250619173207.3367126-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Chen-Yu Tsai <wens@csie.org>

On newer boards featuring the A523 SoC, the AXP323 (related to the
AXP313) is paired with the AXP717 and serves as a secondary PMIC
providing additional regulator outputs. However the mfd cells are all
registered with PLATFORM_DEVID_NONE, which causes the regulator cells
to conflict with each other.

Commit e37ec3218870 ("mfd: axp20x: Allow multiple regulators") attempted
to fix this by switching to PLATFORM_DEVID_AUTO so that the device names
would all be different, however that broke IIO channel mapping, which is
also tied to the device names. As a result the change was later reverted.

Instead, here we attempt to make sure the AXP313/AXP323 regulator cell
does not conflict by explicitly giving it an ID number. This was
previously done for the AXP809+AXP806 pair used with the A80 SoC.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/mfd/axp20x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index e9914e8a29a3..25c639b348cd 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1053,7 +1053,8 @@ static const struct mfd_cell axp152_cells[] = {
 };
 
 static struct mfd_cell axp313a_cells[] = {
-	MFD_CELL_NAME("axp20x-regulator"),
+	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
+	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
-- 
2.39.5


