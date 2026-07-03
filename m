Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975C9C44503
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7xrsZhtkxRKVle0WQR2/5hlAiXVX34rhtHg5f9pLUc=; b=0RNlfwvTbhx2paOSBqHJKZ7d+f
	95ad/1oFck63uYO9Z5ciq/UgEOyoDsY1E2qTMFuWaCFJ2MY8Nk0p2TeYRJ4xspC2gRfMDM060A1cR
	4AM/FOOtPSKcRBho6ehv8DHKIjVrLpVgaEcHBPHFhY9hgt4VpCtS5hawMKHQ2DcN6+MiAmancrxGu
	BwShDQvRgVGOTceBw4XLnseY5is1HITeOFYgj3AW+yskr0/c/6tbklbkMZJJ3HEb2NxeTwm/lS3mY
	puYkex606crHeHaRI3TcCknk9K+ts3e45b0awP1LOHN3a1uFFz7fsIlM2Y+zG4S//8w9XdKwsfk9Q
	W402cD+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiP9-00000007fWG-04zW;
	Fri, 03 Jul 2026 18:14:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOZ-00000007duK-0f56;
	Fri, 03 Jul 2026 18:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102414;
	bh=LwQqS8coKgvymoJgMVu8XEM9jYreg3Oyt1anGPjS52c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cOOKiviXXnCSV+p8zfEBX2OtsQitJUAX9CvK1BemdKyzDBgOCgnwlVvGghaTbIWVz
	 sKB7xZCKIhi6vF40C179Q7WlVf7QchMD21bGXLwEy+NRWtgHHnH1fl3F5gNgCWU6pr
	 L8IsRJmRZUvYsDoIs8sshacyC4r53MZsLRNf+vatAgPvLcTadPQNH48OcPA/F9lwkZ
	 ZnptEdr4BulyagbMXQCojwkuvZTZuRNLXWI4BcjTjlS4BXtF1oY92gvgTOqnbVMBKM
	 fHri30IxbPBYbPJ1UowbzhihGAn9FoudnDwrtDLTU+6QQoJglKGP8q66OEHqXFq/WR
	 dnnrLzUD7UwtQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0308117E1576;
	Fri,  3 Jul 2026 20:13:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A9B8E480076; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:48 +0200
Subject: [PATCH v10 32/36] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-32-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=LwQqS8coKgvymoJgMVu8XEM9jYreg3Oyt1anGPjS52c=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8xg6PeFnZcmq0JgXMQyYUirloOTLYeP/
 wiIG9Z50ocwg4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vMAAoJENju1/PI
 O/qaD7AP/0Qzbv24ViDBs/FXVLdBrNTY5y7GfPNW/CYopgcFMD+UEpS1GbJrtvwI42gHlyCiih4
 Q5avXiqN8n+LSvkJMTyyzr/5tCXiLApSjHIWKNfqQUIK8I5CeXwVUuyyrU7Eotlp/IC3dmRWygZ
 MP+Ew8C6w1MDJp/wSKLqu3ulzqaQe8JP3TL+iYSmv0awPO4rI2y+AEuL9QVlvcj+vd9onFUcYcT
 OPpJThOanVwkFY6kgDOHb0pjvk5n5PB5XwnPRBDTPC9EdkItozg+H8tEPGM+GV9MLl9fte6MV6y
 Cz5f9C/8OEYzZTBBNU/uoffXDeabrROV8kHsjMb+X9TrpuJp+sS2zjREbwqEAU65Rz7UC3a1364
 39UlhDVd72o4skvGcYotWsVDI+wdYb7Bmvy+COG1D3FBTWSYWvg/vermjTLUMOpGXZMFckN+XOj
 E/MBy7b+DrqrPjm7IYsxCHEKY6wG7rdcrGaQWVeThYDOsNvfSD+Rexz4gTAwU8JQyQbh1RCHUX3
 T/v3cTrkB7FKv0dl1NA2U7vrAs6soDI2RS+NVmD8/iHEjYYCIPK/dVpGEQfagOixb/+cGEo0sFq
 YGe6L+DQjGJqb5j+PcSpyelL4m+mEKedjYYdytNkCEoJP/iFSiQuNJQBHPc3vShZVOagN7KIxm8
 nGiCkiwAPV8Se2RnpoKwrvQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111347_461526_4DE11AA9 
X-CRM114-Status: GOOD (  14.60  )
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

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its probe routine
marking everything as off and later on does a re-init, which avoids
the problem.

Apart from that rk_udphy_status_check() is called after the probe,
so it should not return -EPROBE_DEFER.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 5d151fff9eeb..3fb6eea2979b 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -750,17 +750,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
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

-- 
2.53.0


