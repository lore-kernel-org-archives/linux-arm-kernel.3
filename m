Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53893CDE00D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIcLnrNAirHiFnjjwIfONbFuixRN+Ngt1z00i7Jxb5U=; b=LKEWseDpJUqy4VHR4bHNfOfRlX
	mNY37UDN5zz8cByiychSOaY3JogGrIKT8Ld6BJFSsQgtK9/I8tdtkG+qcCQbmI55+NyqjGoj85EAw
	5yZF4gS9qLtgv76O3yKIxN+e79xsszrsT3J0BFoDRe3VpRIMDl/I2Fb0ed8udlRWCVD97UTIAelCR
	41z3mq4Gt9WPNKRtXa1aA34V5MJE+mmM6S7N9KcHKW7An8DVK1W7K5VSjBAuYqKfCC5dJq0ZH7+hD
	QKT76DXX2OWEmleu0OQSCmmbCpZpjmDSI2jvujytANii8Ja6LMnhtX8yVJRDs0pBr97af2eaJesJy
	Mhts6x1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco4o-00000009bf4-14Fr;
	Thu, 25 Jun 2026 17:41:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3M-00000009Za5-0vuv;
	Thu, 25 Jun 2026 17:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409181;
	bh=yCiw8z2UZvWRq9t6m2DjxSjwEpiHMLoGQwvUavl25U0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mv0eJlcp5oMIUruB6ek22DodS+kYVJixkO19OnxGBEwRD3qBTvCu05q8cbzNB2WXD
	 ZpPXfNlNfunXIj6+fanb3JyuDiEeiWA3C+BC1VhbfEjIgAsRgw9d8SeXD8PnFTsOHf
	 j/+dcNpCBW7LfXIxAEDdL3WlXES2pkWXykbLC2Xpr8zGZiN5Nije6G829eXd9dhFlq
	 Cf3SiIltdL5sS+myynH3+Uyi6KjTkTYFNUb3Q8XM8pO3pKcYlC70DwB+bcwjhr/7j2
	 m63xdu/lrShqMbmCr8kfMgQUK6UVSz2E6iNnbSIrwbyHryTROKbauphwvl0mdfGIuR
	 L6MWk/cNhVmkg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 39BA217E15C4;
	Thu, 25 Jun 2026 19:39:41 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1D76A48006A; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:52 +0200
Subject: [PATCH v7 25/27] phy: rockchip: usbdp: Hold mutex in DP PHY
 configure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-25-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=yCiw8z2UZvWRq9t6m2DjxSjwEpiHMLoGQwvUavl25U0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9ve13T9kS1Y1cp+2SyUK0AKoRggdPYXM
 aO9LllARPBLtYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaJNEP/016qdNdDOzwbpj1GGmCDiNIYR9GTMTmljYGfKbPEct6tGF34nRNOA5CFhdhEoEdfK5
 m80x+CfCgpquYWm9Lmg+C7USEoLVfxAiwx70eOkksqllaAqCadBSe6fjow9PihdevhnguPtgY7O
 nSJ5rEl4wxgN1XUWezzEVK3kggefE4H2eyMh4Zk62TExL1+uTglWumNAi4/7dGBJBWRljJsZ/9T
 fdTanzypeuPp4uhdAyaiVHMIyPXB/0KJK+uuRcpKIHUnAm/USojOHs2fobsBRHgQxD7A5CkH1m8
 QhdA9t3KHmi7tUufD/L/gO1zLnesctgxBlHkCwDmurxXOAY2qASQQRlAz7DEXk1amVO+hpbSXsI
 GfvjRoV1R8N7d7mwN9odoEf/CuTSt97t9dgxF/SzJb/TYlJjcmpjJInYVVPIxq88g0UgyQz4zRS
 yJXqQuzxT2FT04NISKa1XY8THjNF33qFAkj6bJe7Db/W3t2MFqoGlVPRTI73ZMRc0SEPOolztLR
 gbxIa9xXak8xocz2nLNpvGtbBr0ftqqaWoPLPoVJwQ0Q0DmbX6Etn1yoTqImhSbjg5cmFkNdZw0
 eCD/jAO9scbcWXzAvrNRxYDuldVMk/hFZeFSSj3KEM0AU0yTlxA2FG7LFICQsNQqI+debtIU7Tt
 Yyg36/0KzivHoScmIcPMrZQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103952_509367_1C5BCA7D 
X-CRM114-Status: GOOD (  10.69  )
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

rk_udphy_dp_phy_configure() accesses some variables from the struct
rk_udphy, which are updated independently from the USB-C framework.

The USB-C mux/orientation switch functions already hold a mutex to
ensure mutual exclusive access to the struct rk_udphy states, so
simply hold the same one in the DP PHY configuration function.

Reproducing problems due to this on real hardware would be really hard,
but could be possible when quickly re-connecting the USB-C connector.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612164627.23D391F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 182141837596..fc788f2bf5fb 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1189,6 +1189,8 @@ static int rk_udphy_dp_phy_configure(struct phy *phy,
 	u32 i, val, lane;
 	int ret;
 
+	guard(mutex)(&udphy->mutex);
+
 	if (dp->set_rate) {
 		ret = rk_udphy_dp_phy_verify_link_rate(udphy, dp);
 		if (ret)

-- 
2.53.0


