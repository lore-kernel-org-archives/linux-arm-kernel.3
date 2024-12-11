Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B09EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hP52LCokD7s7l+czqLY7ENifkcs6FttWiM43399gFg=; b=OcC6ApeYOQeTIja/+Z+/6I95k9
	hpY5LtN+n8tWvUJIZ42HiVek9IuqRcQbDPpgSdt6RJ6Wc3bCPYI9TVsVTl3qwbgD9sb5X9KTI+UVW
	5Bb6bqK+GZ5WYolv5rJUR+YnZMerNpzhzCpR2vie59N582y7ViZJl05mNc+XJXPfwcf82vLQoeNOC
	filfnqe7pitrV44KI1WpOLimbCnG6a3vKpVC9kxWcH+wOkokCFVSiCT1HSr7MgHrwR0JnqqFcBTTU
	E7fT9v+D9fYB8k9DYmXBhch1E9fB/O/DIwdNPqzkGoxXz8iA57jYGcMpMDtolEXXxDRoj6bOem+cf
	JVoP8BBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRtQ-0000000Fnz4-1Vqb;
	Wed, 11 Dec 2024 18:57:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLRop-0000000Fm80-43WE;
	Wed, 11 Dec 2024 18:52:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1B4EA41856;
	Wed, 11 Dec 2024 18:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986F6C4CED4;
	Wed, 11 Dec 2024 18:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733943138;
	bh=W92itmm6nIz7U96ODCMuGNd+u6iLSuSzSf/TPSVW9/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rLBFu67SRz0Bz0Br64PnNGoQ85fGvFH/9zL7CPCxnLrVqekewD4Uo4ZsYbexJhYB/
	 1A7BsscAQdKiCOKTIuc0iA6Z83zhHi8InuMNsdRW8DC8w1/itrq/bV4u/p0DJk9Sho
	 VhmNA9PyJKVuXxhX5wwSwyB+G102gOVMFyGCNdVSKJl/zdHwGJdxP5kWWxP7R8TypV
	 JPkYZDCxqWwmtEu3DETRBlSGez+6Xwl71RgZyG27YGvDG9hOzhcqa3qq69NegJoMVe
	 UlVuxAS6EyA0g+NQP3KZqHeS8mdYldqehmiVPCwEiCn8KYAIC1rbJRyXzVUz6A4Djm
	 E4AvYnNMo2hHw==
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
Subject: [PATCH AUTOSEL 6.6 02/23] watchdog: mediatek: Add support for MT6735 TOPRGU/WDT
Date: Wed, 11 Dec 2024 13:51:39 -0500
Message-ID: <20241211185214.3841978-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211185214.3841978-1-sashal@kernel.org>
References: <20241211185214.3841978-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.65
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_105220_067909_122B2729 
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
index b2330b16b497a..f8c90555d0b03 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
@@ -81,6 +82,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6735_data = {
+	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6795_data = {
 	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
 };
@@ -442,6 +447,7 @@ static int mtk_wdt_resume(struct device *dev)
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
-- 
2.43.0


