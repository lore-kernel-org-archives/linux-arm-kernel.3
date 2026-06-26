Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90883C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 21:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cslRQ+BULUR49CDcCbqs0zYZnoDv6ztIe6VOSwAqNfg=; b=lnHUvNZhvoOMwEegZCqsyvmgnc
	Sg4j62KsqJJ6A9fmVeXUWcWSABmN0c4DX++aQYkdyn6aysnnCMek/XmkUEVPwRRU3ghqEUovtdgnu
	Qd0ZiJG/x6dGqCkDEZlppcM//NNhXCAagflQvYE/+Ow9URL5HHM/48Au2ogNWq+vOYjxbh+hC0ToL
	kHhvm8bBSe/svLUO6Yu16qrqV6C2OhpGLBrEzBEZ3IydnYxFqcrY11hkY4nL/42hCMFKieqoeYNa+
	aACUROCs8KDHXm8S67r84spj4clmGP/7ZM/PFUAliNYwrr8zvuLzOSuOAiJFeWDajQBCWkeSX7//8
	sKXzCalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDhG-0000000Bt4J-1Ec3;
	Fri, 26 Jun 2026 21:02:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDgs-0000000Bsle-3JQV;
	Fri, 26 Jun 2026 21:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507740;
	bh=MarmR1wDaE/auFAtnNePXWY3E7UWDMWQ2CxnXkcbfjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CHcruOHFIPttswVoR6IM1QkyvF4+mf4TY36EqSAtHqN3SCRJrcQCMOsL/xMxvX3sl
	 DPtKsmgF8MLtTV8MAHBVBosoatyOjUffFClH4pTxJGI/X0WHF2SO+Wvq80DLHsPZzk
	 gqQdJTzRyuQy/YAc0Cz6WSSI9g0TpGChdASwQgIflM2l7v1qQj1mGXRa+JKEauq93v
	 78dhuoL0XMUKJGQylJFhwdxOEd3qGYt0dI/Lmgxqb04zOuGf5ZrgkCefJyTiIEAxLq
	 wvnZAkanSbq7BbJCSs2ZayO2ihmyk+ueOxpJ6zSWuY1DQRLmPbz0/5qN/N0M/Bt3bY
	 PQx6kqqFV07dw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0057317E0C88;
	Fri, 26 Jun 2026 23:02:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3037C48006A; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:18 +0200
Subject: [PATCH v8 25/29] phy: rockchip: usbdp: Clear USB status on PHY
 exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-25-47f682987895@collabora.com>
References: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
In-Reply-To: <20260626-rockchip-usbdp-cleanup-v8-0-47f682987895@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=MarmR1wDaE/auFAtnNePXWY3E7UWDMWQ2CxnXkcbfjg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yVdZh4n+jkW7gcyoPH3lQcGa1FiDJ1LO
 TdTz5vHHbYlKIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PI
 O/qajBsP/2iW+fNHmJyYrQARtaGAvY11NLf6GT7uYLt250imMz5I/intLeETL1VJExxtCnzZtLv
 CEePzyabyiwiH5UfqtAwnL/gKnVFaigLe8et4+t39Nf5D6PgG/LpxpmeZCV/1ZZztgeVzYKau8P
 2JEFknQfYSvQ6k6dIXSqMVuV+8820Bqz7uGtq57KZDMgwlkxKRhcEGuK6OpZTzWx3bnTkK1w9rZ
 dKoj0cyzkJPDLo0bn1CvXls2vgHKrvN2d8IafShlTHVl8pUKZAifA6yKen0gJKgxrFWfuOFRgMN
 orA2lHrYSpwfo/yDCM+kDNBKL0LmTUWChHykSMECazqFDAdjbo3DXowzeRb6TePWniarJcycAl+
 F9C36VrenjAftHquWyIbrjFBlcE05foQSjtdUPm3ZDZDmU2IPZGP4VuixM+tRSxe6YCU3iG9HYr
 CpfXHtTdhQo8RT1AQqIuvEbBBtKnyXk2LctsFxoMd9N/VOSVqRc2dgg2fLIfW16nybGWz0Vdbwp
 AazKTMcfoADXqHf5Egtdu8wji6b8mvSCAZEa+DjS/IY3tu+6EQyPPOJTcD1H7Ly1T2Uav9bjtHA
 Wt71WpJt7kKD4+fqbBPhhZtRVMna0sp2enPw7Ml0pU2lJMWrZOi/BbqejBk6WecqfV85VQ8zej1
 BAVbXccjVkNWK47a3UtoyZQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_140222_995833_5CCB4D94 
X-CRM114-Status: GOOD (  12.31  )
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

Ensure the USB status flag is cleared when the USB3 PHY is
exited while the system is in DP-only mode. This can happen
if the USB3 controller device is unbound while a DP-only
adapter is plugged into the USB-C port.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260625-rockchip-usbdp-cleanup-v7-24-38eb3cf654fd%40collabora.com
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4566822d70c4..15c18c6e3093 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1322,8 +1322,10 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 	udphy->usb_in_use = false;
 
 	/* DP only or high-speed */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
+	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
+		udphy->status &= ~UDPHY_MODE_USB;
 		return 0;
+	}
 
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
 

-- 
2.53.0


