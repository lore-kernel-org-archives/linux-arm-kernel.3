Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A411FE8785D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=15LymIk0SvnvZToNHATemRXEGn/Fkn0X1/6WXyXGwHc=; b=Y/B9gjoI3OUo7kxOlszzEOK+MF
	ZOM8WeWjjvnW8FD21d02crxHjm0jnNp5hlXswsIJpe2R/YGYMBeukRhmOBu8ZNoTz+BOF084b+/zE
	ExKC4iImTDOerK4OGDjz6nwWeyzT/3Z30cmuvzWgoEjM+0DbkV3nSxsetqU1uMOa8WFB3MaMgrh93
	NaacbfGEmXighL317UpNVxvjS0yKRTHZ/yZQqpMO1+g2t+uXBRFsB4cVKKW5RlDihkgEoD4ULadqI
	HjpD+/9oDy1LRpaPa0ruCztixTe692OgMgGN9Msc/FPsjt9F01vXsjuff4uVkXVdTXKZnswp4qq8/
	wyyr9v6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLp-00000007Auh-39Do;
	Tue, 03 Feb 2026 18:42:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLLl-00000007Ar0-09T7;
	Tue, 03 Feb 2026 18:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770144125;
	bh=oMsJDM1MmVk2bHHw13eaAXk939zCI0dmHOrouppRrk8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JSUgRBIdEzrgEdzouOrzrrHeKi4m6Wx4oLvmlmtLudmJOczFHXDJZhd7VbmUfg6XW
	 l98rDcJKKT4CIcxbjDKiD//DZzlWN1ryMkR7JmCP0n7P3saMjvWSCvfkU/WG/oPiAG
	 7gM4xzzJ7vXMUiI4ZSqRDTa+tw/t0AVQRtgNdKq9zjpWisEGL0TFg6zWcU8FH9yI36
	 cimp0uWZGp7AcEt3epL4S6VmQzA3IJNFsSwpB7RQCHOE39hhkpVVaWq/HarQGqbjni
	 I7hUMAMgcUm83nkYyod4ouPsVGC0zdgYpJBN6JEN0Sg7Z/bIa38YsoibmzKf52pl61
	 itt6U/SW+jIuw==
Received: from jupiter.universe (dyndsl-091-248-189-143.ewe-ip-backbone.de [91.248.189.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 86C4A17E140C;
	Tue,  3 Feb 2026 19:42:05 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 4A826480023; Tue, 03 Feb 2026 19:42:05 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 03 Feb 2026 19:41:27 +0100
Subject: [PATCH 1/7] phy: rockchip: usbdp: Amend SSC modulation deviation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-rockchip-usbdp-cleanup-v1-1-16a6f92ed176@collabora.com>
References: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
In-Reply-To: <20260203-rockchip-usbdp-cleanup-v1-0-16a6f92ed176@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Frank Wang <frank.wang@rock-chips.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=zxFHGi7c7hyE1yQCyWeBG1H5qOuim8JFl3knpk3L5BY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmCQX2HK34vgfc7ifeBwoRb19y3FVD04V4HY
 XOUY0Dnc34txYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpgkF9AAoJENju1/PI
 O/qaOnwP/Rzkxen/YlLoXL7Rj/zlG0SXOsUiOr9CE8CsAgHeFw6VN5rjRhoeaJzX7OcT1pfsg2R
 aUkQXMo/T+1NCnZn6pGDdQJ5q8qm2l/LuFAJhanBg/fDFt9hGE4EX9gL2axjUG4VH86YZr4axsY
 RGmMI53A5NUrTdcRNQFSgRR/XNJsV8pzdkTdh/CyL6aHpIG2oGGO2PwkIp8/qeiOyINMT+UcBds
 LopQko0tlZrp2lwi98H2iObwtrqnSypmrWmwgWTbybAK8fzrs65j5TGhVkT173lx3+UDjUp9a95
 eKA6uOD5P/Yl9E3h9gNX/ZP20GHWTSP2IqehHIRi0mr2thYsazguHxFL9YwcGerTL/OELxHdX0o
 O66Amm+5pyT5/18Pcd1UjKQVzaCwziK/zl0nbtEkYwkdzSfSTN8ys0o7JvFzmWqUwfWfJnzI9Da
 dlBof9kOODfIA9Bi1cy+RKGYpLJhIPwRzSv72Ib4maWHnSBkSRjt4dE3cLFNYdY0t04oBQMcXLZ
 rR3h9+mtuXlH8jQWP8c9oLFmgXLgjInUsEN43wRaJUWqZW/CA1eAF0rzxadicRe9EuEPedT2gYH
 DF3+AeWwQU7IHrXjGO8cBTsrdFLU7QVVe5XlFttTbfd7r0XqZUMVctBE9otL8x0+f741mDUHFCs
 CnhGIQN/HtPCu9ND1IpcucQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_104209_231244_04BE1260 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

From: Frank Wang <frank.wang@rock-chips.com>

Move SSC modulation deviation into private config of clock

 - 24M: 0x00d4[5:0] = 0x30
 - 26M: 0x00d4[5:0] = 0x33

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
[Taken over from rockchip's kernel tree; register 0x00d4 is not
described in the TRM]
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..b494819be284 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -350,7 +350,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
 	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
 	{0x1a44, 0xd0}, {0x1a48, 0x01},
 	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
-	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
+	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
+	{0x00d4, 0x30}
 };
 
 static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
@@ -377,7 +378,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
 	{0x0c30, 0x0e}, {0x0c48, 0x06},
 	{0x1c30, 0x0e}, {0x1c48, 0x06},
 	{0x028c, 0x18}, {0x0af0, 0x00},
-	{0x1af0, 0x00}
+	{0x1af0, 0x00}, {0x00d4, 0x33}
 };
 
 static const struct reg_sequence rk_udphy_init_sequence[] = {
@@ -412,8 +413,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
 	{0x0070, 0x7d}, {0x0074, 0x68},
 	{0x0af4, 0x1a}, {0x1af4, 0x1a},
 	{0x0440, 0x3f}, {0x10d4, 0x08},
-	{0x20d4, 0x08}, {0x00d4, 0x30},
-	{0x0024, 0x6e},
+	{0x20d4, 0x08}, {0x0024, 0x6e}
 };
 
 static inline int rk_udphy_grfreg_write(struct regmap *base,

-- 
2.51.0


