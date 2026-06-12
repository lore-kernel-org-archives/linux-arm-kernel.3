Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5A1CD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDNKWU0RZvsi/JDFjSwhO7C8LZA24QzLRyL66bb8CrM=; b=gWi2DdiH3wl12++5dqedh99Wo5
	5Lu3zG9IlPLP3J66nGjq+qmEmcAtyrMTqaKL+T3YvOv5rEFVNTu9kFqCg03RRVk5p7NV+tUm71gaf
	5AwQfZgWde7VZJyo0XRFOYzGw6J8ljy1oGj7kIlY/T+l9sA+ZcxrmdYCbahgcLHQ/YWlftmblKMU9
	EHLQfyjZKWFLPh7L2qWb8SxFV8VLQ9EQxPTY7DeywHoWH5ggs7z3AhYJdtjIdkjETHxta56y5Mk/r
	kavTTeSv9YfG/VFp8iehlOeicRTnQCvwQnmhB3QHjeDRttYUxtgLp/NM0sx7tI/dt43z7ug/NzLwN
	/7b6xK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4e6-0000000BEaQ-1qp6;
	Fri, 12 Jun 2026 16:22:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4ds-0000000BE47-3IhI;
	Fri, 12 Jun 2026 16:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281314;
	bh=fH5mubes2SOS68X9ZiYq/N2c6YI1cho4HC4nJ2SpDZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FdcWF9mkG+zbwzGr8GD0a60r230mnYCXXWjYLGQTdtCjsqDZK29RCC4ktqgcllX4U
	 9ZmgTeFzSmMj841ZQy0ct7SP0Buyff/58l/HXp+/N2RNiVODgEaDg009GoxUjVwyQ2
	 Nj87egWYHeTrneQjU1fdfp6qmHeKo9e5dC+Xcqd3RZdxZ3TIEcFI2sTuhzYHK9WbKY
	 M6b7lEh1URXPjOZvYgITScZWfNzsTI1Qi6+vY09/7IQ7SD4909j89Fh5Yol63YP1st
	 qyn0eXJWBVhHknk/qPv8bg/u+pjcIvxrWsdiKW9E+TqtCpNi19nHmgY9dRNa3edmP0
	 G8swiHCtJRatg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75C3617E0E6E;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id CCDCE480031; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:44 +0200
Subject: [PATCH v5 06/18] phy: rockchip: usbdp: Add missing mode_change
 update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-6-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=fH5mubes2SOS68X9ZiYq/N2c6YI1cho4HC4nJ2SpDZg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiFYALoVetLRBjtCjGI62MJSBAfqV5I0i
 AQqkyEZm4/T1YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qaHtsP+gJDT1+JUU/jL4rE3Eg3XUOAQ0v5G+dh2jwEZVNLhHWgY6Mo9UbCzGNCqNcg0HTbc/X
 9L7CfZbhijBhRk7PqXliFw+Vwh4jTPhBTLbb/hOMRMVtMnyPNomflwvUHu2tCtWjx9o5F6nrIQi
 7BNu67rXWV5RnNHFOOpzSPoKSxU1JUH6Uko5kYjjGj3QaZkUKWgggeqaOFYFjmoJm5Bqh+7NOGc
 18LV/uQjEaS330jyUF0pFpdE37qMNGaazX71gnOH7s+w/abJUEyeO1ET+z8u4b1cXft2dwlb7YJ
 YNqqFief+NpjiseXdaHZk9lmB8Md4B/SU2PYv02jWpv5DnPska9i0CDJ/tZOw9KSlsiMYF1fEz9
 F1Os4ELa/7tCKMANzTq9Kbg4uuzowEAZ6kA0t+C9PWxJKo4nSo6ym2xNLprv2l6bLAgUx8A4wo/
 erHLf7OgHXvMr3RoE9Aeurv54mpBtmUdUBLG1YybkR2qviq2NQn1mBUYnJ+YmA/Pw+n7konOkeG
 M0sDXh1pQ2RK8eMVtj+hNw62TANBsJC0gRZo1KKojDHQlpZ25thCF7RAdLhhh4jmvMW9jsYfjER
 Fd0Zf2MAHsc0iilGBUSRDWjoy+f9kKlR1eF23WOoLMSaFJ+D7chrNNFg3nULXDtHAttOCnLptqF
 qS218jwCMjsGmyZOfvlEqog==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092201_030990_6C6A9B94 
X-CRM114-Status: GOOD (  12.26  )
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
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
2.53.0


