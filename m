Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5585CC43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 20:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrecXVWmti7LeKr82VS0l7RtLcBv9mHQi1l/N/zvvS4=; b=peQYiz36TEa8FQYO9XZtozYqqq
	U1iGhRp+eG/G2+90EjvdI6eQ1M96xwWfSEgrehzx6RLu1SuAcphuYZ9gqQwX4n//NlF4HCcTcP7tJ
	UhY8NRtcnSt31SatloopRO4najw26lNcn4oo7FIGKfk1gPm4fIhvDnm5hmIYLnQ4m5D735xyCF3jh
	Ay+3fEW143kqcq48BcMmixlFCOxAq8AlBarLWp3M4XXu54+mutvnCfz8p7J+8lNNGjRtA9cPTKOtS
	9tknzbF5P7DvRJbbRBCEY2tJRpCAlV0RHxS7DH6hTCdiKpZdjiPCRCJypPoKp0B0VSfFr8virtUbM
	Dp3KSd6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDbP-0000000BrH8-08VU;
	Fri, 26 Jun 2026 20:56:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdDa0-0000000Bpgz-1p3o;
	Fri, 26 Jun 2026 20:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782507303;
	bh=3n2dLm8cwAAZVSuTNSiRXrkEGCT5P2BhFUYLouYMLq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GXFM6MolvEo36/TYaxuxg66OP1nhA72Tc+vqDn1yUxV2oAX6ZbWGk+WCi0W9seytd
	 TzHQrEAttyyr8STqRyvarkCW387lV5BVcZP2W8HKiZ2MoX5sWE6+NajNw/uHY33w6b
	 XQJ3CpABEbVBtCWdYp4lh5dhetm7uJfN/0diODW11nPQjnG5l4luvTYcSThLpKpQoG
	 9gAXudJftfohXFAKqjZeQyQFTIdgfSM48rLPQGn6Rh+ypi7V8WoRilFH3V2cxJO/kj
	 7d172O6piX3h23TwcZ0li8/hpUCEslk//7iP2BdlNXdXmW0zrHZo28Hs++gXMemsRq
	 1pb+0e3gqT0GQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7179B17E35CD;
	Fri, 26 Jun 2026 22:55:03 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 3654248006F; Fri, 26 Jun 2026 22:55:02 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 26 Jun 2026 22:55:22 +0200
Subject: [PATCH v8 29/29] phy: rockchip: usbdp: Disable USB3 on probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-rockchip-usbdp-cleanup-v8-29-47f682987895@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=3n2dLm8cwAAZVSuTNSiRXrkEGCT5P2BhFUYLouYMLq4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo+5yafBmu9Crfrt5VjEWfUAOd76vUFSXmvr
 b4Vb6dDCvzOO4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPucmAAoJENju1/PI
 O/qaLUgP/R4ED4RcxqTiOKyps2g+s/jwkJSFwHSjm6ynjiY4TZIHeJH6JVtf28ONhnGZKbfmXrU
 0E5lPKmGLdtSQIRTWcWEfzqWRXIkr6SUsSCfVfp0wIga+mhShZ8z/zf5Nn/GNgF4ZcyYu6TLZTs
 l95atA67334rkFoBgUaM4uLr4pIPQ1S/a6wz0u/e/62BOUmBGnJUdNrohm8FhQ5Q1D8+8FglL3R
 S7L5K8kAT4FqZiulkMfG9EJXO34oHsAdTyern8isY30VjDLbXkur9sqlPa116h1uf2OOPnpIpYp
 oMjWEh6dONUTIhLlE2n0O86HywZnSO8cXM00zDTo28BXvX+M3LcYuUwgES+uoQ3tY9ODgWxPtaF
 SMW1AZsiY39WUOmxk7bwRGWwQWuJUx10bDcEZGIGp4FO/o1H/jD+Z0cPhzjpuT/mPvJwlyVtvDA
 dVARymrq1nQgxT8XDWOp5p6n1IpSiTCoNTUDji90mXv3VwjgJBx4A7f8xRIFRiT5NzAf9qD3dHK
 9+IlhJVcp+EeNVCVkaOxgjrREGG2kDVN2wl0miitooM3SFD6Bhyvk1Q3dVlH/3hILiT0uDUJHja
 aHObhNZmk0GrHi58T0nBuEzLiSs5g3mk2O71on5dIVUcM7E3CQtyOW82llv+65t0kabHaBZnHVC
 N57yUkSexPY8RyUZbNCUpBw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_135516_671124_BF3DAD9F 
X-CRM114-Status: GOOD (  13.58  )
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

Disable USB3 support during probe, so that the driver always starts with
a clean state. With this it no longer makes sense to use -EPROBE_DEFER
for cmn ana lcpll lock timeouts afterwards. This error code should only
appear during probe and the PHY initialization function is also being
called at normal runtime.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7c8b9eaaf352..a25cce0b7337 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -755,17 +755,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {
@@ -962,6 +952,8 @@ static int rk_udphy_get_initial_status(struct rk_udphy *udphy)
 		rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, false);
 	}
 
+	rk_udphy_u3_port_disable(udphy, true);
+
 exit:
 	rk_udphy_disable(udphy);
 

-- 
2.53.0


