Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5EEC43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuZ8jB3Zn4C+5K1Cp/rvqOvHsJ0OMM4v8u17qcNaptg=; b=KCz5yGhOPF4Cf++vQwFV/meKX7
	9ecSiEd+2VbV89il9V7y1zcoQplzLMT0WiYFZF5lPi0jgLQl1DWtnhtuoLawbw4ar9jpUjFRUhgqf
	9k8qE3NHDjTtC0v0ALsQM8EoIHen5oDE8cFUS/1mBxKZ79Gx7FJuNVMl2BVu6bPJF6/fuf84xuW2F
	h45s0cUfLqPkGwm4dDgp3utr4VpFc7ebm7uJ32gc3yzwsLRrtdBQ90BQN9z53pqLoXOQqsyxTuk78
	FpRheiSz32cM1iDDo6oJwuruvfSEr+iC37AylkFZaC8wNmMKOUOL5N0nW/GAo9U3uFmvLONWsjjEo
	xkxClg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDaz-0000000Bqka-46pd;
	Fri, 26 Jun 2026 20:56:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDZw-0000000BpcF-17XX;
	Fri, 26 Jun 2026 20:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=bEoQG/Yys4jT28HNaTVApBbEpqOJRZhkpwJKmtLe//I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gMru2ayOZH2mdWnJ2ghc67VKsl9W2zrYwCLFhh1hSRljKXw851dXK9XjITsWnFs8i
	 2xqb5FNWWnwMCHFJyoAJOjvZ6ldhSAzZAEc3N6z0OlrfK61mUQG5+STJLbRgOlsFKi
	 bxYML/5j0u/tUXHrbHTXAGkuq8mczY3rqaJ0pz47wwSM3bX7DY1m1EayNkWf+0sXB7
	 25OcFciLCHGC0u0bgM5vltayAVf/A+pHNXWselqSswlsXRbtAoN1MnT2Foc5/7yoTt
	 EeHc7HKi8fv+GOs8IfHPWIYM+xPbCO9aTbwmWPPq+AhY6Z8WOlKKMlFjknUEC92qy6
	 IuFBa6cIxVTGg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D29EB17E1539;
	Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1B6E3480047; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:04 +0200
Subject: [PATCH v8 11/29] phy: rockchip: usbdp: Add missing mode_change
 update
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-11-47f682987895@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=bEoQG/Yys4jT28HNaTVApBbEpqOJRZhkpwJKmtLe//I=;
 b=kA0DAAoB2O7X88g7+poByyZiAGo+5yWjFn5qkTHA+NKIgxeN6GJwNmyjcB+CweDJD6nD6OksH
 4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPuclAAoJENju1/PIO/qaHDwP/A5U
 umpT1iVFyw3BPM8vth5wSsv+IboQaeZ/G5TS16slev7KLMToIrNrsaaC40r16Qd6gZg52hxOGOx
 pi86Op3NDB2rdRb+FxY4c1YrXDi+09GjBxAA7PF28AnZm68t6X6IXcuiC9TqAc9ARpvaZpjk81n
 PEN8hB3+1+Nj5tbcrhPK2w99I+i0t/KBmxw6wdxWl0+PyuZweajrPG2HhEdVn8G3hRFuYxVbD0n
 yr8Oy2DjYVJgQjWuHWUG5pxFEXpPMQRuq18XZj4zTwC6ZDLGvRXCH8qa26R+kXV1UtEMkB8RhIj
 ceS8KF4a/LXRq05Q4rRRS45BpMSdwS8W3mbyhuxJc9sBXjlaZ3Eo3vKoX0Cdt0sFOcbLylBBIkN
 2CELtwiaQVg0wGeiyBwivN8yucFUPLUcn6f23yGaimzyCZzkLi4kAghDVQINB+qs/y70JgpYEpE
 uss1NvEZeemjiAITWDOStQsocyHut4I9bYgFhj+DgW2/vYG8/dmnjsOG8gc0v0gKwGgtRlDTYN8
 pw+I843s6HuqnyDHgQbb6lQh9cIS6IhFfFp5yN/FHUL+uuwBwneFSJp74exNachATRni1uunZ0D
 cKjf+T+bFm7W0zpTD6kBWaD/Nr4uFn1cBFvlqgFNJmDBG9rQsV2eiAcpDvvUogUAcSw6+0Iu9ue
 usuj/
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135512_511839_88F3A213 
X-CRM114-Status: GOOD (  12.03  )
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
index c6d24dd3bdef..d091f8007acd 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -622,6 +622,15 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
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
@@ -652,7 +661,7 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	udphy->mode = UDPHY_MODE_DP_USB;
+	rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
@@ -1394,10 +1403,7 @@ static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
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


