Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321B2C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5JtOvmWNd6bFlW0/aoEOGT6DG3kDULQFhCTqNCWRuo=; b=0YcItGE8n+Me3tX1KVCvHYS9IF
	wYN/b9uSmAowI/K+M3BpPct7WST2w/ECjSWrBR2oT44XkVV5UJkpD/KAa4tkx/d6Od3V+8TTJ4Rlh
	hSP/dCPJ+k08DMYFyzkXcfw9yfhmNOvNLFJQ19IAkdmBqI0E74AAoiE8tpGHwETgkS58/C2ZEz09Q
	ODFlqo1gxt9buest8LJvtVziCT/3v6fLQlCjpMkJgPQBqz+0CEtYiigONYXqeEoOIy4JKWEyWz/AI
	rb2y3yQx2VmQC0bYgBhskuIa7uJbq6X02iZMt2bVk90JNIUJWmL+PJ6OOUvkkv71ZM6xQynbImD6O
	17uQl4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TZA-00000006ocC-1t8C;
	Tue, 15 Sep 2026 13:51:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TXw-00000006nTB-20uP;
	Tue, 15 Sep 2026 13:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480198;
	bh=vswEIu9Vf4rsFEgSwN3S8wzjXFBYhtVhUdWv0v1IcQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z0wa18VIHXQIvcBUVncI/gS4flzDgHMa8K0sEqBpp5SbSvjxgA416yILzc8eXVAiM
	 oDLhLmloNEg2SjmGrh2DBajGqbR75uLcU0TppvnL228KEazNLKkI1GIpj8tgXfw0Q9
	 Ru9XF6ZkBtxVqbTaaOoCRiFh0NpYCrhgn80UYexThoxqLgY350wqeqaPJjZNGfXF7J
	 1CoxwD29Wjy3FkKk8yPOMwHV74yKCVAQsvBXU5lW0Sa4dtn9F0jSPKaPPul+2Neuoo
	 VCofvpHurPnXjUoZl5VN3WALXycLTXelAQtZSzPj7F3iuT994S2qYUwpt82o7rIM7u
	 L8t3sOk5D/rxg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE2C117E0B0F;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 30673480035; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:52 +0200
Subject: [PATCH v15 05/16] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-5-80e2c11d1ce8@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vswEIu9Vf4rsFEgSwN3S8wzjXFBYhtVhUdWv0v1IcQU=;
 b=owJ4nAFsApP9kA0DAAoB2O7X88g7+poByyZiAGqpTQVYYVNwwp4mbUZlXo3+265HLCWpxp0Sm
 OVSOMSNL2bkdYkCMgQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qaBj4P923eaOGsSviB7JLlFjPTUl24y6ysLEbKA1SKclz6weNbjNPOx8RrUzXYbCc9lb4vBR2
 g3nzoQEy0tbfG/OuQEgteOjIoFcfJRAJPH6XApzevvDFGO/Vk/SDOyEUEZ8gpi2zUMh/P8ES6g3
 WRwS/wPzPjbsucY1HHYvdFLJ+Lu8Tf0fc6bkvqBB3r+MvNM7ozNTHfTgHw2Z4MfZVuZL/ESDRAh
 UXfDU8TgV2Gs2xcJYlwK38WcdlceBRS9Ih5fOIhPXVa6sSrVWF+wB7bEbgEIJugNqdSG1fOGW1p
 5Fq8UbowaLDrxWj6k7+9/GlSXwiCLZcGfJGWi4AgDkf88Qd4YG8+BBGTghvc66UJW9K07ZMkvZu
 QocIiSiSSOz0yCaGrLZKfW0hJSQMu34YSFbd4yk+4J+IO8dkRby7Atd1PUGrsKn/CmLG0+gFc0g
 5QXmjud+PZ4Z3irkPFDzu/IfYySfmJZdvLHq2VgX4SnzIONTCNZknY8wyZ4iMzDw9nMi9B/eVgi
 NgxOl6O8MlYGXWZ3xsf4n4ITtzybbC/+q6QAm1LMs1kq1Ds8DV9VLw4H+YQ9Mb+K6lxPkrzqmnd
 QZm5QJFkyc0bvGIyOnqtVkaC9TtP4GV0zluY0kT7FaHgcrZzHJhagGFnJTdTUYfoasxOhD7TO9+
 1oDAJn9CErF+N3ZKpTCmc
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_065006_379528_54BAE46F 
X-CRM114-Status: GOOD (  12.29  )
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

The rk_udphy_clk_init() function would currently try to do a strncmp for
a NULL pointer, if DT specifies 'clocks' property, but no 'clock-names'
property. Fix this by making sure the clock has an id string set.

Note that DT binding requires setting clock-names, so this is only a
problem when booting a non-compliant device tree.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.kernel.org
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c6cda0b80bfa..93364728bca4 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -431,6 +431,9 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {
+		if (!udphy->clks[i].id)
+			continue;
+
 		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {
 			udphy->refclk = udphy->clks[i].clk;
 			break;

-- 
2.53.0


