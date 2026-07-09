Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C89C44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 19:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ru0+sDCh36WRKvnrrh0caFU6O5lGZHzEvbm7T7ASnrE=; b=RigScCxP7oc/qw+kvt7CKWlZ60
	fkw7GSJk8zTHF5AT450Ohm9796ghclnCCcmsXzgvM71tQRZyzN8g6TgdZq9DoIS77YP8oZtE37PwT
	sAlyfIh8/XgBBHS5XtRCa6rcPhE0cK9p/jEXBrbEwoZv2+Ec/nuCZOnjDFadY95mi2TpZN/i/nYlo
	pr+oT66zH3JecKvY6GGd8pSmcxgbRO4yFVX1CcplhU5PAbFTVktwfKEdBDZHPHlQZLoaiIbSSMpJZ
	eA0ENZ+AG/YZIY+hPP9qX07jaIEHJ4JWqjuWSlqRWaNlyCMsb2jLSCXtQ+/Wg7k/Gi1hxMFlHoTkj
	BvIwZ/VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu39-00000003OeV-3gCO;
	Thu, 09 Jul 2026 19:04:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whu32-00000003OUc-3Kya;
	Thu, 09 Jul 2026 19:04:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783623874;
	bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FEvwfcOZO3yQK3DiiMDhDND7yykIMMlOxic8HENk4d5wL/xF/qxib5/wweZfnP0WO
	 eaY2GuFC0JpAWSyOw/nV6wIbqGQpVDA2xVmekf6e/KEshj6Tvm5qW2K3vJ1/OTjcFk
	 FDWDj/VVJ3jg6VtVcJMqSfXx+B+166GWUf++X93Dei0yCi9kmnomO5ltFnU1aPyEZX
	 7xu/MeI8iavFE12sQOOGEinrM2GT4xNOUFzBqTHGc+BSZZBd2KOjVchBDVVF+wxUIn
	 1ZdDUjrv+XUZhBF5trhN4m4SHgRdHvGZYUjFUXdCKmsj6BbsSKh/eD25ySEqPyS3MB
	 ozMDjyRRZGYJA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B7E217E0E04;
	Thu, 09 Jul 2026 21:04:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C1B14480067; Thu, 09 Jul 2026 21:02:29 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 09 Jul 2026 21:02:44 +0200
Subject: [PATCH v11 21/36] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-rockchip-usbdp-cleanup-v11-21-a149ac60f76c@collabora.com>
References: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
In-Reply-To: <20260709-rockchip-usbdp-cleanup-v11-0-a149ac60f76c@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1759;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpP8EUAH1cmb7CJr1PqRzQdGafn8xDNtWA4A
 O//cDuJ2Gln8YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqT/BFAAoJENju1/PI
 O/qadXwP/jrmkAC7He1d0ASid2gBRlSlrL4w7z05n/vvWee2wdd+52QY9noYqH9S+iafwoIWce0
 qEzkjgN6k1VUY7uccwqSoq1Ekn8DwrFsWNkJ2WJzFQGjSrCyKubTmFpAKbKA3dXarteAfuymPr7
 NqHWjJQczmmZD+yn7rkboYtf/NBNblLiGQAIHIU1Mv7W0OCr+xvbV7457IQBNB8XlTUSdYoVKdv
 sI16GkeC+KwUOPcnVo99qucxn7wIMTkBSeitUIdU7QZQH/Z//TQIFhDqns8JNy3N6vD9tSAL8aV
 h0ohlbzX1Ly+EDF9GIuhJrsxWgTHcz3JP3MuDrtlzlTnFaofCLVpZxNLIT+g1E3LMPIp65efad/
 0Cju4oTtqQkb6B5XxSi0S4W2OZXmZerkRMwO/clvjM2WoMttvfXXmDI9z1J4Yz0pelQLe6rBpgL
 bG1XCUQbyjdlvyw2f1JqnWa8jbmqmtCBQD4yf6EX1S/8sl5t+0Xl0ZqgX3Ysnu9wHgaY6ved1jM
 D0MzOxILZMivranhzOee7QRR0L379NINLRl60Nshktup7zQHki4PLLAfEwNicl/XPImtml3sr6c
 Y/9y1SP3wz35JezzXrpyLNDUUW2pmlFWPf8MAUGjXUeEXQ1PStdPI5a0kJV8s4DkOfkr/2Y48Ri
 CKc3pU5OT+8LJ3C/gw7w1vg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_120436_993873_B03718CA 
X-CRM114-Status: GOOD (  12.67  )
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

Handle TYPEC_STATE_SAFE and TYPEC_STATE_USB Type-C state events,
so that the muxing is properly updated when exiting DP AltMode.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619155020.CC7361F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 4e54020d1755..0399cbf96e19 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1293,17 +1293,26 @@ static const struct phy_ops rk_udphy_usb3_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static bool rk_udphy_is_supported_mode(struct typec_mux_state *state)
+{
+	/* Handle Safe State and USB State */
+	if (state->mode < TYPEC_STATE_MODAL)
+		return true;
+
+	/* Handle DP AltMode */
+	if (state->alt && state->alt->svid == USB_TYPEC_DP_SID)
+		return true;
+
+	return false;
+}
+
 static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 				  struct typec_mux_state *state)
 {
 	struct rk_udphy *udphy = typec_mux_get_drvdata(mux);
 
-	/*
-	 * Ignore mux events not involving DP AltMode, because
-	 * the mode field is being reused, e.g. state->mode == 4
-	 * could be either TYPEC_MODE_USB4 or TYPEC_DP_STATE_C.
-	 */
-	if (!state->alt || state->alt->svid != USB_TYPEC_DP_SID)
+	/* Ignore mux events not involving USB or DP */
+	if (!rk_udphy_is_supported_mode(state))
 		return 0;
 
 	mutex_lock(&udphy->mutex);

-- 
2.53.0


