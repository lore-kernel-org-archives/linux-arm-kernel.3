Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EBFC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFUBzOekbjmUZk2h3KQhSCXnCJtWz7mi364151Wp2ZQ=; b=hvZCn33Fkfi+fWvRDqwGofMvlg
	aeVNKYKrINQqH9JD56cqX04VpYGGCLIlDQVIUvGG4swKiiAJslwa6qwvmZcXJKMXyxdRBrrDAMOQD
	tGX1d/mAVAtXVsScpjIkrI4CqzHEEdrf4EAOwByFmfdj03dvweHxwOAiJ1AxfdBnAPpJle2fVTEWV
	Jlm7B6WipFjmyiwd+DDWgdSy1c92Rl+zC4n85IR6b+YGAobEDyCgekiWwD7JDWHhoySSVDFJMyyK0
	vjSFvaMe1peixmX/sSXeN9jlOP6isEAMJe2IEJLMuOuUFzZ06xvNuqmXxcBmDLTjqeycs7XjfGYKg
	kqPW0DPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TYt-00000006oKA-3R8f;
	Tue, 15 Sep 2026 13:51:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TXw-00000006nTO-2Ma3;
	Tue, 15 Sep 2026 13:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789480199;
	bh=sj9LBh28iAOPdKC2Yk3iBAPDw/iU870tFO75CLAFURw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JEgRlZ/B+KK74YnwUdsf2qtsN1MLgxw8O5T00EcuaYfG6QXvizjVhfnLbIfKdZaV4
	 DdxJ6csbVDEfHSNzEqkWFPBWEp002KzGsSnVtveBuRdNzBiMaLrxoAZiNKzI85jOJz
	 I0UqxOvKM5bUrniHYwmH/4gWH+KthBsZaIstLg/BvEUfD1RR15wsexEOZKsP34LKjb
	 /IhWgw2a/OmgFZ5jMleqcWuq9MkHnFGuLJUp0MWAEwoNL/oPvatMWuj9e0EHh1ljcW
	 vaGONoQQwdBQoqIE+gJeMA/dgUr8NGj5jiAnBRcOJ1pgORLiYM0/h9XcqCeYhzN8HJ
	 B10YNM9I3hbUw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D7D5817E0D7F;
	Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 35C5B48003D; Tue, 15 Sep 2026 15:49:58 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 15:49:55 +0200
Subject: [PATCH v15 08/16] phy: rockchip: usbdp: Amend SSC modulation
 deviation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-v15-8-80e2c11d1ce8@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1Q1JW1JnKNYhx66aUCknN/wu+6hBR/DH+Mx6zdtRaUU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpTQXPaIxRkb5kjjtuP4ok1jEwKIvhPwJ8P
 CE32ThhaTymWokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqU0FAAoJENju1/PI
 O/qa8h4QAI4It8W+Uui97+UEHo2/alY3B6AGcn6av2UWNmhv6smvxwMeSeO+S5GtA6wcj9jZKGo
 Fd8rCGSbSYiBjd0qB39cYLEevl/btaie1YLV1O+1xTIxDDaj6Myexmok83OzvpbuqPB6GP5P2B8
 aKLDcgomiJKQbqNPbmT51IJtjEH7QA+3isugidM3moZhQGTZ29e68zBKwMCuHonFoLDvG/j5Mzf
 r2CKwMvzL5Frc0unzbVbfI2+eIew1wkT3Nzel0DHyCeoaM28pXse7Lr6CWEGjQlP25h+nKBNdoq
 gqQTC1c42QGXyfHb4FBqZUdKau8bM0hYHaLPMXR4XNptwusvEQdqubBMHVv7lxKTRRaO7F0nqRn
 wdL/I2h5rp5T8Zo4JlQiN35ZpoxYjLSqqd//nGwXws+Yetc/VXDp5R7fmaiv6WcC1CreEc+4XdQ
 hwpb5Pq+L6QGko7dGBYK7xELkIs3WhucTAP4Rjww6c6fcJq6EJseoDHDJpMg54ui/VzmH4C9JEh
 lWRkY20KY7sq0Jq89Sp4N3jy8MVoQvVI93NCAom5VyS0o8kxq7dnGk6Cc+kU0ZN7n9RbX0wxn/g
 qXL3+tqLW6Lt9MsJWcWqjmCwamXb2kHYv9lSWrDEVxdtRN8/6ynw99o2sdB9/ucAo47FX+q+sS/
 3NtYy4xihVPbcEToKvUYsyw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_065006_616490_E7F445E3 
X-CRM114-Status: GOOD (  10.43  )
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 925f2d162212..586363f5ca20 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -349,7 +349,8 @@ static const struct reg_sequence rk_udphy_24m_refclk_cfg[] = {
 	{0x0a64, 0xa8}, {0x1a3c, 0xd0},
 	{0x1a44, 0xd0}, {0x1a48, 0x01},
 	{0x1a4c, 0x0d}, {0x1a54, 0xe0},
-	{0x1a5c, 0xe0}, {0x1a64, 0xa8}
+	{0x1a5c, 0xe0}, {0x1a64, 0xa8},
+	{0x00d4, 0x30}
 };
 
 static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
@@ -376,7 +377,7 @@ static const struct reg_sequence rk_udphy_26m_refclk_cfg[] = {
 	{0x0c30, 0x0e}, {0x0c48, 0x06},
 	{0x1c30, 0x0e}, {0x1c48, 0x06},
 	{0x028c, 0x18}, {0x0af0, 0x00},
-	{0x1af0, 0x00}
+	{0x1af0, 0x00}, {0x00d4, 0x33}
 };
 
 static const struct reg_sequence rk_udphy_init_sequence[] = {
@@ -411,8 +412,7 @@ static const struct reg_sequence rk_udphy_init_sequence[] = {
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


