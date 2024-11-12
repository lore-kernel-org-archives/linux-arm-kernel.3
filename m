Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334F3D42B82
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oFTXYgHKs934udntK87Ds9cLtDDB3dtnPgSyfyt+k30=; b=Exp3lsUymfp0fMJEhVA+OtTC6/
	P+bHMn1p4KqonmCFkAm8gQ2odhBaGdrG0+KmV3wDsQt4CFF1Esx5m7K5FU+2k1uTO4lXU3nrN/3gQ
	7pe3oC+ZRQY0vENHYbOIWVpUCLTMl8myQxvQA21mwdFhnptQtN1xRPBJm70l0vrLRvXFRkXKrX5XG
	3reEdYdzRn+ahPOaSk1yBr9SqSFU6rfWUESDDgDCQc+ooDgJ1QcZqvCDs5/LAQuoHcULQllE7LTxW
	xzDAm1FF6TEFkNJhVYXLnDbO15YgyZqfLceXOlXrXcqsXBbtsvFZPgb12A9Hm282PLMIEeJ1JNJgy
	8DFZEtYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tArS2-00000003g4U-1Wqw;
	Tue, 12 Nov 2024 14:01:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqSP-00000003TQh-0udu;
	Tue, 12 Nov 2024 12:58:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9AD35A41B60;
	Tue, 12 Nov 2024 12:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79DD9C4CED0;
	Tue, 12 Nov 2024 12:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731416237;
	bh=aumUC1jKWcDK+qq7WwJfwJihetxm0F5JvzlC4NdgWL0=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=UMbRfcMLxlHLC9J6QqIpTiZG5I3hsJ0dtv1tA+Q3k3fLdEEWRcJDFDa9G0wJmEAfi
	 jXzewQL8uQXlq6k39xbp81V3ZfA+lvW9TpcC+sfLkeVLzt2NTUQQG9Pu4R26TthLCu
	 /PMFf3MoGxGqL/pqxpJvr9pMAEvAOJy7qDP8CQWRQGqFdvboj+0Ll5VjC7vgBFbrw/
	 kB+KalbqrjbITzoxfFy5YA0SNjcgziRpbZhzGW7Wqed8rzva7F8Bh+66xkOxuqX38+
	 LrE1M8vndsYVugf3K+rjrVR0jr3Ih69BjYXQf1KTxXDX1U8/oKxq4MAhYBJQ3cDoDb
	 kQUgSsWOJUM9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA44D32D8D;
	Tue, 12 Nov 2024 12:57:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Tue, 12 Nov 2024 20:57:13 +0800
Subject: [PATCH v2] clk: meson: Fix the determine rate error in
 clk_regmap_divider_ro_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-fix_childclk_of_roclk_has_been_tampered_with-v2-1-64f8009cdf2a@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAKhQM2cC/52NQQ6DIBBFr2JYl0aooU1XvUdjCAyDTKpiwNg2x
 rsXPUL/at4k/7+VZUyEmd2rlSVcKFMcC8hTxSCYsUNOrjCTtWxECff00RCod9C/dPQ6xf0IJmu
 LOOrZDBMmdPpNc+BKOAug5OXaKFYmp4Slf+iebeFAeY7pe9gXsX//FC2Cl8YNhFXeO7D1wwx97
 AjOEAfWbtv2A6RiwUTqAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731416235; l=3076;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=8AI+tmYmNulgS0Oos4nPr/9f/YnCkFdoNAlNOvZiX+k=;
 b=WNYt8589v61xwco+HqIDwnC1iODrOIA0rq+V7GBT46G5LTeEwTBownMkgl0abQ1O51r4LdNy9
 gE/wSujgJ5GCiKjMCC4QQU+iisFAWMUD223v2rIPbgsygenS6PSUYTV
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_045721_423228_DD7A2104 
X-CRM114-Status: GOOD (  13.35  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The rate determined by calling clk_regmap_divider_ro_ops with
clk_regmap_div_determine_rate is not RO, which will result in the
unexpected modification of the frequency of its children when setting
the rate of a clock that references clk_regmap_divider_ro_ops.

Fiexs: ea11dda9e091 ("clk: meson: add regmap clocks")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Background: During the execution of clk_set_rate(), the function 
clk_core_round_rate_nolock() is called to calculate the matching rate
and save it to 'core->new_rate'. At the same time, it recalculates and
updates its 'child->newrate'. Finally, clk_change_rate() is called to
set all 'new_rates'.
---
Changes in v2:
- Remove the CLK_DIVIDER_READ_ONLY judgment logic in
clk_regmap_div_determine_rate().
- Add clk_regmap_div_ro_determine_rate().
- Link to v1: https://lore.kernel.org/r/20241111-fix_childclk_of_roclk_has_been_tampered_with-v1-1-f8c1b6ffdcb0@amlogic.com
---
 drivers/clk/meson/clk-regmap.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index 07f7e441b916..edf65ca92c7a 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -80,21 +80,6 @@ static int clk_regmap_div_determine_rate(struct clk_hw *hw,
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
-	unsigned int val;
-	int ret;
-
-	/* if read only, just return current value */
-	if (div->flags & CLK_DIVIDER_READ_ONLY) {
-		ret = regmap_read(clk->map, div->offset, &val);
-		if (ret)
-			return ret;
-
-		val >>= div->shift;
-		val &= clk_div_mask(div->width);
-
-		return divider_ro_determine_rate(hw, req, div->table,
-						 div->width, div->flags, val);
-	}
 
 	return divider_determine_rate(hw, req, div->table, div->width,
 				      div->flags);
@@ -127,9 +112,28 @@ const struct clk_ops clk_regmap_divider_ops = {
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, CLK_MESON);
 
+static int clk_regmap_div_ro_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(clk->map, div->offset, &val);
+	if (ret)
+		return ret;
+
+	val >>= div->shift;
+	val &= clk_div_mask(div->width);
+
+	return divider_ro_determine_rate(hw, req, div->table, div->width,
+					 div->flags, val);
+}
+
 const struct clk_ops clk_regmap_divider_ro_ops = {
 	.recalc_rate = clk_regmap_div_recalc_rate,
-	.determine_rate = clk_regmap_div_determine_rate,
+	.determine_rate = clk_regmap_div_ro_determine_rate,
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, CLK_MESON);
 

---
base-commit: 664988eb47dd2d6ae1d9e4188ec91832562f8f26
change-id: 20241111-fix_childclk_of_roclk_has_been_tampered_with-61dbcc623746

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



