Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64951C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnBeXiStYgFzT6Xv6OYTFChhFG/sUzJn2kEZ2LKj010=; b=i2sfg6r43y2lE5si1mJtO1TvJX
	lC1NJb/zx+TwuaWkilU5cUPi1rfPKp0d0O7EXU/rhLQVBiguT15dOPvpbvfV6D6fAzeeCrBkwWJd5
	smrumvgso7HFOECbrYQ3/g3IdDp37l0lU8TWeEfx4h11Qtl3MhUOjtZ6wkK6d1rqa3U+7kYVst0VL
	8s0rojkxIF5xttgrB0Y8BP1Eu/G7gl5ZpCuehiyE58t08bVCCaMwC77u2/YGyNm16elzhLi/DVb9L
	wru6ssrkynpMjNdqYkOrGd/CIYdn0sNPi72gLjrEZC7o4fRve7ZAPXQzCkTWzHGiLrgrv5r80pM/L
	D3InXt1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucVH-00000001bVk-0iN3;
	Thu, 13 Aug 2026 20:58:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucUt-00000001b0L-3Zb9;
	Thu, 13 Aug 2026 20:57:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654669;
	bh=xtuw+S8aOiE2uzmS/xdd2KuITABZc272KnkQDRN0ffI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RqniNRXOB9ihtfps+IpaHA8DQhvGkB9cVmeae11Ul0uxqgU5PpHjN/I331Ik5d/hw
	 fZxYD7BDdBpongh1KCRBt5qWD0zPuWsb4gfXE2quwzEA3TBCM/aZVRgao4oO5JdLkA
	 pc9nwVQyyP9OsZTv7DgXfc1U32JIm8cGtxpSfZbYUSujb1jP9maGHUtiYsd0OdwmXc
	 gelukDhbJVRSzOOLxEQJyEvE9lp4lw9YvLIHPmr9g+/8T7zPunMfwRdhcSvFl17U8x
	 Hbc6RJxFn9AZdklFs/sM/aSHOQyjDPOFuWTXsYs3JTk+TXkr1OiPfIjEizjYf25T7+
	 47ISG4ry0pevQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E1E2F17E10B0;
	Thu, 13 Aug 2026 22:57:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BE46948006E; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:10 +0200
Subject: [PATCH v14 27/38] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-27-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=xtuw+S8aOiE2uzmS/xdd2KuITABZc272KnkQDRN0ffI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmV5i9XhIqiZolTNMpxwY4BOpqJmGr/ja
 /c2v/fbkfSSUIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qaJJ4P/291uoKDo+Aszoj+kaLwiQXFYzR7Op+C+LexbfkwVek65gQyDPCN34cXrmfgTc1ySE8
 Ks0otvztz8ftTwINtvdsOmU+8DkKcLGmIaaSQm6cbKk1ZE3cNgEqIj6KfvI3yP3ufvVVEsj+xr4
 zD4dmhY0VFVw/nqaPYdlRIiH255XZC0zerUf7QnDN/z5HzIBSIx8GKdmkBNqrPodEFj0CWPYppp
 FFTgcN/5lnuqKvKArrfT/k4gGh56P5H1Ig8priv9p22lcDeyNqXi/VRWu3SnJyOmyy/BbIRyaPT
 U8/0X0R+1AJE4Om1UUTGCxp7450t8nBvWUddCyJlKw8JwBymwn7W5tXeGqj3WMcv/JNsWZbBaf/
 b18FIHuP90Gt8H/2Z6lkUjCPN6cPj3wNhIPyZuYzoYfToL8BtqAkp2EiSW6r7znGEHQPSxDmvFp
 VuTpnMLYT/L7c/FFgbUbYb4ZGcD77ESYCaoOB+8VdV92RKp4h4QhmVM0ybZ3E79NYMY5M3F1jpZ
 KfI3hqZfcw1uDqz7GEv+pdslY2jZQfgF2SJ41f2Pz02uRxF1B6J+NaF7fT5aYiAoxkWoN+TO/Tl
 V2qFmUzOd+FXraQ1hFduqJkkfmH19F+g1tNPGZfEq7QCHKpHkrzQmIw5Vikpeu5bp55tNYrj0B2
 LaCLBf8Ik/KRRZfMrQ28+iA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135756_051665_EA01BF52 
X-CRM114-Status: GOOD (  11.49  )
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

Ensure that USB3 mode is not accidently enabled during PHY re-init
for systems that are configured as high-speed only via DT.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626212424.C215E1F000E9%40smtp.kernel.org
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 701c92ed6e2d..59b836a3796c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1009,7 +1009,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (ret)
 			return ret;
 
-		if (udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {

-- 
2.53.0


