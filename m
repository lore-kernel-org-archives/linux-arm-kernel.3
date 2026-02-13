Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF255EDF171
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 14:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIxQ2Fo6sUkPiArsMOA/uuDzA9mk66YXAI1U73hTdt4=; b=Yg0LNUHIQWyGBWyNJa4in7kQaB
	sBrr2pVVaZsfw+Lkqs9DuaCH0zEPFRoudCHZL0YF8uRDCrzx73nVsiV44zKj5CTipV8UwYzWg9DIX
	z7D1VjWXt6clEgB6Q+JT1fLmqG3BK5b+4Q4PDFQZA/QGJuTEbNJRX4Ae47GdZJh2mrk/bTkj5NGon
	HfZ+uG9fiZP9pTI7uNfPpytNmG32D5C9n9fWdZgCgziUdP6m2Haf3f3lI3MgEhalVgrr+iWpC8SuP
	+s6maXhbDXqgrsCzO86fOBk8rEoLdLdo6g895Df2f9v7CGE+IIFriQTt3LiStnwXaLPq/8ObKm6R5
	YkY74Irw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKr-00000003Yk7-1cFn;
	Fri, 13 Feb 2026 14:39:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vquKZ-00000003YOB-0HtZ;
	Fri, 13 Feb 2026 14:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770993571;
	bh=dUOuRcSdmkPT5OJpNxAO8iMCG2oRg7tjpzo/g+O1Qks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gMQCfKMm1dKcG0bb8E4aSjatPR9AKtw/m3NxaZPJjDA46ZSmZsaHjFx+de51mgx+t
	 ogug53r5vbNzn/nOW1XEFck5GJzS/W7uj7Hg0+PmB3SVzbyMd1ykNM4N31vfLgLuWm
	 d9lQDilLQ0iTH9y8ilz/Y0qOOGP8ThXYXKS76uNzddyR+z6AI3HtBh6GJRrNpL2mTy
	 ptl1ucu3TUlHN4fpPjOSlCNqAQ3pYAFJpFDzYv3iPiSci0CUFu9xws3Xj5X8vJ0+H9
	 K7KB4WLRumPp57w3g1aT06keOPM9C8f6ZsWDW9HC09ePgo8FsDLT8l5S7yqjuMaDch
	 trScFsyaAEd9Q==
Received: from jupiter.universe (dyndsl-091-248-188-214.ewe-ip-backbone.de [91.248.188.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5205F17E35CE;
	Fri, 13 Feb 2026 15:39:31 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A738448002A; Fri, 13 Feb 2026 15:39:30 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 13 Feb 2026 15:39:28 +0100
Subject: [PATCH v2 5/9] phy: rockchip: usbdp: Add missing mode_change
 update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-rockchip-usbdp-cleanup-v2-5-b67ec225f96e@collabora.com>
References: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
In-Reply-To: <20260213-rockchip-usbdp-cleanup-v2-0-b67ec225f96e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dUOuRcSdmkPT5OJpNxAO8iMCG2oRg7tjpzo/g+O1Qks=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGmPN6I2xwbRYEJQcoZjFHKkKY9jItDfAdTAC
 E0FECBcQW8EDIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJpjzeiAAoJENju1/PI
 O/qaR4oP/1uZfMbj0rowGL2WGARs0wzwdFCKpqyZxjykestN+KCmjYuqlC3BITd0BO2lxnqx7Gd
 ECLXdReTzV9PWiV4SFiB1b5dqYQDpQuaKzK4jaZHY+c7/wT4QQlQ4oQ9OclrFDX/7Fyhyec/1Pe
 KSRiDMWxMhxIcMXA2dQpyA58PlqfuK0DwzdDNPa3f+84SGUo+h2t/FFNvCKMxcYXvWOI66ZHW5B
 TOiSatprRPh5qlxGSY0QmM+dSReVKoiIG4EK/+v3IzIiH5YwD7wi5uHDc9puG54Bf9ed0RnFz6c
 JSXDpBCCLKKABcjM8u8gW5L/QcFj9ETdRe9WCIZEpdyYclzMlQbicnUQbXV7kWcS8SdQ8B/Ff2H
 Sp0WSDmNyKzJcqJESUR4S8VSoxAe9Z+RCbis0FODkKzw7IYCnia/cW98m10SsQ2AYO4P4OwrFGI
 Bf2+yf1Pv7t3u64gpGOm2o0v9CVjSMMVOK1NDbjhbidnvbLe3IiSN4zC0uIT2gc9NTVCo0I9W1J
 MO5uq/3wDURsGdDPDNB93sGbnmSoAIV1l//hAl6VP4FqBcLDJXld4JOgDSlPXawyKLbgokNzAja
 pFuhAvHD354RkvB5byGJ+vND1NyKoY1X+NQtVoj+0OHCN+4q1Iy2/M+lUIMCb7pAcc58n4/aaHv
 x3MX4bvwjG/umwMBHGxosvA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_063939_308342_C96987D5 
X-CRM114-Status: GOOD (  12.12  )
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

rk_udphy_set_typec_default_mapping() updates the available modes,
but does not set the mode_change as required. This results in
missing re-initialization and thus non-working DisplayPort.

Fix this issue by introducing a new helper to update the available
modes.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 97e53b933225..febc148a754e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -619,6 +619,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
 	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
 }
 
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+{
+	if (udphy->mode == mode)
+		return;
+
+	udphy->mode_change = true;
+	udphy->mode = mode;
+}
+
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 {
 	if (udphy->flip) {
@@ -649,7 +658,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1385,10 +1394,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
 			usleep_range(750, 800);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else if (data->status & DP_STATUS_HPD_STATE) {
-			if (udphy->mode != mode) {
-				udphy->mode = mode;
-				udphy->mode_change = true;
-			}
+			rk_udphy_mode_set(udphy, mode);
 			rk_udphy_dp_hpd_event_trigger(udphy, true);
 		} else {
 			rk_udphy_dp_hpd_event_trigger(udphy, false);

-- 
2.51.0


