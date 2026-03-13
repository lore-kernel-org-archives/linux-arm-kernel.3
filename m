Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E4B107BCD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 17:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKCUIC6yucfA4Qlk4vJzVhUFelItDmwvJOCRC74MCWM=; b=AlSiw+tBaAB42Yh9z1b/xVKq6S
	IZ3IOaeLYFphCdisHPRzOfIbv0KcvyeYpiPn112a4VJusfgmN5rdK2EdhaqstPPFUbbp1cJYqgBgA
	Wd3ItdEjg5a6HYOfaC2HPoGT8ItmCh9sQAz2hgIZQR67Fo9TjI20EVWdqRAG9pedBkN9TTd0jUCa3
	ar8ubOqEdhk6P+eKFKmhiRMYqlBLDwZLEyqKxtfa2afY3pqfSIvaUSgPx70oTgT9/NXwdw4NUa0Nz
	LfL+QWQO+RgHvPbnJwPW110d2B9VZQIp66a6FLmQTv7dQQdijmmZGffxs7kmLaA31iAYiHu2hMOFu
	mzQ8iDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16lV-00000000nza-3F41;
	Fri, 13 Mar 2026 17:57:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w16lJ-00000000nlg-2hhI;
	Fri, 13 Mar 2026 17:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773424641;
	bh=7erG1vSntiZYfDvD9BPxDXJhjGY+cucRfQBaEqe1HlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ieLBvGr+yVicWy/eXV2T4tHKZZs7vEsi2DA+COe02Sv8188BReGoSdqnp/Ftf5Eds
	 c1hayddhGwN6gX8x4a0Lzx9tBoFWkZYfJSOcMW+91cNHHs++LAyYXFq037t9SD+W+U
	 Dv3qVBg3bLVwecpDexIyDypoTF3GgFJiTkfvbRpi/wK5VPw4bfcgHAUfA6MKaSjQYj
	 M57FIlkPQz6N/9jeZcvL3Rf1HkmnC8Pj2NUAwkqz29y8zspjgH98/Ok//L9NN6hVD/
	 NW+LksSSagaep6BqdCfDw3wmrpRUvNvy8OqznBoPgQMdq0rbWB0eBQRiCoj4ZoNOov
	 ff+owCO5N6zzg==
Received: from jupiter.universe (dyndsl-091-248-210-078.ewe-ip-backbone.de [91.248.210.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F17417E0EB4;
	Fri, 13 Mar 2026 18:57:21 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 283F548002A; Fri, 13 Mar 2026 18:57:21 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Mar 2026 18:57:13 +0100
Subject: [PATCH v3 04/12] phy: rockchip: usbdp: Amend SSC modulation
 deviation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-rockchip-usbdp-cleanup-v3-4-3e8fe89a35b5@collabora.com>
References: <20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com>
In-Reply-To: <20260313-rockchip-usbdp-cleanup-v3-0-3e8fe89a35b5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=DmJGqquNgLK3sA4UZxU1kvwePYoRCEplGjQQLTvjtuw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGm0UAD4zFEFy+De1oL5KQyUrINHyjejz91ck
 WMnwecOweACFIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJptFAAAAoJENju1/PI
 O/qaijcP+gPgApeWWe7B/YUbIe/y383lh+xKjKfOsVjayjBxlstwoxHaQOTXSZmb3vyf8OCPzUe
 nlWQm8OQ7Pr2w5fjdSvJlgoY+sVoBLevGdon7LIKdQcOYidKKWFKF+ddlvZuSqHOO1Z9LbL5HBA
 ByznkxrY6ITcb/+KD/WPzLYIeuzUK/BnYvwFvKzuKBXR4AZ64VKUUrVmaZqEzze4bORHXCFwDNI
 q+EwnxViNT0+tIQktfPiBd6PFtblDVtFw5EmTdjay9Q35EH6UvU6sKfscR0x3aIJGSt5g1TDUby
 gs3LyPNEs6ez/jmunADZ3ngcb4NRXb2jGXnsZa10VXHpFJlRgFETPl+/cImvFkr2EWhe/fhgahi
 Dk3VX+fFt2JSKSPrtcdo2CPEy+rvFMSxOsqnsUWgP1bFyfaLgSc/Z7pgCn9slPomT9n+Z93yLM2
 SFhtiW4E/4B15m9UrCKkJvaRY41qO6FemTlSB6IkoxvuCFaRgxr0mYZi3FSUfeu8JtRsB02b2G7
 /Nk9U3rwxQSbIVKH1EzDAT9IkNqnkD2MLw9M41zrjyMR0IpMnnWtMgpqjm/R+aNHcC4bjQAN1E8
 gcQDZ/oDxzA5Yka0MgLdrkUTlSTrB+TZKbJrai0VnKZCqUHXbvB7XxOE/+6GAsSuoAZLStuyb92
 9bueVVC2V+ErEEqCnPx84hQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_105725_894226_72105ADB 
X-CRM114-Status: UNSURE (   9.85  )
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
index 98562a888b42..1f686844c337 100644
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


