Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05713E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 18:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CcophrXStUW6PPY5OQ6Q6xN6zKlVgz8mY+TBrO2yC8c=; b=FIE6xlUcFV9V4qS3Pu5fqNBIJo
	Muva0THz/DZWknzhUN0V7pr3VYoR10/qoIqulaAp7y4wFYZBy9RgqqYDbqlX7Q64Ci329Nnp7WDlB
	F3lCggRwc0vTNmoZXfBgv/j9Uf0FzqKIJFYIX7KcyFNIoHMXa8izqakU70k5szyx1B7k/s4S6pL7F
	O65sXm7U5f4Z5kT7UmNFyqTQkPcYxFEhBkIlDAEKKdjl+IP5ulf/LN50ISd0aWtsQjWCmU0m2+VjE
	03fSHQZ8T7vPVabY3cN8ZEizyEdV13U4KrVgLebx5ZumNTOpp1Xqg+HmrqeYpHA1dSqR3Jj5CeTGa
	tFdiLWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRpG-0000000FmEE-1M1R;
	Wed, 11 Dec 2024 18:52:46 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRnB-0000000Flco-0PWh;
	Wed, 11 Dec 2024 18:50:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 145DAA41867;
	Wed, 11 Dec 2024 18:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3268C4CED2;
	Wed, 11 Dec 2024 18:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733943036;
	bh=4EXLjDTriVc1je8/0CUblwdhPgHCunMQ0LA3jn8a5AM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VzKETxIBY6M2tTVxSyMrWX6sLyCO5YEDgPgTt2jzA2mWktvZwGArEL+1qG4zR3QpB
	 y6JcL57z4B9XCXrF/s/vHvlDbIC1TNp1rFDhAUKeAWfNYNHgHTsz+DaUEawoLGgkMB
	 NpfnpneoI1z15JJnZwTqV5sgz7UPbejILsa9SqeUxg0y36P81Ba+fL28+6ATB46i1f
	 FpMipNMxYqt3dAuN5yxjIGNt+TbqntgYcZlEbOUdAh9zQK+7EH+ScyXkFmIR06MfNw
	 ee8a6sotdovGzsiW28kO1aqMfV67217pGw0c8f3mhjvnzGbV+oZEt/HFnJZ+1yp2AL
	 RNiW3clH0oipg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 04/36] watchdog: mediatek: Add support for MT6735 TOPRGU/WDT
Date: Wed, 11 Dec 2024 13:49:20 -0500
Message-ID: <20241211185028.3841047-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211185028.3841047-1-sashal@kernel.org>
References: <20241211185028.3841047-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.4
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_105037_206384_4E00E7D6 
X-CRM114-Status: GOOD (  10.18  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

[ Upstream commit 15ddf704f56f8c95ff74dfd1157ed8646b322fa1 ]

Add support for the Top Reset Generation Unit/Watchdog Timer found on
MT6735.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20241106104738.195968-3-y.oudjana@protonmail.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index c35f85ce8d69c..91a11715f6de5 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
@@ -87,6 +88,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6735_data = {
+	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6795_data = {
 	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
 };
@@ -483,6 +488,7 @@ static int mtk_wdt_resume(struct device *dev)
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
-- 
2.43.0


