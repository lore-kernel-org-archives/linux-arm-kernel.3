Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAB8FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7HBSU125bKDpp0A3u0mngaJXpspGRFJ+FxyU/GSLm8=; b=3OctDkRnemP/lqBTrNhI86A4Ej
	85D7C8G5ssK/HfE9AGKXA+Us8RmGt5zhC2q8ZHMNyEdU4ypkysGrj/D0Qp8gqRMP+ypElQsO9UEhV
	4tpVIj+opXretCiWdByML0/TTpLQ7F+yAIBmzVn7ISH8VkOj8Qgprx0VJRIxbFERyNKxThdJCBYbY
	QStDDMBSdi25d6T3WBJR0jTv03E4VH8KqzxGanFSx9gwrrLjYPYr1x/E8PpbFTSRgae7FBLiNsGCf
	hQ1KKIiU6AetqZ7AdKbQGkvS+TT9hrhaicgSaha8jv3ubenMSlR9IItO85TSekTIpT996kxQu5wI5
	yHPyXSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITP0-00000005eMB-00rx;
	Thu, 30 Apr 2026 15:34:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITOu-00000005eHM-30bu;
	Thu, 30 Apr 2026 15:34:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20D0960180;
	Thu, 30 Apr 2026 15:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42CE2C4AF0B;
	Thu, 30 Apr 2026 15:33:59 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-gpio@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/7] pinctrl: single: Fix type in .pin_config_group_get() callback
Date: Thu, 30 Apr 2026 17:33:18 +0200
Message-ID: <72df69f272aa302059c470e0680a9c70985aaf36.1777562725.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777562725.git.geert+renesas@glider.be>
References: <cover.1777562725.git.geert+renesas@glider.be>
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

On 64-bit platforms, "unsigned long" is 64-bit.  Hence checking if all
"unsigned long" configuration values are equal should be done using an
"unsigned long" temporary.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/pinctrl-single.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 7e022a46ee422dc1..4d5f85b7e6bbe2b0 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -619,8 +619,9 @@ static int pcs_pinconf_set(struct pinctrl_dev *pctldev,
 static int pcs_pinconf_group_get(struct pinctrl_dev *pctldev,
 				unsigned group, unsigned long *config)
 {
+	unsigned long old = 0;
 	const unsigned *pins;
-	unsigned npins, old = 0;
+	unsigned npins;
 	int i, ret;
 
 	ret = pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
-- 
2.43.0


