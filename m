Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0431CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 20:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUb2JzOzL0ZF1/vJ5Tbm1EbBkS6w1QvqsQ4rogE+byQ=; b=F3WIu5XaPI0fSXZpvWSGrX2qN+
	4iNwVTOpQNSFxG8n7iHBk1+UX2irJKn/9X9oW7UaOgpBgSjZ/+hzRASc/6dVi+fb65p3fOiVmMG7z
	YXlsELDMKpJktL/QtnJfYMM2Rp3RmuQid1I1a5k5Cssxt9MOVCbM1gF2oVdkoLsPPRZp3xZejMgPk
	+IhMvC7BC2FcJI13rQWhKt7jrUVv4r7219FpxCRC/lDtJK+s8dtwDhoQFd7+qRYhhHpsV8vXoFjQ5
	KqWlBgAvA7N0COKLLwPB90c3JPChgkBrFfbPDy+fDP+7BAv4RcfaM8B3gLwntH+ZopCw2s4y7nR5z
	SMLSjC6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIH0-00000005kIy-2CqW;
	Fri, 10 Jul 2026 20:56:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIGg-00000005jw9-3gc8;
	Fri, 10 Jul 2026 20:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783716973;
	bh=7NtyUqb33FG+jkcWAqQCofPeXAbNDYLMWt9ICp4xwmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YThiVFIyt0IgNFvU0IQr41k9Gg/WLRP8RV2Z14q6voul1y4OA2aplhommirHeN3jB
	 0oFurEkKUcsfWlnOsu4Kt9fnG+DFPKEKGwF02xERzTtVeU6nfRc7wqNsyTMyYDftMk
	 3Vl2C9tx8pP3585eaAZRX1rrTBhmlTw5c75DWveb79CQRQff0n9Ce7lMbohDRQckMD
	 ZxOQitQBhAwb9GckW+P0jUksvBRFK7qzNXqXy8I4PXaK6sNziFxL0DTwZG1o2/dGtm
	 AM0a1JXkpMI9ZkGQJdRtDSg42QJlHo7j8OfQ04Tr4s1z7UXnuBa8D2Voi5gp5q4hgu
	 pSgYTf3gKwReA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6865D17E0EFE;
	Fri, 10 Jul 2026 22:56:13 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 11EAE48006F; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:45:06 +0200
Subject: [PATCH v12 28/36] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-28-8b41a9a9bef0@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=7NtyUqb33FG+jkcWAqQCofPeXAbNDYLMWt9ICp4xwmw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdlbn+M9eq5d3Pp3V5venzSpbHpzXmNha
 4MXNngift5ED4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qanOsP/j4S/f4b1JA34NmA00oNvDQA5E96BpL83ATgbDY7iHcHLxWlaXDm5FuHAiIqkqKrlF+
 NYTV20CXb3HuLS4VjAbYetXdTtuoqCpGJkxFLcjN6f9QQBD2B+bzI3+qfVZVdkXIWAuDkc3RCqR
 J6eUj4IZU4J+bqU09nKFLRjjGUmBr5SGVLod2i4GDLpVZS7it2ahBarLCZYBFNDY5eJp+pX72Zp
 X49y2caBlRd3PDeBzX5ib1Xag1KUBTlJpCGxE9T0icTv6PfQp9csFU2SkBGA7Lp9bjXTqrDXhoo
 gvIRTXp5dkpQjCgZuwdVG5Irq/tTiQyJaolle4cnu3pPRTeeVDE1EhRB7B7WvxtfBnZkxnMrE1T
 fznnlQrST5q0A4fb8irDSWhdmxgkBu8veQXYkY5H8fSm70DTJ9UXuEYqqtULSOXZ5kH8/VK/mgo
 DjxBYtvqB/8Ir8iaTJtV091urQmwiRUFKRAhXMqrCtElkYqSWIZ3dh+BYUSzi5jy5aP3wH8zJWb
 VPfTFoSttYgn1NSc4GVy57O2HZAbOYVpvfsV4OY+Tgff0qLhAjuCSyiJ3kYr64XhLnTGZdBjQQ+
 RiapJtku00T5xyFuzqH4b/IpbDtcV9EktVRy9Axd9Zk9zMYb7jutXRlt5TriMQr9I1mc0m5R0Aa
 2sK1nWSer/WpDFG47muchpQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_135619_068551_805257D9 
X-CRM114-Status: GOOD (  11.81  )
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
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2099ae2e51d1..af915cc37727 100644
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


