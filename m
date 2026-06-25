Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0F9CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUzrbf2ZOlgMSXasgiA813uVorowz+/R7EYhJ3WPjBo=; b=XNvTnNkZGhgVL7PeXCpVOmmTy9
	BuiOMOOuzTz6/VQzvVFYWzyDDCVYY+tAST1swQdJ8KySjtMkqVYRlLPt/Vpllzhgga0sa2FaY/eBx
	sO+D1QYmYT4re2Zpcid4gRMlxr6+YrLa6374avWEynlYIKVQNPTrGDbVDSxpbx8uZzLUmO2o172bi
	im9fwB81lLAly47znuXx/ct282lpla++L6H8Gq274gybB9KPXQ07tcuGsIo3DJ6Eaog0b6q/s7TLI
	GaQjzSY5sxi6gkXyjkPu9A5dZI1iA+8mUmr+qKrpevwGCtW1gEwIHXEj96z2bqwQwFsvKyP3EzKCt
	VU1z5A/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3K-00000009ZaX-3Fjs;
	Thu, 25 Jun 2026 17:39:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3D-00000009ZSu-1OWP;
	Thu, 25 Jun 2026 17:39:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FS+GzwG4ZkhoQJeB9L0r4u/8TPB2YkdRfKsmyu596gGg4dcnM6mVOo6d7YOwYmzXc
	 FlJxoS32CQ74k0uY+w+Lcbj7W5LUbmZjwyTQtf32+PfYH8yaKvYflLM43wKu5gNcKk
	 F2nC5OMvJXJLhhxZ06RgHbFsfsMPamam+F3hikcGbF4fzYmmr4c/0Qe/5xsq/37hE4
	 uL4j65cRKSBRHmXXoY43Jn6TYndyIgmIftV/OPceBgDtgGFMc4EcULxkwqZcmmlDNA
	 5kTzkARBYAwVTY4q9xX4eIRO9PnRBmRYcraSURf6OOKapHq20NjNnuF5Flv09DxSLU
	 3yEiwjzZwcyYQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4988A17E0C91;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id F007A480029; Thu, 25 Jun 2026 19:39:39 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:29 +0200
Subject: [PATCH v7 02/27] phy: rockchip: usbdp: Update mode_change after
 error handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-2-38eb3cf654fd@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1789;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=USg1ohYmbXwetA6mCilQyNqt0XA2ZTz/AW7yPMSqQVI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9q4ryncczx0Z6w5Fp1c9beUINV/M9G8h
 eg55tqLQkxkVokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfaAAoJENju1/PI
 O/qaQVsP/2aE/le5xe0RJ0sWHWKzvUsShE9u+NvzljYLILJr3Gh3ldNJsd2ZRdhCuQGyZioCLRe
 6GJa8Wwt78CQfimaaiwq1V0eFB+hmXRnJQmcj++SxIfC8Pb2Hz1PkLjrvg1i4+SDtqSZ2paU/KA
 B9zoz8s+0k1P+44DWdLSDZz10k/PdTcy64F8Me6uE/8d3YxeIFB2EV2dgVj1rKnp+KLEaJsq/7M
 ujjzQ1dpbzJtuApZdLqrWSqh2eDBxum4vrVQmDCpaJoF0dP7Nq+Mw/gT96xQ6hZf06Gb/ZAz98J
 5s9yMsNQLyojlGC985dDeMhOa3w1mkQE4KboZD2AxhjJX3T7GHd29/UiST4Q3hYGSDUILJ/KM1V
 rWeaXNcYNp7fExUEZ4RaijmgnNxyQOPdZ9aTXtgRGaHbdqwn2cw+aI09s0ddtcB0n+Cggq7kobo
 vWQiHi8X9qaSf5ECvagL6v/Nhu4FsBdNGvCUCLZKFV/+pWiNqwLXkrqT2yP9QL9CSLAzLQnVRTu
 sJFxOOlJXjcbTZ25nVXbDOgoI2AzeDMc2ow+9L46jG0524SyyVZQ8hjMvo9ugPWmwHxX4KE97GO
 rZG/mQQ1H3LsYIVO7NBN5nZ04yn1+11083gE+M/3uEMngyxZJySEbio/tLc48ts2gnZBjnI+DaE
 O83STgyhf2AkakW6i7WMyFw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103943_559963_C0FC5110 
X-CRM114-Status: GOOD (  12.86  )
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

If rk_udphy_init() or rk_udphy_setup() fails, the reinit will not be
tried again. Fix this by only updating the variable after all potential
errors have been handled.

Note, that no errors have been seen on real hardware and failures would
most likely be fatal and require at least a full reboot as the function
already asserts the PHY reset lines. So this is more of a theoretical
issue.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612163835.8D5471F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index fba35510d88c..a5ffdf7a6e76 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1000,15 +1000,14 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
 		udphy->mode_change = false;
+	} else if (udphy->mode_change) {
 		udphy->status = UDPHY_MODE_NONE;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
@@ -1017,6 +1016,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
+		udphy->mode_change = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


