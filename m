Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBF1D41C24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 09:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3l8HpYNfs2EFwl1Bgyt5QQ8IGggSrLbdojct/api3CA=; b=A3FgTzaaPUXcV919/Owjpnn4Tg
	OPmQkgxvK9w2sGUeXzFZ/WdnuHIQ5sikvIBHm+8Dop0bcObAS4olNpRRV52N5993VKJk5tPPSw3Pp
	A2qTq/AGTjLquhINQSLrpEoeK8cJo0exCbdoWE1qQpkNc0d+JaVmbCHYrY/8v1+QixUr3PWml9U4W
	pAqvexejsV3nqfH5Am94l6N3vwq3f/ErSBfqCm36kQ/vTu0lqp4ErnDykJiZ152z2BaK/V+RZ7yPq
	JweGp5V4ODH3UfOII6Z9MuOBS0ElLp8uPFftk47Y1afBZWv16TFNLQX6i/XXSiVSyb5yOBbp5Ea3D
	GvwQ3EcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9pr-00000006GOq-1T6V;
	Wed, 13 Nov 2024 09:38:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9o3-00000006G2i-1mMw;
	Wed, 13 Nov 2024 09:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3l8HpYNfs2EFwl1Bgyt5QQ8IGggSrLbdojct/api3CA=; b=QMm3NO8M0vldMDb/M2RzH5ZPLD
	wjpJCToJV49ZSpinh1xKCz+eXy3Qj6wNlbP78KBZ/zTl5Ro/bZXmEiBq4hhvmr+DQlxhvcHLClnOg
	mbiFy5h0uKrI+jGIPJyGA+Y2jeWVhtE6ol+xf2RLBa3W6ZA8Fy0bE4dLua7UjzeXDVPpUh5w7IV8I
	pLHgsskhABZhywwomzUciSFfstaF/1R2lttE8Yog58u5NfCyfNW1wmY9Q7tRWZSawl/0aRt6YZ81v
	jV9oC8TjomHG7P4D0yqCvbF14OXskYh7auv1kmqJjpvkNdqa4zCAzNfXZbLcjP5jiu5lhXODj6MNa
	gebFQaiQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9nx-0000000DDuC-3yiQ;
	Wed, 13 Nov 2024 09:36:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 008D55C0FDA;
	Wed, 13 Nov 2024 09:36:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC09BC4CECD;
	Wed, 13 Nov 2024 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731490609;
	bh=2YwXzis6Ve+VboxE95rpK7Is2IaGUN76qS7qkgQHAFY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=lhJ5TA50hUHGpeMBkQIlZHc0Gr5VXQkn0VL7DLAOS2NaKX6Nh8iDBT/TK2cggYJ4Q
	 K9tQZtqg88EHW0pzLU/6PGR18ElQxrWwcDoa4vIV04wE/MyaNaPAx/njJ8JhSbiz4r
	 /TESdVQyd2eP6UcZyN/cqR/9r0BE5pNvExpUsuiAPL+Pk89khk8IaUrTH8BmyPjbgr
	 0LXNU6REyyDO3etATlaQetlivM+zP0GiXP0Gbhy6MPBLMD21UsxkIIN36Re1dKkzI2
	 UkA2dMmQ8RdO/oHdvXPoGb7mVlcl8Opgxc17plkQb5HM3Vxq7SAm+kVAkhow11jwy7
	 TDWsGLozax2dA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EEED41C00;
	Wed, 13 Nov 2024 09:36:48 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Wed, 13 Nov 2024 17:36:46 +0800
Subject: [PATCH v3] clk: meson: Fix the determine rate error in
 clk_regmap_divider_ro_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241113-fix_childclk_of_roclk_has_been_tampered_with-v3-1-2c624308337b@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAC1zNGcC/52NQQ6CMBBFr2K6FkMLqejKexjTlOmUTgRKWoIaw
 t0trHSps5r/k//ezCIGwsjOu5kFnCiS71Mo9jsGTvcNZmRSZiIXJU+XWXoqcNQaaO/KWxX8+jg
 dVY3Yq1F3AwY06kGjyyQ3NYAUxbGULCGHgGm/6a63lB3F0YfXZp/42v4pmniWFhXwWlproM4vu
 mt9Q3AA37FVNYlPvPgRLxJelrbK8xMYK/Q3flmWN5K5x29JAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731490607; l=2575;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=EwVrOsGFSv8d11s7BZKnGfuGkTWiDeiqd6+q7e3YxDQ=;
 b=FQKgJ4e25qoC6/pS5s/LNKSQtYlURL82MNRads2emSz7hMQgT+Pdvo1F0lrZBv7TDf4Hj8wO7
 D4AyvSvv+Z+B08f/Pet19xHCatpX7Q1zwO5iG3rKmpqNvF77PYuXkGo
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_093654_981314_B70E28B5 
X-CRM114-Status: GOOD (  12.00  )
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
clk_regmap_div_determine_rate is not 'RO', which will result in the
unexpected modification of the frequency of its children when setting
the rate of a clock that references clk_regmap_divider_ro_ops.

Fixes: ea11dda9e091 ("clk: meson: add regmap clocks")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Background: During the execution of clk_set_rate(), the function 
clk_core_round_rate_nolock() is called to calculate the matching rate
and save it to 'core->new_rate'. At the same time, it recalculates and
updates its 'child->newrate'. Finally, clk_change_rate() is called to
set all 'new_rates'.
---
Changes in v3:
- Restore clk_regmap_div_determine_rate().
- Link to v2: https://lore.kernel.org/r/20241112-fix_childclk_of_roclk_has_been_tampered_with-v2-1-64f8009cdf2a@amlogic.com

Changes in v2:
- Remove the CLK_DIVIDER_READ_ONLY judgment logic in
clk_regmap_div_determine_rate().
- Add clk_regmap_div_ro_determine_rate().
- Link to v1: https://lore.kernel.org/r/20241111-fix_childclk_of_roclk_has_been_tampered_with-v1-1-f8c1b6ffdcb0@amlogic.com
---
 drivers/clk/meson/clk-regmap.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index 07f7e441b916..2b0b4eb0a3f0 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -127,9 +127,28 @@ const struct clk_ops clk_regmap_divider_ops = {
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



