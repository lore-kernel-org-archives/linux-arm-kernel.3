Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AA5CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 17:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HRChiWgvbp/QT1Pv2ElPVt8Su2o/r7JcmWGd4uX9oCE=; b=3hUwK1KY0JnG+XPjhuqhpzfg97
	w+EEwlj/k7NOlvYnCx2WfHiw8c+dPy3SgZn7wqgvONLt6ijYeJqpGLrhXNzsPYghkVSMNTheADR5O
	aTWJCl1Pt4AojCrJ0ydy+YGUXDDJBzyo8DZ/kkk7QyhxZmv50Hvm/3bYE6p1Lx6SlbJcadnqGbX+c
	/1Ac24u0QdTYM5NHRAOnGChaRr8MEfVFIc/ASXPlhvw0vItKHdGB3ixwyYyhsGHxmfG8kTiz84VcF
	WfJCro9ZWnzonzC0liczZSNWLv10MFXmhHOCWPlyGC5ANKnc6kARdnIlAQWJ1KswnlCFb2K1jhbQy
	6udnRByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOf4U-0000000D5O5-02vD;
	Sun, 17 May 2026 17:14:34 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOf4Q-0000000D5Ms-1N7y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 17:14:32 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 30C3C1F80044
	for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 17:14:25 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 89BBDB407A0; Sun, 17 May 2026 17:14:24 +0000 (UTC)
Received: from collins (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id CB7A8B4079C;
	Sun, 17 May 2026 17:14:06 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH] pinctrl: sunxi: Implement function_is_gpio
Date: Sun, 17 May 2026 19:14:05 +0200
Message-ID: <20260517171405.3697469-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_101430_528320_206C2D03 
X-CRM114-Status: GOOD (  10.38  )
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

The function_is_gpio pinmux op allows the core to find out whether a
GPIO can be safely requested from a pinctrl property and requested as a
GPIO at the same time.

This is especially useful to request a GPIO with a particular drive
strength, which would otherwise not be possible.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index d3042e0c9712..6162f2d86723 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -821,6 +821,17 @@ static int sunxi_pmx_get_func_groups(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
+static bool sunxi_pmx_function_is_gpio(struct pinctrl_dev *pctldev,
+				       unsigned function)
+{
+	struct sunxi_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
+
+	if (!strncmp(pctl->functions[function].name, "gpio", 4))
+		return true;
+
+	return false;
+}
+
 static void sunxi_pmx_set(struct pinctrl_dev *pctldev,
 				 unsigned pin,
 				 u8 config)
@@ -952,6 +963,7 @@ static const struct pinmux_ops sunxi_pmx_ops = {
 	.get_functions_count	= sunxi_pmx_get_funcs_cnt,
 	.get_function_name	= sunxi_pmx_get_func_name,
 	.get_function_groups	= sunxi_pmx_get_func_groups,
+	.function_is_gpio	= sunxi_pmx_function_is_gpio,
 	.set_mux		= sunxi_pmx_set_mux,
 	.gpio_set_direction	= sunxi_pmx_gpio_set_direction,
 	.request		= sunxi_pmx_request,
-- 
2.54.0


