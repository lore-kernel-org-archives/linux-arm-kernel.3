Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51F4CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+0VhQp5fUdWXIsJf7azwcgotdkB/Z3nf8mmwJJC//0=; b=stG73V5LxDrDs3qMRsrqgrjh2M
	iWKU7RP7AZwQgwuWYjRV+xvDTx/bwndyBvwFrTrmoUAzQzS/eoIMxmMkr3/fnw0cavY33pruG58Gk
	klo0nvC85cFuFc8CXwEAXWOyEowcIr1zJUn498yiKQEoN6ciU/KQxCeT6ba77rNyWZsrFhAMYb52r
	53DZxqJpjK93RjW5Rzif6+S+JKRf/WaPQqGliKSnjvuIm92S3IT4eCwq5BPN2r49TaQwD5aO8T1Ir
	QOcFy+OA/xtRJu1IsoeSYZ8DBcZtlTih8Zkoa79/ScHyW/0yawIytrNFxFcwtutt5x3t57qH9mtUM
	vR38xMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco9g-00000009cqx-3CEU;
	Thu, 25 Jun 2026 17:46:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco9d-00000009cob-2w0B;
	Thu, 25 Jun 2026 17:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409579;
	bh=BYScj2yZ+eSgHWhDbJdeSOOvZifwTS8fqOkiX4kBNLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=de5i03LJUgYkg6yo4QP8Zgxg/hv72F7UEukSuhCFN/T6YMAdR7sihoGUzbMgP+Lzg
	 F8tkLHoxonz2f9g+rLLzunECImxvXLNb9DpIwd1a5aABHG3vtmL/RnymzlGUVTdRA/
	 hkhI/jVQku73y+n9f+BrL5DJlwg/8vYOZUQHGeebB8Zyv3NQyDJSWv5+LrhMBWqain
	 gG72ADSQx4rMncU0O3C+QCMF2QarnR8bJDEK4SAIjhphIr/EXpH9bXolngj7jESEva
	 06T3g0Ibk5WGe6WZN0mIOQ6cydoxrrGAFW8WE50yhsAj+h7KguShfwYS+EviXgY95h
	 HJg5q1xcMOtwQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1050B17E0C91;
	Thu, 25 Jun 2026 19:46:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 205B248006D; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:54 +0200
Subject: [PATCH v7 27/27] phy: rockchip: usbdp: Avoid xHCI SErrors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-27-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=BYScj2yZ+eSgHWhDbJdeSOOvZifwTS8fqOkiX4kBNLU=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9sJxTZSFqmDzq7h3AJWTCi/9vWbhhj2Z
 LBAIFgr+7TX9YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaaS8P/3HJ7NE6/ONYUJltywLoibRkMx88TBKwR7z/aTSJOxxRnKD/3wv5zNu/K0fjhByguw4
 mRmdcKxu0yUaN3m97gz7jOD0a6V1orEDQo/ye6haiHtMOOOhNJKNACHrfzuFnBD+tdsYcBmy9rv
 KrsjR9PsVR7aJqCnJV2gNz1joZCttCjAV+joVJmh9w/zUslG7vNJx3Kjo3DdLs2lmClXIldBYqp
 iZpFjwR+3lAZ7KeAZUmiXnRWnUvsyJEYatHq83XN2ABIUwmpDSIV08lgZf7bLtivE/ToYiD+1yW
 C0HcGIgzOLIz2GA1ZdyHf+crHtqQWrb5LVG6U3j9IrUwNiNhAO5IxOGoKG1Q3yQi/3T+REOJnrG
 eP+7dUQVQsorGO8G+FoGX8EPlSbB/weug2XP8yaIDhgmjkzR8UGZC9Xy552GG6BA5J4aIT2WpR1
 l1XyIqlDMT9DQ+2WnI9P6Xh4xc03uS6jcNGRe8P1wj/MvbXLDnoVrp0A1Pkc6viISYIjJobInlC
 d1QOVY3Skj2cEz3r5++ZZ6P2Py6DpTrJvtkVf9RadOl0AxsTxN6TPmEc3yKp7mrsHnlmDan95DW
 pr3cQDVKh0hqYUpaB1xfX4KZT4grELSVOidyUsj5ncSSG7JveanxudFdtLbjjC3N+DCvTMndbhK
 Q+R0NMrBTOgRUEF6H+icqWg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_104621_890467_008892AC 
X-CRM114-Status: GOOD (  15.60  )
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

The USBDP PHY provides the PIPE clock to the USB3 controller, which
means the PHY must be fully running when anything tries to access
the xHCI registers.

When switching between USB3-only, USB3 + DP and DP-only mode, the
PHY must be re-initialized resulting in a short period of the PHY
being disabled. If the DWC3 driver decides to access the xHCI at
this point the system will fail with an SError.

This patch avoids the problems by disabling the USB3 port before
re-initializing it. This does a couple of things:

- forces phystatus to 0 from GRF (not from PHY)
- switches PIPE clock source from PHY to UTMI (safe fallback clock)
- num_u3_port=0

The last part will be ignored, as DWC3 already probed, but the
clock re-routing will avoid the SError. There is a small delay
afterwards to make sure the mux happened. The datasheet gives
no hints how long it takes, so delay time is a guess.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 8c5d6b8595e2..82ce80dc9dbc 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1026,8 +1026,8 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {
-		if (udphy->mode == UDPHY_MODE_DP)
-			rk_udphy_u3_port_disable(udphy, true);
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)

-- 
2.53.0


