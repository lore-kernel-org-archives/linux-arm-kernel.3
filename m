Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE6ACDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPdmOyUeIUxYhrlePwoIoeY6qrZIUEad0P9Q4m0NE3E=; b=a6gvl7rkFkxC8mqiV/sGAgKt/R
	+aJFGDkrE4wc0GcxX1iu+cyzO5PEv1tHlelvGt2sO0X9W8MnnZRml8IDazLkt0CDakoLw4x+f1hue
	SNXRKA0AVOHoqOcf7BLg5h2H4py9dilzt0mM5xj7lFdcMd1Up+w5FmqSOVZfPDkqKnPJY8mE21ncK
	3FS5pD5tPn4FhueADrkXlaYf7FfMy2ODh+L8Rz96gGKIR6AC76tjEFIAHfeqZKYEH/Ggdag3GxCTg
	++xrnccpH2qeIjhFQAItmnMbclsXSu6RlYLhzMjE9kRW9+y5zOH4Taf9Th0uLrqHLdtAzRXVVSXdI
	3PSofF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wabAF-00000002eZI-0hxS;
	Fri, 19 Jun 2026 15:29:51 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9X-00000002dYM-0dk4;
	Fri, 19 Jun 2026 15:29:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=cpvq43WRrUvRj02SetrExdbPsYDBWgO/ul7fvY292vs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FYXcPLbF481CnTg31VM+szyWM1uTJyP8JYhGfhqBZsbCQwD/v84XjUv2jzSvueGzb
	 srXx0H1Qt75d+vXkeAL9kj+PtpP9XGNY1ewH47mJxXYwBa91h/ImRMlrWcZWKTVtey
	 /FdDDrzoGIa02Nli6XzjapYuN+DD9n/8OSeZfzCmF1THAz2bOXOOaN/9U01kNAVlyE
	 HyAPZzOi1lYhYAlH3rTyqBqRwXMmUQPEnoeLDH4AVM3918KmqOuXPnAwtoWjdu2zei
	 glLji3HxJsRS8Xq5bPtULGTGrHpf2b32Qn6cWimBpmgkyzSKvW9L/Sx3B2gvDFItJb
	 Jw2L0nnCdGXzA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BBE917E1270;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 930FB480038; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:28:59 +0200
Subject: [PATCH v6 08/23] phy: rockchip: usbdp: Amend SSC modulation
 deviation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-8-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1765;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LCrcJKsu7JmY/ja6BaMtSNvqcASCulXZamqfYDJZGNc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDgcc9ln6ZxZahY3gWApTUHyXhflppCaI
 GskblCNLykLy4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qaIhIP/3reH7DB3VW7erXppLH+b/3V4K7nSiG+1+t2enw/TrkFsduMQYeoN5waTzTcw/3ALMn
 l0eeTyQI2ccEfy21+c7PC5fa5w0YAN+AdxFAWI46snNEgs/3YmU5kRAwW/H4A8oTsxdartQTD60
 AdpcLhda5YCFi8sTtulPMrZ0QKlfPeMXZcmqDrIXH5u5TdCZLlj6qBmCuxkqk+eEQQAUflVu4ea
 J/1z74aPTEFMRsegP/DtXTfIayni8b40zhTqtyr0lLJmXw1tGL/SkYXuaxUWmYmko9sYnoXD4A1
 Ezp8Hkv4pqfky/VdNjNEjEK7vvEHUPvJj7AC2nNDpyq5OWCWezsOquFzE4VE9s159cuWpue9tk+
 4VUovMGI72gwx/2rWNb9X4LCXyyANYYn4uJUp0uL/uPEQNk3Ux22e5fjl0X6zDYMmeENcy4AQJL
 1HklAiuHW8XEL+KmhoIO3WjcWfrKSQZam5OzeB3FV+6yCKoKcDPhFnAyqVRsfQwhBpDIh9qBuw3
 1EtABjeXMXqek5t3rF2Pz3sX9dMplJnJ9A6UmEQE01UBEQ9ApPEIHn6Kt9MkhT6WaT4q8elwhWk
 FehD60alcY/TSbvklBIMiKoa0jWSxFH+FMnA2YVKNlIfFCnp6n933wp6ThmYsmkPBe8irx4/Xxf
 CH8eOGLFKl7+jAb77Rxouew==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082907_393284_1BCC8F02 
X-CRM114-Status: UNSURE (   9.98  )
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index c05ee65a9f73..a44babac3517 100644
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
2.53.0


