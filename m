Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D02C83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 13:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rsOaNz3ckMQVGLDratD9aLFM3UYFXLOKl9hejPveJQc=; b=LfC/u970RDXHtLs9TL7PfWaZ7U
	TjrobKcC9iAz8ZbPmTC7v/gTxACFA2XByhY1/HZQBA9+iR7Rc60EwgMbmwSrLZAGEjmrkQkTGgtgf
	EhrkMLD3S1WJ2KFlDrFZPeWsVjcg8/5QRXVlw7oD2dZxExJ/dm69bo7TDU9vztmo7hy7e7VsBuFm7
	8NriBMQL+8cfl7kOKRfWyA8Qv/7Y7Mr6rMDIBnrOB02545K5PDpJr+muk3kZxZ3wjanjFWSwtHEsq
	qXD4zPXOxql5JI/EgUs7ygun4pZy8O4n3FuwxDQfh4VpT1jo2DteTdQ6pQk7QEibLSxuslppgWuUv
	QgP3tg8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWF2w-00000002Sw7-3nAC;
	Mon, 30 Jun 2025 13:59:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWEwI-00000002Rsn-3HjM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 13:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26F306112D;
	Mon, 30 Jun 2025 13:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDA7C4CEE3;
	Mon, 30 Jun 2025 13:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751291573;
	bh=BLeTzHiVYrcH1QMezUXpiaCbYaNy9iuQfkkE2j1kvvE=;
	h=From:To:Cc:Subject:Date:From;
	b=QUeRuwJP7seoHvP5pT7ExodC3YkDQfgxpX9UsCECDZSrA854UnDVVmpbr4ADiskqH
	 pJzriguNTvsMpj2ZApq6LhIwD+o+nL8kH1OXkUyJo8CIxlYuTVqnIRwYzVrFw9vbE5
	 aMoQIUaCucRlHugGoeOeO+aUkIpRhV5i6/OiJZuEC3I7UlkZio76ZWeVyhQV0x2hvH
	 /bm4yfVoRnb5ztKlrAAmOulG0YKHLXuzUktq3MpzEtv49eX6ct4ppQOctB7T5IrA6/
	 4HN/5ksr3XzgIP4JahmoVoYZRj07aC4WuEH+WicgD7CXm9cUiDh7Ob/mAKClpSHohd
	 a5Ms7kwslVxOA==
Received: by wens.tw (Postfix, from userid 1000)
	id BCF125FE2C; Mon, 30 Jun 2025 21:52:50 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] mfd: axp20x: Skip PEK on AXP313A/AXP323 if no interrupt line is available
Date: Mon, 30 Jun 2025 21:52:49 +0800
Message-Id: <20250630135249.3961621-1-wens@kernel.org>
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

Originally an explicit ID for the AXP313/AXP323 regulator was set to
avoid a conflict with the primary AXP717 PMIC on Allwinner A523 family
boards.

This didn't entirely work since on some or all of these boards, the
interrupt line on this secondary PMIC was left unconnected, and thus
the driver would fall back to the generic "no interrupt; only regulators"
case, which didn't have the explicit ID set, thus undoing the intended
fix.

Explicitly exclude the PEK cell in the no IRQ case for the
AXP313/AXP323, instead of using the generic fallback.

Fixes: 249abf9b1e25 ("mfd: axp20x: Set explicit ID for AXP313 regulator")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
The other option would be to move the explicit ID to the generic
fallback case instead. This is really only visible in sysfs and the
kernel logs, so probably not that important.
---
 drivers/mfd/axp20x.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 25c639b348cd..8877482a95a1 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1055,6 +1055,7 @@ static const struct mfd_cell axp152_cells[] = {
 static struct mfd_cell axp313a_cells[] = {
 	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
 	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
+	/* Keep PEK as last entry for exclusion in no-irq cases */
 	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
 };
 
@@ -1306,12 +1307,18 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
 		axp20x->irq_flags = IRQF_TRIGGER_LOW;
 		break;
 	case AXP313A_ID:
+		/* Exclude PEK if no IRQ is available */
+		nr_cells_no_irq = ARRAY_SIZE(axp313a_cells) - 1;
+		cells_no_irq = axp313a_cells;
 		axp20x->nr_cells = ARRAY_SIZE(axp313a_cells);
 		axp20x->cells = axp313a_cells;
 		axp20x->regmap_cfg = &axp313a_regmap_config;
 		axp20x->regmap_irq_chip = &axp313a_regmap_irq_chip;
 		break;
 	case AXP323_ID:
+		/* Exclude PEK if no IRQ is available */
+		nr_cells_no_irq = ARRAY_SIZE(axp313a_cells) - 1;
+		cells_no_irq = axp313a_cells;
 		axp20x->nr_cells = ARRAY_SIZE(axp313a_cells);
 		axp20x->cells = axp313a_cells;
 		axp20x->regmap_cfg = &axp323_regmap_config;
-- 
2.39.5


