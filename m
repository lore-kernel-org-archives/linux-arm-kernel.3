Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AA5C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ebxQ8Ud77+kiLI7Dt4Ay+WyCYlW1v2024k+u6bYoCS4=; b=GCghCgRQUwS8Sj4S8vS8it9bbT
	smLDyxumnmKHwo3ImqBY14XfRVlmQdrYOit9SNkDPtm9dFcJysce8nmYJ+pg+Njfwv/AmouQSv7Ih
	vn4wFepJuuOkFvzzpfvIDmAQEa9ApBtQeSvozsx7PBN9BHOT5a3r5Nj1QuTXZhd44J0GNoEblaJLH
	uYbGaFgqV9t/tk83chqBzDYMT+B1HpFE5Eb/ARQ4zLwccZpWCihl21F8sExVa7e9Trx1yAyXsGrm9
	ALMxERKlZVuNxPEiGKwltdh/9hRf1y6ZINJVzKt/GJPJmCL6gj1Q759YUEZEPo0/HyNaHd5Kc7S26
	DL8xi4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VAy-00000007E4j-05TJ;
	Tue, 15 Sep 2026 15:34:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6V9a-00000007BG2-0Ej8;
	Tue, 15 Sep 2026 15:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789486379;
	bh=bxKqLBqmZmKA9K3p8MVfnhKoFDZYWaIyfLekrNvajrg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J7wdEuJAjvNuYk/fdUq0hi+0Amg6z1v8091GbP5lYHwO2pIllEGWKIlYamk4Ix0oc
	 pDD8snMq5wQpDQoXPe/BH5v3ipNSKTBd74JmSHpI10KkICC8kdn2AqIvxHQECbn/lS
	 LeWuy/31gyS1M1sH5aJmMkLSRuNGCv0b6L1sn68QAozwfPNFWCQlDXe2o5kgOGR/+u
	 qLO9DnjyfGXacxdVFCRio/JJ9fbFMSeIamgq9Nb7z5Z2PI6PxMheoHz65nfj2CSvE5
	 qzlpMurQeZ4TamMeQvjaeNWflOj+FHQWXTP3C92UcywAc6QHOc/W0JaBdJy1Odvobf
	 j+KSF8E16pSuw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A9B2B17E00A9;
	Tue, 15 Sep 2026 17:32:59 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 68E3D480029; Tue, 15 Sep 2026 17:32:59 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 17:32:48 +0200
Subject: [PATCH v15 1/6] phy: rockchip: usbdp: Add phy reset notification
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-1-9ad90a456953@collabora.com>
References: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
In-Reply-To: <20260915-b4-rockchip-usbdp-cleanup-part3-v15-0-9ad90a456953@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2051;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=bxKqLBqmZmKA9K3p8MVfnhKoFDZYWaIyfLekrNvajrg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqpZSsWtSVot48sp9/3LoBRpjWCiHdo9uxKB
 3UzvJD1DlhArokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqWUrAAoJENju1/PI
 O/qaDFgQAJM7pFpeZRV9Iz3J7y5xFjONKudZcQ/2lSpSn9Baty1sIirI8efQHpBrYgQKl38FDhE
 kUX1qdNjR02GjgAlZqT79M3GfOZpMLBuALOA0Yaq+U4zjoFNPALppjQm+PITwHyqS2xYqPd29m4
 s3LMbjaWp+9iBoqrrxArg9mu1q+QYFZE2rNkfEqCaZP6D2eH8ttXkV8FriCW0RuAB7Lp0a2NGhB
 mbVJrOxSfNaBggrKjDMTmF+kPQWlY6Cy/E9WX6pq5lHBv0wTwlSLp2GRgR/hSdAEXv4JhrtxaS7
 eOKi4zqfKNuZNV3BbLEzYWZpRcLcaLdErBaJvIsJs5hpmHuDi7RuuOvJLeg1uaLc6fmA3xwQCp4
 K5Fc8Q0O+Ltc5JuhGjs8JnPQFUH87fvKLCRhfj5eD+ezU+Jfw/d5bUhS+3TJNlu9EnRHyEYLYuG
 AVA6aaNMUOQXdwZyZJTkO1Ptx+KHcCOVnAEyTuPbMrQeBeU6tEmG+inAuMgkZg9F90GJEjVG+X9
 XEfMhD8y76LAUfjLpgMHigZx8QN5RlVHv2zXP2gKcNLwaKCizsdg633kvimeT6zPENPJPNZoywn
 uAoDuZ8CEWMHd9KcSiTn9naCJ7/TrulAliS0iVtCxoJV6/w/TLM7qJ5Rmm7FZRPB3HHTEUXWN2n
 dgxLhnwJmVICvdCsATegcbg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_083302_342294_9F33286B 
X-CRM114-Status: GOOD (  12.89  )
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

To resolve issues with running into permanent "cmn ana lcpll lock
timeout" errors after a few device replugs, add support for reset
notifications, which will be handled by the DWC3 driver to gracefully
handle the PHY being disabled. This avoids corrupting the controller's
internal state and the PIPE interface between the USB3 controller and
the PHY, thus fixing the issue.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e748acdd2d31..0f39982c70b1 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1004,24 +1004,39 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
+
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	} else if (udphy->phy_needs_reinit) {
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_PRE_RESET);
+
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
 
 		ret = rk_udphy_init(udphy);
-		if (ret)
+		if (ret) {
+			phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		phy_notify_reset(udphy->phy_u3, PHY_NOTIFY_POST_RESET);
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


