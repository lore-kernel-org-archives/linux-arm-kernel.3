Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD6CC44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ru0+sDCh36WRKvnrrh0caFU6O5lGZHzEvbm7T7ASnrE=; b=4oijC8YuiKY8yupA1frUAk1Puq
	GQGrcHr/pY+q5TNabF0T36JBEK5cLUSOihF6b5BqekiTRrVpzkquS7XJiQoANP2BqPSY+MOusKqhu
	V9rIJF1hNOUtxmFVdIa0THEIcV1tgNd90z6ZeQwzG8WhYUy8+y5vAUZbk6KIq9vvq8fcENmfc30rQ
	tba/VriIinUSvvgimvizW9AmKtduIwcy0L1aeGEA2I77iVyZOQtGak1wAlBre5nCdKWGCc7i84hAs
	X28S4pifl8iwWyomhQ4iU4FBIVkgpLaG9Lvxy5LadRE4zbhC4uvoRnSw8dfsLXbNq2cgu/WgmGFj5
	HqM+6l5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIGj-00000005jzm-2JDR;
	Fri, 10 Jul 2026 20:56:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIGd-00000005jud-352N;
	Fri, 10 Jul 2026 20:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783716973;
	bh=l3uTaVmYXyzz4C+Rff5MIwMgEtWsya2jWgKHFq2XIA4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PjqKhwVNegcV/oEvr6eP4viEzyRIUkXTxDo/xcVXucymkYYdY1YEWQTIt+IKoG0FJ
	 CovE9C2ygfOb1Hypv29vH8TULvELPUcxHvBDHQVjPINoPufOjWFsm2GtRLZ96D+Evv
	 V6RInU6BpLTUCHz8ptiwmVHUPk0GjoT0pv7oFUq+U9y7jWSoZgwIzPIY7fhAZOOK6M
	 mND+9o8NW8Xm+VvjbmODMk0lKRLM0Sp/r5sLNlGv+yo8Y45eNvlp1G5HBNOJfsJynX
	 vZYryVLd9Zrf/9ipnBT9vyW+1ey0iS5AdZmfacZTI90rBv+oqpUJQ1/q78yRzTHFgl
	 maQD2cO6vT1uw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 17ED817E0EA6;
	Fri, 10 Jul 2026 22:56:13 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 06E09480067; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:59 +0200
Subject: [PATCH v12 21/36] phy: rockchip: usbdp: Properly handle
 TYPEC_STATE_SAFE and TYPEC_STATE_USB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-21-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdlFv928K3HH+xY1qBeDPeZKXqni6b6AR
 rkP3eAehujOvYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qagLAP/jPUlSGTgQ3t5ZRk5jXYsUFghxH0TXZttSf/EfkLfgMHSRxuFX33O4+rSvmyZ8IBVN1
 j1CFJn4r4KDcBk54euE2g8SO+WvgRQgAVs4chBR7cTcJqni85VQXLm8RhR8OXYpSVVyqUqPSVfl
 hLAB0VLgM+Lvr29xD40CMg8DHR3iW1DJ4fN42Livz+cqb9TJK4vwRkcG0H5g+gAMOqb2eYqZBVU
 M9ssHkKPnH7tpHwot2ccUB5ckAvGXcMwRTFiI9kNrNsnV3IK8z4L2nZo2tnCNjzToJlhPsrMcqh
 tLs1zClOZpZfKFpe/8yVHLuAvoeyv2fYQd31cS0BWa1b/l6TBH1njaJMOdQgC2k66XJkXEKB5Pz
 Dw5X7r9jXAfj6ujeKmNDcOG1yQNIwNFCHSbiid0twi9rxhM7quwW2HYT0U8pEhTgqF7J/zxhsVj
 2SSKfy4xqDmwFmtNuJRVZ3094J2r8YTie3rHnmJnX0AQr+T3t4j7Z8knhmQbjMn4CrJz9F8eEDa
 UgYthJD+yYaq5Z3k+W2n69oK4yYIbJ3/ETMfkvngmzdBBWYaHySgspqxOOxMr6ILoQi+LHqhO3B
 BPfCk4CDgaAMSP/ecSTZgh5InRxvxzUkNTK9NJQ7C9cNKB+KagF0NOLjKW2iWGtmLpCoWlnqixB
 9jJPMLABHxwccoCYDlM8p/w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_135615_921773_43964167 
X-CRM114-Status: GOOD (  12.88  )
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


