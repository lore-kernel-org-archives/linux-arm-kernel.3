Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6B9CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yapbBOJ0KfC2Izj+RmJ+xcZBRGi5EAzcQmucEMufUA=; b=mXqJjMlo3nOZa9kT8Ol19aSoAs
	Aqyx2u3Qi3lJ1433PgYygcjg7P0qz8iePlhX2FoeySRXW5j6hYjMfiah3qc7cP8JQ6xeigv4MCoMU
	TvU+XRRt9Pp05En5nxusmkzQkkaJhyd3p9DrbU5YrkO17//D51bx/AsyoC0mnxvGafIS27pGyN4gz
	syxvZja2Tok/aSISv2LWmej19iDYddBi78UXpzZJZ/tCw0SbBcflpN0rZ6dZ/rt0ApqMjJsyx6om6
	25hHYsy0iG0Xjink+d1ztc1mGgFuGrkp4/+W8kvWKsFLDkhoNSnp6DHKCQg5iTg08GRNo3INwIPxf
	qMWiPF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco4n-00000009bcx-20lj;
	Thu, 25 Jun 2026 17:41:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3I-00000009ZW0-2eZL;
	Thu, 25 Jun 2026 17:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=S8mBZ4Hlh7Ki9BChV9ZzEHUUZ4TaYKsVcqZFSMwsbAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ya0mGJBmu8o1P9eq2iGyOQygiBC1X8Xs8tSPSFwh/mRg3cLALZI2SbfBDtiUUovrr
	 QvUS3kNUN76tqAL78sYiwQXEVG7XIIQKMWbu1VF6vg5Gf9d+mYhmfJ8mwTvjzqDmDc
	 ydckFgZRQ4ECxvDOEE0WAc9NtDEE8Ia3ccHsbqBVdx1NFUU/9Itcs9V2f/0kOYydpv
	 X+6A4d27LxYohnw4sF2DQy/VcmVR4580QyCaBIMUyQ3wmlpFxEaGAzV720igPwoADD
	 TP0EX5T0v/lynXsU409ZPtAC7jfamNYksudBPWs+8hCUqkJT/9kEBBGPqggY47t4CO
	 Jpz/lpFbXxhQQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AFD1317E140E;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0685248003A; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:36 +0200
Subject: [PATCH v7 09/27] phy: rockchip: usbdp: Keep clocks running on PHY
 re-init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-9-38eb3cf654fd@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=S8mBZ4Hlh7Ki9BChV9ZzEHUUZ4TaYKsVcqZFSMwsbAs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9tYupvParE2L65hIg+cnbTldO7e6gNRi
 ASRjz2zah7skYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qan5IP/3m1eDFr0pV3lChdsejPXTbAdQy1/Szw81g+BP4AntJs61xAAZHAgTVHPsDdDctezgW
 k3JcW1xpIoINRY3OoQPSbuO3ipMfDZ+bBvbj9CyCeK86QI6UnYzSvv7XjAd6I+cxbfI6loQggjW
 iup61lMlKzf8I+JBs745/EQP6WdxeIPhdK+YjyOZlk6aOU9ZFb+DuvRTpuYZOf7DwoMd8K8TfqQ
 A66vtSnXxtes2UaX9Fpg0gSrEvkfLrHN5DhgXgjvBCq7sWEtp1mMF7c3li7hyD2apzlyWzoauCA
 8sNKHGaOt9HqSa68bz3ZNjkUpCZJhCIav9TC04U3iC6lW35XhJuVbTJpjS3esdTQ4algkLawQPa
 OEecy2AGRyscbm1muqbLDuKrc6HPJvK8im8yaISuoMZWHW19szPeo69wHxILZ1mu96WUkLc04qd
 GhbLdMDVvdD+hdEMcAez/I3PUdsf9Cug0SV1YBh7M4xI/2w/jdy98bXcj+Lyl4FEgwt2D+CoF3H
 UeXME4YsYy7fCV/wEtRjv3NVOCKq/tG3+W8JS0awC8ON4F5pGQBgucS597iwcOyKKRTaK5s4XW1
 6EORX0XHBIBrlx16XTfyN4Z/1XaTxG6Eadq9NziM//38HKfGF+hnFVF5MKDHYmynBx5URfv9zRs
 nWN71wfQQWTo/ts08uAg62w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103948_890020_98129094 
X-CRM114-Status: GOOD (  10.57  )
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

When a mode change is required rk_udphy_power_on() disables
the clocks and then calls rk_udphy_setup(), which then enables
all the clocks again before continuing with rk_udphy_init().

Considering that rk_udphy_init() does assert the reset lines,
re-enabling the clocks is just delaying things. Avoid it by
directly calling rk_udphy_init().

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2324f9050f63..989a7884d8b5 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1017,8 +1017,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
-		rk_udphy_disable(udphy);
-		ret = rk_udphy_setup(udphy);
+		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
 		udphy->mode_change = false;

-- 
2.53.0


