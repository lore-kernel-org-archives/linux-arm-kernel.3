Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06824D12D68
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+DGuCnyvM9Dhga5BbPYR/KepBQjSrnnpoGcRAjwsUg=; b=dGNGbw+cdlAmOhJGxng1/XzucA
	4fQlgAkCgBeT4x5JYF5KKgC1CbudTLpK7KyBXx+gnNirLf9QzKP8YoCKpiLpmeuDcYiD50Hkiywvq
	vHqQMPacN4InL9STvbskoauRSGmC7//mJkvCdg9L/Wn/3/UJEvrcd/Mli7Tg3YhM9t8Ea7jhVfkwv
	+++9n1hXLStN7440mKpXJQK/NrWumJQGN32uO7SVN7ZzRybNJ6tLO85wDtz7TzL6XKAiDdjyJR6rp
	gAJtg5ZRvDqfLZdrRsdXFJrU0R6ZKXuuL7WDJOGHo1MB/VC8674mxIAxa/eFZyqQftfLi5U23LHiC
	JdoHeLeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALGY-0000000GEsB-25Rr;
	Mon, 11 Nov 2024 03:39:02 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALEl-0000000GEYN-38mL;
	Mon, 11 Nov 2024 03:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8DA4A40CD1;
	Mon, 11 Nov 2024 03:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9305C4CECF;
	Mon, 11 Nov 2024 03:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731296229;
	bh=FLYPFnw2Yqnj3auU91LfHIFR9j23kCj3QGzsgZlM2TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pgvqDa4pX+626RzLwZsL24T9zfPieZu92smUBkx72aDNnWAfWqiJH7sjEBkfHQ14a
	 jv9zS0gyJ/a6vC0CEjTH918NYMABEmiZ8PV5Gv6UxJrJD8weKKQHfyG4claUg/S4l/
	 G/N65cg0/2d8y0O++T8ieMKgiPV3VYb9Vwqek5Q6ioXYpk3mpXrgKMwISnQHyTC9Pr
	 d7dz9Yr+6eOjtmN8tFVk+I3SWnH0HguJcVXZ/8prA+0uJxEFFRhaVyWN86mi6v3m8v
	 SRB5JrktapbOgAGdWFjAygR5MPvPsCX1nRpHwnCKmnnzx0HwEylx6R8ldcI0ifUFKe
	 /EwCR3aW8XsVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B29D12D63;
	Mon, 11 Nov 2024 03:37:09 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Mon, 11 Nov 2024 11:37:01 +0800
Subject: [PATCH v2 1/3] clk: Fix the CLK_IGNORE_UNUSED failure issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-fix_glitch_free-v2-1-0099fd9ad3e5@amlogic.com>
References: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
In-Reply-To: <20241111-fix_glitch_free-v2-0-0099fd9ad3e5@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731296227; l=3533;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=9b1cy9TNBZPPfcNjZa5uI79KkJxq5esCtVNt/pf2DF4=;
 b=B3YI7KWQBzzPirhueg0Y4FP+swR7rBAu+MWHP4YpU+sGHKo/kUjKDGkCpEzczH87qc/QhIka2
 B60vBX1oqjgDzindHyBmrnyp1s2NwPm++D2kOiKV4dLgTCeZYz/CqIX
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_193711_966810_3FA8A453 
X-CRM114-Status: GOOD (  16.49  )
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

When the clk_disable_unused_subtree() function disables an unused clock,
if CLK_OPS_PARENT_ENABLE is configured on the clock,
clk_core_prepare_enable() and clk_core_disable_unprepare() are called
directly, and these two functions do not determine CLK_IGNORE_UNUSED,
This causes the clock to be disabled even if CLK_IGNORE_UNUSED is
configured when clk_core_disable_unprepare() is called.

Two new functions clk_disable_unprepare_unused() and
clk_prepare_enable_unused() are added to resolve the preceding
situation. The CLK_IGNORE_UNUSED judgment logic is added to these two
functions. To prevent clock configuration CLK_IGNORE_UNUSED from
possible failure.

Fixes: a4b3518d146f ("clk: core: support clocks which requires parents
enable (part 1)")
Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/clk.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d02451f951cf..6def76c30ce6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -94,6 +94,7 @@ struct clk_core {
 	struct hlist_node	debug_node;
 #endif
 	struct kref		ref;
+	bool			ignore_enabled;
 };
 
 #define CREATE_TRACE_POINTS
@@ -1479,6 +1480,68 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 	}
 }
 
+static void __init clk_disable_unprepare_unused(struct clk_core *core)
+{
+	unsigned long flags;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return;
+
+	if ((core->enable_count == 0) && core->ops->disable &&
+	    !core->ignore_enabled) {
+		flags = clk_enable_lock();
+		core->ops->disable(core->hw);
+		clk_enable_unlock(flags);
+	}
+
+	if ((core->prepare_count == 0) && core->ops->unprepare &&
+	    !core->ignore_enabled)
+		core->ops->unprepare(core->hw);
+
+	core->ignore_enabled = false;
+
+	clk_disable_unprepare_unused(core->parent);
+}
+
+static int __init clk_prepare_enable_unused(struct clk_core *core)
+{
+	int ret = 0;
+	unsigned long flags;
+
+	lockdep_assert_held(&prepare_lock);
+
+	if (!core)
+		return 0;
+
+	ret = clk_prepare_enable_unused(core->parent);
+	if (ret)
+		return ret;
+
+	if ((core->flags & CLK_IGNORE_UNUSED) && clk_core_is_enabled(core))
+		core->ignore_enabled = true;
+
+	if ((core->prepare_count == 0) && core->ops->prepare) {
+		ret = core->ops->prepare(core->hw);
+		if (ret)
+			goto disable_unprepare;
+	}
+
+	if ((core->enable_count == 0) && core->ops->enable) {
+		flags = clk_enable_lock();
+		ret = core->ops->enable(core->hw);
+		clk_enable_unlock(flags);
+		if (ret)
+			goto disable_unprepare;
+	}
+
+	return 0;
+disable_unprepare:
+	clk_disable_unprepare_unused(core->parent);
+	return ret;
+}
+
 static void __init clk_disable_unused_subtree(struct clk_core *core)
 {
 	struct clk_core *child;
@@ -1490,7 +1553,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 		clk_disable_unused_subtree(child);
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
-		clk_core_prepare_enable(core->parent);
+		clk_prepare_enable_unused(core->parent);
 
 	flags = clk_enable_lock();
 
@@ -1517,7 +1580,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 unlock_out:
 	clk_enable_unlock(flags);
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
-		clk_core_disable_unprepare(core->parent);
+		clk_disable_unprepare_unused(core->parent);
 }
 
 static bool clk_ignore_unused __initdata;

-- 
2.42.0



