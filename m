Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EADC44520
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 01:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OLFTIGcp3bYO3KIt/KGlovcaLt2NX/PWPoIuZRHESGA=; b=N1QBr2Jun7cZkh47qN0Bp4smCk
	3S24tr1fDhBy65/O21knwnfV4V8c4y1XH/GtxkRCfaqkxi3gKkCEoECCf36xbT5iX74oEzL408ENh
	pHDJGhu1WxOQmFygg/OfI4X2nStZGi3NxVHFXfqP0UNv8HM+ETsC3pqLRxs3r0l+ljvaqlPFpcXzK
	hSJ7tVNbr78kumZMCVomJYBortH1zGXMnkawaFwlHAVSFDU1fB8e3ZXAfVFGYAvq04OFCXfDzsQe9
	Un6NdVEzkmNkt2NJBLkh36oc+BPEayqpstUgZED9jNtViTCjo0PmTqHCc1qJSjuFir4+gz4wayDlr
	ZW8tURRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wktVV-00000003Tlx-0R19;
	Sat, 18 Jul 2026 01:06:21 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wktVR-00000003TlL-3Njr;
	Sat, 18 Jul 2026 01:06:19 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wktVH-000000004zb-25WJ;
	Sat, 18 Jul 2026 01:06:07 +0000
Date: Sat, 18 Jul 2026 02:05:59 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] regulator: mt6358: use regmap helper to read fixed LDO
 calibration
Message-ID: <dcd98d81dede338c9bbb9700a9613c848b702e49.1784336005.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_180617_846312_168785D4 
X-CRM114-Status: GOOD (  12.49  )
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

The "fixed" LDOs with output voltage calibration use
mt6358_get_buck_voltage_sel as their get_voltage_sel op, but the
MT6358_REG_FIXED and MT6366_REG_FIXED entries do not populate
da_vsel_reg/da_vsel_mask. The op therefore reads register 0x0 with a
zero mask and shifts the result by ffs(0) - 1 = -1, which is undefined
behaviour and gets flagged by UBSAN on every boot on MT6366 boards:

  UBSAN: shift-out-of-bounds in drivers/regulator/mt6358-regulator.c:384:38
  shift exponent -1 is negative
  Call trace:
   mt6358_get_buck_voltage_sel+0xc8/0x120
   regulator_get_voltage_rdev+0x70/0x170
   set_machine_constraints+0x504/0xc38
   regulator_register+0x324/0xc68

Besides the undefined shift, the returned selector is always 0, so the
actual calibration offset programmed in <reg>_ANA_CON0 is never
reported.

The descriptor already carries the correct vsel_reg/vsel_mask (the
ANA_CON0 calibration field), matching the regulator_set_voltage_sel_regmap
op already in use. Read the selector back through
regulator_get_voltage_sel_regmap instead.

Fixes: cf08fa74c716 ("regulator: mt6358: Add output voltage fine tuning to fixed regulators")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/regulator/mt6358-regulator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index f2bb3c1523ca..d6a0ec406b07 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -492,7 +492,7 @@ static const struct regulator_ops mt6358_volt_fixed_ops = {
 	.list_voltage = regulator_list_voltage_linear,
 	.map_voltage = regulator_map_voltage_linear,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
-	.get_voltage_sel = mt6358_get_buck_voltage_sel,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
 	.set_voltage_time_sel = regulator_set_voltage_time_sel,
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
-- 
2.55.0

