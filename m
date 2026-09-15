Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49D0C982CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dVwDwCxcq1zN1Wj6x7zq+AbW6aRa2rVSLS1uLr3aMbI=; b=2X/01y3haGF5mG5x1LLIi4TWRP
	MfdybidH9Tz+/0106GaiOTyabuthblCkPIq36WnmkNlPCAd1sYCFS4mzZSPVlj2VFr1q7DzOOSYAG
	1NK7Bx6kGsP2WWWXSZRZ7gJEZISn17cKaXvtoJjRT1y70db0ejNeINkEh8WiltL83E7BngCSppLM9
	0yU+AIADe04PNxh/6zGvQvapwzpmt55NF73cRw40iFumVzV/mq9/cJxL4TiLFOqTAj84g/DqRTS3g
	SHRZ11pW1Apx7Z48fa30l0lvc5n1RrViuMILU/mBg2yo7zKsLIRBvp3H+4ucBOGMBXAS5wRIGlBKb
	65iRCI5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Uke-000000075Vd-1c2s;
	Tue, 15 Sep 2026 15:07:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Ujs-000000074tc-0mSK;
	Tue, 15 Sep 2026 15:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789484779;
	bh=PX3bW1sBE7HEbhsLaU0fKDW6DOA5Axs3TotiYYFI6k4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W/pmP1laxa9RN9kKhCDAeJCDoOp2/SM4H/Otop1uexGqCzo4mnOtRlLZRrXK8krAM
	 wyjan8pFu3i3iSmK+ActDRmkmzA0CSuUhtq+NDzGckBJXdaxUyjYKCmyMP6EFgyTYz
	 jdRelqkwUTYB9rw7dVH7McG13XwtOCJxF//R8cigiSBwcTJPSrKnGnHspBGA+grWHR
	 g4Beky0ZO9OndAKY+TEEIIDlbEMa0VMr3GPtM7ebLV98+7DMJW6vxhM6WIJaXvBFUw
	 gHr1MhVHdOMYDmrWRLlNlazR06+GcZMBxOvIKvuXeknk7eGnUXVLWIyQ+uXVyhvKt7
	 crd3CNhVf8eKg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 01C8E17E0D7F;
	Tue, 15 Sep 2026 17:06:19 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6CF3C480047; Tue, 15 Sep 2026 17:06:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:06:12 +0200
Subject: [PATCH v15 09/11] phy: rockchip: usbdp: Avoid xHCI SErrors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-rockchip-usbdp-cleanup-part2-v15-9-8d507cb1174f@collabora.com>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=PX3bW1sBE7HEbhsLaU0fKDW6DOA5Axs3TotiYYFI6k4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpXup5pTCfJZPMKPAyDkFAvXceTFPoun30E
 qk56mvc29fbJYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqV7qAAoJENju1/PI
 O/qaeDoP/0wEZruFvau6rYIJJsEyN++PLXP+AP/4yT+KMIa7zZ/bMdyIg2O/CSLq8zbXtZpHt3C
 TdklKDfR8VSXdZ6UwyvgeRog7Uf6wcSMrykpkbYjZ7q1nnwNT9cFC2YWOnbgqMU70cJUmxEk2Z3
 qf8RbO7Fp9bIPnaPThieKMuBqMuo/OSybIaak5OJMh/BldmWRH5VfY2SmBJ/eiby2e3C5tNteBp
 Cuf3tAkyU0zqJfeulI494J2IUWXpiLRH1LKV+1db+TvKi1gIbScEL4pE9Kpcuo9cIsKzQbmHIA0
 0GBJCQZkV5JtPvOKYJo1zG9WxadIGICo0PeTJqSmIKaC1VKnZQdSoF5WvVkpGFP8wZY2BWsXWjy
 dcNNPJHUr5hlRFrdSuhGaX8gduilHkYuFdym3orBPcnkVatEj1GmLVpmUJXG/lNnOkAq3f0y/JO
 mNKXTovT3081PGu0bUpK0IlhrcmicgkURilLS2LMYkoj3qRvfU2FO0NMzokZbDWYi8kWdvH04Zk
 nrG137r8QWIBGkq3hkaovE+fGbcXBAcrav+acRiw3x3t2Qv23QYsi3fRyI3pFjoC/BK02p5tv1j
 BOCGZDm30Pil/A2BRXTwlSkiXTFfecKm55fM8E70jIGhEpJ9WvUCXYc2XGvLlw4Sf/Q3FAS3JD+
 g3rFSlhx6uxoHSfzp4q0uqQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_080628_394773_CCC0FB1F 
X-CRM114-Status: GOOD (  15.41  )
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
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 23cfb9bbd334..4116b4b18882 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -999,12 +999,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {
-		if (udphy->mode == UDPHY_MODE_DP)
-			rk_udphy_u3_port_disable(udphy, true);
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
+
+		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	}
 

-- 
2.53.0


