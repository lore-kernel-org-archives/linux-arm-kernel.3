Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8F5C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ah+n82N/gKpJoyDoMm5esDfeNmqpGxPED8l9j/bZ+bc=; b=aVBTZezeTC+VrNajOkDInviqLl
	Qx0VOyY7+1v5RyKvSdIySSFbmZJ0Mb1fXUaytrwrIeD7J4DhjaPCW4HygUDG9xB4wMX7+rtwCumOG
	pDxdWmvRbbo5HCz8dSnp59b6eAtLC9Y7F6Vwxt+CKtNrARQB/vAKfOW3LjL6TSEfX1nUkTYD4dNLE
	zCw3AqgTFDFVc8lqo6GknW7cbZqsYiqyqbvygI7MauYIvPL1buIVtQPyx12QNRto35N3Cine4ABn1
	TF/p+BjwJK4uchBCOwWBX3adtJo1ct5lbD+I0z3h4/Vrjbu/CYmJppPjDftXQf2H0NsTFfI+p+Z4P
	MGqvVFUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TQ-00000003AFV-0w48;
	Wed, 01 Jul 2026 23:36:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TF-000000039nB-2pVJ;
	Wed, 01 Jul 2026 23:36:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=k0pGr7k0QHKfkWVayOd/7CosZlxE+m9eDyIdiae8YwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HPdr/JlqoB112+kFToTxe14n5HP9kwoV4GvLLVP7gpQWJq3NdxnVaKn26bDB/Q2Ux
	 QBkK36wcQvBBl3mfXE+UQNGFJNFwmJ8mCZfEXX60+bJUFHPz0U5UEUu9eQNq7jnQj3
	 rciFbsz/Ob3nJmmKyFl5JGC+Y1ML8xpkc8AvYuroorVQdf7Rq0SWCQ+tZRMVgjTyCs
	 NS/MSrHntcktBsE+Od8TzXRFCNWko7mKciKmxJVE6cpEv25DuKcKGcvX9hJzUlAGnG
	 WHWEgUtiG6Y7DCwL/4ngpfk8M+aaFoEbN8LXS4a5vi4cfCv+BqKtqPC8ow+ewoAuDt
	 2bYY+Y3EV2BXw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 88F0517E35C9;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C12AC480052; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:52 +0200
Subject: [PATCH v9 14/38] phy: rockchip: usbdp: Rename DP lane functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-14-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=k0pGr7k0QHKfkWVayOd/7CosZlxE+m9eDyIdiae8YwM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFMGwJ+KR0Ac63pCApaxCu+rVmLn1aK/b
 jWqkIzi88nf1IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qakJgP/A3oEWM8tHSfLtj5YAJssGtw167JlQvaK5k68BJu/jT/35HnFs94knc7ht0dpzyUyVK
 UHpinHODVRG61XApQ5woLrLTxW0Y9eJ9AJp0kIydrJgw1kYihL/SFZ/fyN2k6o2jVfPuSFrY2qy
 dhQ70ajXeYCDm+EIMkUU4x3LBFVUSAI1n9BrEi7HQrXL1l4g1kEIPFkjrqlo0V+9ZWXUIkTutGA
 kAyqf1jdMkSJRtGyJVu34mpvMHMNvNBtMGLJA60Roq8TZrAkoypt2mUqk0z5++EevOPU6qLzITZ
 fTN6wJDoaYwyl/Nww+0k8laRFMB4AYuxl+bxHOO4mtfrxtQvaYZ+hYJTyxz0GP/M/Q3ammt9Y6x
 fQXhOIyNTf4Ypg0T3REUq9s/L8B2qvlOkmxtutBRjBpHa+EJnIJxrySTBHCB3eAFhOVk00ZDR2X
 f2blGQBTyf1JpFlZm3w+pW/Nnxr8yv/0zOvVqgJsWCRcRKo4n/A0XbpoP4tQUEmE963EChN5shP
 ht+eMjHoBuDhVdNa4ReFnpInn6zRh6vF6qNuTVJ6pmCbKoZ9oYitGLc52r/5rh3g5mCjATqp4bl
 nH6NlXi/T/CvSc+UgV3H12vduYXo2f0LPMKgRC5EIvZNLxj3ol16mTpiN2r3tkLDF3V6HfBlshc
 23H9fStnvmBbC0FoGrDoznw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163557_874621_F5718474 
X-CRM114-Status: GOOD (  12.14  )
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

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 0cfd23a405cb..ee7ec86bda9e 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -550,7 +550,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -579,7 +579,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1084,9 +1084,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1104,7 +1104,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0


