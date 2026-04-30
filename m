Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9E1CD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BH2eMwmDXpvou/fq3WbwrmyD7sCikHzZTFRhPhW/Tu4=; b=UZowQg+ud/1ExQrBdr1T4R7nHP
	vTjzNu0347Q2S9E9QuXfftujEYpw7zv6IkL333Y52sUKyPlzc+RdNJ9FfnYlrjwNVGsOD5fvgV53J
	Ly1q1RQKPvhZ6pa+ryoHFBm51Y1EXUbSzuYCpDKvxsrHjcwgi3gir9nevXLDgFAwElp7pOq0ISteg
	kP8ZcVgDJHs/60uX4Yb7dGXEsJjkyDhbYpNzNmr9ZjdoNKfH4lFyTe0wYgy37PzDK1GLVCCXsl7EN
	Lc/eQNj062yWV4AHHW3IB/mXKlztkZiPRKW3FzIejk5a+s1lRsIzWcmnqKpftdmgjw+QYAh5Dy8xQ
	NAjxQwkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITOn-00000005eBb-2v50;
	Thu, 30 Apr 2026 15:33:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITOh-00000005e75-49Ix;
	Thu, 30 Apr 2026 15:33:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0152441CA;
	Thu, 30 Apr 2026 15:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97E7C2BCB9;
	Thu, 30 Apr 2026 15:33:47 +0000 (UTC)
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
Subject: [PATCH 4/7] pinctrl: mediatek: moore: Fix type in .pin_config_group_get() callback
Date: Thu, 30 Apr 2026 17:33:15 +0200
Message-ID: <ebdc02536f922f2261d6d338a6afa234015621ff.1777562725.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1777562725.git.geert+renesas@glider.be>
References: <cover.1777562725.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_083352_055057_036B88A7 
X-CRM114-Status: GOOD (  10.65  )
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
 drivers/pinctrl/mediatek/pinctrl-moore.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index 071ba849e5322396..17e30f83dc1972c0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -402,7 +402,8 @@ static int mtk_pinconf_group_get(struct pinctrl_dev *pctldev,
 				 unsigned int group, unsigned long *config)
 {
 	const unsigned int *pins;
-	unsigned int i, npins, old = 0;
+	unsigned int i, npins;
+	unsigned long old = 0;
 	int ret;
 
 	ret = pinctrl_generic_get_group_pins(pctldev, group, &pins, &npins);
-- 
2.43.0


