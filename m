Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F847CDE00D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rp4xmAdpXNV2fL8BGVOGgzKaVSxj5m8nOHGlnNssYs4=; b=WAQICQ8m5yE8rLTk8WNdMBof5p
	FGWoaeK4zE7Ebt69QTtp9ChaiNSsHd+xJbwb0gDwD3kPQ0jJ5FK0oWmCSxzg8s3rO+WX1nvu5ytPX
	kSQthE//NFdqFpA+wOiUINCPQJjexz4MOahzpf7cV8CvDG6z1mMi629tgSimYNMJm1bLMlnT4kauX
	96ifYSCHFMycObE7yNX8WpOnaxtREF0quBqwKkewVKUEW3DutgikxACFc9RVwjqimoDnuU6EAvY/V
	298RLRgd18jnF2hHZUQ1d+ZfR9cgKzUK3ZQR1GjR6W0/1O33CnVU6zt2C36sP6q1f1p5WpehWsYYn
	9/fA378w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3z-00000009aGk-1RdO;
	Thu, 25 Jun 2026 17:40:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3H-00000009ZUz-3KyU;
	Thu, 25 Jun 2026 17:39:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=HZ/3ES/nIovGU0qa5ahu6BZsbPwj2mb1498FeAaaX4s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=INN3dmDONpdACBs2Faq5TOxhMJsjqKiudzLLLUi8+TpB9332K30xwNTH2moLipD0H
	 qtMs27h5JMfEi53h7cHZf1VW6MvSGrMkQmOhy+RFGkO+6sgSS8PBZvjgHCCw7NvMjd
	 A6TJwWjx3ef/n+vyoaFJHffiAfJc/0ezPtvLqrk6nvfBPRih0/1QAGDhw2N2aLJaWb
	 IjEOTXHh6aod1/4avE8FPY/kFxFYyY1MxMdPEvVGE9GPaYHeDbMIo17GZW75upE4il
	 BQoseSdad3ArzTRO/UqBFGTq8a0zX0D/uV8tflyweuKk4FMxuWN1pw4gSyoBNJ5Xmr
	 q8uuYbKeUyqdw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A60B117E1270;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0511C480038; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:35 +0200
Subject: [PATCH v7 08/27] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-8-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HZ/3ES/nIovGU0qa5ahu6BZsbPwj2mb1498FeAaaX4s=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9s7BBRaoGAP0HJiJtSiaFFqF73MUetNp
 1gDJFjNpR2B5IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaKIIP/RgT8jh+Ou1c6H14CCRijJkxKMl4Y9m1FEHTFknbVaJATH3uu6Pcwuz1Jf33GLeJeaa
 LdhW7DEwOTtrIbIoxHTlRNiC197WEC99oawF7mGolgkwoTQGMD7pwmpYxz5MnKBAbpu6B5J2Vs/
 Yu4QBia4gdqiZ8gKUdfBcw92lVAH8e2yePbo5ZtQoYelz9UHwWZAKncBO6/Zm0U+jLnRKqOL4y/
 2T8FyY4Ly8Bbr+q/idIjCpE+WJtEIUvVsQi+oJCg/Z8g+1gFbZMG29eyWAE8YuSqIDEJwhmiZ3T
 QYmFpRvDWmfkd36mL2FzscwdnY7SoNe8Jd9ZA2ux9uUyUqQG9JjrfSEZTNxy93NkBJFV8/arixs
 Rv0VaT2sk35nKLgzrC7O/jCM6CO3QukL5Ex9K6MracIt41XHFYBa9j3mXShTOBAEY4an8V6MNJ/
 HEbVxQIE7pDaGBeUHKAhSgwSQwinqqKBoIfCQ2X/D7+0X8WMdRCUPyKwVv1Co8jXUzXWhETnWkq
 LqUE5IL26AdqEhcwhQxIXTOhTeEb0RGZ0HEtRH0sd10xKQKBzeiEXf2VEoAnkdMWcmtJszCQMwe
 c95ZLps+JQViQ+UEqS9FAridTs6wnQZSMUgOW913ycS7jEqD/hgnEjvsadqPbzeq60EKaotQAau
 rQP3kRE7PqM6PO05I1TwZhQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103947_999181_55816242 
X-CRM114-Status: GOOD (  12.00  )
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

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 121dd78d8c16..2324f9050f63 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1132,6 +1132,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0


